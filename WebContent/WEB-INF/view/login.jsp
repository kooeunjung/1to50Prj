<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>���߷°���</title>
  
      <link rel="stylesheet" href="css/login.css">
  </head>

<body>
  
<form action=login-proc.jsp method="GET">
  <header>�α��� �� ������ ��⼼�� ^^</header>
  <label>�г��� <span>*</span></label>
  <input type=text placeholder="guest" name=nickname id=nickname/>
  <div class="help">�ѱ۰���</div>
  <label>��й�ȣ <span>*</span></label>
  <input type=password placeholder="password"
						name=password id=password/>
  <div class="help">��й�ȣ�� �ؾ��ٸ� Ŭ���ϼ���</div>
  
  <button class="first" type=submit value=login id=loginBtn
							onClick="location.href='login-proc.jsp'"> Login</button>
  <button class="second" type=button value=register id=registerBtn
							onClick="location.href='register.jsp'"> Register</button>
</form>
  
  
</body>
</html>
