package chatting.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import chat_test.ChatServerEx;

public class ServerStartAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("채팅하기 클릭. execute 들어옴");
		
		
		String receive_email = request.getParameter("receive_email");
		/*HttpSession session = request.getSession();*/
		/*String sender_email = (String) session.getAttribute("email");*/
		String sender_email = "tpwls1226@naver.com";
		
		System.out.println(sender_email);
		System.out.println("dddddddddddd: " + receive_email);
	
		
		/*ChatServerEx server = new ChatServerEx(sender_email, receive_email);*/
		/*ChatServerEx server = new ChatServerEx();*/
		
		
		System.out.println("dddddddddddd: " + receive_email);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./chatting/chat2.jsp");
		
		return forward;
	}
	
}
