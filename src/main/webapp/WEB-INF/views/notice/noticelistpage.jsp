<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/navigationbar.jsp" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<style>
	h1 {
		text-align : center;
		margin-bottom : 50px;
	}
	.container {
		margin-top: 80px;
	}
	table {
	 text-align:center;
	}
	.pagination {
	  justify-content: center;
	  margin : 10px 0;
	}
	.search {
	  display : flex;
	  margin : 0px auto;
	  justify-content: center;
	  
	}
	#bwrite {
	 background-color: rgb(180, 112, 203);
	 width : 100px;
	 height : 40px;
	 float : right;
	 border:none;
	}
	.search {
	 display : flex;
	 margin-top : 50px;
	 margin-bottom : 100px;
	}
	#searchselect {
		width : 200px;
		margin-right : 10px;
	}
	#searchinput {
		width : 400px;
	}
	#searchBtn {
		background-color: rgb(180, 112, 203);
		width : 100px;
		color : white;
		justify-content : space-between;
		boarder : none;
		margin-left : 20px;
		border:none;
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
        
        <!-- 관리자만 버튼이 보이도록 구현 -->
        <div class="write">
        	<c:if test = "${member.authority == 1}">
        	<input type="button" value="작성하기" id="bwrite" class="btn btn-sm btn-primary" onclick="location.href='/notice/noticewrite'"/>
        	</c:if>
        </div>
        
      	 <nav aria-label="Page navigation exmple" >
      	<ul class="pagination">
        	<c:if test="${page.prev}">
			 <li class="page-item"><a class="page-link" href="/notice/noticepagesearch?num=${page.startPageNum - 1}">이전</a>
			</c:if>
			
			<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
			 <li class="page-item">
			 
			  <c:if test="${select != num}">
			   <a class="page-link" href="/notice/noticepagesearch?num=${num}">${num}</a>
			  </c:if>
			  
			  <c:if test="${select == num}">
			   <b class="page-link">${num}</b>
			  </c:if>
			    
			 </li>
			</c:forEach>
			
			<c:if test="${page.next}">
			 <li class="page-item"><a class="page-link" href="/notice/noticepagesearch?num=${page.endPageNum + 1}">다음</a></li>
			</c:if>
		</ul>
		</nav>
       	
       	<div class="search">
		 <select class="form-control" name="searchType" id="searchselect">
		     <option value="n_title" <c:if test="${page.searchType eq 'n_title'}">selected</c:if>>제목</option>
		      <option value="n_content" <c:if test="${page.searchType eq 'n_content'}">selected</c:if>>내용</option>
		     <option value="n_title_n_content" <c:if test="${page.searchType eq 'n_title_n_content'}">selected</c:if>>제목+내용</option>
		 </select>
		 
		 <input class="form-control" id="searchinput" type="text" name="keyword" value="${page.keyword}"/>
		 
		 <button type="button" id="searchBtn">검색</button>
		</div>	
		</div>
		<%@ include file="../includes/footer.jsp" %>
		
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