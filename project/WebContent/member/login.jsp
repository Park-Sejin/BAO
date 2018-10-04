<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		
		<link href="./css/login.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<header>
			<div id="log_head">
				<img src="./img/login/logo.png" width="135" height="50" id="log_logo_img">
				<span id="log_logo">로그인</span>
				<div id="head_btn">
					<a href="">모바일 앱 설치</a>
					<a href="./join.me">회원가입</a>
				</div>
			</div>
		</header>
	
		<article>
		
		<form action="" method="post" id="login">
			<input type="text" name="id" placeholder="이메일 또는 아이디" id="text"><br>
			<input type="password" name="pass" placeholder="비밀번호"  id="text"><br>
			<input type="checkbox" name="check" id="check"> 자동 로그인<br><br><br>
			
			<input type="submit" value="로그인" id="submit"><br>
			
			<div id="lost"><a href="">비밀번호를 잊어버리셨나요?</a></div>
			
			<div id="login_line">
				<fieldset>
					<legend>또는</legend>
				</fieldset>
			</div>
		
			<input type="button" value="카카오계정으로 시작하기" id="btn_k"><br>
			<input type="button" value="구글계정으로 시작하기" id="btn_g"><br>
		</form>
		
		
	
		
		</article>
	</body>
</html>