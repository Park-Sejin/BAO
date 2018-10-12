<%@page import="member.db.MemberBean"%>
<%@page import="member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");

	String email = request.getParameter("email");
	
	//객체생성
	MemberDAO mdao = new MemberDAO();
	
	//이메일 체크
	int check = mdao.emailCheck(email);
	
	
	
%>



<%=check%>