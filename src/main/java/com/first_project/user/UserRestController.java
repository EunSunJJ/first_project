package com.first_project.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.first_project.user.bo.UserBO;
import com.first_project.user.model.User;
import com.first_project.util.Sha256;

@RequestMapping("/user")
@RestController
public class UserRestController {

	@Autowired
	private UserBO userBO;

	// 아이디 중복확인 API
	@PostMapping("/is-duplicated-id")
	public Map<String, Object> isDuplicatedId(@RequestParam("loginId") String loginId) {

		Map<String, Object> result = new HashMap<>();
		// select
		// exist count로 boolean / null인지 아닌지 두가지 방법
		User user = userBO.getUserByLoginId(loginId);

		// 응답 user가 있으면, 없으면
		if (user != null) {
			result.put("code", 1);
			result.put("result", true);
		} else {
			result.put("code", 1);
			result.put("result", false);
		}
		return result;
	}

	// 회원가입 API
	@PostMapping("/sign-up")
	public Map<String, Object> signUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password, 
			@RequestParam("name") String name,
			@RequestParam("nickname") String nickname, 
			@RequestParam("email") String email) {

		// PW hashing ★
		String hashedPassword = Sha256.testSHA256(password);

		// DB insert
		userBO.addUser(loginId, hashedPassword, name, nickname, email);
		// 응답값
		Map<String, Object> result = new HashMap<>();
		result.put("code", 1);
		result.put("result", "성공");

		return result;
	}

	// 로그인 API
	@PostMapping("/sign-in")
	public Map<String, Object> signIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password, 
			HttpServletRequest request) {

		// PW hashing ★
		String hashedPassword = Sha256.testSHA256(password);

		// DB select -> null 또는 1행
		User user = userBO.getUserByLoginIdPassword(loginId, hashedPassword);

		// 로그인 상태 처리
		Map<String, Object> result = new HashMap<>();
		if (user != null) { // 로그인
			result.put("code", 1);
			result.put("result", "성공");

			// 세션에 유저 정보 담기
			HttpSession session = request.getSession();
			session.setAttribute("userId", user.getId());
			session.setAttribute("userName", user.getName());
			session.setAttribute("userLoginId", user.getLoginId());

		} else { // 로그인 불가능
			result.put("code", 500);
			result.put("errorMessage", "존재하지 않는 사용자 입니다");

		}
		// 응답
		return result;
	}

	// 아이디 찾기 API
	@PostMapping("/search-id")
	public Map<String, Object> searchId(
			@RequestParam("name") String name, 
			@RequestParam("email") String email) {

		// select
		User user = userBO.getUserByNameEmail(name, email);
		
		// 응답
		Map<String, Object> result = new HashMap<>();
		if (name != null && email != null) { // 조건이 정보가 일치해야 성공인데 그냥 null만 아니면 성공으로 뜸
			result.put("code", 1);
			result.put("result", "아이디 찾기에 성공했습니다.");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "존재하지 않는 사용자 입니다");
		}
		return result;
		
	}
		// 비밀번호 찾기 API
}
