<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<%@ include file="../includes/navigationbar.jsp" %>
<style>
	h1 {
		text-align : center;
	}
	.container {
		margin-top: 50px;
	}
</style>
<div class="container" role="main">
		<h1> 공지사항 수정 </h1>
		
        <form name="form" id="form" method="post">
        
        <div class="mb-3">
        <label for="title">제목</label>
        <input type="text" class="form-control" name="n_title" value="${nview.n_title}"/></br/>
        </div>
        
        <div class="mb-3">
        <label for="content">내용</label>
        <textarea class="form-control" cols="50" rows="10" name="n_content">${nview.n_content }</textarea></br/>
        </div>
        
        <div align="right">
        <!-- <input type="button" value="수정완료" class="btn btn-sm btn-primary" style="background-color: purple"/> -->
        <button class="btn btn-sm btn-primary" style="background-color: purple">수정완료</button>
        </div>
        
        </form>
</div>