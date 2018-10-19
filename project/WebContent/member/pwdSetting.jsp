<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>비밀번호 설정</h1>
	<div id="profile">
		<h3>비밀번호 재설정이 가능합니다.</h3>
		<br>
		<p>비밀번호는 영문,숫자 포함 4~12자리 이어야 합니다.</p>
		<br>

		<table id="pro_table">
			<tr>
				<td>비밀번호</td>
				<td colspan="2"><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass2"></td>
				<td><input type="button" name="btn_ok" onclick="updatePass()"></td>
			</tr>
		</table>
	</div>
</body>
</html>
			
