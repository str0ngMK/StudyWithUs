<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <title>회원정보 수정</title>
  <link rel="stylesheet" href="style.css">
  <script src="jquery-3.4.1.js"></script>
  <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

</head>

<body>
  <div class="modify">

    <h1>회원정보 수정</h1>

    <form action="" method="">

      <div>
        <div class="int-area11">
          <input type="text" name="name" id="name" value="${10member_authentic.getName()}" autocomplete="off" required>
          <label for="name">이름</label>
        </div>
      </div><br>

      <div>
        <div class="int-area11">
          <input type="text" name="id" id="id" autocomplete="off" value="${10member_authentic.getId()}" required>
          <label for="name">아이디</label>
        </div>
      </div><br>

      <div>
        <div class="int-area11">
          <input type="text" name="nickname" id="nickname" autocomplete="off" value="${10member_authentic.getNickname()}" required>
          <label for="nickname">아이디</label>
        </div>
      </div><br>

      <div>
        <div class="int-area11">
          <input type="text" name="email" id="email" autocomplete="off" value="${10member_authentic.getEmail()}" required>
          <label for="email">이메일</label>
        </div>
      </div><br>

      <div>
        <div class="int-area11">
          <input type="text" name="contact" id="contact" autocomplete="off" value="${10member_authentic.getContact()}" required>
          <label for="contact">핸드폰 번호</label>
        </div>
      </div><br>

      <div>
        <div class="int-area11">
          <input type="text" name="birthdate" id="birthdate" autocomplete="off" value="${10member_authentic.getBirthdate()}" required>
          <label for="birthdate">생년월일</label>
        </div>
      </div><br>

      <div>
        <div class="int-area11">
          <input type="text" name="gender" id="gender" autocomplete="off" value="${10member_authentic.getGender()}" required>
          <label for="gender">성별</label>
        </div>
      </div><br>

      <div>
        <div class="int-area11">
          <input type="text" name="address" id="address" autocomplete="off" value="${10member_authentic.getAddress()}" required>
          <label for="address">주소</label>
        </div>
      </div><br>

      <div class="btn-area11">
        <button id="btn1" type="reset">취소</button>
        <button id="btn2" type="submit">수정</button>
      </div>
    </form>
  </div>

  <script> //수정해야함
    let pwd = $('#pwd');
    let btn2 = $('#btn2');

    $(btn2).on('click', function () {
      if ($(pwd).val() == "") {
        $(pwd).next('label').addClass('warning');
        setTimeout(function () {
          $('label').removeClass('warning');
        }, 1500);
      }
    });

  </script>

</body>

</html>