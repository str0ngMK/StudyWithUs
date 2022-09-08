<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="../includes/navigationbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 업데이트</title>
<link rel="stylesheet" href="../resources/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<%-- 	<form class="reply_modify" name="replymodify" id="replymodify" method="POST"> --%>
			<div class="form-group">
				<label>작성자</label>
				<input type="hidden" id="bno" name="bno" value="${reply.bno}">
				<input type="hidden" id="rno" name="rno" value="${reply.rno}">
				
				<input type="text" value="${reply.writer}" > / <fmt:formatDate value="${reply.regdate}" pattern="yyyy-MM-dd" ></fmt:formatDate><br>
				<label>내용</label>
				<input type="text" id="content" name="content" value="${reply.content}">
			</div>
		<div>
			<button type="submit" class="replymodifybtn" id="send">수정하기</button>
			<button type="button" class="replymodifyclose" id="close">닫기</button>
		</div>
<%-- 	</form> --%>
<script type="text/javascript">
//   	$(document).ready(function() {
  		
//   	$("#send").click(function(){
//   		$('#replymodify').submit(); 
//    		setTimeout(function() {  
//    			window.close();
//    		},1000);
// 	});
  	
//    	$("#close").click(function(){
//    		setTimeout(function() {
//  		self.close();
//  		}, 2000);
//    	});
// 	});
  	
$("#send").click(function(){
		
		const bno = '${reply.bno}';
		const rno = '${reply.rno}';
		const writer = '${reply.writer}';
		const content = document.getElementById("content").value;
		
		const data = {
				bno : bno,
				rno : rno,
				writer : writer,
				content : content
		}	
		
		console.log(bno);
		console.log(rno);
		console.log(data);
		
		$.ajax({
			data : data,
			type : 'POST',
			url : '/reply/reply_update',
			success : function(result){
				$(opener.location).attr("href", "javascript:replyListInit();");
				opener.location.reload();
				window.close();
			}			
		});		
	});
</script>
</body>
</html>