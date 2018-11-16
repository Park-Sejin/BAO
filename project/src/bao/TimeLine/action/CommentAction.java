package bao.TimeLine.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import bao.TimeLine.db.CommentBean;
import bao.TimeLine.db.CommentDAO;
import member.db.MemberDAO;

public class CommentAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ActionForward_execute");
		
		response.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
	    String email = (String)session.getAttribute("email");
		
		CommentDAO cdao = new CommentDAO();
		CommentBean cb = new CommentBean();
		
		cb.setCmt_board_num(Integer.parseInt(request.getParameter("board_num")));
		cb.setCmt_content(request.getParameter("content"));
		cb.setCmt_email(email);
		
		cdao.insertComment(cb);
		
		
		JSONObject obj;
		String Write = null;
		
		MemberDAO mdao = new MemberDAO();
		
		
		cb = cdao.LastComment(email);
		
		obj = new JSONObject();
		obj.put("Name",mdao.getMember(cb.getCmt_email()).getName());
		obj.put("Date",cb.getDate().toString());
		obj.put("Content",cb.getCmt_content());
		
		Write = obj.toString();
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.println(Write);
	  	out.close();      
		
		
		
		
		
		return null;
	}
	
}