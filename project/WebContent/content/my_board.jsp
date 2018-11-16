<%@page import="member.db.MemberBean"%>
<%@page import="bao.TimeLine.db.CommentBean"%>
<%@page import="bao.TimeLine.db.CommentDAO"%>
<%@page import="project.db.ProjectDAO"%>
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
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
    				ProjectDAO pdao = new ProjectDAO();
    		%>
			    	<div id="time_board">
			    		<% if(bb.getTable_type().equals("Write")) { %>
			    		 <div id="time_pName">
			               <h3><%=pdao.getProjectName(bb.getProject_num()) %></h3>
			             </div>
						    		
			    		
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
				       </div>
				       <!-- 댓글 달기 -->
				       <%
				       		CommentDAO cdao = new CommentDAO();
				       		ArrayList<CommentBean> cmt_arr = cdao.getComment();
				       %>
				       
				       <div id="comment_body">
				       		<%for(CommentBean cb : cmt_arr) { 
				       			MemberDAO cmt_mdao = new MemberDAO();
				       			if(cb.getCmt_board_num() == bb.getNum()) {%>
								<div id="comment_list">
										<img alt="프로필사진" src="./img/right_menu/img_photo_null32.png">
										
									<div id="comment_info">
										<b><%= cmt_mdao.getMember(cb.getCmt_email()).getName() %></b>
										<span style="color: #c0c0c0;font-size: 12px;"><%=cb.getDate() %></span>
										좋아요
										<a href="">수정</a> | <a href="">삭제</a><br>
									</div>
									<div class="clear"></div>
									<div id="cmt_content">
										<%=cb.getCmt_content() %>
									</div>
								</div>
							<%}  } %><div id="new_cmtList<%=bb.getNum()%>"></div><!-- 작성한 페이지 ajax 넘어오는 div -->
							
							<form action="" id="comment_form"></form>
								<div id="form_in_div">
									<img alt="프로필사진" src="./img/right_menu/img_photo_null32.png">
									
									<input type="text" class="cmt_content" id="content<%=bb.getNum()%>" name="content" placeholder="댓글을 입력하세요.">
									<input type="hidden" class="board_num" id="board_num<%=bb.getNum() %>" name="board_num" value="<%= bb.getNum()%>">
									<input type="button" value="작성" class="sub_cmt" id="sub_cmt<%=bb.getNum()%>" style="width: 40px; height: 30px;">
								</div>
							</form>
	                  </div>
				       <%} %> 
			       </div>
			       <div id="mar_btm"></div>
	         <%		}
	         	} 
	         }%>
	         <script>
	         	$(document).ready(function(){
	         		var sub_id = "";
	         		var cmt_id = "";
	         		var num = "";
	         		var b_num = "";
	         		
	         		$(".cmt_content").click(function(){
	         			cmt_id = "#"+$(this).attr('id');
	         		});
	         		
	         		$(".sub_cmt").click(function(){
	         			sub_id = "#"+$(this).attr('id');
	         			num = sub_id.substring(8,sub_id.length);
	         			b_num = "#board_num"+num;
	         			
	         			$.ajax({
	                       url:"./CommentAction.tl",
	                       data: {
	                    		board_num : $(b_num).val(),
		                    	content : $(cmt_id).val()
	                       },
	                       type: 'POST',
	                       success: function(data){
	                          $("textarea[name=content]").val("");
	                          var json = $.parseJSON(data);
	                          var Chutext=json.Con;
	                          var Write="<div style='margin-bottom: 10px;'>";
	                          	Write+="<img alt='바꿔야함' src='./img/right_menu/img_photo_null32.png'>";
	                          	Write+="<div id='comment_info'>";
	                          	Write+="<b>"+json.Name+"</b>";
	                          	Write+="<span style='color: #c0c0c0;font-size: 12px;'>"+json.Date+"</span>";
	                          	Write+="좋아요/수정/삭제 해야함 css";
	                          	Write+="</div>";
	                          	Write+="<div class='clear'></div>";
	                          	Write+="<div id='cmt_content'>";
	                          	Write+=json.Content;
	                          	Write+="</div>";
	                          	Write+="</div>";
	                          	
	                            $("#new_cmtList"+num).append(Write);
	                       }
	                    });
	         		});
	         	});
	         	
	         </script>

		</article>
	</div>
		
		
		
	</body>
</html>