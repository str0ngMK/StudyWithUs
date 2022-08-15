<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/admin_sidebar.jsp" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<style>
	.container {
		margin-top: 50px;
}
</style>
<body>
        <div class="container">
        <h1> ▶ Sweeter 공지사항</h1>
        <table class="table table-hover">	
        	<thead>
       			<tr>
       				<th>번호</th>
       				<th>제목</th>
       				<th>등록일</th>
       			</tr>
        	</thead>
        	<tbody>
        		<c:forEach items="${nlist}" var="nlist">
        		<tr>
        			<td>${nlist.n_num }</td>
        			<td>
        				<a href="/admin/noticeview?n_num=${nlist.n_num}">${nlist.n_title }</a></td>
        			<td>
        			<fmt:formatDate value="${nlist.n_date}" pattern="yyyy-MM-dd" /></td>
        		</tr>	
        		</c:forEach>
        	</tbody>
        </table>
		</div>

</body>