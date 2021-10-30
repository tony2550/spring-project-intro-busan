package com.bitc.intro.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitc.intro.domain.Manager;
import com.bitc.intro.domain.User;
import com.bitc.intro.service.ManagerService;
import com.bitc.intro.service.RestaurantService;
import com.bitc.intro.service.UserService;
import com.bitc.intro.util.Script;

@Controller
@RequestMapping("/manager")
public class ManagerController {

	@Autowired
	private ManagerService managerService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private RestaurantService restService;
	
	
	// 로그인 페이지로 이동
	// http://localhost:8000/manager/login
	@GetMapping("/login")
	public String login() {
		return "manager/login";
	}
	
	// 로그인
	@PostMapping("/login")
	public ResponseEntity<String> login(String username, String password, HttpSession session) {

		Manager manager = managerService.getManagerById(username);
		System.out.println(manager);
		boolean isSamePassword = false;
		String message = "";

		if (manager != null) { // 아이디가 존재할 경우
			isSamePassword = (password.equals(manager.getPassword()))?true:false;
			
			if (isSamePassword==false) { // 패스워드 불일치
				message = "패스워드가 일치하지 않습니다.";
			}
		} else { // 일치하는 아이디가 없음
			message = "존재하지 않는 아이디입니다.";
		}

		if (manager == null || isSamePassword == false) {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "text/html; charset=utf-8");
			String str = Script.back(message);
			return new ResponseEntity<String>(str, headers, HttpStatus.OK);
		}

		session.setAttribute("manager", manager);
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Location", "/");

		return new ResponseEntity<String>(headers, HttpStatus.FOUND);
	} // login post
	
	
	// 고객관리 페이지로 이동
	@GetMapping("/management")
	public String management(Model model) {
		List<User> users = userService.getUsers();
		model.addAttribute("users", users);
		return "manager/management";
	}
	
	// 고객관리 상세페이지로 이동
	@GetMapping("/manageDetail")
	public String manageDetail(String username, Model model) { // user의 username을 매개변수로 받음
		User user = userService.getUserById(username);
		System.out.println(user);
		model.addAttribute("user", user);
		return "manager/manageDetail";
	}
	
	
}
