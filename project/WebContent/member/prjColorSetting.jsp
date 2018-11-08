<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	//이메일값 받아오기
	var email = document.getElementsByName("email")[0].value;

	$(document).ready(function(){
	
		//라디오박스 선택시 설정 정보 저장
		$(".radio").click(function(){
			var color = $("input[name='color']:checked").val();
			$.ajax({
				type: "POST",
				url: "./PrjColorSetAction.me",
				data:{
					"email":email,
					"color":color
				},
				dataType : "text",
		        error : function(){
					alert('통신실패!!');
				},
		        success: function(data){
		        	alert("설정변경");
		        }
			}); 
		});
	});
</script>
</head>
<body>
	<h1>프로젝트 색상 설정</h1><br>
	<h2>프로젝트 색상 설정</h2><br>
	<p>프로젝트 만들기 또는 프로젝트에 초대받았을 때, 프로젝트의 색상을 지정합니다.</p><br>
	<div id="radio">
		<%
		String email = (String)request.getAttribute("email");
		String color = (String)request.getAttribute("color");
		//저장된 색상 설정값이 있으면 설정값 가져오기
		if(color != null){
			if(color.equals("random")){
				%>
				<input type="radio" name="color" value="random" class="radio" id="radio1" checked="checked">
					<label for="radio1"><span>랜덤 설정</span></label><br><br>
				<input type="radio" name="color" value="blue" class="radio" id="radio2">
					<label for="radio2"><span>색상 고정(파랑)</span></label>
				<%
			} else if(color.equals("blue")){
				%>
				<input type="radio" name="color" value="random" class="radio" id="radio1">
					<label for="radio1"><span>랜덤 설정</span></label><br><br>
				<input type="radio" name="color" value="blue" class="radio" id="radio2" checked="checked">
					<label for="radio2"><span>색상 고정(파랑)</span></label>
				<%
			} else {
				%>
				<input type="radio" name="color" value="random" class="radio" id="radio1">
					<label for="radio1"><span>랜덤 설정</span></label><br><br>
				<input type="radio" name="color" value="blue" class="radio" id="radio2">
					<label for="radio2"><span>색상 고정(파랑)</span></label>
				<%
			}
		} else {
		%>
		<input type="radio" name="color" value="random" class="radio" id="radio1">
			<label for="radio1"><span>랜덤 설정</span></label><br><br>
		<input type="radio" name="color" value="blue" class="radio" id="radio2">
			<label for="radio2"><span>색상 고정(파랑)</span></label>
		<%} %>
		<input type="hidden" name="email" value="<%=email%>">
	</div>
</body>
</html>