<%@page import="member.db.MemberBean"%>
<%@page import="member.db.MemberDAO"%>
<%@page import="chat_test.chat_Client"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	/* String email = (String) session.getAttribute("email"); */
    	String email = "tpwls1226@naver.com";
	    MemberDAO mdao = new MemberDAO();
		MemberBean mb = mdao.getMember(email);
    
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
    	
    	System.out.println("name: " + name + ", session: " + mb.getName());
    	
    	
    	String receive_msg = "";
    	
    %>
    
    <%if(name.equals(mb.getName())) { %>
	    <div id="chat_receive"> <!-- 보낸 메세지 -->
			<sup style="color: #f66;">1</sup>
			<span id="chat_time"><sub>오후 12:30</sub></span>
			<span id="chat_msg"><%if(txt_input != null){%> <%=txt_input %> <%} %></span>
		</div>
		<div id="clear"></div>
		
	<%} else { %>
		<div id="chat_send"> <!-- 받은 메세지 -->
			<span id="chat_msg"><%=receive_msg %></span>
			<span id="chat_time">
			<sub>오후 12:32</sub></span>
			<sup style="color: #f66;">1</sup>
		</div>
		<div id="clear"></div>
	<%} %>
