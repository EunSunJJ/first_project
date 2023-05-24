<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<div id="wrap">
	<div class="questionLogo">
		<span>질문 목록</span>
	</div>
	
	<table class="table text-center">
		<thead>
			<tr>
				<th>NO</th>
				<th>질문 제목</th>
				<th>작성 날짜</th>
			</tr>
		</thead>

		<tbody>
		<c:forEach var="questionPost" items="${QuestionPostList}">
			<tr>
				<td>${questionPost.id}</td>
				
				<td><a href="/question-post/post-detail">${questionPost.subject}</a></td>
				<input type="password" id="postSecretBox" class="d-none">
				
				<fmt:formatDate var="date" value="${questionPost.createdAt}" pattern="yyyy-MM-dd"/>
				<td>${date}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

	<a href="/question-post/post-create" class="btn btn-info" id="questionBtn">질문하기</a>
</div>

<script>
$(document).ready(function)
</script>