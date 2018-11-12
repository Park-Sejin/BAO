<%@page import="javax.tools.DocumentationTool.Location"%>
<%@page import="member.db.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/info.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

			
	$(document).ready(function(){
		/* 초기설정 : 계정정보화면 */		    		
		$("#content").load("./SetMemberAction.me");
		$("#baseSetting").addClass("black");
    	
		/* 계정정보 */
		$("#baseSetting").click(function(){
			//선택된 것만 검은색글자로 변경하고 화면 가져오기
			$("#baseSetting").addClass("black");
			$("#pwdSetting").removeClass("black");
			$("#alramSetting").removeClass("black");
			$("#prjColorSetting").removeClass("black");
			$("#phSyncSetting").removeClass("black");
			$("#content").empty();
			$("#content").load("./SetMemberAction.me");
		});
		
		/* 비밀번호 설정 */
		$("#pwdSetting").click(function(){
			//선택된 것만 검은색글자로 변경하고 화면 가져오기
			$("#pwdSetting").addClass("black");
			$("#baseSetting").removeClass("black");
			$("#alramSetting").removeClass("black");
			$("#prjColorSetting").removeClass("black");
			$("#phSyncSetting").removeClass("black");
			$("#content").empty();
			$("#content").load("./PwdSet.me");
		});
    		
		/* 알림설정 */
		$("#alramSetting").click(function(){
			//선택된 것만 검은색글자로 변경하고 화면 가져오기
			$("#alramSetting").addClass("black");
			$("#baseSetting").removeClass("black");
			$("#pwdSetting").removeClass("black");
			$("#prjColorSetting").removeClass("black");
			$("#phSyncSetting").removeClass("black");
			$("#content").empty();
			$("#content").load("./AlramSet.me");
		});
    		
		/* 프로젝트 색상 설정 */
		$("#prjColorSetting").click(function(){
			//선택된 것만 검은색글자로 변경하고 화면 가져오기
			$("#prjColorSetting").addClass("black");
			$("#baseSetting").removeClass("black");
			$("#alramSetting").removeClass("black");
			$("#pwdSetting").removeClass("black");
			$("#phSyncSetting").removeClass("black");
			$("#content").empty();
			$("#content").load("./PrjColorSet.me");
		});
    		
		/* 연락처 동기화 설정 */
		$("#phSyncSetting").click(function(){
			//선택된 것만 검은색글자로 변경하고 화면 가져오기
			$("#phSyncSetting").addClass("black");
			$("#baseSetting").removeClass("black");
			$("#pwdSetting").removeClass("black");
			$("#alramSetting").removeClass("black");
			$("#prjColorSetting").removeClass("black");
			$("#content").empty();
			$("#content").load("./PhSyncSet.me");
		});
    		
    		
    });
    	
</script>
</head>
<body>
<%
	//email이 없으면 로그인페이지로 이동
	String email=(String)session.getAttribute("email");
	if(email == null){
		response.sendRedirect("./Login.me");
	}
%>

	<!-- 상단삽입 -->
	<jsp:include page="../default/top_in.jsp"></jsp:include>
	
	<div class="clear"></div>
	<!-- 환경설정 -->
	<article>
		<div id="LeftHeaderBody">
			<div id="LeftHeaderSub">
				<a href="./main.pr"><img alt="돌아가기" src="./img/info/btn_back.gif"></a>
			</div>
			<div id="LeftHeaderDl">
				<dl>
					<dt>계정</dt>
					<dd><a id="baseSetting">계정 정보</a></dd>
					<dd><a id="pwdSetting">비밀번호 설정</a></dd>
				</dl>
			</div>
			<div id="LeftHeaderDl">
				<dl>
					<dt>설정</dt>
					<dd><a id="alramSetting">알림 설정</a></dd>
					<dd><a id="prjColorSetting">프로젝트 색상 설정</a></dd>
				</dl>
			</div>
		</div>
		
		<div id="content">
		</div>
		
	</article>

</body>
</html>