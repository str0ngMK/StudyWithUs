<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/navigationbar.jsp" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<style>
	h1 {
		text-align : center;
	}
	.container {
		margin-top: 50px;
	}
	table {
	 text-align:center;
	}
</style>
<body>
        <div class="container">
        <h1> 공지사항 </h1>
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
        				<a href="/notice/noticeview?n_num=${nlist.n_num}">${nlist.n_title }</a></td>
        			<td>
        			<fmt:formatDate value="${nlist.n_date}" pattern="yyyy-MM-dd" /></td>
        		</tr>	
        		</c:forEach>
        	</tbody>
        </table>
        
        <div>
        	<input type="button" value="작성하기" class="btn btn-sm btn-primary" style="background-color: purple" onclick="location.href='/notice/noticewrite'"/>
        </div>
         <div>
        	<c:if test="${page.prev}">
			 <span>[ <a href="/notice/noticepagesearch?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a> ]</span>
			</c:if>
			
			<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
			 <span>
			 
			  <c:if test="${select != num}">
			   <a href="/notice/noticepagesearch?num=${num}${page.searchTypeKeyword}">${num}</a>
			  </c:if>
			  
			  <c:if test="${select == num}">
			   <b>${num}</b>
			  </c:if>
			    
			 </span>
			</c:forEach>
			
			<c:if test="${page.next}">
			 <span>[ <a href="/notice/noticepagesearch?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a> ]</span>
			</c:if>
		</div>
       	<div>
		 <select name="searchType">
		     <option value="n_title" <c:if test="${page.searchType eq 'n_title'}">selected</c:if>>제목</option>
		      <option value="n_content" <c:if test="${page.searchType eq 'n_content'}">selected</c:if>>내용</option>
		     <option value="n_title_n_content" <c:if test="${page.searchType eq 'n_title_n_content'}">selected</c:if>>제목+내용</option>
		 </select>
		 
		 <input type="text" name="keyword" value="${page.keyword}"/>
		 
		 <button type="button" id="searchBtn">검색</button>
		</div>
		</div>
		
		<script>

		 document.getElementById("searchBtn").onclick = function () {
		    
		  let searchType = document.getElementsByName("searchType")[0].value;
		  let keyword =  document.getElementsByName("keyword")[0].value;
		  
		  console.log(searchType)
		  console.log(keyword)
		  
		  location.href = "/notice/noticepagesearch?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
		 };
		</script>
</body>