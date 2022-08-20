<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입창</title>
</head>
<body>
	<h1>회원 가입</h1>
	<c:url value="/user/addUser.do" var="addUserUrl" />
	<form:form name="frmMember" action="${addUserUrl}" method="POST">

		<p>
			<label for="user_name">이름</label> <input type="text" name="user_name" />
		</p>
		<p>
			<label for="id">아이디</label> <input type="text" name="id" />
		</p>
		<p>
			<label for="user_pwd">비밀번호</label> <input type="password" name="user_pwd" />
		</p>
		<p>
			<label for="nickname">닉네임</label> <input type="text" name="nickname" />
		</p>
		<p>
			<label for="contact">휴대폰번호</label> <input type="text" name="contact" />
		</p>
		<p>
			<label for="email">이메일</label> <input type="email" name="email" />
		</p>
		<p>
			<label for="birth_date">생년월일</label> <input type="text" name="birth_date" />
		</p>
		<p>
			<label for="gender">성별</label> <input type="text" name="gender" />
		</p>
		<p>
			<label for="address">주소</label> <input type="text" name="address" />
		</p>
		<button type="submit">가입하기</button>
	</form:form>

</body>
</html>