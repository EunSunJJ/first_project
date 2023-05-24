package com.first_project.post;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/answer-post")
@Controller
public class AnswerPostController {

	@GetMapping("/post-list")
	//  http://localhost/admin/answer-post/post-list
	public String PostList(Model model) {
		model.addAttribute("view", "answer/list" );
		return "template/layout";
	}
	
	@GetMapping("/post-create")
	//  http://localhost/admin/answer-post/post-create
	public String PostCreate(Model model) {
		model.addAttribute("view", "answer/create" );
		return "template/layout";
	}
}
