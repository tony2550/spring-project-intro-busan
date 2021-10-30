package com.bitc.intro.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.bitc.intro.domain.AttachVO;
import com.bitc.intro.domain.UploadDTO;
import com.bitc.intro.service.AttachService;

@RequestMapping("/upload/*")
@RestController
public class UploadController {
	
	@Autowired
	private AttachService attachService;
	
	@GetMapping(value = "attachlist", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<AttachVO>> getImageList(int rid) {
		List<AttachVO> imageList = attachService.getAttachesByRid(rid);
	
		return new ResponseEntity<>(imageList, HttpStatus.OK);
	}
	
	@PostMapping("/imagelist")
	public ResponseEntity<List<UploadDTO>> uploadImages(MultipartFile[] uploadFile, HttpServletRequest request) throws Exception{
		
		List<UploadDTO> list = new ArrayList<>();
		
		String realPath = request.getSession().getServletContext().getRealPath("/");
		realPath += "resources/restimages/";
		File uploadPath = new File(realPath, getDateFolder());
		
		if (!uploadPath.exists()) { // 실제 업로드패스가 존재하는지 확인 메소드
			uploadPath.mkdirs(); // 없으면 경로에 폴더를 맹글고 진행해라
		}
		
		
		for (MultipartFile multipartFile : uploadFile) {
			if (multipartFile.isEmpty()) {
				continue; // 없으면아무작업하지말고 빠져나가기
			}
			
			UploadDTO uploadDTO = new UploadDTO();
			
			String originalFilename = multipartFile.getOriginalFilename(); // 실제 사용자가 업로드한 파일 이름
			
			UUID uuid = UUID.randomUUID();
			String uploadFilename = uuid.toString() + "_" + originalFilename; // 같은 파일이라도 중복이 안되게 고유의 uuid를 붙혀서 저장한다
			
			// 파일 업로드 수행 파일 1개 업로드 수행완료
			multipartFile.transferTo(new File(uploadPath, uploadFilename)); // 업로드시에 i/o가 발생하기때문에 예외처리 필요
			uploadDTO.setFilename(originalFilename);
			uploadDTO.setUploadpath(getDateFolder());
			uploadDTO.setUuid(uuid.toString());
			list.add(uploadDTO);
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
		
		
	private String getDateFolder() { // 날짜형태 폴더명 생성 메소드
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		String str = sdf.format(date);
			
		return str;
	}
}
