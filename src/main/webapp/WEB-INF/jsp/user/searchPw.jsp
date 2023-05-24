<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="wrap">
	<div class="d-flex justify-content-center">
		<div class="mt-5">
			<h2>비밀번호 찾기</h2>
		</div>
	</div>

	<div class="d-flex justify-content-center mb-3">
		<div>비밀번호는 가입 시 입력하신 이메일을 통해 찾을 수 있습니다</div>
	</div>

	<div id="searchPwBox">
		<form id="searchPwForm" method="post" action="/user/search-pw">
			<div class="d-flex justify-content-center align-items-center mb-3">
				<span class="font-weight-bold mr-4">이름</span> <input type="text"
					id="name" name="name" class="form-control col-4 mt-1"
					placeholder="이름을 입력해주세요">
			</div>


			<div class="d-flex justify-content-center align-items-center mb-3">
				<span class="font-weight-bold mr-3">아이디</span> <input type="text"
					id="loginId" name="loginId" class="form-control col-4 mt-1"
					placeholder="아이디를 입력해주세요">
			</div>


			<div class="d-flex justify-content-center align-items-center mb-3">
				<span class="font-weight-bold mr-3">이메일</span> <input type="text"
					id="email" name="email" class="form-control col-4 mt-1"
					placeholder="이메일을 입력해주세요">
			</div>

			<button type="submit" id="searchPwBtn2" class="btn btn-secondary">비밀번호
				찾기</button>
		</form>
	</div>
</div>

<script>
$(document).ready(function(){
	$("#searchPwBtn2").on("submit",function(e){
		e.preventDefault(e);
		
		// validation
		let name = $("#name").val().trim();
		let loginId = $("#loginId").val().trim();
		let email = $("#email").val().trim();
		
		if(!name) {
			alert("이름을 입력하세요");
			return false;
		}
			
		if(!loginId) {
			alert("아이디를 입력하세요");
			return false;
		}		
		
		if(!email) {
			alert("이메일을 입력하세요");
			return false;
		}
		
		// ajax 통신
		$.ajax({
			// request
			type:"post"
			, url:"/user/search-pw"
			, data:{"name":name, "loginId":loginId, "email":email}			
			// response
			, success:function(data){
				
			}
		});
	});
});

</script>