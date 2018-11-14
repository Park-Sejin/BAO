<%@page import="chatting.db.ChatBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="chatting.db.ChatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>	
		<%
			String sender_email = (String)session.getAttribute("email");
			/* String receive_email = request.getParameter("receive_email"); */
			String receive_email = (String)session.getAttribute("receive_email");
		
			ChatDAO cdao_m = new ChatDAO();
			ArrayList<ChatBean> arr =  cdao_m.getChat(sender_email, receive_email);%>
		
		
		<fieldset>
		 <% if(arr.size() != 0) { 
		 	
				int cnt = 0;
				String date2 = "";
			    for(ChatBean cb_m : arr) { 
			    	String date1 = cb_m.getDate().toString();%>
			    	
			    	<legend> <%if(!date1.equals(date2) || cnt == 0){ %> <%=cb_m.getDate() %> <%} %> </legend>
			    	
			    	<% ChatDAO read_cdao = new ChatDAO(); %>
			    	
			    	
				    <%if(cb_m.getSender().equals(sender_email)) { %>
					    <div id="chat_receive"> <!-- 보낸 메세지 -->
					    	<%if(cb_m.getRead_cnt() == 1){ %>
								<sup style="color: #f66;">1</sup>
							<%} %>
							<span id="chat_time"><sub>오후 12:30</sub></span>
							<span id="chat_msg"> <%=cb_m.getMessage() %></span>
						</div>
						<div id="clear"></div>
						
					<%} else { %>
						<% read_cdao.setRead(sender_email, receive_email); %>
						
						<div id="chat_send"> <!-- 받은 메세지 -->
							<span id="chat_msg"><%=cb_m.getMessage() %></span>
							<span id="chat_time">
							<sub>오후 12:32</sub></span>
						</div>
						<div id="clear"></div>
				<%		} 
				    
				    cnt++; 
				    date2 = cb_m.getDate().toString();
				    }
			}%>
			</fieldset>
	</body>	
</html>