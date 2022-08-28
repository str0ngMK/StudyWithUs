<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link href="../resources/css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="jquery-3.4.1.js"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	 .container {
	   position : absolute;
	   top : 5%;
	   left : 13%;
	}  
	.idbox {
		display : flex;
	}
	.idChk {
		width : 100px;
		height : 40px;
		margin-left : 10px;
		border : none;
		border-radius : 20px;
		background-color: rgb(180, 112, 203);
		color : white;
	}
</style>
</head>
<body>
		<div class="container">
			<div class="input-form col-md-12 mx-auto">

				<h1>회원 정보 수정</h1>

				<form class="validation-form" action="/user/memberdeleteview" method="post" id="regForm" novalidate>

					<div class="row">
						<div class="col-md-6 mb-3">

							<div>
								<label for="user_name">이름</label> <input type="text"
									class="form-control" id="user_name" name="user_name"
								    value="${member.user_name}" readonly="readonly">
							</div>
							
							<label for="name">아이디</label>
							<div class="idbox">
								 <input type="text" class="form-control" id="id" name="id" value="${member.id}" readonly="readonly">
							</div>

							<div>
								<label for="name">비밀번호</label> <input type="password"
								class="form-control" id="user_pwd" name="user_pwd" required>
							</div>
							<div>
								<label for="nickname">닉네임</label> <input type="text"
									class="form-control" id="nickname" name="nickname"
									placeholder="" value="${member.nickname}" readonly="readonly">
							</div>
							<div>
								<label for="name">휴대폰번호</label>
								<!--자동완성-->
								<input type="text" class="form-control" id="contact"
									name="contact" placeholder="" value="${member.contact}" 
									onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" readonly="readonly">
							</div>

						</div>

					</div>

					<div class="mb-3">
						<label for="email">이메일</label> <input type="email"
							class="form-control" id="email" name="email"
							value="${member.email}" readonly="readonly">
					</div>
					
					<div class="mb-3">
					<label for="birth">생년월일</label><br>
					<input class="form-control" type="text" id="birth_date" name="birth_date" value="${member.birth_date}"  readonly="readonly">
					</div>
					
					<div class="mb-3">
						<label for="gender">성별</label> 
							<c:if test="${member.gender == 1}">
								<div>여자</div>
							</c:if>
							
							<c:if test="${member.gender == 2}">
								<div>남자</div>
							</c:if>
					</div>

					<div class="mb-3">
						<label for="address">주소</label> <input type="text"
							class="form-control" id="address" name="address" value="${member.address}" readonly="readonly">
					</div>

					<hr class="mb-4">


					<div class="mb-4"></div>
					<div class="btn-area">
						<button id="submit" type="submit">회원탈퇴</button>
						<br> <br>
						<button onclick="/index">메인화면</button>
					</div>
				</form>
			</div>
		</div>

	<script>
		
		$(document).ready(function() {
			var user_pwd = document.getElementById("user_pwd");
			
			$("#submit").on("click", function() {
			if(user_pwd === "${member.user_pwd}"){
				alert("회원정보 탈퇴가 정상적으로 이루어졌습니다.");
			} else {
				alert("비밀번호가 다릅니다.");
			}
			});
			
			
		});
		
		
	</script>

</body>

</html>