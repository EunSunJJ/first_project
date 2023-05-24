package com.first_project.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.first_project.user.dao.UserMapper;
import com.first_project.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserMapper userMapper;
	
	// 아이디 중복확인 
	// input : loginId
	// output : User
	public User getUserByLoginId (String loginId) {
		return userMapper.selectUserByLoginId(loginId);
	}
	
	// 회원가입
	// input : loginId, password, name, nickname, email
	// output : int
	public int addUser (String loginId, String password, String name, String nickname, String email) {
		return userMapper.insertUser(loginId, password, name, nickname, email);
	}
	
	// 로그인
	// input : loginId, password
	// output : User
	public User getUserByLoginIdPassword(String loginId, String password) {
		return userMapper.selectUserByLoginIdPassword(loginId, password);
	} 
	
	// 아이디 찾기
	// input : name, email
	// output : Map
	public User getUserByNameEmail(String name, String email) {
		return userMapper.selectUserByNameEmail(name, email);
	}
}