<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="wrap">
	<div class="signInTitle">⭐로그인⭐</div>

	<div class="signInBox ml-4">

		<form id="signIpForm" method="post" action="/user/sign-in">

			<div class="form-group">
				<span class="font-weight-bold">아이디</span> <input type="text"
					id="loginId" name="loginId" class="form-control col-5 mt-1"
					placeholder="아이디를 입력해주세요">
			</div>


			<div class="form-group">
				<span class="font-weight-bold">비밀번호</span> <input type="password"
					id="password" name="password" class="form-control col-5 mt-1"
					placeholder="비밀번호를 입력해 주세요">
			</div>

			<button type="submit" id="signInBtn1" class="btn btn-primary">로그인</button>

			<div class="buttonBox">
				<a class="btn btn-success" href="/user/sign-up-view" id="signUpBtn2">회원가입</a>
				<a class="btn btn-secondary" href="/user/search-id-view"
					id="searchIdBtn1">아이디 찾기</a> <a class="btn btn-secondary"
					href="/user/search-pw-view" id="searchPwBtn1">비밀번호 찾기</a>
			</div>
		</form>
	</div>
</div>

<script>
$(document).ready(function(){
	// 로그인
	$("#signIpForm").on("submit", function(e){
		e.preventDefault();
		// validation
		let loginId = $("#loginId").val().trim();
		let password = $("#password").val();
		
		if(!loginId) {
			alert("아이디를 입력하세요");
			return false;
		}
		
		if(!password) {
			alert("비밀번호를 입력하세요");
			return false;
		}

		// 서버에 보내준다
		let url = $('#signIpForm').attr("action");
		console.log(url);
		let params = $('#signIpForm').serialize();
		console.log(params);
		
		// request
		$.post(url, params)
		
		// response
		.done(function(data){
			if (data.code == 1) {
				alert("환영합니다!");
				// 로그인 성공 시 이동페이지 -> 다시 설정하기 (확인용)
				location.href = "/start-page";
			} else {
				alert(data.errorMessage);
			}
		});
		
	});
});
</script>

