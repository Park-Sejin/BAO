<%@page import="java.util.ArrayList"%>
<%@page import="chatting.db.ChatDAO"%>
<%@page import="chatting.db.ChatBean"%>
<%@page import="member.db.MemberBean"%>
<%@page import="member.db.MemberDAO"%>
<%@page import="chat_test.chat_Client"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	String email = (String) session.getAttribute("email");
    	String txt_input = request.getParameter("txt_input");
    	String sen_email = request.getParameter("sender_email");
    	
    	String receiveData = (String)request.getAttribute("receiveData");
    	
    	
    	/* 디비 저장-------------------------------------------------- */
    	if(txt_input.length() != 0) {
	    	ChatBean cb = new ChatBean();
			cb.setSender(sen_email); // 세선 값
			cb.setReceiver(request.getParameter("receive_email"));
			cb.setMessage(request.getParameter("txt_input"));
			cb.setRead_cnt(0);
			
			ChatDAO cdao = new ChatDAO();
			cdao.ChatSubmit(cb);
    	}
		/* --------------------------------------------------------- */
    	
		
    	 chat_Client cc = new chat_Client(); 
    	 if(txt_input != null){
    		cc.ChatSubmit(txt_input);
    	}/* else if(name.equals("exit")){
    		cc.ChatExit();
    	}  */
    	
    	//System.out.println("name: " + name + ", session: " + email);
    	
    %>
    <% if(sen_email.equals(email)) { %>
	    <div id="chat_receive"> <!-- 보낸 메세지 -->
			<sup style="color: #f66;">1</sup>
			<span id="chat_time"><sub>오후 12:30</sub></span>
			<span id="chat_msg"> <%=txt_input %></span>
		</div>
		<div id="clear"></div>
			
	<%} else { %>
		<div id="chat_send"> <!-- 받은 메세지 -->
			<span id="chat_msg"><%=receiveData %></span>
			<span id="chat_time">
			<sub>오후 12:32</sub></span>
			<sup style="color: #f66;">1</sup>
		</div>
		<div id="clear"></div>
	<% } %>
