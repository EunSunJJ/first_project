<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="wrap">
	<div class="d-flex justify-content-center">
		<div class="mt-5">
			<h2>아이디 찾기</h2>
		</div>
	</div>

	<div class="d-flex justify-content-center mb-3">
		<div>아이디는 가입 시 입력하신 이메일을 통해 찾을 수 있습니다</div>
	</div>

	<div id="searchIdBox">
		<form id="searchIdForm" method="post" action="/user/search-id">
			<div class="d-flex justify-content-center align-items-center mb-3">
				<span class="font-weight-bold mr-3">이름</span> <input type="text"
					id="name" name="name" class="form-control col-4 mt-1"
					placeholder="이름을 입력해주세요">
			</div>


			<div class="d-flex justify-content-center align-items-center mb-3">
				<span class="font-weight-bold mr-3">이메일</span> <input type="text"
					id="email" name="email" class="form-control col-4 mt-1"
					placeholder="이메일을 입력해주세요">
			</div>

			<button type="submit" id="searchIdBtn2" class="btn btn-secondary">아이디
				찾기</button>
		</form>
	</div>
</div>

<script>
$(document).ready(function(){
	$("#searchIdForm").on("submit", function(e){
		e.preventDefault();
		
		// validation
		let name = $("#name").val().trim();
		let email = $("#email").val().trim();
		
		if(!name) {
			alert("이름을 입력하세요");
			return false;
		}
		
		if(!email) {
			alert("이메일을 입력하세요");
			return false;
		}
		
		//  AJAX 통신
		$.ajax({
			// request
			type:"post"
			, url:"/user/search-id"
			, data:{"name":name, "email":email}
			// response
			, success:function(data) {
				if (data.result) {
					alert("아이디 찾기에 성공했습니다.")
					// 로그인 아이디를 뿌려주고 싶어
					location.href = "/user/search-id-success-view";
				} else {
					alert("조회된 데이터가 없습니다.")
				}
			}
			,     error: function (request, status, error) {
		        console.log("code: " + request.status)
		        console.log("message: " + request.responseText)
		        console.log("error: " + error);

			}

		});
	});	
});	
</script>