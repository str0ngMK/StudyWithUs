<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% HttpSession se = request.getSession();
   if(se.getAttribute("member") == null) { %>
   <script>
	 alert('로그인이 필요합니다.');
	 window.history.back();  
	</script> 
<% } %>
