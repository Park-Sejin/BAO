package member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberFrontController extends HttpServlet{

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 가상 주소 가져와서 필요한 주소만 가져오기
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String command = requestURI.substring(contextPath.length());
    	System.out.println("command : "+command);
    	
    	ActionForward forward = null;
    	Action action = null;
    	
    	// 가상주소를 비교해서 페이지 처리
    	if(command.equals("/Login.me")){ 
    		forward = new ActionForward();
    		forward.setPath("./member/login.jsp");
    		forward.setRedirect(false);
    		
    	} else if(command.equals("/MemberLoginAction.me")){
    		action = new MemberLoginAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    		
    	} else if(command.equals("/Join.me")){
    		forward = new ActionForward();
    		forward.setPath("./member/join.jsp");
    		forward.setRedirect(false);
    		
    	} else if(command.equals("/MemberJoinAction.me")){
    		action = new MemberJoinAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    		
    	} else if(command.equals("/FindPassword.me")){
    		forward = new ActionForward();
    		forward.setPath("./member/findPassword.jsp");
    		forward.setRedirect(false);
    		
    	} else if(command.equals("/kakaoJoin.me")){
    		action = new KakaoJoinAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	} else if(command.equals("/SendMail.me")){
    		forward = new ActionForward();
    		forward.setPath("./member/sendMail.jsp");
    		forward.setRedirect(false);
    		
    	} else if(command.equals("/RePassword.me")){
    		forward = new ActionForward();
    		forward.setPath("./member/rePassword.jsp");
    		forward.setRedirect(false);
    		
    	} else if(command.equals("/RePasswordAction.me")){
    		action = new RePasswordAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    		
    	} else if(command.equals("/Set.me")){
    		forward = new ActionForward();
    		forward.setPath("./member/updateMember.jsp");
    		forward.setRedirect(false);
    		
    	} else if(command.equals("/SetMemberAction.me")){
    		action = new SetMemberAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	} else if(command.equals("/PwdSetAction.me")){
    		action = new PwdSetAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    		
    	} else if(command.equals("/PwdSet.me")){
    		action = new PwdSet();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    		
    	} else if(command.equals("/GoogleLogin.me")){
    		action = new GoogleLoginAction();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    		
    	} else if(command.equals("/Logout.me")){
    		action = new Logout();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    		
    	} else if(command.equals("/ImageUpload.me")){
            action = new ImageUploadAction();
            try {
              forward = action.execute(request, response);
           } catch (Exception e) {
              e.printStackTrace();
           }
            
         } else if(command.equals("/AlramSet.me")){
        	 action = new AlramSet();
        	 try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
        	 
         } else if(command.equals("/PrjColorSet.me")){
        	 action = new PrjColorSet();
        	 try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
        	 
         } else if(command.equals("/PhSyncSet.me")){
        	 action = new PhSyncSet();
        	 try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
        	 
         }
    	
    	// 페이지 이동    
    	if(forward != null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
    	
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
