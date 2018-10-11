<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String id=request.getParameter("id");
	String idid="aa";
	int check=-1;
	
	if(id.equals(idid)){
		check=-1;
	}else{
		check=0;
	}
%>
<%=check%>