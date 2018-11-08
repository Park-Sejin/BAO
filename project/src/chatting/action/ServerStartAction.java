package chatting.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import chat_test.ChatServerEx;

public class ServerStartAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("server 클릭. execute 들어옴");
		
		ChatServerEx server = new ChatServerEx();
		
		return null;
	}
	
}
