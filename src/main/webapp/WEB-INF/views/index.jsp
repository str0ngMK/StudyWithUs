<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="includes/navigationbar.jsp" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
   	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Mochiy+Pop+One&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <link href="/resources/css/indexstyle.css" rel="stylesheet">
    <title>Sweeter</title>
</head>
<body>
    <div class="content">
        <div class="slidebox">
            <input type="radio" name="slide" id="slide01" checked>
            <input type="radio" name="slide" id="slide02">
            <input type="radio" name="slide" id="slide03">
            <input type="radio" name="slide" id="slide04">
            <ul class="slidelist">
                <li class="slideitem">
                    <div>
                        <label for="slide04" class="left"></label>
                        <label for="slide02" class="right"></label>
                        <div class="text">
                            <p class="param">야, 너두?</br>나두 Sweether 해!</p>
                        </div>
                        <div class="btext"><button onclick="location.href='/room.do'">스터디 참여</button></div> 
                        <a><img src="resources/image/main/image1.jpg"></a>
                    </div>
                </li>
                <li class="slideitem">
                    <div>
                        <label for="slide01" class="left"></label>
                        <label for="slide03" class="right"></label>
                        <div class="text">
                        <p class="param">Sweeter는<br>당신을 기다리는 중</p>
                        </div>
                        <div class="btext"><button onclick="location.href='todo/adtodo.do'">To do list 만들기</button></div> 
                        <a><img src="resources/image/main/image2.jpg"></a>
                    </div>
                </li>
                <li class="slideitem">
                    <div>
                        <label for="slide02" class="left"></label>
                        <label for="slide04" class="right"></label>
                        <div class="text">
                            <p class="param">언제 어디서나<br>참여가능한 Sweeter</p></div>
                            <div class="btext"><button onclick="location.href='/room.do'">스터디 참여</button></div> 
                        <a><img src="resources/image/main/image3.jpg"></a>  
                    </div>
                </li>
                <li class="slideitem">
                    <div>
                        <label for="slide03" class="left"></label>
                        <label for="slide01" class="right"></label>
                        <div class="text">
                            <p class="param">미래를 여는 길, <br> Sweeter와 함께가요!</p></div>
                            <div class="btext"><button onclick="location.href='/board/list'">게시판 보러가기</button></div> 
                        <a><img src="resources/image/main/image4.jpg"></a>
                    </div>
                </li>
            </ul>
       </div>
        <div class="content2">
            <div class="content2_1">
                <div class="first">
                <h2>Sweeter와 함께 공부해보세요.</h2>
                <h2>힘들었던 공부가 쉬워질거예요.</h2>
                </div>
                <div class="second">
                서로 소통하면서 공부할 수 있습니다.<br>
                공부시간도 실시간으로 확인해보세요.</div>    
                <button class="btext2" onclick="location.href='/room.do'">스터디 참여</button>
            </div>
            <div class="content2_2">
                <div class="divc2">
                    <a><img src="resources/image/main/image5.jpg"></a>
                    <p>스터디 모임</p>
                </div>
                <div class="divc2">
                <a><img src="resources/image/main/image7.jpg"></a>
                <p>언제든 질문하기</p>
                </div>
                <div class="divc2">
                <a><img src="resources/image/main/image8.jpg"></a>
                <p>공부시간<br>확인가능</p>
                </div>
            </div>
        </div>
        <div class="content3">
            <div class="content3_1">
                    <a><img src="resources/image/main/image9.jpg"></a>
            </div>
            <div class="content3_2">
                <div class="first">
                    <h1>모든 일의 시작은 계획부터!</h1>
                    <h1>To do list를 이용해 보세요.</h1>
                    </div>
                    <div class="second">
                    서로 소통하면서 공부할 수 있습니다.<br>
                    공부시간도 실시간으로 확인해보세요.</div>    
                    <button class="btext3" onclick="location.href='todo/adtodo.do'">계획 작성하기</button>
            </div>
        </div>
    </div>
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
<!--     <div class="qna">
        <img class="imlogo2" src="resources/image/logo.png" alt="logo">
    </div>
    <div class="modal">
        <div class="title">
            <h2>Sweeter 이용방법</h2>
            <div class="close-button">X</div>
        </div>
        <hr/>
        <div class="m_content">
            <div class="notice">▶ Sweeter는 채팅 형식의 스터디룸입니다 </div>
            <div class="notice">▶ 바르고 고운말을 사용해주세요 </div>
            <div class="notice">▶ 다른 사람이 공부에 집중할 수 있도록 도와주세요  </div>
            <div class="notice">▶ 주어진 시간에 최선을 다해서 공부하세요 </div>
            <div class="notice">▶ 다른 문의사항은 1:1게시판이나 이용방법을 참고해주세요 </div>
        </div>
        <hr>
        <div class="m_footer">
            <button class="b_close">닫기</button>
        </div> -->
    </div>
    <script>
        const modal = document.querySelector(".modal");
        const qna = document.querySelector(".qna");
        const close1 = document.querySelector(".close-button");
        const close2 = document.querySelector(".b_close");

        qna.addEventListener('click', () => {
            modal.style.display = 'block';
        });

        close1.addEventListener('click', () => {
            modal.style.display = 'none';
        });

        close2.addEventListener('click', () => {
            modal.style.display = 'none';
        });
    </script>
</body>
</html>