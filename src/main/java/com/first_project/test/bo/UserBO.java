package com.first_project.test.bo;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.first_project.test.dao.UserMapper;

@Service
public class UserBO {

	@Autowired
	private UserMapper userMapper;
	
	public List<Map<String, Object>> getUserList() {
		return userMapper.selectUserList();
	}
}
