package com.first_project.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.first_project.test.bo.UserBO;

@Controller
public class TestController {
	
	@Autowired
	private UserBO userBO;
	
	@ResponseBody
	@RequestMapping("/test1")
	// http://localhost:8080/test1
	public String test1() {
		return "Hello world";
	}
	
	@ResponseBody
	@RequestMapping("/test2")
	// http://localhost:8080/test2
	public Map<String, Object> test2() {
		Map<String, Object> map = new HashMap<>();
		map.put("a", 1);
		map.put("b", 2);
		map.put("c", 3);
		map.put("d", 4);
		return map;
	}
	
	@RequestMapping("/test3")
	// http://localhost/test3
	public String test3() {
		return "test/test";
	}

	@ResponseBody
	@RequestMapping("/test4")
	// http://localhost/test4
	public List<Map<String, Object>> test4() {
		return userBO.getUserList();
	}
}