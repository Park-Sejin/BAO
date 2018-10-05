<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="./css/login.css" rel="stylesheet" type="text/css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>


</head>
<body>
	<header>
	<div id="log_head">
		<img src="./img/login/logo.png" width="50" height="50"
			id="log_logo_img"> <span id="log_logo">회원가입</span>
		<div id="head_btn">
			<input type="button" value="모바일 앱 설치" class="btn-1"> <input
				type="button" value="로그인" class="btn-2"
				onclick="location.href='./login.me'">
		</div>
	</div>
	</header>

	<article>

	<div id="login">
		<input type="text" name="name" placeholder="이름" id="join_NameTxt"><br>
		<input type="password" name="emaul" placeholder="이메일" id="join_EmailTxt"><br>
		<input type="text" name="pass" placeholder="비밀번호" id="join_PassTxt"><br>
		<input type="checkbox" name="check" id="check"> <span
			style="font-size: 14px">서비스 이용약관 및 개인정보 취급방침에 동의합니다.</span><br>
		<br> <br> <input type="button" value="회원가입" id="submit" onclick="JoinAction()"><br>

		<script type="text/javascript">
			function JoinAction() {
				$(document).ready(function() {
					/* id에 #~~~~~~~~~~~~~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!? */
					var name = document.getElementById('NameTxt').value;
					var email = document.getElementById('EmailTxt').value;
					var pass = document.getElementById('PassTxt').value;
					if (name == "") {
						alert("이름을 입력해주세요!");
						return false;
					}
					$.ajax({
						type : "POST",
						url : "MemberJoinAction.me",
						data : {
							"name" : name,
							"email" : email,
							"pass" : pass
						},
						success : function(data) {
							alert(data);
						//alert("이름 가져왔습니다.");
						//data가 1이면 controller가서 회원가입후 보여주는 페이지
						}
					});
				});
			}
		</script>
		
		
		<div id="login_line">
			<fieldset>
				<legend>또는</legend>
			</fieldset>
		</div>

		<input type="button" value="카카오계정으로 시작하기" id="btn_k"><br>
		<input type="button" value="구글계정으로 시작하기" id="btn_g"><br>
	</div>




	</article>
</body>
</html>