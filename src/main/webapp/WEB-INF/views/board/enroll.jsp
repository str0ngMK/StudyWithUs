<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 등록 페이지</title>
<style>
	*{
		margin:0;
		padding:0;
		box-sizing:border-box;
	}
	body{
		font-family:"굴림체", sans-serif;
		font-weight:400;
		font-size:16px;
		line-height:1.7;
		color:#777;
	}
</style>
</head>
<body>

<h1>게시판 등록</h1>
<form action="/board/enroll" method="post">
	<div class="input_wrap">
		<label>Title</label>
		<input name="title">
	</div>
	<div class="input_wrap">
		<label>Content</label>
		<textarea rows="3" name="content"></textarea>
	</div>
	<div class="input_wrap">
		<label>Writer</label>
		<input name="writer">
	</div>
	<button class="btn">등록</button>
</form>



</body>
</html>