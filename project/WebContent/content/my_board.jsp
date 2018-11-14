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
		
		<article id="timeline">
			<h3>내 게시물 글 보기</h3>
			<div id="mar_btm"></div>
			
	        <div id="time_board">
	            <div id="time_pName">
					<h3>프로젝트 명</h3>
	            </div>
	            <div id="time_body">
		            <div id="time_profile">
						<img alt="프로필사진" src="./img/right_menu/img_photo_null32.png" id="profile_img">
						<span id="time_info">
							<b>이름</b><br>
							<span style="color: #c0c0c0;font-size: 12px;">날짜</span>
						</span>
		            </div>
		            <div class="clear"></div>
		            
		            <div id="time_content">
		            	게시판 글
		            	
		            	
		            <div>좋아요 댓글달기</div>	
		            </div>
		         </div>
		         
		         <div id="mar_btm"></div>
	         </div>

		</article>
	</div>
		
		
		
	</body>
</html>