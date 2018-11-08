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
	var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);

	$(document).ready(function() {
		$("#btnSave").click(function() {

			//비밀번호 공백확인
			if ($("#passTxt1").val() == "") {
				$("#text").html("비밀번호를 입력해주세요");
				$("#passTxt1").focus();
				return false;
			}
			if ($("#passTxt2").val() == "") {
				$("#text").html("비밀번호를 재입력해주세요");
				$("#passTxt2").focus();
				return false;
			}

			//비밀번호 같음확인
			if ($("#passTxt1").val() != $("#passTxt2").val()) {
				$("#text").html("비밀번호를 동일하게 입력해주세요");
				$("#passTxt1").val("");
				$("#passTxt2").val("");
				$("#passTxt1").focus();
				return false;
			}

			//비밀번호 유효성검사
			if (!getCheck.test($("#passTxt1").val())) {
				$("#text").html("영문과 숫자를 4~12 범위로 입력해주세요");
				$("#passTxt1").val("");
				$("#passTxt2").val("");
				$("#passTxt1").focus();
				return false;
			}

		});
	});
</script>
</head>
<body>

	<h1>비밀번호 설정</h1>
	<div id="profile">
		<h2>비밀번호 재설정이 가능합니다.</h2>
		<br>
		<p>비밀번호는 영문,숫자 포함 4~12자리 이어야 합니다.</p>
		<br>
		
		<%
			String email = (String)session.getAttribute("email");
		%>

		<form action="./PwdSetAction.me" method="post">
			<input type="hidden" name="email" value="<%=email%>">
			<table id="pro_table">
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pass" id="passTxt1"
						placeholder="비밀번호 입력"></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="pass2" id="passTxt2"
						placeholder="비밀번호 확인"></td>
				</tr>
			</table>
			<br>
			<div style="color: red" id="text"></div><br>
			<input type="submit" name="btn_ok" id="btnSave" value="변경">
		</form>
	</div>

</body>
</html>

