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
	int proNum = 19;
	int memNum = 1;
%>
<form action="./projectJoinAction.pr">
	<input type="hidden" value="<%=proNum%>" name="proNum">
	<input type="hidden" value="<%=memNum%>" name="memNum">
	해당 프로젝트에 가입하시겠습니까?<br>
	<input type="submit" value="가입하기">
</form>

</body>
</html>