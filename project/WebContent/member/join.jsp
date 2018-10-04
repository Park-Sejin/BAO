<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		
		<link href="./css/login.css" rel="stylesheet" type="text/css">
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

		
	</head>
	<body>
		<header>
			<div id="log_head">
				<img src="./img/login/logo.png" width="135" height="50" id="log_logo_img">
				<span id="log_logo">회원가입</span>
				<div id="head_btn">
					<a href="">모바일 앱 설치</a>
					<a href="./login.me">로그인</a>
				</div>
			</div>
		</header>
	
		<article>
		
		<form action="" method="post" id="login">
			<input type="text" name="name" placeholder="이름" id="text"><br>
			<input type="password" name="emaul" placeholder="이메일"  id="text"><br>
			<input type="text" name="pass" placeholder="비밀번호"  id="text"><br>
			<input type="checkbox" name="check" id="check">
			<span style="font-size: 14px">서비스 이용약관 및 개인정보 취급방침에 동의합니다.</span><br><br><br>
			
			<input type="submit" value="회원가입" id="submit"><br>
			
			<div id="login_line">
				<fieldset>
					<legend>또는</legend>
				</fieldset>
			</div>
			
			<script type="text/javascript">
				$(document).ready(function(){
					$(#submit).click(function(){  /* id에 #~~~~~~~~~~~~~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! */
						var name = document.getElementsByName(name).value;
						
						$.ajax({
							type: "POST",
							url: "MemberJoinAction.me",
							data: {"name" : name},
							success: function(data){
								alert("이름 가져왔습니다.");
							}
						});
					})
					
				});
			</script>
		
			<input type="button" value="카카오계정으로 시작하기" id="btn_k"><br>
			<input type="button" value="구글계정으로 시작하기" id="btn_g"><br>
		</form>
		
		
	
		
		</article>
	</body>
</html>