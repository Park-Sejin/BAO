package member.action;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.action.Action;
import member.action.ActionForward;
import member.setting.db.SettingBean;
import member.setting.db.SettingDAO;

public class AlramSetAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("AlramSetAction_execute()");
		
		//파라미터값
		String email = request.getParameter("email");
		String alram = request.getParameter("alram");
		
		//설정이 저장된 이메일이 있는지 확인
		SettingDAO sdao = new SettingDAO();
		int check = sdao.emailCheck(email);
		
		//디비에 저장
		SettingBean sb = new SettingBean();
		sb.setEmail(email);
		sb.setAlram(alram);
		
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
