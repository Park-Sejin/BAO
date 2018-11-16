package bao.TimeLine.action;

import java.io.File;
import java.io.PrintWriter;
/*import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;*/
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bao.TimeLine.db.BoardBean;
import bao.TimeLine.db.BoardDAO;
import member.db.MemberDAO;
import project.db.ProjectBean;
import project.db.ProjectDAO;


public class TimeLineWriteAction implements Action{

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
      System.out.println("TimeLineWriteInsert execute()!!");
      
      HttpSession session = request.getSession();
      String email = (String)session.getAttribute("email");
      
      
      //System.out.println("dd: " + email);
 
      request.setCharacterEncoding("UTF-8");
      try{
         int maxPostSize=100*1024*1024;
         ServletContext ctx = request.getServletContext();
         String saveDirectory = ctx.getRealPath("/upload");
         
         
         MultipartRequest mr=new MultipartRequest(
               request,
               saveDirectory,
               maxPostSize,
               "UTF-8",
               new DefaultFileRenamePolicy()
               );
         
         
         // 파일이 여러개, 파일 사이즈 체크
         String fileInput="";
         String fileName=""; //파일이름
         File fileObj=null;
         long fileSize=0;
         Enumeration formNames=mr.getFileNames();
         while(formNames.hasMoreElements()){
            fileInput=(String)formNames.nextElement();  //첫번째 type=file
            fileName=mr.getFilesystemName(fileInput);
            if(fileName!=null){
               
               fileObj=mr.getFile(fileInput);
               fileSize=(long)fileObj.length();
            }
         }
         
      BoardBean bb=new BoardBean();
      
      
      bb.setContent(mr.getParameter("content"));
      //System.out.println("action : "+mr.getParameter("content"));
      
      bb.setWrite_file(mr.getFilesystemName("write_file"));
      //System.out.println("Faction : "+mr.getFilesystemName("write_file"));
      
      bb.setImg_file(mr.getFilesystemName("img_file"));
      //System.out.println("Iaction : "+mr.getFilesystemName("img_file"));
      
      bb.setMember_user(email);
      
      
      bb.setProject_num(Integer.parseInt(mr.getParameter("num")));
        
      BoardDAO bdao=new BoardDAO();
<<<<<<< HEAD
      bdao.insertWrite(bb);
=======
      int tNum = bdao.insertWrite(bb);
      bdao.alarm(bb, tNum);
      
      /*List<String> ConList=new ArrayList<String>();
      ConList.add(multi.getParameter("content"));
      ConList.add(multi.getParameter("write_file"));
      ConList.add(multi.getParameter("Img_write_file"));*/
      
/*      
      HashMap<String, Object> ConList=new HashMap<String, Object>();
      ConList.put("Con", multi.getParameter("content"));
      ConList.put("WF", multi.getParameter("write_file"));
      ConList.put("IF", multi.getParameter("Img_write_file"));
      
      request.setAttribute("Conn", multi.getParameter("content"));
      
>>>>>>> refs/remotes/origin/master

      
      JSONObject obj=null;
      //JSONArray arr=new JSONArray();
      String Write=null;
      
      MemberDAO mdao = new MemberDAO();
      
      obj=new JSONObject();
      obj.put("Name",mdao.getMember(bb.getMember_user()).getName());
      obj.put("Date",bb.getDate());
      obj.put("Content",bb.getContent());
<<<<<<< HEAD
      obj.put("ProjectNum",bb.getProject_num());
=======
>>>>>>> refs/remotes/origin/master
      //obj.put("IF", multi.getParameter("Img_write_file"));
      Write=obj.toString();
      
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();
       out.println(Write);
       out.close();      

      //System.out.println("xasxasxasd"+request.getAttribute("AA"));
      
/*      ActionForward forward = new ActionForward();
      forward.setPath("./TimeLine/divdiv.jsp");
      forward.setRedirect(false);*/
      }catch(Exception e){
      e.printStackTrace();
      }
      return null;
   }
}
