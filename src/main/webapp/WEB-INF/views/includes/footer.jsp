<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.footer {
    width: 100%;
    height: 200px;
    background-color: rgb(77, 74, 79);
    margin-top : 100px;
	}
	.fmenu {
	    display: flex;
	    justify-content: space-around;
	    list-style: none;
	    padding-left: 0px;
	}
	.fmenu li {
	    padding: 10px 12px;
	    width: 150px;
	    /* background-color: blueviolet; */
	    margin: 10px;
	    font-size: 15px;
	    font-family: sans-serif;
	    text-align: center;
	}
	.fmenu a {
	    color:white;
	}
	.finform {
	    margin-left: 10%;
	    width: 1020px;
	    /* background-color: aquamarine;*/
	}
	.companyname {
	    color: white;
	    font-weight: 800;
	}
	.inform {
	    color:rgb(165, 162, 162);
	    margin-right: 50px;
	    margin-top: 20px;
	    width: 50px;
	}
</style>
</head>
<body>
<footer class="footer">
            <ul class="fmenu">
               <li><a href="#">이용약관</a></li>
               <li><a href="#">개인정보 취급방침</a></li>     
               <li><a href="#">이용방법</a></li>
               <li><a href="#">문의하기</a></li>            
            </ul>
        <div class="finform">
            <span class="companyname">(주) 스위더</span>
            <span class="inform"> 주소 : 서울 ○○구 △△동</span>
            <span class="inform"> 이메일 : StudyWithUs@gmail.com</span>
            <span class="inform">대표 전화 : 1234 –1234</span><br>
            <span class="inform">대표 이사 : 스위더 / 사업자 등록 번호 : 123-45-12345</span> 
            <span class="inform">copyrigths 2022. StudyWithUs All Rights Reserved</span>
        </div>
    </footer>
</body>
</html>