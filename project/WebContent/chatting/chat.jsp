<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Insert title here</title>
      <link href="../css/chat.css" rel="stylesheet" type="text/css">
   </head>
   <body>
      <div id="chat_top">
         운영자
         <img src="../img/login/logo.png" alt="바꿔야함" id="chat_menu">
      </div><br>
      
      
      <div id="chat_boay">
         <fieldset>
            <legend>년도-월-일 요일</legend>
            <div id="chat_receive">
            <sup style="color: #f66;">1</sup>
               <span id="chat_time"><sub>오후 12:30</sub></span>
               <span id="chat_msg">안녕하세요</span>
            </div>
            
            <div id="clear"></div>
            <div id="chat_receive">
               <sup style="color: #f66;">1</sup>
               <span id="chat_time"><sub>오후 12:31</sub></span>
               <span id="chat_msg">그래</span>
            </div>
            
            <div id="clear"></div>
            <div id="chat_send">
               <span id="chat_msg">안녕하세요</span>
               <span id="chat_time"><sub>오후 12:32</sub></span>
               <sup style="color: #f66;">1</sup>
            </div>
            
            <div id="clear"></div>
            <div id="chat_send">
               <span id="chat_msg">뭐하냐</span>
               <span id="chat_time"><sub>오후 12:50</sub></span>
               <sup style="color: #f66;">1</sup>
            </div>
            
            <div id="clear"></div>
            <div id="chat_receive">
               <sup style="color: #f66;">1</sup>
               <span id="chat_time"><sub>오후 12:59</sub></span>
               <span id="chat_msg">잔다</span>
            </div>
            
         </fieldset>
      </div>
      
      
      
      
      
      <div id="chat_clip">
         <img src="../img/login/logo.png" alt="바꿔야함">
      </div>
      
      <div>
         <textarea rows="5" cols="197" placeholder="메세지를 입력하세요."></textarea>
         <div id="chat_btn">전송</div>
      </div>
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   </body>
</html>