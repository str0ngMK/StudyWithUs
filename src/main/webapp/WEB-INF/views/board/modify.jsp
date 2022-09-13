<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
    <%@ include file="../includes/navigationbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <style>
	.text-center {
		margin-top : 20px;
	}
	#save {
		border : 1px solid rgb(180, 112, 203);
		color : rgb(180, 112, 203);
		background-color: white;
	}
</style>
</head>
<body>
	<% 
		String id = null;
		if(session.getAttribute("id") != null){
			id = (String)session.getAttribute("id");
		}
	%>
<div class="container">
<h2> 게시글 수정 </h2>
<form id="modifyForm" name="modifyForm" action="/board/modify" method="post" onsubmit="return checkform();">
	<input type="hidden" name="bno" readonly="readonly" value='<c:out value="${pageInfo.bno}"/>' >
	<div class="input_wrap">
		<label for="title">제목</label>
		<input type="text" class="form-control" name="title" value='<c:out value="${pageInfo.title}"/>'>
	</div>
	<div class="input_wrap">
	<label>카테고리</label>
	<select class="form-control" name="category">
		<option value="1" <c:if test="${pageInfo.category eq 1}">selected</c:if>>가입인사</option>
		<option value="2" <c:if test="${pageInfo.category eq 2}">selected</c:if>>스터디원 모집</option>
		<option value="3" <c:if test="${pageInfo.category eq 3}">selected</c:if>>일상/잡담</option>
		<option value="4" <c:if test="${pageInfo.category eq 4}">selected</c:if>>결심/목표</option>
		<option value="5" <c:if test="${pageInfo.category eq 5}">selected</c:if>>help me!(수능/입시)</option>
		<option value="6" <c:if test="${pageInfo.category eq 6}">selected</c:if>>help me!(공무원)</option>
		<option value="7"<c:if test="${pageInfo.category eq 7}">selected</c:if>>help me!(자격증)</option>
		<option value="8"<c:if test="${pageInfo.category eq 8}">selected</c:if>>기타</option>
	</select>
	</div>
	<div class="input_wrap">
		<input type="hidden" id="writer" name="writer" value="${sessionScope.member.id}">
	</div>
	<div class="input_wrap">
		<label for="content">내용</label>
		<textarea class="form-control" cols="50" rows="10" name="content"><c:out value="${pageInfo.content}"/></textarea>
	</div>

	<div class="text-center">
		<button type="button" id="move_btn" class="btn btn-outline-secondary">목록</button>
		<button type="submit" id="save" class="btn btn-primary">수정완료</button>
		<button type="button" id="delete_btn" class="btn btn-outline-danger">삭제</button>
	</div>
	</form>
</div>
	<form id="infoForm" action="/board/modify" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
		<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>	
		<input type="hidden" name="type" value="${cri.type }">
		<input type="hidden" name="keyword" value="${cri.keyword }">	
	</form>
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
<script>

	let form = $("#infoForm");		// 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
	let mForm = $("#modifyForm");	// 페이지 데이터 수정 from
	
	/* 목록 페이지 이동 버튼 */
	$("#move_btn").on("click", function(e){
		if(confirm("목록 페이지로 이동하시겠습니까? 수정된 내용은 저장되지 않습니다.") == true){
			location.href='/board/list'
		}else {
			return false;
		}
	});
	
	/* 삭제 버튼 */
	$("#delete_btn").on("click", function(e){
		if(confirm("게시글을 삭제하겠습니까?") == true){
			document.modifyForm.submit();
		}else {
			return false;
		}
// 		form.attr("action", "/board/delete");
// 		form.attr("method", "post");
// 		form.submit();
	});	
	
	function checkform(){ 
//			$("#check").on("click", function(){
		var title = document.getElementById("title2").value;
		var content = document.getElementById("content").value;
		
		if(title == ""){
			alert("제목을 입력하세요.");
			$("#title2").focus();
			return false;
		} 
		
		if(content == ""){
			alert("내용을 입력하세요.");
			$("#content").focus();
			return false;
		}
		
		}
	
</script>
	
</body>
</html>