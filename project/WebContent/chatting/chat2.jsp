<%@page import="java.sql.Date"%>
<%@page import="chatting.db.ChatBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="chatting.db.ChatDAO"%>
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
							sender_email: $("#sender_email").val(),
							receive_email: $("#receive_email").val()
						},
						success: function(data){
							/* $("#chat_msg").text(data.trim()); */
							$("#text_page").append(data);
							$("#txt_input").text("");
						}
					});
					$('#chat_body').scrollTop($('#chat_body').prop('scrollHeight'));
				});
				
				
			});
			
			
			
			/* function autoRefresh_div(){
				var currentLocation = window.location;
				$("#chat_body").load(currentLocation + ' #chat_body');
				
			}
			setInterval('autoRefresh_div()', 1000); */
			
			var cnt = 0;
			window.setInterval(function(){
				$('#chat_body').load('./chatting/past_chat.jsp');
				if(cnt == 0) {
					$('#chat_body').scrollTop($('#chat_body').prop('scrollHeight')); 
					cnt++;
				}
			}, 1000);
			
			/* window.setInterval(function() {
			   $("#chat_body").html("#chat_body");
			}, 1000); */
			
			
		</script>
		
		
		
		
		
		
		
		
	
	</head>
	<body scroll="no">
		<% 
			String sender_email = (String) session.getAttribute("email");
			String receive_email = request.getParameter("receive_email");
			
			MemberDAO mdao = new MemberDAO();
			MemberBean re_mb = mdao.getMember(receive_email);
			
			/* session.setAttribute("email"+mb.getNum(), email); */
			chat_Client cc = new chat_Client();
			cc.ChatClient(sender_email, receive_email);
			/* cc.ChatExit(); //채팅 종료 시. */
			
			ChatDAO read_cdao = new ChatDAO();
			read_cdao.setRead(sender_email, receive_email);
		
		%>
	
		<div id="chat_top">
			<%=re_mb.getName() %> <img src="../img/login/logo.png" alt="바꿔야함" id="chat_menu">
		</div>
		<br>
	
		
		<div id="chat_body" style="min-width: 100px; min-height: 600px; height: 630px; overflow-y: scroll;">
			
			<fieldset>
				<%session.setAttribute("receive_email", receive_email); %>
				<jsp:include page="past_chat.jsp?receive_email=<%=receive_email %>"></jsp:include>
				
				
				<input type="hidden" id="foc">
				
				<legend>년도-월-일 요일</legend>
				<div id="text_page">
				
				<!-- 실시간 -->
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
			<input type="hidden" value=<%=sender_email %> id="sender_email">
			<input type="hidden" value=<%=receive_email %> id="receive_email">
		</div>
	
	
	
	
	
	
	
	
	
	
	</body>
</html>