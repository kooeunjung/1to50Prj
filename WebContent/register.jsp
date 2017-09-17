<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>순발력게임</title>
  
      <link rel="stylesheet" href="css/login.css">
  </head>

<body>
  
<form action=register-proc.jsp method="GET">
  <header>간단히 가입후 게임을 즐기세요^^</header>
  
  <label>닉네임 <span>*</span></label>
  <input type=text type=text name=nickname id=nickname/>
  <div class="help"> 한글가능</div>
  <label>이메일주소 <span>*</span></label>
  <input type=text type=text placeholder="****@*** 형식으로 작성해주세요" name=email id=email/>
  <div class="help">비밀번호 분실 시 사용할 이메일 주소를 입력하세요</div>
  <label>비밀번호 <span>*</span></label>
  <input type=password type=password placeholder="password" name=password id=password/>
  <label>비밀번호 확인 <span>*</span></label>
  <input type=password type=password placeholder="password" name=password2 id=password2/>
  
  <button class="first" type=submit value=register id=guestBtn onClick="location.href='register-proc.jsp'"> Register</button>
  <button class="second" type=button value=login id=registerBtn onClick="location.href='login.jsp'"> login</button>
</form>
  
  
</body>
</html>
