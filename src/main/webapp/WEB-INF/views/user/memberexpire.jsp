<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <title>회원탈퇴</title>
  <link rel="stylesheet" href="style.css">
  <script src="jquery-3.4.1.js"></script>
  <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>

<body>

  <div class="delete_member">

    <form action="" method="">

      <h1>회원탈퇴</h1>

      <div class="int-area13">
      
        <br>
        <h3>탈퇴 시 주의사항</h3>
        
        <dl>
          <dt><h4>즉시 탈퇴 처리 및 기존 아이디 사용 불가</h4></dt>
          <dd>회원 탈퇴 시, 즉시 탈퇴 처리되며 기존에 가입하셨던 아이디로 재가입(재사용)이 불가능합니다.</dd>
        </dl>

        <dl>
          <dt><h4>관계법령에 따른 주문번호는 회원 탈퇴 후 5년간 보존</h4></dt>
          <dd>전자상거래 등에서의 소비자 보호에 관한 법률 제6조(거래기록의 보존 등)에 의거, 주문정보는 회원 탈퇴 후 5년간 보존됩니다.</dd>
        </dl>

        <dl>
          <dt><h4>관계법령에 따른 주문번호는 회원 탈퇴 후 5년간 보존</h4></dt>
          <dd>전자상거래 등에서의 소비자 보호에 관한 법률 제6조(거래기록의 보존 등)에 의거, 주문정보는 회원 탈퇴 후 5년간 보존됩니다.</dd>
        </dl>

        <dl>
          <dt><h4>탈퇴 후 7일 이내 재가입 불가 및 정보보관</h4></dt>
          <dd>회원 탈퇴 후 7일간 휴대전화번호 / 이메일주소 / 개인식별정보(CI/DI)가 저장되며 동일 정보로 사이트 가입이 불가능합니다.</dd>
        </dl>

      </div>

      <br>
      
      <label for="agree13">
        <input type="checkbox" name="final_agree" id="final_agree">
        <label for="final_agree"><b>상기 사항을 모두 확인했습니다.</b><br>&nbsp;&nbsp;&nbsp; (7일 이내 재가입 불가함에 동의합니다.)</label>
      </label>

      <div class="btn-area13">
        <button type="reset">취소</button>
        <button type="submit">탈퇴</button>
      </div>

    </form>

  </div>

</body>

</html>