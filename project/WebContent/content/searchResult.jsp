<%@page import="project.db.ProjectBean"%>
<%@page import="java.util.List"%>
<%@page import="project.db.ProjectDAO"%>
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
	List searchList = (List)request.getAttribute("searchList");
	for(int i=0; i<searchList.size(); i++){
		ProjectBean pb = new ProjectBean();
		pb = (ProjectBean)searchList.get(i);
%>
	<%=pb.getProName() %>
	
<%
	}
%>

</body>
</html>