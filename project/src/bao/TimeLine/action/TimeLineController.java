package bao.TimeLine.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TimeLineController extends HttpServlet{
   
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
       // 媛��긽 二쇱냼 媛��졇���꽌 �븘�슂�븳 二쇱냼留� 媛��졇�삤湲�
       String requestURI = request.getRequestURI();
       String contextPath = request.getContextPath();
       String command = requestURI.substring(contextPath.length());
       System.out.println("command : "+command);
       
       
       ActionForward forward = null;
       Action action = null;
       
       
       // �븸�뀡媛붾떎媛� �룎�븘�� 由ы꽩諛쏆� 媛믪쓣 forward濡� ���옣�빐 諛묒쓽  if臾� �럹�씠吏� �씠�룞
       // 湲� �옉�꽦遺�遺�
       if(command.equals("/TimeLineWriteAction.tl")){
          //System.out.println("controller");
          action = new TimeLineWriteAction();
          try{
             forward=action.execute(request, response);
          }catch(Exception e){
             e.printStackTrace();
          }  
       }else if(command.equals("/TimeLine.tl")){
         forward = new ActionForward();
         forward.setPath("./TimeLine/timeline.jsp");
         forward.setRedirect(false);
          
       }else if(command.equals("/TimeLineDutyWriteAction.tl")){
          action = new TimeLineDutyWriteAction();
          try{
             forward=action.execute(request, response);
          }catch(Exception e){
             e.printStackTrace();
          }
          
       }else if(command.equals("/FileDownloadAction.tl")){
          action = new FileDownloadAction();
          try{
             forward=action.execute(request, response);
          }catch(Exception e){
             e.printStackTrace();
          }
       }else if(command.equals("/myBoard.tl")){
           forward = new ActionForward();
           forward.setPath("./content/my_board.jsp");
           forward.setRedirect(false);
            
         }
       

       
       // �럹�씠吏� �씠�룞    
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


