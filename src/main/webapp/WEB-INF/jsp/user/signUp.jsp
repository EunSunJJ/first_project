<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="wrap">
	<div class="signUpTitle">⭐회원가입⭐</div>

	<div class="signUpBox ml-4">

		<form id="signUpForm" method="post" action="/user/sign-up">

			<div class="form-group">
				<span class="font-weight-bold">아이디</span>
				<div class="d-flex">
					<input type="text" id="loginId" name="loginId" class="form-control col-5 mr-2 mt-1" placeholder="아이디를 입력해주세요 (6자리 이상)">
					<input type="button" id="loginIdCkBtn" name="loginIdCkBtn" value="중복확인" class="btn btn-success">
				</div>
			</div>

			<%-- 중복확인 결과 --%>
			<div class="ckBox">
				<div id="idCkkLength" class="small text-danger d-none"> ID를 6자 이상 입력해주세요</div>
				<div id="idCkDuplicated" class="small text-danger d-none"> 이미 사용중인 ID입니다</div>
				<div id="idCkOk" class="small text-success d-none"> 사용 가능한 ID 입니다</div>
			</div>
			
			
			<div class="form-group">
				<span class="font-weight-bold">비밀번호</span> 
				<input type="password" id="password" name="password" class="form-control col-5 mt-1" placeholder="비밀번호를 입력해주세요">
			</div>


			<div class="form-group">
				<span class="font-weight-bold">비밀번호 확인</span> 
				<input type="password" id="passwordCk" name="passwordCk" class="form-control col-5 mt-1" placeholder="비밀번호를 다시 입력해 주세요">
			</div>


			<div class="form-group">
				<span class="font-weight-bold">이름</span> 
				<input type="text" id="name" name="name" class="form-control col-5 mt-1" placeholder="이름을 입력해 주세요">
			</div>


			<div class="form-group">
				<span class="font-weight-bold">닉네임</span> 
				<input type="text" id="nickname" name="nickname" class="form-control col-5 mt-1" placeholder="닉네임을 입력해 주세요">
			</div>


			<div class="form-group">
				<span class="font-weight-bold">이메일</span> 
				<input type="text" id="email" name="email" class="form-control col-5 mt-1" placeholder="이메일주소를 입력해 주세요">
			</div>

			<button type="submit" id="signUpBtn1" class="btn btn-success">회원가입</button>
		</form>
	</div>
</div>

<script>
$(document).ready(function(){
	// 중복 확인
	$('#loginIdCkBtn').on('click', function(){
		// 경고 문구 초기화
		$('#idCkkLength').addClass("d-none");
		$('#idCkDuplicated').addClass("d-none");
		$('#idCkOk').addClass("d-none");
		
		let loginId = $('#loginId').val().trim();
		
		// 6자 미만이면 경고 문구 노출
		if(loginId.length < 6) {
			$('#idCkkLength').removeClass('d-none');
			return;
		}
		
		// AJAX 통신 - 중복확인(6자 이상이면 서버에게 물어봐야해 중복인지 아닌지)
		$.ajax({
			// request
			type:"post"
			, url:"/user/is-duplicated-id"
			, data:{"loginId":loginId}
		
			// response
			, success:function(data) {
				if(data.result) {
					// 중복 = 사용불가
					$("#idCkDuplicated").removeClass("d-none");
				} else {
					// 사용가능
					$("#idCkOk").removeClass("d-none");
				}
			}
		});
	}); 
	
	// 회원가입
	$("#signUpForm").on("submit", function(e){
		// 폼테크가 동작하지 않도록 하는것 = e.preventDefault();  -> 화면이동X
		e.preventDefault(); // 서브밋 기능 중단
		
		// validation 자동으로 -> 그대로 두면 알아서 submit이 된다
		// submit 기능을 멈추고 임의로 submit을 부를 수도 있다 (이걸로!)
		let loginId = $("#loginId").val().trim();
		let password = $("#password").val();
		let passwordCk = $("#passwordCk").val();
		let name = $("#name").val().trim();
		let nickname = $("#nickname").val().trim();
		let email =$("#email").val();
		
		// 값이 있는지 없는지 순차적으로 확인
		if (!loginId) {
			alert("아이디를 입력하세요");
			return false;  // form일때는 반드시 return false 그래야 동작을 안한다
		}
		
		if(!password || !passwordCk) {
			alert("비밀번호를 입력하세요");
			return false;
		}
		
		if(password != passwordCk) {
			alert("비밀번호가 일치하지 않습니다");
			return false;
		}
			
		if(!name) {
			alert("이름을 입력하세요");
			return false;
		}
		
		if(!nickname) {
			alert("닉네임을 입력하세요");
			return false;
		}
		
		if(!email) {
			alert("이메일을 입력하세요");
			return false;
		}
		
		// 아이디 중복확인 완료 됐는지 확인 -> idCkOk d-none이 있으면 alert
		if ($("#idCkOk").hasClass("d-none")) {
			alert("아이디 중복확인을 해주세요");
			return false;
		}
		
		// 서버로 보내기
		let url = $(this).attr("action");
		console.log(url);
		
		let params = $(this).serialize();
		console.log(params);
		// 보낼 준비 완료
		
		$.post(url, params) // request
		.done(function(data){
			// response
			if (data.code == 1) {  // 성공
				alert("가입을 환영합니다! 로그인을 해주세요");
				location.href = "/user/sign-in-view"
			} else { // 실패
				alert(data.errorMessage);
			}
		});
	});
});
</script>
