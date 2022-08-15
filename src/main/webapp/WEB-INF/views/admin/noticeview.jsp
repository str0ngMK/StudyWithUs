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
<div class="container" role="main">
		<h1> ▶ Sweeter 공지사항</h1>
		
        <form name="form" id="form" method="post">
        
        <div class="mb-3">
        <label for="title">제목</label>
        <input type="text" class="form-control" name="n_title" value="${nview.n_title}" readonly="readonly"/></br/>
        </div>
        
        <div class="mb-3">
        <label for="content">내용</label>
        <textarea type="text" class="form-control" cols="50" rows="10" name="n_content" readonly="readonly"/>${nview.n_content }</textarea></br/>
        </div>
        
        <div align="right">
        <input type="button" value="수정하기" class="btn btn-sm btn-primary" style="background-color: purple" onclick="location.href='/admin/noticemodify?n_num=${nview.n_num}'"/>
        <input type="button" value="목록으로" class="btn btn-sm btn-primary" style="background-color: purple" onclick="location.href='/admin/noticepage'"/>
        <input type="button" value="삭제하기" class="btn btn-sm btn-primary" style="background-color: purple" onclick="location.href='/admin/delete?n_num=${nview.n_num}'"/>
        </div>
        </form>
  </div>
</body>