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
		$(document).ready(function(){		
			$("#join_EmailTxt").keyup(function(){
				var email = $("#join_EmailTxt").val();
				$.ajax({
					type:"POST",
					url:"joinCheck.jsp",
					data:{
						"email":email
					},
					success:function(data){
						
						//중복 체크
						if(data.trim() == 1){
							$("#text").html("동일한 이메일이 사용중입니다");
						} else{
							$("#text").html("사용가능한 이메일 입니다");
						}
					}
				});
			});
		});
		
		function JoinAction(){
			var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		    var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
		    var getName= RegExp(/^[가-힣]+$/);
		    var fmt = RegExp(/^\d{6}[1234]\d{6}$/); //형식 설정 
				
									
				 //이름 공백확인
				if($("#join_NameTxt").val() == ""){
					$("#text").html("이름을 입력해주세요");
					$("#join_NameTxt").focus();
					return false;
				}
				
				//이메일 공백 확인
			    if($("#join_EmailTxt").val() == ""){
			        //alert("이메일을 입력해주세요");
			        $("#text").html("이메일을 입력해주세요");
			        $("#join_EmailTxt").focus();
			        return false;
			    }
				
			  	//이메일 유효성 검사
			    if(!getMail.test($("#join_EmailTxt").val())){
			        //alert("이메일형식에 맞게 입력해주세요")
			        $("#text").html("이메일형식에 맞게 입력해주세요");
			        $("#join_EmailTxt").val("");
			        $("#join_EmailTxt").focus();
			        return false;
			    }
				
				//비밀번호 공백 확인
			    if($("#join_PassTxt").val() == ""){
			        //alert("비밀번호를 입력해주세요");
			        $("#text").html("비밀번호를 입력해주세요");
			        $("#join_PassTxt").focus();
			        return false;
			    }
				
			    //아이디 비밀번호 같음 확인
			    if($("#join_NameTxt").val() == $("#join_PassTxt").val()){
			        //alert("비밀번호를 아이디와 동일하게 설정할 수 없습니다");
			        $("#text").html("비밀번호를 아이디와 동일하게 설정할 수 없습니다");
			        $("#join_PassTxt").val("");
			        $("#join_PassTxt").focus();
			        return false;
			    }
				
			    //비밀번호 유효성검사
			    if(!getCheck.test($("#join_PassTxt").val())){
			        //alert("영문과 숫자를 4~12 범위로 입력해주세요");
			        $("#text").html("영문과 숫자를 4~12 범위로 입력해주세요");
			        $("#join_PassTxt").val("");
			        $("#join_PassTxt").focus();
			        return false;
			    }
			    
			    //체크박스 검사
			    if($('input:checkbox[name="check"]').is(":checked") == false){
			    	//alert("서비스 이용약관 및 개인정보 취급방침에 동의해야 가입이 가능합니다");
			    	$("#text").html("서비스 이용약관 및 개인정보 취급방침에 동의해야 가입이 가능합니다");
			    	return false;
			    } 
			    
		}

</script>

</head>
<body>
	<header>
	<div id="log_head">
		<img src="./img/login/logo.png" width="50" height="50" id="log_logo_img"> 
		<span id="log_logo">회원가입</span>
		<div id="head_btn">
			<input type="button" value="모바일 앱 설치" class="btn-1"> 
			<input type="button" value="로그인" class="btn-2" onclick="location.href='./Login.me'">
		</div>
	</div>
	</header>

	<article>

	<form action="./MemberJoinAction.me" method="post" id="login" onsubmit="return JoinAction()">
		<input type="text" name="name" placeholder="이름" id="join_NameTxt"><br>
		<input type="text" name="email" placeholder="이메일" id="join_EmailTxt"><br>
		<input type="password" name="pass" placeholder="비밀번호" id="join_PassTxt"><br>
		<input type="checkbox" name="check" id="check"> 
		<span style="font-size: 14px">서비스 이용약관 및 개인정보 취급방침에 동의합니다.</span><br><br>
		<div style="color: red" id="text"></div><br>
		<input type="submit" value="회원가입" id="submit"><br>

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