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
<title>Insert title here</title>
<!-- css -->
<link href="css/top.css" rel="stylesheet">
<link href="css/AllView_popup.css" rel="stylesheet">
<link href="css/HeaderCss.css" rel="stylesheet">
<link href="css/search.css" rel="stylesheet">
<!-- script -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	//동일한 project이름일 때는 셀 세로병합
	var mergeItem="";
	var mergeCount=0;
	var mergeRowNum=0;
	$(document).ready(function(){
		$('tr','table').each(function(now){
			if(row>2){//헤더제외
				var thisTr=$(this);
				var item=$(':first-child',thisTr).html();
				if(mergeItem != item){
					mergeCount=1;
					mergeItem=item;
					mergeRowNum=Number(row);//숫자 형태로 저장
				}else{
					mergeCount=Number(mergeCount)+1;
					$("tr:eq("+mergeRowNum+")>td:first-child").attr("rowspan",mergeCount);
					$('td:first-child',thisTr).remove();//병합했으므로 해당 행의 첫번쨰 td element는 삭제한다
				}
			}
		});
	});
	
	
</script>
</head>
<body>
	<!-- top -->
    <jsp:include page="../default/top3.jsp"></jsp:include>
    <!-- left -->
    <jsp:include page="../default/LeftHeader.jsp"></jsp:include> 

	<div class="clear">
	
	<!-- 검색결과확인 -->
	<article>
	<div id="resultArea">
	<!-- 검색타입과 키워드 -->
	<%
	String type = (String)request.getAttribute("type");
	if(type.equals("all")){
		type = "ALL";
	} else if(type.equals("project")){
		type = "프로젝트";
	} else if(type.equals("write")){
		type = "글";
	} else if(type.equals("member")){
		type="참여자";
	}
	String keyword = (String)request.getAttribute("keyword");
	%>
	<h4>"<%=keyword%>" 에 대한 <%=type%> 검색 결과입니다.</h4>
	
	<%	//검색결과 가져오기
		List searchList = (List)request.getAttribute("searchList");
		System.out.println("searchList"+searchList);
		
		//검색결과 있을 때
		if(searchList != null){
			if(type.equals("ALL")){ //검색타입이 all일때
				for(int i=0;i<searchList.size();i++){
					HashMap hm = (HashMap)searchList.get(i);
				%>
				<table class="resultTable">
					<tr>
						<td><a href="./timeline.jsp?num=<%=hm.get("pro_num")%>"><%=hm.get("pro_name") %></a></td>
						<td><a href=""><%=hm.get("pro_master") %></a></td>
						<td style="font-size: 13px;"><%=hm.get("pro_date") %></td>
					</tr>
				<%
					if(hm.get("content") != null){
						%>
						<tr>
							<td><a href=""><%=hm.get("content") %></a></td>
							<td><a href=""><%=hm.get("writer") %></a></td>
							<td style="font-size: 13px;"><%=hm.get("con_date") %></td>
						</tr>
						<%
					}
				}
			} else { //검색타입이 all이 아닐때
				%>
				<table class="resultTable">
					<%
					if(type.equals("프로젝트")){
						%>
						<tr class="firstTr">
							<td>프로젝트</td>
							<td>기획자</td>
							<td>기획일</td>
						</tr> 
						<%
					} else if(type.equals("글")){
						%>
						<tr class="firstTr">
							<td>프로젝트</td>
							<td>글</td>
							<td>작성자</td>
							<td>작성일</td>
						</tr> 
						<%
					} else if(type.equals("참여자")){
						%>
						<tr class="firstTr">
							<td>프로젝트</td>
							<td>참여자</td>
							<td>참여일</td>
						</tr> 
						<%
					}
					//검색결과
					for(int i=0;i<searchList.size();i++){
						HashMap hm = (HashMap)searchList.get(i);
					%>
					<tr class="resultTr">
						<td><a href="./timeline.jsp?num=<%=hm.get("pro_num")%>"><%=hm.get("pro_name") %></a></td>
						<%
						//글정보 검색시에만 글 보이기
						if(hm.get("content") != null){
						%>
							<td><a href=""><%=hm.get("content") %></a></td>
						<%} %>
						<td><a href=""><%=hm.get("member") %></a></td>
						<td style="font-size: 13px;"><%=hm.get("date") %></td>
					</tr>
					<%} %>
				</table>
			<% 	
			}
		} else {
			%>	<!-- 검색결과 없을때 -->
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