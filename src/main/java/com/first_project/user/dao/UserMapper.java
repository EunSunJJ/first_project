package com.first_project.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.first_project.user.model.User;

@Repository
public interface UserMapper {

	// 아이디 중복 확인
	public User selectUserByLoginId (String loginId);
	
	// 회원가입
	public int insertUser (
			@Param("loginId") String loginId, 
			@Param("password") String password, 
			@Param("name") String name, 
			@Param("nickname") String nickname, 
			@Param("email") String email);
	
	// 로그인
	public User selectUserByLoginIdPassword(
			@Param("loginId") String loginId, 
			@Param("password")String password);
	
	// 아이디 찾기
	public User selectUserByNameEmail(
			@Param("name") String name, 
			@Param("email") String email);
}
