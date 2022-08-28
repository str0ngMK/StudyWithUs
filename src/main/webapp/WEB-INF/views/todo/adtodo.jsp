<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../includes/navigationbar.jsp" %>
<%@ include file="../redirect.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TODO LIST</title>
<link rel="stylesheet" href="../resources/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	h1 {
		text-align : center;
		margin-bottom : 50px;
	}
	.container {
		margin-top: 80px;
	}
	.put_info {
		display : flex;
		margin : 50px;
	}
	#contents{
		width : 400px;
		height : 50px;
	}
	#todoplusbtn{
		background-color: rgb(180, 112, 203);
		width : 100px;
		hieght: 200px;
		color : white;
		justify-content : space-between;
		border : none;
		border-radius : 10px;
		margin-left : 20px;
		border:none;
		font-size : 25px;
	}
	#tododel {
		border : none;
		background-color: rgb(180, 112, 203);
		width : 100px;
		hieght: 200px;
		color : white;
		border-radius : 10px;
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
			<h1>할일 등록</h1>
			<div class="container">
				<h3>${sessionScope.member.id}님, 멋진 TodoList를 완성해보세요!</h3>
				<div class="put_info">
				<form:form action="/todo/registertodo.do" method="post">
				<input type="hidden" id="id" name="id" value="${sessionScope.member.id}" maxlength="24">
				<input type="text" placeholder="할일을 입력해주세요" id="contents" name="contents" maxlength="24">
          		<input type="hidden" id="complete_yn" name="complete_yn" value="N">
				<button type="submit" id="todoplusbtn">+</button>
				</form:form>
				</div>	
			   		
              	<%-- <div>${todolist.idx }</div>
              	<div>${todolist.contents }</div>
              	<div>${todolist.complete_yn }</div> --%>
              	<table class="table table-bordered">
              		<thead>
              			<tr>
  						<th>상  태</th>
              			<th>할  일</th>
              			<th>버  튼</th>
              			</tr>
              		</thead>
              		<tbody id="todobody">
              			<c:forEach items="${todolist}" var="todolist">
             			<tr>
             			<form:form action="/todo/deletetodo.do" method="post">
             			<%-- <td>${todolist.complete_yn}</td> --%>
             			<c:if test="${todolist.complete_yn == 'N'}">
             				<td><input type='checkbox' name='notdo'/></td>
             			</c:if>
             			<c:if test="${todolist.complete_yn == 'Y'}">
             				<td><input type='checkbox' name='donedo' checked/></td>
             			</c:if>
              			<td id="contents" name="contents">${todolist.contents}</td>
              			
              			<input type="hidden" id="id" name="id" value="${sessionScope.member.id}" maxlength="24">
              			<input type="hidden" name="idx" id="idx" value="${todolist.idx}" onclick="contentsClick()">
              			
              			<td><button type="submit" id="tododel">삭제하기</button></td>
              			</form:form>
              			</tr>
              		</c:forEach> 
              		</tbody>
              		
              	</table>
	</div>
	</div>
	<%@ include file="../includes/footer.jsp" %>
</body>
</html>