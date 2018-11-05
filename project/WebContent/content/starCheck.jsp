<%@page import="project.db.ProjectDAO"%>
<%@page import="member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String star = request.getParameter("star");
	String id = (String)session.getAttribute("email");
	int proNum = Integer.parseInt(request.getParameter("idid"));
	MemberDAO mdao = new MemberDAO();
	int memNum = mdao.getMemberNum(id);
	
	ProjectDAO pdao = new ProjectDAO();
	
	int check = 0;
	if(star.equals("on")){
		check=1;
		pdao.projectFavoriteOn(proNum, memNum);
	}else{
		check=0;
		pdao.projectFavoriteOff(proNum, memNum);
	}
%>

<%=check%>