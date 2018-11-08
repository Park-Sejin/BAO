<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="./css/login.css" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://apis.google.com/js/api:client.js"></script>

<script type="text/javascript">

	var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
	var getName= RegExp(/^[가-힣]+$/);
	var fmt = RegExp(/^\d{6}[1234]\d{6}$/); //형식 설정 

		$(document).ready(function(){		
			//아이디중복확인
			$("#join_EmailTxt").keyup(function(){
				var email = $("#join_EmailTxt").val();
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
						//중복 체크
						if(data.trim() == 1){
							$("#text").html("동일한 이메일이 사용중입니다");
							$("#submit").css("background-color","#cccdd0");
							$("#join_EmailTxt").val("");
							$("#join_EmailTxt").focus();
						} else{
							$("#text").html("사용가능한 이메일 입니다");
						}
					}
				});
			});
			
			//모두 공백이 아니고 형식이 올바르면 버튼 색상변경
			$("#join_PassTxt").on("change keyup paste", function(){
				if($("#join_NameTxt").val() != "" && $("#join_EmailTxt").val() != "" && $("#join_PassTxt").val() != ""
					&& getName.test($("#join_NameTxt").val()) && getMail.test($("#join_EmailTxt").val()) && getCheck.test($("#join_PassTxt").val())){
			    		$("#submit").css("background-color","#5f5ab9");
			    }
			});
		});
		
		function JoinAction(){
									
				 //이름 공백확인
				if($("#join_NameTxt").val() == ""){
					$("#text").html("이름을 입력해주세요");
					$("#join_NameTxt").focus();
					return false;
				}
				
				//이메일 공백 확인
			    if($("#join_EmailTxt").val() == ""){
			        $("#text").html("이메일을 입력해주세요");
			        $("#join_EmailTxt").focus();
			        return false;
			    }
				
			  	//이메일 유효성 검사
			    if(!getMail.test($("#join_EmailTxt").val())){
			        $("#text").html("이메일형식에 맞게 입력해주세요");
			        $("#join_EmailTxt").val("");
			        $("#join_EmailTxt").focus();
			        return false;
			    }
				
				//비밀번호 공백 확인
			    if($("#join_PassTxt").val() == ""){
			        $("#text").html("비밀번호를 입력해주세요");
			        $("#join_PassTxt").focus();
			        return false;
			    }
				
			    //이름 비밀번호 같음 확인
			    if($("#join_NameTxt").val() == $("#join_PassTxt").val()){
			        $("#text").html("비밀번호를 아이디와 동일하게 설정할 수 없습니다");
			        $("#join_PassTxt").val("");
			        $("#join_PassTxt").focus();
			        return false;
			    }
				
			    //비밀번호 유효성검사
			    if(!getCheck.test($("#join_PassTxt").val())){
			        $("#text").html("영문과 숫자를 4~12 범위로 입력해주세요");
			        $("#join_PassTxt").val("");
			        $("#join_PassTxt").focus();
			        return false;
			    }
			    
			    //체크박스 검사
			    if($('input:checkbox[name="check"]').is(":checked") == false){
			    	$("#text").html("서비스 이용약관 및 개인정보 취급방침에 동의해야 가입이 가능합니다");
			    	return false;
			    } 
			    
		}

</script>

		<!-- 구글로그인 -->
		<script>
			  var googleUser = {};
			  var startApp = function() {
			    gapi.load('auth2', function(){
			      // Retrieve the singleton for the GoogleAuth library and set up the client.
			      auth2 = gapi.auth2.init({
			        client_id: '582781589974-rk7pm8gf932johsg4uctn2r31gs7d8gb.apps.googleusercontent.com',
			        cookiepolicy: 'single_host_origin',
			        // Request scopes in addition to 'profile' and 'email'
			        //scope: 'additional_scope'
			      });
			      attachSignin(document.getElementById('customBtn'));
			    });
			  };
			
			  function attachSignin(element) {
			    console.log(element.id);
			    auth2.attachClickHandler(element, {},
			        function(googleUser) {
			    		var email = googleUser.getBasicProfile().getEmail();
		    			var name = googleUser.getBasicProfile().getName(); 
						location.href='./GoogleLogin.me?email='+email+'&name='+name;
			        }, function(error) {
			          alert(JSON.stringify(error, undefined, 2));
			        });
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

		<!-- 카카오계정으로 로그인 -->
         <a id="custom-login-btn" href="javascript:loginWithKakao()">
         <img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="370" height="50"/>
         </a>
         <script type='text/javascript'>
           //<![CDATA[
             // 사용할 앱의 JavaScript 키를 설정해 주세요.
             Kakao.init('1d5525149f2773d68dd108ba5af32c41');
             function loginWithKakao() {
               // 로그인 창을 띄웁니다.
               Kakao.Auth.login({
                 success: function(authObj) {
                     Kakao.API.request({
         
                           url: '/v2/user/me',
         
                           success: function(res) {
         
                                // alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력
         
                                // alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력
         
                                 var userID = res.id;      //유저의 카카오톡 고유 id
                                 var userNickName = res.properties.nickname; //유저가 등록한 별명
                                 var profile = res.properties.profile_image; //프로필사진
                                 
                                 
                                 location.href="kakaoJoin.me?userID="+userID+"&userNickName="+userNickName+"&profile="+profile;
                               }
         
                             })
         
                 },
                 fail: function(err) {
                   alert(JSON.stringify(err));
                 }
               });
             };
           //]]>
         </script>
         
		<!-- 구글계정으로 로그인 -->
			<div id="gSignInWrapper">
			    <div id="customBtn" class="customGPlusSignIn">
			      <span class="icon"></span>
			      <span class="buttonText">구글계정으로 시작하기</span>
			    </div>
		  	</div>
		  	<script>startApp();</script>
	</form>




	</article>
</body>
</html>