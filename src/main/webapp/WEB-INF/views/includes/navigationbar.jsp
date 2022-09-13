<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../resources/css/bootstrap.css">
    <link href="https://fonts.googleapis.com/css2?family=Mochiy+Pop+One&family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
	<style>
	#title2 {
		font-size : 30px;
		font-weight : 700;
		margin-left : 20px;
		margin-top : 10px;
		color : rgb(180, 112, 203);
	}
	.navbar_login {
		paosision : absolute;
		right : 10%;
	}
	.blogin{
	    border : none;
	    width: 120px;
	    height: 50px;
	    margin-top: 10px;
	    padding : 15px 30px;
	    margin-right: 10px;
	    font-size: 15px;
	    border-radius: 30px;
	    background-color: rgb(180, 112, 203);
	    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	    color: white;
	    font-weight: 1000;
	}
	.blogin:hover{
	    background-color: rgb(106, 19, 135);
	}
	.logout_div{
  		display : flex;
	  }
	.name {
		margin-right : 50px;
		margin-top : 20px;
		text-decoration : none;
	 }
	</style>
</head>
<body>
    <!-- <nav class="navbar">
        <div class="navbar_logo">
            <img class="imlogo" src="../resources/image/logo.png" alt="logo">
            <div class="tlogo">
            <a href="/index" class="tlogo">Sweeter</a>
            </div>
        </div>
        <ul class="navbar_menu">
            <li><a href="#">정보수정</a></li>
            <li><a href="/room.do">공부참여</a></li>
            <li><a href="/notice/noticelistpage?num=1">공지사항</a></li>
            <li><a href="#">이용방법</a></li>
            <li><a href="/board/list">게시판</a></li>
            <li><a href="/serviceCenter.do">고객센터</a></li>
            <li><a href="#">랭킹순위</a></li>
        </ul>
        <div class="navbar_login">
            <button class="blogin">로그인</button>
        </div>
    </nav>
    <hr> -->
    
    <nav class="navbar navbar-expand-lg navbar-light">
  	<div class="container-fluid">
    <a class="navbar-brand" id="title2" href="/index">
    <img src="../resources/image/logo.png" width="50" height="50" class="d-inline-block align-text-top" id="logo">
    Sweeter</a>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="/user/membermanagement">마이페이지</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/room.do">스터디참여</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/notice/noticelistpage?num=1">공지사항</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/board/list">자유게시판</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/serviceCenter.do">고객센터</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/ranking">랭킹순위</a>
        </li>
        </ul>
        </div>
        <div class="navbar_login">
        	<c:if test = "${member == null}">
        	<button class="blogin" onclick="location.href='/login/loginForm'">로그인</button>
        	</c:if>
        	
        	<c:if test = "${member != null}">
        		<div class="logout_div">
        		
        		<c:if test = "${member.authority == 0}">
        		<div class="name">
        		<a href="/user/membermanagement">${member.id}님</a>
        		</div>
        		</c:if>
        		<c:if test = "${member.authority == 1}">
        		<div class="name">
        		<a href="/admin/adminmember.do">관리자</a>
        		</div>
        		</c:if>
        		<button class="blogin" onclick="location.href='/login/logout'">로그아웃</button>
        		</div>
        	</c:if>
        </div>
        </div>
</nav>
</body>
</html>