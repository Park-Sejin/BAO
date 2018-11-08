package chat_test;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chatting.action.Action;
import chatting.action.ActionForward;

public class dd implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("서버열기 클릭. execute 들어옴");
		
		ChatServerEx server = new ChatServerEx();
		
		return null;
	}
	

}
