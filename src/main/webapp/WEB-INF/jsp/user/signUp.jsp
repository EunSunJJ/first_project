<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="wrap">
	<div class="signUpTitle">⭐회원가입⭐</div>

	<div class="signUpBox ml-4">

		<form id="signUpForm" method="post" action="/user/sign-up">

			<div class="form-group">
				<span class="font-weight-bold">아이디</span>
				<div class="d-flex">
					<input type="text" id="loginId" name="loginId" class="form-control col-5 mr-2 mt-1" placeholder="아이디를 입력해주세요">
					<input type="button" id="loginIdCheckBtn" name="loginIdCheckBtn" value="중복확인" class="btn btn-success">
				</div>
			</div>

			<%-- 중복확인 결과 --%>
			<div>
				<div id="idCheckLength" class="small text-danger d-none"> ID를 4자 이상 입력해주세요.</div>
				<div id="idCheckDuplicated" class="small text-danger d-none"> 이미 사용중인 ID입니다.</div>
				<div id="idCheckOk" class="small text-success d-none"> 사용 가능한 ID 입니다.</div>
			</div>
			
			
			<div class="form-group">
				<span class="font-weight-bold">비밀번호</span> 
				<input type="text" id="password" name="password" class="form-control col-5 mt-1" placeholder="비밀번호를 입력해주세요">
			</div>


			<div class="form-group">
				<span class="font-weight-bold">비밀번호 확인</span> 
				<input type="text" id="passwordCk" name="passwordCk" class="form-control col-5 mt-1" placeholder="비밀번호를 다시 입력해 주세요">
			</div>


			<div class="form-group">
				<span class="font-weight-bold">이름</span> 
				<input type="text" id="name" name="name" class="form-control col-5 mt-1" placeholder="이름을 입력해 주세요">
			</div>


			<div class="form-group">
				<span class="font-weight-bold">닉네임</span> 
				<input type="text" id="nickname" name="nickname" class="form-control col-5 mt-1"placeholder="닉네임을 입력해 주세요">
			</div>


			<div class="form-group">
				<span class="font-weight-bold">이메일</span> 
				<input type="text" id="email" name="email" class="form-control col-5 mt-1"placeholder="이메일주소를 입력해 주세요">
			</div>

			<button type="submit" id="signUpBtn1" class="btn btn-success">회원가입</button>
		</form>
	</div>
</div>
