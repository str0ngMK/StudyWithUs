<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>에러 페이지</title>
  <link rel="stylesheet" href="../resources/css/style.css">
  <style>
    #btn1 {
      width: 50%; height: 50px;
      background : rgb(165, 99, 191);
      color: #fff;
      font-size: 17px;
      border: none;
      border-radius: 25px;
      cursor: pointer;
      margin-top : 20px;
      margin-left : 100px;
    }
  </style>
</head>
<body>

  <div class="notcorrect">

  <h1>Error</h1>

  <form action="" method="">

  <div class="int-area7">
    <img src="../resources/image/danger.png" alt="exclamationMark"><br>
    <label for=""><h3>요청하신 페이지를 찾을 수 없습니다.</h3></label>
    <div>이용에 불편을 드려 죄송합니다.</div>
    <div>찾으시는 페이지는 주소를 잘못 입력하였거나 삭제된 페이지입니다.</div>
    <div>주소를 다시 한 번 확인해주시기 바랍니다.</div>
  </div>

  <div class="main_btn">
   <button id="btn1" type="reset">메인 페이지</button>
  </div>

</form>

</div>
</body>
</html>