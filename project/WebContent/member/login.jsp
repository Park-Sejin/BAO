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
			});
			
			/* //쿠키값 가져오기
			var cookie_user_id = getLogin();
			//쿠키값 존재하면 id에 쿠키에서 가져온 id할당
			if(cookie_user_id != ""){
				$("#log_EmailTxt").val(cookie_user_id);
			}
			
			//자동로그인체크시
			$("#check").on("click",function(){
				var isRemember;
				
				if($(this).is(":checked")){
					isRemember = confirm("이 PC에 로그인 정보를 저장하시겠습니까? PC방등의 공공장소에서는 개인정보가 유출될 수 있으니 주의해주십시오.");
					if(!isRemember){
						$("#check").attr("checked",false);
					}
				}
			});
			
			//로그인 버튼 클릭시
			$("#submit").on("click",function(){
				if($("#check").is(":checked")){
					saveLogin($("#log_EmailTxt").val());
				} else {
					saveLogin("");
				}
			});
			
			//로그인 정보 저장
			function saveLogin(id){
				if(id != ""){
					setSave("userid",id,7);
				} else {
					setSave("userid",id,-1);
				}
			}
			
			//쿠키에 로그인정보저장
			function setSave(name, value, expiredays){
				var today = new Date();
				today.setDate(today.getDate()+expiredays);
				document.cookie = name + "=" + escape(value) + "; path=/; expires=" + today.toGMTString() + ";"
			}
			
			//쿠키값 가져오기
			function getLogin() {

				// userid 쿠키에서 id 값을 가져온다.
				var cook = document.cookie + ";";
				var idx = cook.indexOf("userid", 0);
				var val = "";
				
				if(idx != -1) {
					cook = cook.substring(idx, cook.length);
					begin = cook.indexOf("=", 0) + 1;
					end = cook.indexOf(";", begin);
					val = unescape(cook.substring(begin, end));
				}
				
				return val;
			} */
			
			
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
			<input type="button" value="구글계정으로 시작하기" id="btn_g"><br>
		</form>
		
		
		</article>
	</body>
</html>