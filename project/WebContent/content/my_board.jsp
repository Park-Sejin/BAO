<%@page import="member.db.MemberDAO"%>
<%@page import="bao.TimeLine.db.TotalDAO"%>
<%@page import="bao.TimeLine.db.TotalBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bao.TimeLine.db.BoardDAO"%>
<%@page import="bao.TimeLine.db.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		
		<link href="./css/timeline.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="./css/top.css">
		<link href="./css/HeaderCss.css" rel="stylesheet">
		<link href="./css/content.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		
		<div id="container">
		<jsp:include page="../default/top3.jsp"></jsp:include>
		<jsp:include page="../default/LeftHeader.jsp"></jsp:include>
		
		<%
			String email = (String)session.getAttribute("email");
		
		
			BoardDAO bdao = new BoardDAO();
			ArrayList<BoardBean> arr = new ArrayList<BoardBean>();
			
			
		%>
		
		<article id="timeline">
			<h3>내 게시물 글 보기</h3>
			<div id="mar_btm"></div>
			
			
			
	        <%
	    	
    		
    		
    		TotalBean tb=new TotalBean();
			TotalDAO td=new TotalDAO();
			ArrayList<TotalBean> TotalList=td.Totalinfo(); // 안함. 나중에 토탈빈으로 바꿔야함.
    		
    		
    		
    		arr = bdao.Writeinfo();
    		
    		if(arr.size() != 0) {
    			for(BoardBean bb: arr) {
    				if(bb.getMember_user().equals(email)){
    				MemberDAO mdao = new MemberDAO();
    		%>
			    	<div id="time_board">
			    		<% if(bb.getTable_type().equals("Write")) { %>
			            <div id="time_body">
				            <div id="time_profile">
								<img alt="프로필사진" src="./img/right_menu/img_photo_null32.png" id="profile_img">
								<span id="time_info" style="width: 100px;">
									<b><%= mdao.getMember(bb.getMember_user()).getName() %></b><br>
									<span style="color: #c0c0c0;font-size: 12px;"><%=bb.getDate() %></span>
								</span>
				            </div>
				            <div class="clear"></div>
				            
				            <div id="time_content">
				            	<%=bb.getContent() %>
				            	
				            	
				            
				            </div>
				            <div>
				            	<a href="">좋아요</a>
				            	<a href="">댓글달기</a>
				            </div>
				       </div>
				         	
				       
				       <%} %> 
				       
			       </div>
			       <div id="mar_btm"></div>
	         <%		}
	         	} 
	         }%>

		</article>
	</div>
		
		
		
	</body>
</html>