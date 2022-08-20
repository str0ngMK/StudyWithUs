<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <title>아이디 찾기</title>
  <link rel="stylesheet" href="style.css">
  <script src="jquery-3.4.1.js"></script>
  <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>

<body>

  <div class="findId-form">

    <h1>아이디 찾기</h1>

    <form action="" method="">

      <div class="int-area2">
        <input type="email" name="email" id="email" autocomplete="off" required>
        <label for="email">이메일 주소</label>
      </div>

      <div class="int-area2">
        <input type="password" name="pwd" id="pwd" autocomplete="off" required>
        <label for="pwd">비밀번호</label>
      </div>

      <div class="btn-area2">
        <button id="btn1" type="reset">닫기</button>
        <button id="btn2" type="submit">확인</button>
      </div>

    </form>

  </div>

  <script>
    let email = $('#email');
    let pwd = $('#pwd');
    let btn2 = $('#btn2');

    $(btn2).on('click', function () {
      if ($(email).val() == "") {
        $(email).next('label').addClass('warning');
        setTimeout(function () {
          $('label').removeClass('warning');
        }, 1500);
      }
      else if ($(pwd).val() == "") {
        $(pwd).next('label').addClass('warning');
        setTimeout(function () {
          $('label').removeClass('warning');
        }, 1500);
      }
    });
  </script>
</body>

</html>