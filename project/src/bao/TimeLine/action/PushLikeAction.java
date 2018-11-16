package bao.TimeLine.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bao.TimeLine.db.ilikeBean;
import bao.TimeLine.db.ilikeDAO;

public class PushLikeAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("PushLike_execute");
		
		HttpSession session = request.getSession();
		
		String email = (String)session.getAttribute("email");
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		
		ilikeDAO idao = new ilikeDAO();
		ilikeBean lb = new ilikeBean();
		
		lb.setLike_email(email);
		lb.setB_num(b_num);
		
		idao.Push_like(lb);
		
		
		return null;
	}
	
}
