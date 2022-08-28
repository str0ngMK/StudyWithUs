<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/adminsidebar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h1 {
		padding:50px;
	}
	tr {
		text-align : center;
	}
</style>
</head>
<body>
	<div class="container">
		<h1> ▶ 고객센터관리 </h1>
		<table>
			<thead>
				<tr>
					<th>회원번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>아이디</th>
					<th>상태</th>
					<th>등록날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${serviceList}" var="serviceList">
					<tr>
						<td>${serviceList.memNum}</td>
						<td>${serviceList.title}</td>
						<td>${serviceList.content}</td>
						<td>${serviceList.id}</td>
						<td>
							<c:if test="${serviceList.status == 0}">답변대기</c:if>
							<c:if test="${serviceList.status == 1}">답변완료</c:if>
						</td>
						<td><fmt:formatDate value="${serviceList.regdate}" pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>