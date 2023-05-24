package com.first_project.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.first_project.post.dao.QuestionPostMapper;
import com.first_project.post.model.QuestionPost;
import com.first_project.util.FileManagerService;

@Service
public class QuestionPostBO {
	
	@Autowired
	private QuestionPostMapper questionPostMapper;

	@Autowired
	private FileManagerService fileManager;
	
	// 질문목록 뿌리기 위해 정보 가져오기
	public List<QuestionPost> getQuestionPostList() {
		return questionPostMapper.selectQuestionPostList();
	}
	// 질문작성
	public int addQuestionPost(
			int userId, 
			String loginId, 
			String subject, 
			String content,
			MultipartFile file,
			boolean secretPost,
			String password) {
		
		String imagePath = null;
		
		if(file != null) {
			// 서버에 이미지 업로드 후 imagePath 받아오기
			imagePath = fileManager.saveFile(loginId, file);
		}
		
		return questionPostMapper.insertQuestionPost(userId, subject, content, imagePath, secretPost, password);
		}

}
