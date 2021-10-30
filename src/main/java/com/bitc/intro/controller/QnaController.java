package com.bitc.intro.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.intro.domain.Criteria;
import com.bitc.intro.domain.PageDTO;
import com.bitc.intro.domain.Qna;
import com.bitc.intro.domain.User;
import com.bitc.intro.service.QnaService;

@Controller
@RequestMapping("/qna/*")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	
	//qna 리스트화면

	@GetMapping("/qnaBoard")
	public String qnaBoard(Criteria cri, Model model) {
		
		// board 테이블에서 전체글 리스트로 가져오기
		//List<BoardVO> boardList = boardService.getBoards();
		
		List<Qna> qnaList = qnaService.getList(cri);
		
		int totalCount = qnaService.getTotalCount(); // 전체글개수 가져오기
		
		PageDTO pageDTO = new PageDTO(cri, totalCount);
		
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("pageMaker", pageDTO);
		
		return "qna/qnaBoard";
	} // list
	
	
	@GetMapping("/content")
	public String content(int id, @ModelAttribute("pageNum") String pageNum, Model model, HttpSession session) {

		// 조회수 1 증가시키기
		qnaService.modifyReadcount(id);

		// 글 한개 가져오기
		Qna qna = qnaService.getQna(id);

		User user = (User) session.getAttribute("user");

		model.addAttribute("qna", qna);

		model.addAttribute("pageNum", pageNum);
		model.addAttribute("user", user);
		return "qna/qnaContent";
	} // content
	
	
	// 핫스팟 목록추가 신청
	@GetMapping("/write")
	public String write(@ModelAttribute("pageNum") String pageNum,Model model,HttpSession session) {
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);
		return "qna/qnaWrite";
	}
	
	// 주글쓰기 처리
	@PostMapping("/write")
	public String write(Qna qna, String pageNum,RedirectAttributes rttr
			) throws Exception {
		
		// insert할 글번호 가져오기
		int num = qnaService.nextQnaNum();
		
		qna.setId(num);
		qna.setReadcount(0);
		qna.setRegDate(new Date());
		

		// 주글을 테이블에 insert하기
		qnaService.register(qna);
		
		
		// 리다이렉트 시 서버로 다시 전달할 데이터를 저장하기
		rttr.addAttribute("id", qna.getId());
		rttr.addAttribute("pageNum", pageNum);
		
		return "redirect:/qna/qnaBoard";
	} // write post
	
	//수정하기
		@PutMapping("modify")
		@ResponseBody // 문자열 리턴하기 위해서 어노테이션 붙히기 ajax에 success 라는 문자열을 리턴해줘야한다
		public String modify(@RequestBody Qna qna) {
			/*
			 * if(qnaService.getQna(qna.getId()).getUserId().equals(qna.getUserId())) {
			 * //DB의 유저아이디와 받아온 유저아이디가 같다면 }
			 */
			qnaService.modifyQna(qna);
			return "success"; // 문자열을 리턴해야한다 jsp가 아니라
		}
			
		@DeleteMapping("delete/{id}")
		@ResponseBody
		public String delete(@PathVariable int id) {
			qnaService.removeQna(id);
			return "success";
		}
		
		
		
	
}
