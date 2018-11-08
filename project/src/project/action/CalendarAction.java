package project.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.setting.db.SettingBean;
import member.setting.db.SettingDAO;

public class CalendarAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("CalendarAction_execute()");
		
		//파라미터값
		String email = request.getParameter("email");
		String schedule1_S = request.getParameter("schedule1");
		System.out.println("schedule1_S : "+schedule1_S);
		String schedule2_S = request.getParameter("schedule2");
		System.out.println("schedule2_S : "+schedule2_S);
		String work = request.getParameter("work");
		System.out.println("work : "+work);
		
		//설정이 저장된 이메일이 있는지 확인
		SettingDAO sdao = new SettingDAO();
		int check = sdao.emailCheck(email);
		
		//디비에 변경된 값 SettingBean에 저장
		SettingBean sb = new SettingBean();
		sb.setEmail(email);
		sb.setWork(work);
		if(schedule1_S != null){
			int schedule1 = Integer.parseInt(schedule1_S);
			System.out.println("schedule1 : "+schedule1);
			sb.setSchedule1(schedule1);
		} else if(schedule2_S != null){
			int schedule2 = Integer.parseInt(schedule2_S);
			System.out.println("schedule2 : "+schedule2);
			sb.setSchedule2(schedule2);
		}
		
		if(check == 1){
			//저장된 셋팅값이 있으면 수정 
			sdao.updateSetting(sb);
		} else {
			//저장된 셋팅값이 없으면 저장
			sdao.insertSetting(sb);
		}
		
		return null;
	}

}
