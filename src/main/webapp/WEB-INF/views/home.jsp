<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta  charset="UTF-8" />
<title>메인홈페이지</title>
</head>

<body>

	<h1>메인홈페이지!!</h1>
	<sec:authorize access="isAnonymous()">
		<p>
			<a href="<c:url value="/login/loginForm.do" />">로그인</a>
		</p>
	</sec:authorize>

	<sec:authorize access="isAuthenticated()">
		<form:form action="${pageContext.request.contextPath}/logout" method="POST">
			<input type="submit" value="로그아웃" />
		</form:form>
	</sec:authorize>

	<h3>
		<a href="<c:url value="/user/userForm.do" />">회원 가입</a>
		<a href="<c:url value="/intro/intro.do" />">소개 페이지</a> 
		<a href="<c:url value="/admin/adminMain.do" />">관리자 홈</a>
	</h3>
</body>
</html>
