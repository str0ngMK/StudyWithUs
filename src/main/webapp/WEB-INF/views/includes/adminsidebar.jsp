<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Mochiy+Pop+One&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="../resources/css/sidebar.css">
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
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
            <li><a href="/admin/adminmember.do">회원 관리</a></li>
            <li><a href="/admin/adminservice.do">1:1문의 관리</a></li>
        </ul>
    </nav>
</body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
</html>