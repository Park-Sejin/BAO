<%@page import="member.db.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/info.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript">
	/* $(document).ready(function(){
		$("#baseSetting").click(function(){
			$("#baseSetting").addClass("on");
			$("#pwdSetting").removeClass("on");
		}); */
		
		/* $("#pwdSetting").click(function(){
			$("#pwdSetting").addClass("on");
			$("#baseSetting").removeClass("on");
		}); */
	//});
	
	/* $("#pwdSetting").click(function(){
		var pwdSetting = $("#pwdSetting").val();
		$.ajax({
			type:"POST",
			url:"pwdSetting.jsp",
			data:{
				"pwdSetting" : pwdSetting
			},
			success:function(data){
				$("#content").html(data);
				$("#pwdSetting").addClass("on");
				$("#baseSetting").removeClass("on");
			}
		});
	});
	
	function updatePass(){
		//비밀번호변경_pwdSetting.jsp
	} */
	
	function ajaxTest(){
    	$(document).ready(function(){
    		$("#pwdSetting").click(function(){
        		$.ajax({
        	        type : "post",
        	        url : "pwdSetting.jsp",
        	        dataType : "text",
        	        error : function() {
        	          alert('통신실패!!');
        	        },
        	        success : function(data) {
        	          $('#content').html(data);
        	        }
        	 
        	      });
        	});
    	});
    	
      
    }
 
    ajaxTest();
	
	
	
</script>
</head>
<body>
	<jsp:include page="../default/top3.jsp"></jsp:include>
	
	<div class="clear"></div>
	<!-- 환경설정 -->
	<article>
		<div id="LeftHeaderBody">
			<div id="LeftHeaderSub">
				<a href="history.back()"><img alt="돌아가기" src="./img/info/btn_back.gif"></a>
			</div>
			<div id="LeftHeaderDl">
				<dl>
					<dt>계정</dt>
					<dd id="baseSetting"><a>계정 정보</a></dd>
					<dd id="pwdSetting"><a>비밀번호 설정</a></dd>
				</dl>
			</div>
			<div id="LeftHeaderDl">
				<dl>
					<dt>설정</dt>
					<dd id="alramSetting"><a>알림 설정</a></dd>
					<dd id="prjColorSetting"><a>프로젝트 색상 설정</a></dd>
					<dd id="phSyncSetting"><a>연락처 동기화 설정</a></dd>
				</dl>
			</div>
		</div>
	
		<div id="content">
			<h1>계정 기본 정보</h1>
			<div id="profile">
				<h3>내 프로필</h3><br>
				<div id="userPhoto">
						<img src="./img/info/empty_photo.png">
						<!-- <a><img src="./img/info/ico_camera.png"></a> -->
				</div>
				<%
					MemberBean mb = (MemberBean)request.getAttribute("mb");
					
					String mobile = mb.getMobile();	
					String team = mb.getTeam();
					String part = mb.getPart();
					String position = mb.getPosition();
					String phone = mb.getPhone();
					
					if(mobile == null){
						mobile = "";
					}
					if(team == null){
						team = "";
					}
					if(part == null){
						part = "";
					}
					if(position == null){
						position = "";
					}
					if(phone == null){
						phone = "";
					}
				%>
				<table id="pro_table">
					<tr>
						<td>이름</td>
						<td><input type="text" name="name" value="<%=mb.getName() %>"></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" name="email" value="<%=mb.getEmail() %>" readonly></td>
					</tr>
					<tr>
						<td>휴대폰번호</td>
						<td><input type="text" name="phone" value="<%=mobile %>"></td>
					</tr>
				</table>
				<table id="pro_table">
					<tr>
						<td>회사 or 팀명</td>
						<td><input type="text" name="team" value="<%=team%>"></td>
					</tr>
					<tr>
						<td>부서명</td>
						<td><input type="text" name="part" value="<%=part%>"></td>
					</tr>
					<tr>
						<td>직책</td>
						<td><input type="text" name="position" value="<%=position%>"></td>
					</tr>
					<tr>
						<td>회사연락처</td>
						<td><input type="text" name="phone" value="<%=phone%>"></td>
					</tr>
				</table>
			</div>
		</div>
	</article>

</body>
</html>