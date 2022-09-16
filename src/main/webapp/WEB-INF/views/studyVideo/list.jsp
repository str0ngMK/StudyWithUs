<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>video list</title>
</head>
<body>
<!-- 	<div class="bbs_gallery"> -->
<!-- 		<ul class="gallery_con clearfix">     -->
<%-- 			<c:forEach var="result" items="${resultList}" varStatus="status"> --%>
<%-- 				<c:set var="goDetailUrl" value="${pageContext.request.contextPath}/youtube/detail.do?mv_code=${result.mv_code}" /> --%>
<%-- 				<c:set var="key" value="${fn:substring(result.mv_the_origin_url,17,100) }" /> --%>
<!-- 				<li> -->
<%-- 					<a href="#" onclick="location.href='${goDetailUrl }'"> --%>
<%-- 				    	<c:choose> --%>
<%-- 				        	<c:when test="${not empty result.mv_the_origin_url}"> --%>
<!-- 				       			<span class="img"> -->
<%-- 				            		<img src="https://img.youtube.com/vi/${key}/mqdefault.jpg" alt="유튜브 동영상 이미지입니다." > --%>
<!-- 				       			</span>     -->
<%-- 				        	</c:when> --%>
<%-- 					        <c:otherwise> --%>
<!-- 					            <span class="img"> -->
<!-- 					                <img src="" alt="등록된 동영상 이미지가 없습니다." class="img" /> -->
<!-- 					            </span> -->
<%-- 					        </c:otherwise> --%>
<%-- 				    	</c:choose>         --%>
<!-- 					    <span class="tt"> -->
<%-- 					        <c:if test="${fn:length(result.mv_title) > 20}"> --%>
<%-- 					            <c:out value="${fn:substring(result.mv_title,0,20)}.." escapeXml="false" /> --%>
<%-- 					        </c:if>  --%>
<%-- 					        <c:if test="${fn:length(result.mv_title) <= 20}"> --%>
<%-- 					            <c:out value="${result.mv_title}" escapeXml="false" /> --%>
<%-- 					        </c:if> --%>
<!-- 					    </span> -->
<!-- 					</a> -->
<!-- 				</li> -->
<%-- 			</c:forEach> --%>
<%-- 			<c:if test="${fn:length(resultList) == 0}"> --%>
<%-- 			    <li class="t_c" style="text-align:center"><c:out value="조회된 데이터가 없습니다." /></li> --%>
<%-- 			</c:if> --%>
<!-- 		</ul> -->
<!-- 	</div> -->
	<iframe width="560"
			height="315"
			src="https://www.youtube.com/embed/#{url}"
			title="YouTube video player"
			frameborder="0"
			allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
	</iframe>
</body>
</html>