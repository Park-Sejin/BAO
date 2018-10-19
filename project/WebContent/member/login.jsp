<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link href="./css/login.css" rel="stylesheet" type="text/css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
		<script type="text/javascript">
			
			var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);	
			var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
		
			$(document).ready(function(){		
				//이메일이 공백이 아니고 형식이 올바르고 비밀번호가 4~12자일때 버튼 색상변경
				$("#log_PassTxt").on("change keyup paste", function(){
					if($("#log_EmailTxt").val() != "" && getMail.test($("#log_EmailTxt").val()) && getCheck.test($("#log_PassTxt").val())){
				    	$("#submit").css("background-color","#5f5ab9");
				    }
				});
			});
			
			
			$("#log_EmailTxt").keyup(function(){
				var email = $("#log_EmailTxt").val();
				$.ajax({
					type:"POST",
					url:"joinCheck.jsp",
					data:{
						"email":email
					},
					success:function(data){
						
						//로그인 체크
						if(data.trim() != 1){
							$("#text").html("이메일이 존재하지않습니다");
						} else{
							$("#text").html("비밀번호를 입력해주세요");
						}
					}
				});
			});
			
			function LoginAction(){
				//이메일 공백 확인
			    if($("#log_EmailTxt").val() == ""){
			        $("#text").html("이메일을 입력해주세요");
			        $("#log_EmailTxt").focus();
			        return false;
			    }
				
			  	//비밀번호 공백 확인
			    if($("#log_PassTxt").val() == ""){
			        //alert("비밀번호를 입력해주세요");
			        $("#text").html("비밀번호를 입력해주세요");
			        $("#log_PassTxt").focus();
			        return false;
			    }
			}
			
		</script>
	</head>
	<body>
		<header>
			<div id="log_head">
				<img src="./img/login/logo.png" width="50" height="50" id="log_logo_img">
				<span id="log_logo">로그인</span>
				<div id="head_btn">
					<input type="button" value="모바일 앱 설치" class="btn-1"> <input type="button" value="회원가입" class="btn-2" onclick="location.href='./Join.me'">
				</div>
			</div>
		</header>
		
		<article>
		
		<form action="./MemberLoginAction.me" method="post" id="login" onsubmit="return LoginAction()">
			<input type="text" name="email" placeholder="이메일 " id="log_EmailTxt"><br>
			<input type="password" name="pass" placeholder="비밀번호"  id="log_PassTxt"><br>
			<input type="checkbox" name="check" id="check"> 자동 로그인<br><br><br>
			<div style="color: red" id="text"></div><br>
			<input type="submit" value="로그인" id="submit"><br>
			
			<div id="lost"><a href="./FindPassword.me">비밀번호를 잊어버리셨나요?</a></div>
			
			<div id="login_line">
				<fieldset>
					<legend>또는</legend>
				</fieldset>
			</div>
		
			<input type="button" value="카카오계정으로 시작하기" id="btn_k"><br>
			<input type="button" value="구글계정으로 시작하기" id="btn_g" onclick="location.href=''"><br>
		</form>
		
		
		</article>
	</body>
</html>