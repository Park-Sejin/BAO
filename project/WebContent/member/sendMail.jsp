<%@page import="member.db.MemberDAO"%>
<%@page import="member.action.ActionForward"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Session"%>
<%@page import="member.action.GoogleAuthentication"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
	request.setCharacterEncoding("UTF-8");
	//String sender = "BAO";
	String receiver = request.getParameter("email");

	String subject = "[BAO] 새로운 비밀번호를 설정해주세요 ";
	String title = "<h1 style='color:#5f5ab9;'>신규비밀번호설정</h1>";
	String p = "<p style='font-size:1.2em;'>안녕하세요. BAO입니다.<br><br>아래 버튼을 눌러 새 비밀번호를 설정해주세요.</p>";
	String form = "<form action='http://localhost:8088/project/RePassword.me' method='post'>";
	String hid = "<input type='hidden' name='email' value='";
	String hid2 = "'>";
	String btn = "<input type='submit' name='ok' value='확인'><br></form>";
	
	
	StringBuffer content = new StringBuffer();
	content.append(title+"<br><br>");
	content.append(p+"<br><br><br>");
	content.append(form+"<br>");
	content.append(hid);
	content.append(receiver);
	content.append(hid2+"<br>");
	content.append(btn);
	
	try {
		//서버정보를 Properties객체에 저장
		Properties properties = System.getProperties();
		//Starttls Command 사용하여 사용자 인증 할수있게 설정 
		properties.put("mail.smtp.starttls.enable", "true"); // gmail은 무조건 true 고정
		//SMTP 서버 지정
		properties.put("mail.smtp.host", "smtp.gmail.com"); // smtp 서버 주소
		//AUTH command를 사용하여 사용자 인증 할수있게 설정
		properties.put("mail.smtp.auth", "true"); // gmail은 무조건 true 고정
		//서버포트지정
		properties.put("mail.smtp.port", "587"); // gmail 포트
		//인증정보생성
		Authenticator auth = new GoogleAuthentication();
		//Session객체생성(메일전송역할)
		Session s = Session.getDefaultInstance(properties, auth);
		//생성한 Session객체를 사용하여 전송할 Message객체생성
		Message message = new MimeMessage(s);
		//메일 송신할 송신 주소 생성
		Address sender_address = new InternetAddress("BAO");
		//메일을 수신할 수신 주소 생성
		Address receiver_address = new InternetAddress(receiver);
		//메일 전송에 필요한 값들을 설정
		message.setHeader("content-type", "text/html;charset=UTF-8");
		message.setFrom(sender_address);
		message.addRecipient(Message.RecipientType.TO, receiver_address);
		message.setSubject(subject);
		message.setContent(content.toString(), "text/html;charset=UTF-8");
		message.setSentDate(new java.util.Date());
		//메시지를 메일로 전송
		Transport.send(message);
		System.out.println("메일이 정상적으로 전송되었습니다.");
		System.out.println(content.toString());
		
		//페이지이동
		response.sendRedirect("./Login.me");
		
	} catch(Exception e){
		System.out.println("SMTP 서버가 잘못 설정되었거나, 서비스에 문제가 있습니다.");
		e.printStackTrace();
		%>
			<script type="text/javascript">
				history.back();
			</script>
		<%
	}

%>

</body>
</html>