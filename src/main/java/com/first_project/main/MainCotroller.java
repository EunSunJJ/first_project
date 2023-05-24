package com.first_project.main;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainCotroller {
	
	// 메인페이지
	@GetMapping("/start-page")
	// http://localhost/start-page
	public String signUpView(Model model) {
		model.addAttribute("view", "main/main");
		return "template/layout";
	}
	
	// 정보페이지들
	
}
