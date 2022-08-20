<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8" />
<title>메인홈페이지</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>

<body>

	<form name='homeForm' method="post" action="/login/loginForm">
		<c:if test="${member == null}">
		
			<div>
				<button type="submit">로그인</button>
				<button type="button">회원가입</button>
			</div>
		</c:if>
		
		<c:if test="${member != null }">
			<div>
				<p>${member.id}님환영 합니다.</p>
				<button id="logoutBtn" type="button" >로그아웃</button>
			</div>
		</c:if>
		<c:if test="${msg == false}">
			<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
		</c:if>
	</form>
	
	<script type="text/javascript">
	$(document).ready(function() {
		$("#logoutBtn").on("click", function() {
			location.href="/login/logout";
		})
	});
	</script>
	
</body>
</html>
