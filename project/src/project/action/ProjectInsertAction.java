package project.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.db.ProjectBean;
import project.db.ProjectDAO;

public class ProjectInsertAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ProjectInsertAction_execute()");
		
		int option = Integer.parseInt(request.getParameter("option"));
		System.out.println("option!! : "+option);
		String proName = request.getParameter("proName");
		String id = "admin";
		
		ProjectBean pb = new ProjectBean();
		pb.setId(id);
		pb.setProName(proName);
		pb.setOption(option);
		
		ProjectDAO pdao = new ProjectDAO();
		pdao.insertProject(pb);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./main.pr");
		forward.setRedirect(true);
		return forward;
	}
	

}
