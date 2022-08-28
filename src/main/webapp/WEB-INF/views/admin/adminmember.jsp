<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/sidebar.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h1 {
		padding:50px;
	}
</style>
</head>
<body>
	<div class="container">
		<h1> ▶ 회원정보관리 </h1>
		<table>
			<thead>
				<tr>
					<th>이름</th>
					<th>아이디</th>
					<th>휴대폰번호</th>
					<th>이메일</th>
					<th>생년월일</th>
					<th>성별</th>
					<th>주소</th>
					<th>닉네임</th>
					<th>가입일</th>
					<th>회원정보수정일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="list">
					<tr>
						<td>${list.user_name}</td>
						<td>${list.id}</td>
						<td>${list.contact}</td>
						<td>${list.email}</td>
						<td>${list.birth_date}</td>
						<td>
							<c:if test="${list.gender == 1}">
								여자
							</c:if>
							<c:if test="${list.gender == 2}">
								남자
							</c:if>
						</td>
						<td>${list.address}</td>
						<td>${list.nickname}</td>
						<td>
						<fmt:formatDate value="${list.reg_date}" pattern="yyyy-MM-dd" /></td>
						<td>
						<fmt:formatDate value="${list.update_date}" pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>