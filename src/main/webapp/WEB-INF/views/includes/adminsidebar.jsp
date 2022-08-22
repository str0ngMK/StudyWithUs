<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Mochiy+Pop+One&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="../resources/css/admin_style.css">
    <link rel="stylesheet" href="<c:${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
</head>
<body>
    <nav class="sidebar">
        <div class="navbar_logo">
            <img class="imlogo" src="../resources/image/logo.png" alt="logo">
            <div class="tlogo">
            <a href="/index" class="text">Sweeter</a>
            </div>
        </div>
        <ul>
            <li>
                <a href="#" class="mem-btn">회원 관리</a>
                <ul class="mem-show">
                    <li><a href="/memberList">회원 목록</a></li>
                    <li><a href="/memberReported">신고된 회원</a></li>
                </ul>
            </li>
            <li><a href="#" class="notice-btn">공지사항</a>
                <ul class="notice-show">
                    <li><a href=/noticepage>공지사항</a></li>
                    <li><a href="/noticewrite">공지사항 작성</a></li>
                </ul>
            </li>
            <li><a href="/reprotedRoom">스터디룸 관리</a></li>
            <li><a href="/questions">1:1문의 관리</a></li>
        </ul>
    </nav>
</body>
<script>
$(document).ready(function() {
    $(".mem-btn").click(function() {
        $("nav ul .mem-show").toggleClass("show");
    });

    $(".notice-btn").click(function() {
        $("nav ul .notice-show").toggleClass("show1")
    });

    $("nav ul li").click(function() {
        $(this).addClass("active").siblings().removeClass("active");
    });

    $("nav ul ul li").click(function() {
        $(this).addClass("active").siblings().removeClass("active");
    });

});
</script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
</html>