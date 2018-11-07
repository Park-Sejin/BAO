<%@page import="project.member.db.ProjectMemberDAO"%>
<%@page import="project.db.ProjectDAO"%>
<%@page import="member.db.MemberDAO"%>
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
	int proNum = Integer.parseInt(request.getParameter("num"));
	String id = (String)session.getAttribute("email");
	MemberDAO mdao = new MemberDAO();
	int memNum = 0;
	if(id == null){
%>
		<script type="text/javascript">
			alert('로그인을 먼저 해주세요');
			location.href="./Login.me";
		</script>
<%		
	}
	memNum = mdao.getMemberNum(id);
	
	ProjectMemberDAO pmdao = new ProjectMemberDAO();
	int check = pmdao.memberCheck(memNum, proNum);
	System.out.print(check);
	// 1 = 이미 가입한 상태 , 0 = 아직 가입 안한 상태
	if(check==1){
		response.sendRedirect("./main.pr");
	} 
	
%>
<form action="./projectJoinAction.pr">
	<input type="hidden" value="<%=proNum%>" name="proNum">
	<input type="hidden" value="<%=memNum%>" name="memNum">
	해당 프로젝트에 가입하시겠습니까?<br>
	<input type="submit" value="가입하기">
</form>

</body>
</html>