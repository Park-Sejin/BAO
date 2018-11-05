<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/login.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

	var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);

	function findPass(){
		//이메일 공백 확인
	    if($("#find_EmailTxt").val() == ""){
	        $("#text").html("이메일을 입력해주세요");
	        $("#find_EmailTxt").focus();
	        return false;
	    } 
		
	}
	
	$(document).ready(function(){
		
		//이메일 체크
		$("#find_EmailTxt").keyup(function(){
			var email = $("#find_EmailTxt").val();
			$.ajax({
				type:"POST",
				url:"./member/joinCheck.jsp",
				data:{
					"email":email
				},
				dataType : "text",
				error : function(){
					alert('통신실패!!');
				},
				success:function(data){
					
					if(data.trim() != 1){
						$("#text").html("이메일이 존재하지않습니다");
					} else{
						//이메일이 존재하면 버튼 색상변경
						$("#find_submit").css("background-color","#5f5ab9");
						//버튼활성화
						$("#find_submit").attr("disabled",false);
						$("#find_submit").css("cursor","pointer");
					}
				}
			});
		});
	    
	});
	
</script>
</head>
<body>
	<header>
		<div id="log_head">
			<img src="./img/login/logo.png" width="50" height="50" id="log_logo_img">
			<span id="log_logo">비밀번호찾기</span>
			<div id="head_btn">
				<input type="button" value="모바일 앱 설치" class="btn-1"> <input type="button" value="회원가입" class="btn-2" onclick="location.href='./Join.me'">
			</div>
		</div>
	</header>
	
	<article>
		<h1>비밀번호를 잊어버리셨나요?</h1>
		<div id="find_text">기존에 가입하신 이메일을 입력하시면 비밀번호변경 메일을 발송해 드립니다.</div>
		<form action="./SendMail.me" method="post" id="find" onsubmit="return findPass()">
			<input type="text" name="email" id="find_EmailTxt" placeholder="이메일(ex.example@google.com)"><br><br>
			<div style="color: red" id="text"></div><br>
			<input type="submit" value="비밀번호 변경메일받기" id="find_submit" disabled="disabled">
		</form>
	</article>
</body>
</html>