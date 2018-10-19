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

	var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);

	$(document).ready(function(){
		
		//비밀번호1이 공백이 아니고 비밀번호가 4~12범위일때 버튼 색상변경
		$("#passTxt2").on("change keyup paste", function(){
			if($("#passTxt1").val() != "" && getCheck.test($("#passTxt1").val()) && getCheck.test($("#passTxt2").val())){
				$("#find_submit").css("background-color","#5f5ab9");
		    }
			
		});
		
	});
	
	function findPass(){
		
			//비밀번호 공백 확인
		    if($("#passTxt1").val() == ""){
		        $("#text").html("비밀번호를 입력해주세요");
		        $("#passTxt1").focus();
		        return false;
		    }
		    if($("#passTxt2").val() == ""){
		        $("#text").html("비밀번호를 재입력해주세요");
		        $("#passTxt2").focus();
		        return false;
		    }
			
		    //비밀번호 같음 확인
		    if($("#passTxt1").val() != $("#passTxt2").val()){
		        $("#text").html("비밀번호를 동일하게 입력해주세요");
		        $("#passTxt1").val("");
		        $("#passTxt2").val("");
		        $("#passTxt1").focus();
		        return false;
		    }
			
		    //비밀번호 유효성검사
		    if(!getCheck.test($("#passTxt1").val())){
		        $("#text").html("영문과 숫자를 4~12 범위로 입력해주세요");
		        $("#passTxt1").val("");
		        $("#passTxt2").val("");
		        $("#passTxt1").focus();
		        return false;
		    }
	}
	
</script>
</head>
<body>
	<header>
		<div id="log_head">
			<img src="./img/login/logo.png" width="50" height="50" id="log_logo_img">
			<span id="log_logo">비밀번호찾기</span>
			<div id="head_btn">
				<input type="button" value="모바일 앱 설치" class="btn-1"> 
				<input type="button" value="회원가입" class="btn-2" onclick="location.href='./Join.me'">
			</div>
		</div>
	</header>
	
	<%
	String email = request.getParameter("email");
	%>
	<article>
		<h1>비밀번호를 재설정합니다.</h1>
		<div id="find_text">비밀번호는 4자~12자의 숫자와 영문으로 설정해야합니다.</div>
		<form action="./RePasswordAction.me" method="post" id="find" onsubmit="return findPass()">
			<input type="hidden" name="email" value="<%=email%>">
			<input type="password" name="pass" id="passTxt1" placeholder="비밀번호 입력(4~9자, 영문숫자입력)"><br>
			<input type="password" name="pass2" id="passTxt2" placeholder="비밀번호 재입력"><br><br>
			<div style="color: red" id="text"></div><br>
			<input type="submit" value="비밀번호 변경하기" id="find_submit">
		</form>
	</article>
</body>
</html>