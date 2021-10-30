package com.bitc.intro.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitc.intro.domain.Love;
import com.bitc.intro.domain.Restaurant;
import com.bitc.intro.domain.User;
import com.bitc.intro.service.RestaurantService;
import com.bitc.intro.service.UserService;
import com.bitc.intro.util.Script;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/user/*")
@Log
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private RestaurantService restaurantService;

	// 회원가입 폼으로 이동
	@GetMapping("join")
	public String joinForm() {
		return "user/join";
	} // get join

	// 회원가입
	@PostMapping("join")
	public String join(User user) {
		// 비밀번호 암호화 처리
		String password = user.getPassword();
		String hashPassword = BCrypt.hashpw(password, BCrypt.gensalt());
		user.setPassword(hashPassword);
		System.out.println(user.toString());
		// 회원가입 처리
		userService.resister(user);
		return "redirect:/user/login";
	} // post join

	// 회원가입시 아이디 중복체크
	@PostMapping(value = "/joinIdDupChkJson", produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Map<String, Object> joinIdDupChkJson(String username) {

		int rowCount = userService.getCountById(username);

		boolean isIdDup = (rowCount == 1) ? true : false;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("isIdDup", isIdDup);

		return map;
	}

	// 로그인 폼으로 이동
	@GetMapping("login")
	public String loginForm() {
		return "user/login";
	} // get login

	// 로그인
	@PostMapping("login")
	public ResponseEntity<String> login(String username, String password, HttpSession session) {

		User user = userService.getUserById(username);
		boolean isSamePassword = false;
		String message = "";

		if (user != null) { // 아이디가 존재할 경우
			// 입력된 패스워드를 데이터베이스에 저장된 암호화된 패스워드와 같은지 비교
			isSamePassword = BCrypt.checkpw(password, user.getPassword());
			if (!isSamePassword) { // 패스워드 불일치
				message = "패스워드가 일치하지 않습니다.";
			}
		} else { // 일치하는 아이디가 없음
			message = "존재하지 않는 아이디입니다.";
		}

		if (user == null || isSamePassword == false) {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "text/html; charset=utf-8");
			String str = Script.back(message);
			return new ResponseEntity<String>(str, headers, HttpStatus.OK);
		}

		session.setAttribute("user", user);

		HttpHeaders headers = new HttpHeaders();
		headers.add("Location", "/");

		return new ResponseEntity<String>(headers, HttpStatus.FOUND);
	} // login post

	// 로그아웃
	@GetMapping("logout")
	public ResponseEntity<String> logout(HttpSession session) {
		session.invalidate();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=utf-8");

		String str = Script.href("로그아웃 되었습니다", "/");
		return new ResponseEntity<String>(str, headers, HttpStatus.OK);
	} // logout get

	// 마이페이지로 이동
	@GetMapping("/mypage")
	public String mypage() {
		return "user/mypage";
	} // mypage get

	// 회원 탈퇴 페이지로 이동
	@GetMapping("/remove")
	public String remove() {
		return "user/remove";
	} // remove get

	// 회원 탈퇴
	@PostMapping("/remove")
	public ResponseEntity<String> remove(String password, HttpSession session) {
		User user = (User) session.getAttribute("user");
		boolean isSamePassword = BCrypt.checkpw(password, user.getPassword());

		if (!isSamePassword) {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "text/html; charset=utf-8");

			String str = Script.back("패스워드가 일치하지 않습니다.");

			return new ResponseEntity<String>(str, headers, HttpStatus.OK);
		}
		// 회원탈퇴(삭제)처리
		userService.deleteById(user.getUsername());

		session.invalidate(); // 세션 초기화

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=utf-8");

		String str = Script.href("회원탈퇴가 정상적으로 처리되었습니다.", "/");

		return new ResponseEntity<String>(str, headers, HttpStatus.OK);
	} // remove post

	// 회원정보 수정시 패스워드 입력
	@GetMapping("/modify")
	public String modify() {
		// 회원 본인이 맞는지 패스워드 입력화면을 응답으로 주기
		return "user/modifyPassword";
	}

	// 회원 정보 수정시 비밀번호 한번더 확인
	@PostMapping("/modifyValid")
	public ResponseEntity<String> modifyValid(String password, HttpSession session) {
		User user = (User) session.getAttribute("user");

		boolean isSamePassword = BCrypt.checkpw(password, user.getPassword());

		if (!isSamePassword) {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "text/html; charset=utf-8");

			String str = Script.back("패스워드가 일치하지 않습니다.");

			return new ResponseEntity<String>(str, headers, HttpStatus.OK);
		}

		// 회원정보수정 폼 화면을 볼 수 있도록 해당 요청 주소로 리다이렉트 시키기
		HttpHeaders headers = new HttpHeaders();
		headers.add("Location", "/user/modifyForm"); // redirect 경로 지정

		return new ResponseEntity<String>(headers, HttpStatus.FOUND);
	} // modifyForm post

	// 회원정보 수정 폼으로 이동
	@GetMapping("/modifyForm")
	public String modifyForm() {
		return "user/modifyForm";
	} // modifyFrom post

	// 회원정보 수정
	@PostMapping("/modifyProcess")
	public String modifyProcess(User user, HttpSession session) {

		String hashPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());

		user.setPassword(hashPassword);

		// 테이블에 회원정보 수정 처리
		userService.modifyUserById(user);

		// 로그인 유지용 세션 정보 수정하기
		User dbUser = userService.getUserById(user.getUsername());
		session.setAttribute("user", dbUser);

		return "redirect:/user/mypage";

	} // modifyProcess post

	// 좋아요한 목록 보기
	@GetMapping("loveList")
	public String likeList(HttpSession session) {
		User user = (User)session.getAttribute("user");
		List<Restaurant> loveList = userService.getLoveList(user);
		session.setAttribute("loveList", loveList);
		return "user/loveList";
	}
	
	// 좋아요한 목록에서 좋아요 취소하기
	@GetMapping("/deleteFromList/{rid}")
	public String deleteFromList(HttpSession session, @PathVariable int rid) {
		User user = (User) session.getAttribute("user");
		int userId = user.getId();
		int restId = rid;
		userService.cancleLove(userId, restId);
		return "redirect:/user/loveList";
	}
	

	// restaurnatDetail 페이지에서 좋아요 기능
	@GetMapping("/checkLove/{rid}")
	@ResponseBody
	public String checkLove(HttpSession session, Model model, @PathVariable int rid) {
		User user = (User) session.getAttribute("user");
		int userId = user.getId();
		int restId = rid;
		
		// 좋아요 눌렀는지 조회(love 테이블에 동일한 row가 있는지 확인)
		if(userService.checkLoveIsPressed(userId, restId)==1) { // 이미 좋아요를 눌렀다면
			userService.cancleLove(userId, restId); // 좋아요 취소
			// restaurantService.decreaseLove
			return "cancleLove";
		} else { // 좋아요를 누른적이 없으면
			userService.pressLove(userId, restId); // 좋아요
			// restaurantService.increaseLove
			return "success";
		}
	}
	
}
