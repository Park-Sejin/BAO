<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		
		<script type="text/javascript">
			function server(){
				window.open("./test.chat?receive_email="+receive_email,"new","width=700, height=870, status=no, location=no, directories=no,scrollbars=no;");
			}
			
			function chat() {
				window.open("./chatPage.chat?receive_email="+receive_email,"new","width=700, height=870, status=no, location=no, directories=no,scrollbars=no;");
			}
		</script>
	</head>
	<body>
		<input type="button" value="서버 열기" onclick="server()">
		<input type="button" value="채팅하기" onclick="chat()">
		
		<!-- 실험 -->
	</body>
</html>