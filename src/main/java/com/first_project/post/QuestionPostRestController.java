package com.first_project.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.first_project.post.bo.QuestionPostBO;
import com.first_project.util.Sha256;

@RequestMapping("/question-post")
@RestController
public class QuestionPostRestController {

	@Autowired
	private QuestionPostBO questionPostBO;
	
	// 질문게시판 글쓰기 API
	@PostMapping("/post-create")
	public Map<String, Object> postCreate(
			@RequestParam("subject") String subject,
			@RequestParam("content") String content,
			@RequestParam(value = "file", required=false) MultipartFile file,
			@RequestParam(value="secretPost", required=false) boolean secretPost,
			@RequestParam(value="password", required=false) String password,
			HttpSession session){
		
		// 세션에서 유저 정보 꺼내옴
		int userId = (int)session.getAttribute("userId");
		String userLoginId = (String)session.getAttribute("userLoginId");
		
		// PW hashing ★		
		String hashedPassword = Sha256.testSHA256(password);
		
		// DB insert
		int rowCount = questionPostBO.addQuestionPost(userId, userLoginId, subject, content, file, secretPost, hashedPassword);
		
		
		// 응답
		Map<String, Object> result = new HashMap<>();
		if(rowCount > 0) {
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "질문을 저장하지 못했습니다");
		}
		return result;
	}
	
}
