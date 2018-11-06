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
			var alram = $("input[name='alram']:checked").val();
			//alert(alram);
			$.ajax({
				type: "POST",
				url: "./AlramSetAction.me",
				data:{
					"email":email,
					"alram":alram
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
	<h1>기본 알람(푸쉬) 설정</h1><br>
	<div id="radio">
		<%
		String email = (String)request.getAttribute("email");
		String alram = (String)request.getAttribute("alram");
		//저장된 알람설정값이 있을때 설정 값 가져오기
		if(alram != null){
			//db에 저장된 체크값 가져오기
			if(alram.equals("all")){
				%>
				<input type="radio" name="alram" value="all" class="radio" id="radio1" checked="checked">
					<label for="radio1"><span>모든 알람 받기</span></label><br><br>
				<input type="radio" name="alram" value="select" class="radio" id="radio2">
					<label for="radio2"><span>나를 지정(@)한 알람 받기</span></label><br><br>
				<input type="radio" name="alram" value="no" class="radio" id="radio3">
					<label for="radio3"><span>모두 받지 않기</span></label> 
				<%
			} else if(alram.equals("select")){
				%>
				<input type="radio" name="alram" value="all" class="radio" id="radio1">
					<label for="radio1"><span>모든 알람 받기</span></label><br><br>
				<input type="radio" name="alram" value="select" class="radio" id="radio2" checked="checked">
					<label for="radio2"><span>나를 지정(@)한 알람 받기</span></label><br><br>
				<input type="radio" name="alram" value="no" class="radio" id="radio3">
					<label for="radio3"><span>모두 받지 않기</span></label> 
				<%
			} else if(alram.equals("no")){
				%>
				<input type="radio" name="alram" value="all" class="radio" id="radio1">
					<label for="radio1"><span>모든 알람 받기</span></label><br><br>
				<input type="radio" name="alram" value="select" class="radio" id="radio2">
					<label for="radio2"><span>나를 지정(@)한 알람 받기</span></label><br><br>
				<input type="radio" name="alram" value="no" class="radio" id="radio3" checked="checked">
					<label for="radio3"><span>모두 받지 않기</span></label> 
				<%
			} else {
				%>
				<input type="radio" name="alram" value="all" class="radio" id="radio1">
					<label for="radio1"><span>모든 알람 받기</span></label><br><br>
				<input type="radio" name="alram" value="select" class="radio" id="radio2">
					<label for="radio2"><span>나를 지정(@)한 알람 받기</span></label><br><br>
				<input type="radio" name="alram" value="no" class="radio" id="radio3">
					<label for="radio3"><span>모두 받지 않기</span></label> 
				<%
			}
		} else {
		//설정이 안되어있을 경우	
		%>
		<input type="radio" name="alram" value="all" class="radio" id="radio1">
			<label for="radio1"><span>모든 알람 받기</span></label><br><br>
		<input type="radio" name="alram" value="select" class="radio" id="radio2">
			<label for="radio2"><span>나를 지정(@)한 알람 받기</span></label><br><br>
		<input type="radio" name="alram" value="no" class="radio" id="radio3">
			<label for="radio3"><span>모두 받지 않기</span></label> 
		<%} %>
	
		<input type="hidden" name="email" value="<%=email%>">
	</div>

</body>
</html>