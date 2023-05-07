<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div id="wrap">
	<div class="d-flex justify-content-center">
		<div class="mt-5"><h2>아이디 찾기</h2></div>
	</div>	
	
	<div class="d-flex justify-content-center mb-3">
		<div>아이디는 가입 시 입력하신 이메일을 통해 찾을 수 있습니다</div>
	</div>
	
	<div id="searchIdBox">
		<form id="searchIdForm" method="post" action="/user/search-id">
			<div class="d-flex justify-content-center align-items-center mb-3">
				<span class="font-weight-bold mr-3">아이디</span> 
				<input type="text" id="loginId" name="loginId" class="form-control col-4 mt-1" placeholder="아이디를 입력해주세요">
			</div>
			
			
			<div class="d-flex justify-content-center align-items-center mb-3">
				<span class="font-weight-bold mr-3">이메일</span> 
				<input type="text" id="email" name="email" class="form-control col-4 mt-1" placeholder="이메일을 입력해주세요">
			</div>	
			
			<button type="submit" id="searchIdBtn2" class="btn btn-secondary">아이디 찾기</button>	
		</form>
	</div>	
</div>