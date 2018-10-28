<%@page import="chat_test.chat_Client"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	String name = null;
    	String txt_input = null;
    	
    	name = request.getParameter("name");
    	txt_input = request.getParameter("txt_input");
    	
    	chat_Client cc = new chat_Client();
		
    	if(txt_input != null){
    		cc.ChatSubmit(txt_input);
    	}else if(name.equals("exit")){
    		cc.ChatExit();
    	}
    	
    	
    	
    %>
    
    
    <div id="chat_receive"> <!-- 보낸 메세지 -->
		<sup style="color: #f66;">1</sup>
		<span id="chat_time"><sub>오후 12:30</sub></span>
		<span id="chat_msg"><%if(txt_input != null){%> <%=txt_input %> <%} %></span>
	</div>
	<div id="clear"></div>
	
	<!-- 
	<div id="chat_send"> 받은 메세지
		<span id="chat_msg">안녕하세요</span>
		<span id="chat_time">
		<sub>오후 12:32</sub></span>
		<sup style="color: #f66;">1</sup>
	</div>
	<div id="clear"></div> -->
