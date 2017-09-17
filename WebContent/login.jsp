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
  
<form action=login-proc.jsp method="GET">
  <header>로그인 후 게임을 즐기세요 ^^</header>
  <label>닉네임 <span>*</span></label>
  <input type=text placeholder="guest" name=nickname id=nickname/>
  <div class="help">한글가능</div>
  <label>비밀번호 <span>*</span></label>
  <input type=password placeholder="password"
						name=password id=password/>
  <div class="help">비밀번호를 잊었다면 클릭하세요</div>
  
  <button class="first" type=submit value=login id=loginBtn
							onClick="location.href='login-proc.jsp'"> Login</button>
  <button class="second" type=button value=register id=registerBtn
							onClick="location.href='register.jsp'"> Register</button>
</form>
  
  
</body>
</html>
