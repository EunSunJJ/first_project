package com.first_project.post;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.first_project.post.bo.QuestionPostBO;
import com.first_project.post.model.QuestionPost;

@RequestMapping("question-post")
@Controller
public class QuestionPostController {

	@Autowired
	private QuestionPostBO questionPostBO;
	
	// 질문 리스트 -> 다시보기
	@GetMapping("/post-list")
	//  http://localhost/question-post/post-list
	public String PostList(
			Model model,
			HttpSession session) {
		Integer userId = (Integer)session.getAttribute("userId");
		
		if(userId == null) {
			return "redirect:/user/sign-in-view";
		}
		
		List<QuestionPost> QuestionPostList = questionPostBO.getQuestionPostList();
		model.addAttribute("QuestionPostList", QuestionPostList); // el문법으로 사용가능
		model.addAttribute("view", "question/list");
		return "template/layout";
	}

	// 질문 작성
	@GetMapping("/post-create")
	//  http://localhost/question-post/post-create
	public String PostCreat(Model model) {
		model.addAttribute("view", "question/create");
		return "template/layout";
	}

	// 질문 수정&삭제
	@GetMapping("/post-detail")
	//  http://localhost/question-post/post-detail
	public String PostDetail(
			Model model) {
		
		model.addAttribute("view", "question/detail");
		return "template/layout";
	}
}
