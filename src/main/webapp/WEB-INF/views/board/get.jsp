<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%@ include file="../includes/navigationbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세화면페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<style>
	#move_btn {
		margin : 10px;
		border : 1px solid rgb(180, 112, 203);
		color : rgb(180, 112, 203);
	}
	#move_btn:hover{
		color : white;
		background-color: rgb(180, 112, 203);
	}
	.tb_content {
		width : 300px;
		height : 200px;
	}
	#move_btn2 {
		width : 100px;
		border : none;
		padding : 5px 5px; 
		color : white;
		background-color: rgb(180, 112, 203);
		margin-left : 20px;
	}
	#move_btn3 {
		width : 130px;
		border : none;
		padding : 5px 5px; 
		color : white;
		background-color: rgb(180, 112, 203);
		margin-left : 20px;
	}
	#btn4 {
		border : none;
		color : white;
		background-color: rgb(180, 112, 203);
		margin-left : 20px;
	}
	table {
	 	margin-top : 20px;
	}
	#reply_write {
		margin-top : 20px;
		background-color:#e9e9e9;
		padding: 20px;
	}
	textarea {
		margin-top: 10px;
	}
	#replyDelete {
		border : none;
		color : white;
		background-color: rgb(180, 112, 203);
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
	<button type="button" id="move_btn" class="btn btn-outline-primary" onclick="location.href='/board/list'">자유게시판</button>
		<input type="hidden" name="bno" value="${pageInfo.bno}">
		<div class="row">
		<table class="table">
			<tbody>
				<tr>
					<td scope="col" style="width: 60%">
						<c:choose>
								<c:when test="${pageInfo.category eq 1}">
									<span class="cate">[가입인사]</span>
								</c:when>
								<c:when test="${pageInfo.category eq 2}">
									<span class="cate">[스터디원모집]</span>
								</c:when>
								<c:when test="${pageInfo.category eq 3}">
									<span class="cate">[일상/잡담]</span>
								</c:when>
								<c:when test="${pageInfo.category eq 4}">
									<span class="cate">[help me!(수능/입시)]</span>
								</c:when>
								<c:when test="${pageInfo.category eq 5}">
									<span class="cate">[help me!(공무원)]</span>
								</c:when>
								<c:when test="${pageInfo.category eq 6}">
									<span class="cate">[help me!(자격증)]</span>
								</c:when>
								<c:otherwise>
									<span class="cate">[기타]</span>
								</c:otherwise>
						</c:choose>
						<c:out value="${pageInfo.title}"/>
					</td>
				</tr>
				<tr>
					<td>
						<c:out value="${pageInfo.writer}"/>
						<span class="float-right"><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${pageInfo.regdate}" />
												  &nbsp 조회수 <c:out value="${pageInfo.viewnum}"/>
						</span>
					</td>
				</tr>
				<tr>
					<td class="tb_content">
						<br/>
						<pre><c:out value="${pageInfo.content}"/></pre>
					</td>
				</tr>
				<tr>
					<td>
						<span class="float-left"><button type="button" id="move_btn2" class="btn btn-primary" onclick="location.href='/board/list'">목록</button></span>
						<c:if test = "${member.id eq pageInfo.writer}">
						<span class="float-right"><button id="move_btn3" class="btn btn-primary" onclick="location.href='/board/modify'">게시글 수정</button></span>
						</c:if>
					</td>
				</tr>
				<tr>
					<td>댓글</td>
				</tr>
				<c:forEach items="${reply}" var="reply">
				<tr>
					<td>	
							<p>
							<c:choose>
							<c:when test = "${member.id != reply.writer}">
								<span style="font-weight:700">${reply.writer} &nbsp </span>
							</c:when>
							<c:otherwise>
								<span style="font-weight:700"> 작성자 &nbsp </span>
							</c:otherwise>
							</c:choose>
							<span style="color:gray"><fmt:formatDate pattern="yyyy.MM.dd HH:mm" value="${pageInfo.regdate}" /></span></p>
							
							
							<pre><p>${reply.content}</p></pre>
							
							<c:if test = "${member.id eq reply.writer}">
							<div class="text-right"><input type="button" class="btn btn-primary" name="replyDelete" id="replyDelete" value="댓글 삭제" data-rno="${reply.rno}"></div>
							</c:if>
					</td>
				</tr>
				</c:forEach>
				<tr>
					<td>
						<p>댓글작성</p>
						<div class="reply_write_form">
						<form method="post" action="/reply/write">		
								<input type="hidden" name="writer" value="${sessionScope.member.id}">
								<input type="hidden" name="bno" value="${pageInfo.bno}">
								<div><textarea rows="5" cols="150" name="content"></textarea></div>
								<div class="text-right"><button type="submit" id="btn4" class="btn btn-primary">댓글 작성</button></div>
						</form>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		</div>
		
		<form id="infoForm" action="/board/modify" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
		<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>	
		<input type="hidden" name="type" value="${cri.type }">
		<input type="hidden" name="keyword" value="${cri.keyword }">	
		</form>
		
	</div>
		
<%-- 		<input type="hidden" name="bno" readonly="readonly" value='<c:out value="${pageInfo.bno}"/>' > --%>
	
<!-- 	<hr/> -->
<!-- 	<div class="input_wrap"> -->
<%-- 		<c:out value="${pageInfo.title}"/> --%>
<!-- 	</div> -->
<!-- 	<hr/> -->
<!-- 	<div class="input_wrap"> -->
<%-- 		<c:out value="${pageInfo.content}"/> --%>
<!-- 	</div> -->
<!-- 	<hr/> -->
<!-- 	<div class="input_wrap"> -->
<!-- 		<label>게시판 작성자</label> -->
<%-- 		<input name="writer" readonly="readonly" value='<c:out value="${pageInfo.writer}"/>' > --%>
<!-- 	</div> -->
<!-- 	<div class="input_wrap"> -->
<!-- 		<label>게시판 등록일</label> -->
<%-- 		<input name="regdater" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.regdate}"/>' > --%>
<!-- 	</div> -->
<!-- 	<hr /> -->
<!-- 	<ul>
	<li>
		<div>
			<p>첫번째 댓글 작성자</p>
			<p>첫번째 댓글</p>
		</div>
	</li>
	<li>
		<div>
			<p>두번째 댓글 작성자</p>
			<p>두번째 댓글</p>
		</div>
	</li>
	<li>
		<div>
			<p>세번째 댓글 작성자</p>
			<p>세번째 댓글</p>
		</div>
	</li>
	</ul> -->
	
<%-- 	<c:forEach items="${reply}" var="reply"> --%>
<!-- 	<li> -->
<!-- 		<div> -->
<%-- 			<p>${reply.writer} / ${reply.regdate}</p> --%>
<%-- 			<p>${reply.content} </p> --%>
<%-- 			<p>${reply.rno}</p> --%>
<%-- 			<input type="button" class="replyDelete" name="replyDelete" id="replyDelete" value="댓글 삭제" data-rno="${reply.rno}"> --%>
			
<!-- 		</div> -->
<!-- 	</li> -->
<%-- 	</c:forEach> --%>
	<%@ include file="/WEB-INF/views/includes/footer.jsp" %>
<script>
	let form = $("#infoForm");
	
	$("#list_btn").on("click", function(e){
		form.find("#bno").remove();
		form.attr("action", "/board/list");
		form.submit();
	});
	
	$("#move_btn3").on("click", function(e){
		form.attr("action", "/board/modify");
		form.submit();
	});
	
	$("#replyDelete").click(function(){
 		location.href = "/reply/delete?bno=${pageInfo.bno}"
 		+ "&rno=" + $(this).attr('data-rno');
		
// 		const rno = $(this).attr('data-rno');
		
// 		console.log("bno = " + "${pageInfo.bno}");
// 		console.log("rno = " + rno);
	});
</script>
	
</body>
</html>