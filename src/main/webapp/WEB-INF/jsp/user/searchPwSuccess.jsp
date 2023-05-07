<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="wrap">
	<div class="d-flex justify-content-center">
		<div class="mt-5 mb-3">
			<h1>비밀번호 찾기</h1>
		</div>
	</div>

	<div class="d-flex justify-content-center mb-4">
		<div>
			<h3>새로운 비밀번호로 변경해주세요</h3>
		</div>
	</div>

	<div class="successPw">
		<span class="font-weight-bold">비밀번호</span> 
		<input type="password" id="newPassword" name="newPassword" class="form-control col-6 mt-1 mb-3"
			placeholder="새로운 비밀번호를 입력해주세요">
	</div>
	
	<div class="successPwCk">
		<span class="font-weight-bold">비밀번호 확인</span> 
		<input type="password" id="newPassword" name="newPassword" class="form-control col-6 mt-1 mb-4"
			placeholder="새로운 비밀번호를 한번 더 입력해주세요">
	</div>

		<a class="btn btn-primary mr-3" href="/user/sign-in-view" id="signInBtn3">로그인 화면으로 돌아가기</a>

</div>