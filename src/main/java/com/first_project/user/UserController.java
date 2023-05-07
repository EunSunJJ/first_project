package com.first_project.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/user")
@Controller
public class UserController {

	// 회원가입
	@GetMapping("/sign-up-view")
	// http://localhost/user/sign-up-view
	public String signUpView(Model model) {
		model.addAttribute("view", "user/signUp");
		return "template/layout";
	}

	// 로그인
	@GetMapping("/sign-in-view")
	// http://localhost/user/sign-in-view
	public String signInView(Model model) {
		model.addAttribute("view", "user/signIn");
		return "template/layout";
	}

	// 로그아웃

	// 아이디 찾기
	@GetMapping("/search-id-view")
	// http://localhost/user/search-id-view
	public String searchIdView(Model model) {
		model.addAttribute("view", "user/searchId");
		return "template/layout";
	}

	// 비밀번호 찾기
	@GetMapping("/search-pw-view")
	// http://localhost/user/search-pw-view
	public String searchPwView(Model model) {
		model.addAttribute("view", "user/searchPw");
		return "template/layout";
	}

	// 아이디 찾기 성공
	@GetMapping("/search-id-success-view")
	// http://localhost/user/search-id-success-view
	public String searchIdSuccessView(Model model) {
		model.addAttribute("view", "user/searchIdSuccess");
		return "template/layout";
	}

	// 비밀번호 찾기 성공
	@GetMapping("/search-pw-success-view")
	// http://localhost/user/search-pw-success-view
	public String searchPwSuccessView(Model model) {
		model.addAttribute("view", "user/searchPwSuccess");
		return "template/layout";
	}
}