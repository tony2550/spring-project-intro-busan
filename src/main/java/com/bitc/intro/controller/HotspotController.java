package com.bitc.intro.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bitc.intro.domain.AttachVO;
import com.bitc.intro.domain.Criteria;
import com.bitc.intro.domain.CriteriaDetail;
import com.bitc.intro.domain.Hotspot;
import com.bitc.intro.domain.PageDTO;
import com.bitc.intro.domain.PageDTODetail;
import com.bitc.intro.domain.SearchCriteria;
import com.bitc.intro.service.AttachService;
import com.bitc.intro.service.HotspotService;

@Controller
@RequestMapping("/hotspot/*")
public class HotspotController {
	
	@Autowired
	private HotspotService hotspotService;
	
	// 관광지 전체보기 / 메인화면
	@GetMapping("list")
	public String hotspotList(Model model, Criteria cri) {
		List<Hotspot> hotspotList = hotspotService.getHotspotsWithPaging(cri);
		
		int totalCount = hotspotService.getTotalCount();
		
		PageDTO pageDTO = new PageDTO(cri, totalCount);
		
		
		System.out.println(hotspotList);
		model.addAttribute("hotspotList", hotspotList);
		model.addAttribute("pageMaker", pageDTO);
		
		
		return "hotspot/hotspotlist";
	}
	
	// 관광지 1건 상세보기
	// 관광지 정보, 식당 목록이 보여야한다.
	@GetMapping("detail")
	public String hotspotDetail(Model model, @ModelAttribute("pageNum") String pageNum ,int id, CriteriaDetail criDetail) {
		//http://localhost:8888/hotspot/detail/
		// 관광지 1건 가져오기 식당 전체가져오기
		
		
		Hotspot hotspot = hotspotService.findById(id);
		System.out.println(hotspot);
		Hotspot restaurants = hotspotService.getRestsWithPaging(id, criDetail);
		int totalCount = hotspotService.getTotalCountBySpotId(id);
		PageDTODetail pageMaker = new PageDTODetail(criDetail, totalCount);
		// board.setHitcount(board.getHitcount()+1); // OSIV = true 여기 있음 안댐
		model.addAttribute("hotspot", hotspot);
		model.addAttribute("restaurants", restaurants);
		model.addAttribute("pageMaker", pageMaker);
		//System.out.println(board.getComments().get(0));
		return "/hotspot/hotspotdetail";
	}
	
	// 맛집 등록 페이지로 이동
	@GetMapping("add")
	public String hotspotAdd(@ModelAttribute("pageNum") String pageNum) { //pageNum 넘겨주기
		return "hotspot/hotspotadd";
	}
	
	@PostMapping("add")
	public String hotspotAdd(Hotspot hotspot, HttpServletRequest request,
			MultipartFile listImage) throws Exception {
		
		String realPath = request.getSession().getServletContext().getRealPath("/");
		realPath += "resources/images/"; // 이미지 저장 패스 생성!
		System.out.println(realPath);
		
		File uploadPath = new File(realPath, getDateFolder()); // 폴더 동적으로 생성하기
		
		if (!listImage.isEmpty()) { // 이 있으면 파일 업로드경로를 img에 저장
			String originalFilename = listImage.getOriginalFilename(); // 실제 사용자가 업로드한 파일 이름
			
			UUID uuid = UUID.randomUUID();
			String uploadFilename = uuid + "_" + originalFilename;
			
			listImage.transferTo(new File(uploadPath, uploadFilename));
			hotspot.setImg(uploadFilename); // 저장되면 hotspot의 img로 저장
		} else {
			hotspot.setImg(hotspot.getImg());  //이 없으면 url 주소를 img에 저장
		}
		
		hotspotService.insert(hotspot);
		
		return "redirect:/hotspot/list";
	}
	
	private String getDateFolder() { // 날짜형태 폴더명 생성 메소드
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		String str = sdf.format(date);
		
		return str;
	}
	
	
	//수정페이지 이동
	@GetMapping("modify/{id}")
	public String hotspotmodify(Model model, @PathVariable int id) {
		Hotspot hotspot = hotspotService.findById(id);
		model.addAttribute("hotspot", hotspot);
		return "hotspot/hotspotmodify";
	}
	
	//수정하기
	@PutMapping("modify")
	@ResponseBody // 문자열 리턴하기 위해서 어노테이션 붙히기 ajax에 success 라는 문자열을 리턴해줘야한다
	public String modify(@RequestBody Hotspot hotspot, HttpServletRequest request,
			MultipartFile thumbnail) {
		// if 썸네일이 url로 변경 파일 변경시 분기해서 저장 수정
		// 사진 파일 수정
		
		hotspotService.updateHotspotById(hotspot);
		return "success"; // 문자열을 리턴해야한다 jsp가 아니라
	}
		
	@DeleteMapping("delete/{id}")
	@ResponseBody
	public String delete(int id) {
		hotspotService.deleteHotspotById(id);
		return "success";
	}
	
	@GetMapping("search/list")
	public String searchlist(@ModelAttribute("searchCriteria") SearchCriteria scri,
			Model model) {
		
		int totalCount = hotspotService.getTotalCount();
		
		PageDTO pageMaker = new PageDTO(scri, totalCount);
		
		model.addAttribute("searchHList", pageMaker);
		model.addAttribute("pageMaker", pageMaker);
		
		return "hotspot/hotspotsearch";
		
	}
}
