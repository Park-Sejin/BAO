package project.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.setting.db.SettingBean;
import member.setting.db.SettingDAO;

public class Calendar implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Calendar_execute()");
		
		//이메일 세션 가져오기
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		
		//이메일주소에 해당하는 정보 가져오기
		SettingDAO sdao = new SettingDAO();
		SettingBean sb = sdao.getSetting(email);
		//저장된 정보가 있으면 값 넘기기
		if(sb.getWork() != null){
			int schedule1 = sb.getSchedule1();
			int schedule2 = sb.getSchedule2();
			String work = sb.getWork();
			request.setAttribute("schedule1", schedule1);
			request.setAttribute("schedule2", schedule2);
			request.setAttribute("work", work);
		}
		
		//이메일정보 넘기기
		request.setAttribute("email", email);
		
		//페이지이동
		ActionForward forward = new ActionForward();
		forward.setPath("./content/calendar.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
