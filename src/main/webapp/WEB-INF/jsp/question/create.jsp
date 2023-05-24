<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="wrap">
	<div class="d-flex align-items-center justify-content-center mb-3">
		<div class="mt-5"><h2>질문 작성하기</h2></div>
	</div>

	<div>
		<div class="d-flex align-items-center justify-content-center mt-2">
			제목 <input type="text" id="subject" class="form-control ml-2 mt-2 col-6" placeholder="제목을 입력하세요">
		</div>

		<div class="d-flex justify-content-center mt-2">
			내용<textarea row="50" id="content" class="form-control ml-2 mt-2 col-6" placeholder="내용을 입력하세요"></textarea>
		</div>

		<div class="addFile">
			<input type="file" id="file" accept=".jpg, .jpeg, .png, .gif">
		</div>
		
		<div class="secretBox">
			<input type="checkbox" id="secret" /> 
			<label for="secret">비밀 질문으로 올리기</label>
		</div>	
		
			<input type="password" id="password" class="password form-control col-2 d-none" placeholder="비밀번호를 입력하세요">
			
			<div class="box d-flex">
				<a href="/question-post/post-list" class="btn btn-info mr-4" id="questionListBtn">목록 화면으로</a>
				<button type="submit" id="questionSaveBtn" class="btn btn-info">저장하기</button>
			</div>
	</div>
</div>

<script>
$(document).ready(function(){
	$("#secret").on("click", function(){
		$('#password').removeClass('d-none');
	});
	
	$("#questionSaveBtn").on("click", function(){

		// validation
		let subject = $("#subject").val().trim();
		let content = $("#content").val().trim();
		let password = $("#password").val();
		// 업로드한 이미지파일 확장자
		let file = $("#file").val();
		
		if(!subject) {
			alert("제목을 입력하세요");
			return;
		}
		
		if(!content) {
			alert("질문 내용을 입력하세요");
			return;
		}
		
		if(!password) {
			alert("비밀번호를 입력하세요");
			return;
			// 조건 하나 더 걸기 체크박스 체크되어 있을 때만
		}

			// alert(file);  
			// 이미지 경로 - C:\fakepath\chipmunk-3959206__340.jpg
			
			// 파일이 업로드 된 경우에만 확장자 체크 validation
			if (file != ""){
				// 확장자만 뽑아서 소문자로 변경한다
				let ext = file.split(".")[1].toLowerCase();
				// alert(ext);
				
				if($.inArray(ext, ["jpg", "jpeg", "png", "gif"]) == -1) {
					alert("이미지 파일만 업로드 할 수 있습니다");
					$("#file").val(""); // 파일 비우기
					return;
				}
			}
			
			// 서버 AJAX
			// 이미지를 업로드 할 때는 form태그가 반드시 있어야 한다
			// append함수는 form태그의 name 속성과 같다
			let formData = new FormData();
			formData.append("subject", subject);
			formData.append("content", content);
			formData.append("password", password);
			formData.append("file", $("#file")[0].files[0]); // 한개만 업로드 가능		
			
			$.ajax({
				// request
				type:"post"
				, url:"/question-post/post-create"
				, data:formData
				, enctype:"multipart/form-data" // 이미지를 보낼 때 반드시 추가
				, processData:false
				, contentType:false
				
				// response
				, success:function(data) {
					if(data.code == 1) {
						// 성공
						alert("질문이 저장되었습니다");
						location.href = "/question-post/post-list";
					} else {
						// 실패
						alert(data.errorMessage);
					}
				}
			
				, error:function(request, status, error) {
					alert("글을 저장하는데 실패했습니다");	
				}
			});
	});
});
</script>
