package com.bitc.intro.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bitc.intro.domain.AttachVO;
import com.bitc.intro.domain.CalCoords;
import com.bitc.intro.domain.Coords;
import com.bitc.intro.domain.Criteria;
import com.bitc.intro.domain.PageDTO;
import com.bitc.intro.domain.Restaurant;
import com.bitc.intro.domain.User;
import com.bitc.intro.service.AttachService;
import com.bitc.intro.service.RestaurantService;
import com.bitc.intro.service.UserService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping("/restaurant/*")
public class RestaurantController {
	// 식당 상세보기 , 식당글 쓰기 , 식당 리뷰보기,
	@Autowired
	private RestaurantService restaurantService;

	@Autowired
	private UserService userService;
	
	@Autowired
	private AttachService attachService;
	
	@GetMapping("list")
	public String restaurantList(Model model, Criteria cri) {
		List<Restaurant> restaurantList = restaurantService.getRestaurantsWithPaging(cri);
		
		int totalCount = restaurantService.getTotalCount();
		
		PageDTO pageDTO = new PageDTO(cri,totalCount);
		
		model.addAttribute("restaurantList", restaurantList);
		model.addAttribute("pageMaker", pageDTO);
		return "restaurant/restaurantlist";
		
	}
	
	// 식당 상세보기
	@GetMapping("detail/{id}")
	public String restaurantDetail(@PathVariable int id, @ModelAttribute("pageNum") String pageNum,
			HttpSession session, Model model, HttpServletResponse response) {
		
		response.addHeader("Set-Cookie", "Test3=TestCookieValue3; Secure; SameSite=None");
		response.addHeader("Set-Cookie", "Test2=TestCookieValue2; Secure; SameSite=None"); 
		response.addHeader("Set-Cookie", "Test3=TestCookieValue3; Secure; SameSite=None");
		
		Restaurant restaurant = (Restaurant) restaurantService.getRestaurantById(id);
		model.addAttribute("restaurant", restaurant);
		User user = (User) session.getAttribute("user");

		// 로그인을 했을 경우
		if (user != null) {
			int checkLove = userService.checkLoveIsPressed(user.getId(), restaurant.getRid());
			if (checkLove == 1) { // 좋아요 내역이 있음
				model.addAttribute("checkLove", 1);
			} else { // 좋아요를 누른적이 없음
				model.addAttribute("checkLove", 0);
			}
		}

		int loveCount = restaurantService.getLoveCount(restaurant.getRid());
		model.addAttribute("loveCount", loveCount);

		// 추천하는 연령 데이터를 전달
		Integer age = restaurantService.getRecommendationsByage(id);
		if (age != null) {
			model.addAttribute("age", age);
		}
		
		// 추천하는 성별 데이터를 전달
		String gender = restaurantService.getRecommendationsByGender(id);
		if(gender!=null) {
			model.addAttribute("gender", gender);
		}
		
		return "restaurant/restaurantdetail";
	}
	
	//지도 좌표를 받고 좌표간 거리를 받기위한 메소드
		@PostMapping(value = "checkCoords" , produces = "application/text;charset=utf8")
		@ResponseBody
		public String checkCoords(Model model,@RequestBody Coords coords) {
			
			double lat1 = coords.getDesY(); //식당 경도
			double lat2 = coords.getMyY();	//내 위치 경도	
			double lon1 = coords.getDesX(); //식당 위도
			double lon2 = coords.getMyX();	//내 위치 위도
			
			//두 좌표간 거리를 구하기 위한 메소드
			double distanceOf2location = CalCoords.geoDistance(lat1, lon1, lat2, lon2);
			System.out.println(distanceOf2location);
			
			//m단위를 소수점 2쨰자리까지 km로 환산
			String result = String.format("%.2f",distanceOf2location/1000);
			
			//string형을 double형으로 형변환
			distanceOf2location=Double.parseDouble(result);
			coords.setDistance(distanceOf2location);
			
			//Json 문자열로 변환
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String coordsToJson = gson.toJson(coords);
			
			return coordsToJson;
		}

	// 식당 추가
	@GetMapping("add")
	public String restaurantAdd() {
		return "restaurant/restaurantadd";
	}

	@PostMapping("add")
	public String restaurantAdd(Restaurant restaurant,HttpServletRequest request,
			MultipartFile listImage,
			List<MultipartFile> files) throws Exception {
		
		int nextRid = restaurantService.nextRid();
		
		String realPath = request.getSession().getServletContext().getRealPath("/");
		realPath += "resources/restimages/"; // 이미지 저장 패스 생성!
		System.out.println(realPath);
//		if (files != null) {
//			log.info("업로드한 파일 개수 : " + files.size());
//		}
		
		if (!listImage.isEmpty()) { // 이 있으면 파일 업로드경로를 img에 저장
			String originalFilename = listImage.getOriginalFilename(); // 실제 사용자가 업로드한 파일 이름
			
			UUID uuid = UUID.randomUUID();
			String uploadFilename = uuid + "_" + originalFilename;
			
			listImage.transferTo(new File(realPath, uploadFilename));
			restaurant.setImg(uploadFilename); // 저장되면 hotspot의 img로 저장
		} else {
			restaurant.setImg(restaurant.getImg());  //이 없으면 url 주소를 img에 저장
		}
		
		
		File uploadPath = new File(realPath, getDateFolder());
		
		if (!uploadPath.exists()) { 
			uploadPath.mkdirs(); 
		}
		
		List<AttachVO> attachList = new ArrayList<AttachVO>(); 
		
		
		for (MultipartFile multipartFile : files) {
			if (multipartFile.isEmpty()) {
				continue; // 없으면아무작업하지말고 빠져나가기
			}
			String originalFilename = multipartFile.getOriginalFilename(); // 실제 사용자가 업로드한 파일 이름
			
			UUID uuid = UUID.randomUUID();
			String uploadFilename = uuid.toString() + "_" + originalFilename; // 같은 파일이라도 중복이 안되게 고유의 uuid를 붙혀서 저장한다
			
			// 파일 업로드 수행 파일 1개 업로드 수행완료
			multipartFile.transferTo(new File(uploadPath, uploadFilename)); // 업로드시에 i/o가 발생하기때문에 예외처리 필요
			
			AttachVO attachVO = new AttachVO();
			
			attachVO.setUuid(uuid.toString());
			attachVO.setUploadpath(getDateFolder()); //2021/06/16
			attachVO.setFilename(originalFilename);
			attachVO.setRestId(nextRid);
//			attachVO.setFiletype(isImageType(originalFilename) ? "I" : "O");
			
			// attachVO를 리스트에 추가
			attachList.add(attachVO);
			
		}
		
		// hotspot, attachVO 트랜잭션 처리
		restaurantService.insertRestaurantAndAttaches(restaurant, attachList);
		
		return "redirect:/restaurant/list";
	}
	
	private String getDateFolder() { // 날짜형태 폴더명 생성 메소드
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		String str = sdf.format(date);
		
		return str;
	}
	
	
	@GetMapping("modify/{id}")
	public String restaurantModify(@PathVariable int id, @ModelAttribute("pageNum") String pageNum,
									Model model) {
		
		Restaurant restaurant = (Restaurant) restaurantService.getRestaurantById(id);
		List<AttachVO> imageList = attachService.getAttachesByRid(id); 
		model.addAttribute("restaurant", restaurant);
		model.addAttribute("imageList", imageList);
		
		return "restaurant/restaurantmodify";
	}
	
	@PostMapping("modify")
	public String restaurantModify(Restaurant restaurant, String pageNum) {
		
		restaurantService.updateRestandAttach(restaurant);
		
		
		return "redirect:/restaurant/list";
	}
	
	@DeleteMapping("delete/{id}")
	@ResponseBody
	public String restarantDelete(@PathVariable int id, String pageNum) {
		restaurantService.deleteById(id);
		return "success";
	}

	
}
