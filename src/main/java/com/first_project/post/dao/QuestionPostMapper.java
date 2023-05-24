package com.first_project.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.first_project.post.model.QuestionPost;

@Repository
public interface QuestionPostMapper {

	// 질문목록 뿌리기 위해 정보 가져오기
	public List<QuestionPost> selectQuestionPostList();
	
	// 비밀번호 파라미터 추가하기
	public int insertQuestionPost(
			@Param("userId") int userId, 
			@Param("subject") String subject, 
			@Param("content") String content, 			
			@Param("imagePath") String imagePath,
			@Param("secretPost") boolean secretPost,
			@Param("password") String password);
}
