<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Insert title here</title>
      <link href="./css/login.css" rel="stylesheet" type="text/css">
      <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
      <script src="https://apis.google.com/js/api:client.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
      <script type="text/javascript">
      
      //뒤로가기금지(로그아웃 후 뒤로 가기 방지 목적)
      history.pushState(null, null, location.href);
      window.onpopstate = function(event) {
         history.go(1);
      };

      //이메일형식(영어&숫자@영어숫자.영어숫자)
      var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);   
      //비밀번호 형식(영어&숫자만 입력가능,4~12글수제한)
      var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
   
      $(document).ready(function(){      
         //이메일이 공백이 아니고 형식이 올바르고 비밀번호가 4~12자일때 버튼 색상변경
         $("#log_PassTxt").on("change keyup paste", function(){
            if($("#log_EmailTxt").val() != "" && getMail.test($("#log_EmailTxt").val()) && getCheck.test($("#log_PassTxt").val())){
                $("#submit").css("background-color","#5f5ab9");
             }
         });
         
         //이메일 체크
         $("#log_EmailTxt").keyup(function(){
            var email = $("#log_EmailTxt").val();
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
                     $("#text").html("비밀번호를 입력해주세요");
                  }
               }
            });
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
                 $("#text").html("비밀번호를 입력해주세요");
                 $("#log_PassTxt").focus();
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
               <span class="buttonText">구글계정으로 로그인</span>
             </div>
           </div>
           <script>startApp();</script>
           
      </form>
      
      </article>
   </body>
</html>