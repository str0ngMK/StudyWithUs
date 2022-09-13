<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/navigationbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 등록 페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<style>
	div {
		margin-top : 15px;
	}
	#save {
		border : 1px solid rgb(180, 112, 203);
		color : rgb(180, 112, 203);
		background-color: white;
	}
	#move_btn {
		border : 1px solid gray;
		color : gray;
		background-color: white;
	}
</style>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
	<% 
		String id = null;
		if(session.getAttribute("id") != null){
			id = (String)session.getAttribute("id");
		}
	%>
<div class="container">
<h2> 게시글 등록 </h2>
<form action="/board/enroll" method="post" onsubmit="return checkform();">

	<div class="input_wrap">
		<label for="title">제목</label>
		<pre><input type="text" class="form-control" id="title" name="title"></pre>
	</div>
	<div class="input_wrap">
	<label>카테고리</label>
	<select class="form-control" id="category" name="category">
		<option value="none">== 게시글 카테고리 선택 ==</option>
		<option value="1">가입인사</option>
		<option value="2">스터디원 모집</option>
		<option value="3">일상/잡담</option>
		<option value="4">결심/목표</option>
		<option value="5">help me!(수능/입시)</option>
		<option value="6">help me!(공무원)</option>
		<option value="7">help me!(자격증)</option>
		<option value="8">기타</option>
	</select>
	</div>
	<div class="input_wrap">
		<label>글쓴이</label> &nbsp ${sessionScope.member.id}
		<input type="hidden" id="writer" name="writer" value="${sessionScope.member.id}">
	</div>
	<div class="input_wrap">
		<label for="content">내용</label>
		<textarea class="form-control" cols="50" rows="10" id="content" name="content"></textarea>
	</div>
	<div class="input_wrap">
		<input type="file" name="fileName">
	</div>
	<div class="text-center">
	<button type="submit" id="save" class="btn btn-primary">저장</button>
	<button type="button" id="check" class="btn btn-primary">저장</button>
	<button type="button" id="move_btn" class="btn btn-primary" onclick="location.href='/board/list'">목록</button>
	</div>
	</form>
</div>
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
<script type="text/javascript">
			function checkform(){ 
// 			$("#check").on("click", function(){
// 			var title1 = $("#title").val();
// 			var text = title1.replace(regExp, "");
			
// 			var title = document.getElementById("title").value;
// 			var category = document.getElementById("category").value;
// 			var content = document.getElementById("content").value;

			var title1 = $("#title").val();
			var content2 = $("#content").val();
			
			if(title1.replace(/\s/g,"").length == 0){
				alert("제목을 입력하세요.");
				$("#title").focus();
				return false;
			} 
			
			if(category === "none"){
 				alert("카테고리를 선택하세요.");
 				$("#category").focus();
 				return false;
 			}
			
			if(content2.replace(/\s/g,"").length == 0){
				alert("내용을 입력하세요.");
				$("#content").focus();
				return false;
			}
			
//			console.log(title);
//			console.log($("#title").val(text.trim()));
//			console.log();
			
 			}
</script>
</html>