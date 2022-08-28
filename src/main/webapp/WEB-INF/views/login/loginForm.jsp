<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8" />
<title>로그인 페이지</title>
<link href="../resources/css/style.css" rel="stylesheet">
<script src="jquery-3.4.1.js"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	h4 {
		text-align : center;
	}
</style>
</head>
<body>

	<div class="login-form">
		<c:url value="/login/loginCheck" var="loginUrl" />
		<form:form name="frmLogin" action="${loginUrl}" method="POST">

			<!--   <c:if test="${param.error != null}">
        <p>아이디와 비밀번호가 잘못되었습니다.</p>
      </c:if>

      <c:if test="${param.logout != null}">
        <p>로그아웃 하였습니다.</p>
      </c:if>  -->
			<c:if test="${member==null }">

		<h1>로그인</h1>
				<div class="int-area">
					<input type="text" name="id" id="id" autocomplete="off" required>
					<label for="id">아이디</label>
				</div>

				<div class="int-area">
					<input type="password" name="user_pwd" id="user_pwd"
						autocomplete="off" required> <label for="user_pwd">비밀번호</label>
				</div>

				<div class="btn-area">
					<button id="btn" type="submit">로그인</button>
				</div>
		<div class="caption">
			<a href="#">아이디 찾기</a><br>
			<br> <a href="#">비밀번호 찾기</a><br>
			<br> <a href="/user/joinagreeterms">회원가입</a>
			<br><br> <a href="/index">메인화면</a>
		</div>
			</c:if>
			
			<c:if test="${member!=null}">
				<div>
					<p>${member.id }님, 환영합니다.</p>
					<a href="/user/membermanagement">회원정보관리</a><br>					
					<div class="btn-area">
					<button id="logoutBtn" type="button" onclick="location.href='/login/logout';">로그아웃</button>
					</div>
				</div>
			</c:if>
			<c:if test="${msg == false}">
				<h4 style="color:red;">로그인 실패! 아이디와 비밀번호를 확인해주세요.</h4>
			</c:if>
		</form:form>
	</div>

	<script>
		let id = $('#id');
		let pwd = $('#pwd');
		let btn = $('#btn');

		$(btn).on('click', function() {
			if ($(id).val() == "") {
				$(id).next('label').addClass('warning');
				setTimeout(function() {
					$('label').removeClass('warning');
				}, 1500);
			} else if ($(pwd).val() == "") {
				$(pwd).next('label').addClass('warning');
				setTimeout(function() {
					$('label').removeClass('warning');
				}, 1500);
			}
		});


	</script>

</body>

</html>