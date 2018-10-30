<%@page import="member.db.MemberBean"%>
<%@page import="member.db.MemberDAO"%>
<%@page import="project.member.db.ProjectMemberDAO"%>
<%@page import="project.member.db.ProjectMemberBean"%>
<%@page import="project.db.ProjectBean"%>
<%@page import="chat_test.chat_Client"%>
<%@page import="chat_test.ChatServerEx"%>
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
				
				$("#chat_btn").click(function() {
					$.ajax({
						type: "post",
						url: "./chatHandling.chat",
						data: {
							txt_input: $("#txt_input").val(),
							name: $("#chat_name").val()
						},
						success: function(data){
							/* $("#chat_msg").text(data.trim()); */
							$("#text_page").append(data);
							$("#txt_input").text("");
						}
					});
					
				});
				
				
			});
			
		</script>
	
	</head>
	<body>
		<% 
			/* String email = (String) session.getAttribute("email"); */
			String email = "sujin11@naver.com"; // 임의의 값
			
		
			/* ChatServerEx cs = new ChatServerEx(); */
			chat_Client cc = new chat_Client();
			MemberDAO mdao = new MemberDAO();
			MemberBean mb = mdao.getMember(email);
			
			session.setAttribute("email"+mb.getNum(), email);
			
			cc.ChatClient(mb.getName());
		%>
	
		<div id="chat_top">
			운영자 <img src="../img/login/logo.png" alt="바꿔야함" id="chat_menu">
		</div>
		<br>
	
		
		<div id="chat_boay" style="min-width: 100px; min-height: 600px;">
			<fieldset>
				<legend>년도-월-일 요일</legend>
				<div id="text_page">
				
				
				
					
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
			<textarea rows="5" cols="50" placeholder="메세지를 입력하세요." id="txt_input"
				style="width: 87%; resize: none; outline: none; overflow: hidden;"></textarea>
			<input type="button" value="전송" id="chat_btn">
			<input type="hidden" value=<%=mb.getName() %> id="chat_name">
		</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</body>
</html>