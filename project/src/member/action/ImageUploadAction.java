package member.action;

import java.io.File;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import member.db.MemberBean;
import member.db.MemberDAO;

public class ImageUploadAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
      System.out.println("ImageUploadAction_execute()");
      
      //실제로 업로드될 폴더의 경로
      ServletContext context = request.getServletContext();
      //업로드 할 가상 경로
      String realPath = context.getRealPath("/upload");
      
      //업로드 할 가상 경로
      //String realPath = request.getRealPath("/upload");
      
      //파일 업로드 객체생성
      MultipartRequest multi = null;
      
      //파일크기제한
      int maxSize = 10*1024*1024;
      
      try {
         
         //파일업로드 처리 객체를 사용해서 업로드
         multi = new MultipartRequest(
               request,
               realPath,
               maxSize,
               "UTF-8",
               new DefaultFileRenamePolicy()
               );
         
      } catch(Exception e){
         e.printStackTrace();
      }
      
      //메일주소
      String email = multi.getParameter("email");
      System.out.println("email : "+email);
      
      //이미지
      //폼에서 전달되어온 파일타입의 입력상자 이름반환
      Enumeration files = multi.getFileNames();
      System.out.println("files : "+files);
      //첫번쨰입력상자의 이름반환
      String filename = (String)files.nextElement();
      System.out.println("filename : "+filename);
      //서버상에 업로드된 실제 파일명
      String image = multi.getFilesystemName(filename);
      System.out.println("image : "+image);
      
      /*String original = multi.getOriginalFileName(filename);
      System.out.println("original : "+original);
      String type = multi.getContentType(filename);
      System.out.println("type : "+type);
      File uf = multi.getFile(filename);
      System.out.println("uf : "+uf);*/
      
      //넘어온값 저장할 객체생성
      MemberBean mb = new MemberBean();
      mb.setEmail(email);
      mb.setImage(image);
      
      //이미지저장(수정)
      MemberDAO mdao = new MemberDAO();
      mdao.insertImage(mb);
      
      //넘겨주기
      request.setAttribute("image", image);
      
      
      //페이지이동
      ActionForward forward = new ActionForward();
      forward.setPath("./member/imageUpload.jsp");
      forward.setRedirect(false);
      
      return forward;
   }

}