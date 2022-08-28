<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../redirect.jsp" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>회원정보 관리</title>
<link href="../resources/css/style.css" rel="stylesheet">
</head>

<body>

	<div class="membermanagement">

		<h1>회원정보 관리</h1>

			<div class="btn-area9">
				<button id="btn1" onclick="location.href='/user/modifymemberinfo';">회원정보 수정</button>
				<p class="inform">
					<label for="">휴대폰 번호, 닉네임 등 내 정보를 수정하세요</label>
				</p>
			</div>

			<div class="btn-area9">
				<button id="btn3" onclick="location.href='/user/memberdeleteview';">회원 탈퇴</button>
			</div>
			
			<div class="btn-area9">
				<a href="/login/loginForm">로그인 홈으로 가기</a>
			</div>

	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#logoutBtn").on("click", function() {
				location.href = "/login/logout";
			})
		});
	</script>
	
</body>

</html>