package com.first_project.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.first_project.user.model.User;

@Repository
public interface UserMapper {

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
}
