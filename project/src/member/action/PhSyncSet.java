package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PhSyncSet implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("PhSyncSet_execute()");
		
		
		
		//페이지이동
		ActionForward forward = new ActionForward();
		forward.setPath("./member/phSyncSetting.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
