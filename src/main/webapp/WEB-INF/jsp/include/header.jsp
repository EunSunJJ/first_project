<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="h-100 d-flex justify-content-between align-items-center">
	
	<div>
		<h1>사이트 이름 정하기</h1>
	</div>
	
	<div>
		<div class="afterLogin">
			<c:if test="${not empty userId}">
				<span class="mr-3">${userName}님 안녕하세요</span>
				<a href="/user/sign-out" class="font-weight-bold">로그아웃</a>
			</c:if>
		</div>
		
		<div class="beforeLogin">
			<c:if test="${empty userId}">
				<a href="/user/sign-up-view" class="font-weight-bold mr-3">회원가입</a>
				<a href="/user/sign-in-view" class="font-weight-bold">로그인</a>
			</c:if>
		</div>
	</div>
	
</div>