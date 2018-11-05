package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PrjColorSet implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("PrjColorSet_execute()");
		
		
		//페이지이동
		ActionForward forward = new ActionForward();
		forward.setPath("./member/prjColorSetting.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
