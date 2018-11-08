package chatting.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import chat_test.ChatServerEx;

public class ServerStartAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String receive_email = request.getParameter("receive_email");
		HttpSession session = request.getSession();
		String sender_email = (String) session.getAttribute("email");
		
		System.out.println(sender_email);
		System.out.println("dddddddddddd: " + receive_email);
		
		ChatServerEx server = new ChatServerEx(sender_email, receive_email);
		
		System.out.println("dddddddddddd: " + receive_email);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./chatting/chat2.jsp");
		
		return forward;
	}
	
}
