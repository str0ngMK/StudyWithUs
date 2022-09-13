<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/includes/navigationbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<style>
	.pageInfo{
	  	list-style : none;
	  	display: inline-block;
	    margin: 5px 0 0 200px;
	 }
	.pageInfo li{
	  	float: left;
	    font-size: 15px;
	    margin-left: 25px;
	    padding: 7px;
	    font-weight: 500;
	    color : gray;
  	}
	a:link {color:black; text-decoration: none;}
	a:visited {color:black; text-decoration: none;}
	.move:hover {color:black; text-decoration: none;}
	.active{
	  background-color: #cdd5ec;
	 }
	.pageInfo a {
		color : gray;
	}
	.search_area {
		display : flex;
		width : 500px;
		justify-content : center;
		margin : 0 auto;
		margin-top: 40px;
	}
	.search_area select{
		margin-right : 10px;
		width : 100px;
	}
	.search_area button {
		width : 150px;
		border : none;
		padding : 5px 5px; 
		font-weight: 800;
		background-color: rgb(180, 112, 203);
		margin-left : 10px;
	}
	.cate {
		color : gray;
	}
	table {
	 	margin-top : 20px;
	}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
</head>
<body>
	<% 
		String id = null;
		if(session.getAttribute("id") != null){
			id = (String)session.getAttribute("id");
		}
	%>
	
	<div class="container">
	<h2> 자유 게시판 </h2>
	<div class="table_wrap">
		
		<table class="table table-hover text-center" >
			<thead>
				<tr>
					<th class="bno_width">번호</th>
					<th class="title_width">제목</th>
					<th class="writer_width">작성자</th>
					<th class="regdate_width">작성일</th>
					<th class="viewnum_width">조회</th>
				</tr>
			</thead>
			<c:forEach items="${list}" var="list">
				<tr>
					<td><c:out value="${list.bno}"/></td>
					<td class="text-left" style="width: 60%;">
						<a class="move" href='<c:out value="${list.bno}"/>'>
							<c:choose>
								<c:when test="${list.category eq 1}">
									<span class="cate">[가입인사]</span>
								</c:when>
								<c:when test="${list.category eq 2}">
									<span class="cate">[스터디원모집]</span>
								</c:when>
								<c:when test="${list.category eq 3}">
									<span class="cate">[일상/잡담]</span>
								</c:when>
								<c:when test="${list.category eq 4}">
									<span class="cate">[help me!(수능/입시)]</span>
								</c:when>
								<c:when test="${list.category eq 5}">
									<span class="cate">[help me!(공무원)]</span>
								</c:when>
								<c:when test="${list.category eq 6}">
									<span class="cate">[help me!(자격증)]</span>
								</c:when>
								<c:otherwise>
									<span class="cate">[기타]</span>
								</c:otherwise>
							</c:choose>
							<c:out value="${list.title}"/>
						</a>
					</td>
					<td><c:out value="${list.writer}"/></td>
	                <td><fmt:formatDate pattern="MM/dd" value="${list.regdate}"/></td>
	                <td><c:out value="${list.viewnum}"/></td>
				</tr>
			</c:forEach>	
		</table>
	</div>
	
	<div class="text-right">
		<c:if test = "${member.id != null}">
		<button type="button" id="move_btn" class="btn btn-outline-secondary" onclick="location.href='/board/enroll'">글쓰기</button>
		</c:if>
	</div>
	
	<div class="search_wrap">
		<div class="pageInfo_wrap" >
			<div class="pageInfo_area">
				<ul id="pageInfo" class="pageInfo">
				
					<!-- 이전페이지 버튼 -->
					<c:if test="${pageMaker.prev}">
						<li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}"> << </a></li>
					</c:if>
					
					<!-- 각 번호 페이지 버튼 -->
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
					</c:forEach>
					
					<!-- 다음페이지 버튼 -->
					<c:if test="${pageMaker.next}">
						<li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }"> >> </a></li>
					</c:if>	
					
				</ul>
			</div>
		</div>
		
		<div class="search_area">
			<select class="form-control" name="type">
				<option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
				<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
				<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
				<option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
				<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목 + 내용</option>
				<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목 + 작성자</option>
				<option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW'?'selected':'' }"/>>제목 + 내용 + 작성자</option>
			</select>		
			<input type="text" class="form-control" name="keyword" value="${pageMaker.cri.keyword }" placeholder="검색어를 입력하세요">
			<button type="button" class="btn btn-primary">검색</button>
		</div>
	</div>
	<form id="moveForm" method="get">	
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">	
		<input type="hidden" name="type" value="${pageMaker.cri.type }">	
	</form>
	</div>
<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
<script>
$(document).ready(function(){
	
	let result = '<c:out value="${result}"/>';
	
	checkAlert(result);
	console.log(result);
	
	function checkAlert(result){
		
		if(result === ''){
			return;
		}
		
		if(result === "enroll success"){
			alert("등록이 완료되었습니다.");
		}
		
		if(result === "modify success"){
			alert("수정이 완료되었습니다.");
		}
		
		if(result === "delete success"){
			alert("삭제가 완료되었습니다.");
		}		
	}	
	
});

	let moveForm = $("#moveForm");

	$(".move").on("click", function(e){
		e.preventDefault();
		
		moveForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
		moveForm.attr("action", "/board/get");
		moveForm.submit();
	});

	$(".pageInfo a").on("click", function(e){
		e.preventDefault();
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.attr("action", "/board/list");
		moveForm.submit();
		
	});	
	
	
	$(".search_area button").on("click", function(e){
		e.preventDefault();
		
		let type = $(".search_area select").val();
		let keyword = $(".search_area input[name='keyword']").val();
		
		if(!type){
			alert("검색 종류를 선택하세요.");
			return false;
		}
		
		if(!keyword){
			alert("키워드를 입력하세요.");
			return false;
		}		
		
		moveForm.find("input[name='type']").val(type);
		moveForm.find("input[name='keyword']").val(keyword);
		moveForm.find("input[name='pageNum']").val(1);
		moveForm.submit();
	});
	
</script>
</html>