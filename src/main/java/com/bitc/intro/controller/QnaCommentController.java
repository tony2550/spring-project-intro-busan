package com.bitc.intro.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bitc.intro.domain.QnaComment;
import com.bitc.intro.service.QnaCommentService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@RequestMapping("/reply/*")
@RestController // Controller + @ResponseBody
public class QnaCommentController {
	@Autowired
	private QnaCommentService qservice;

	// 댓글 추가
	@PostMapping("insert")
	public String insert(@RequestBody QnaComment comment) {
		
		comment.setRegDate(new Date());
		
		System.out.println(comment.toString());
		
		qservice.insert(comment);
		return "success";
	}

	// 댓글리스트
	
	@GetMapping(value = "commentList", produces = "application/text;charset=utf8")
	public String list(int qnaId) {
		List<QnaComment> clist = qservice.getList(qnaId);
		System.out.println(clist.toString());

		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String clist2Json = gson.toJson(clist);
		
		return clist2Json;
	}

	// 댓글 삭제
	@DeleteMapping("delete/{id}")
	public int delete(@PathVariable int id) {
		System.out.println(id);
			
		qservice.delete(id);
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String clist2Json = gson.toJson(id);
		System.out.println(id);
		
		
		return id;
	}

}
