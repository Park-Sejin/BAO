package project.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.db.MemberDAO;
import project.db.ProjectBean;
import project.db.ProjectDAO;
import project.member.db.ProjectMemberDAO;

public class ProjectInsertAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProjectInsertAction_execute()");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("email");
		System.out.println("아이디 : "+id);
		
		int option = Integer.parseInt(request.getParameter("option"));
		String proName = request.getParameter("proName");
		
		ProjectBean pb = new ProjectBean();
		pb.setId(id);
		pb.setProName(proName);
		pb.setOption(option);
		
		ProjectDAO pdao = new ProjectDAO();
		MemberDAO mdao = new MemberDAO();
		ProjectMemberDAO pmdao = new ProjectMemberDAO();
		pdao.insertProject(pb);
		pdao.projectFavoriteOff(mdao.getMemberNum(id));
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./main.pr");
		forward.setRedirect(true);
		return forward;
	}
	

}
