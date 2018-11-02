<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link href="./css/chat.css" rel="stylesheet" type="text/css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
		
		<script type="text/javascript">
		
			$(document).ready(function() {
			 	$("#clip_menu").hide();
				$("#chat_clip>#chat_c_img").click(function() {
					$("#clip_menu").toggle();
				});
			});
		</script>
	
	</head>
	<body>
		<div id="chat_top">
			운영자 <img src="./img/login/logo.png" alt="바꿔야함" id="chat_menu">
		</div>
		<br>
	
	
		<div id="chat_boay" style="min-width: 100px; min-height: 600px;">
			<fieldset>
				<legend>년도-월-일 요일</legend>
				<div id="chat_receive">
					<sup style="color: #f66;">1</sup> <span id="chat_time"><sub>오후
							12:30</sub></span> <span id="chat_msg">안녕하세요</span>
				</div>
	
				<div id="clear"></div>
				<div id="chat_receive">
					<sup style="color: #f66;">1</sup> <span id="chat_time"><sub>오후
							12:31</sub></span> <span id="chat_msg">그래</span>
				</div>
	
				<div id="clear"></div>
				<div id="chat_send">
					<span id="chat_msg">안녕하세요</span> <span id="chat_time"><sub>오후
							12:32</sub></span> <sup style="color: #f66;">1</sup>
				</div>
	
				<div id="clear"></div>
				<div id="chat_send">
					<span id="chat_msg">뭐하냐</span> <span id="chat_time"><sub>오후
							12:50</sub></span> <sup style="color: #f66;">1</sup>
				</div>
	
				<div id="clear"></div>
				<div id="chat_receive">
					<sup style="color: #f66;">1</sup> <span id="chat_time"><sub>오후
							12:59</sub></span> <span id="chat_msg" style="max-width: 200px; max-height: 300px;">ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</span>
				</div>
	
			</fieldset>
		</div>
	
	
	
	
	
		<div id="chat_clip">
			<div id="chat_c_img"></div>
		</div>
		
		<div id="clip_menu">
			<ul>
				<li><img src="./img/chat/addfile_pc.png">pc에서 올리기</li>
				<li><img src="./img/chat/addfile_drop.png">드롭박스에서 가져오기</li>
				<li><img src="./img/chat/addfile_google.png">구글 드라이브에서 가져오기</li>
			</ul>
		</div>
		
		
	
		<div>
			<textarea rows="5" cols="50" placeholder="메세지를 입력하세요."
				style="width: 87%; resize: none; outline: none; overflow: hidden;"></textarea>
			<input type="button" value="전송" id="chat_btn">
		</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</body>
</html>