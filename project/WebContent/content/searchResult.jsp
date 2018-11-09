<%@page import="java.util.HashMap"%>
<%@page import="project.db.ProjectBean"%>
<%@page import="java.util.List"%>
<%@page import="project.db.ProjectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/top.css" rel="stylesheet">
<link href="css/AllView_popup.css" rel="stylesheet">
<link href="css/HeaderCss.css" rel="stylesheet">
<!-- search -->
<link href="css/search.css" rel="stylesheet">

<title>Insert title here</title>

</head>
<body>
	<!-- top -->
    <jsp:include page="../default/top3.jsp"></jsp:include>
    <!-- left -->
    <jsp:include page="../default/LeftHeader.jsp"></jsp:include> 
<%-- <%
	List searchList = (List)request.getAttribute("searchList");
	for(int i=0; i<searchList.size(); i++){
		ProjectBean pb = new ProjectBean();
		pb = (ProjectBean)searchList.get(i);
%>
	<%=pb.getProName() %>
	
<%
	}
%> --%>


<div class="clear">
<!-- 검색결과확인 -->
<article>
<div>
<%
	List searchList = (List)request.getAttribute("searchList");
	if(searchList != null){
%>
	<table class="resultTable">
		<!-- <tr>
			<td>프로젝트</td>
			<td>참여자</td>
			<td>참여일시</td>
		</tr> -->
		<%
		for(int i=0;i<searchList.size();i++){
			HashMap hm = (HashMap)searchList.get(i);
		%>
		<tr>
			<td><%=hm.get("pro_name") %></td>
			<%
			if(hm.get("content") != null){
			%>
				<td><%=hm.get("content") %></td>
			<%} %>
			<td><%=hm.get("member")  %></td>
			<td><%=hm.get("date")  %></td>
		</tr>
		<%} %>
	</table>
<% 	
	} else {
		%>
			<div id="no_search">
				<img src="./img/content/no_collabo_list_icon6.png">
				<h1>검색 결과가 없습니다.</h1>
			</div>
		<%
	}
%>
</div>
</article>
</body>
</html>