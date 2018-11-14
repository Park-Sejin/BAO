<%@page import="project.db.ProjectBean"%>
<%@page import="project.db.ProjectDAO"%>
<%@page import="java.util.List"%>
<%@page import="project.member.db.ProjectMemberDAO"%>
<%@page import="member.db.MemberBean"%>
<%@page import="member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = (String)session.getAttribute("email");
	MemberDAO a_mdao = new MemberDAO();
	// 내정보
	MemberBean my_mb = a_mdao.getMember(id);
	
	// 내 id num값
	int memNum = a_mdao.getMemberNum(id);
	
	// 나와 같은 프로젝트에 가입된 회원 리스트
	ProjectMemberDAO a_pmdao = new ProjectMemberDAO();
	List memList = a_pmdao.getJoinMemberList(memNum);
%>

<script>
	$(document).ready(function(){
		$('#sbm').keyup(function(e){
			if(e.keyCode == 13){
				alert('assaf');
			}
		});
	})
</script>

<div id="hd_chat_sec2">
	<div id="chat_search">
			<img src="./img/top_header/if_icon-111-search_314478.png" width="30" style="position: absolute; left: 10px;">
			<input type="text" name="searchMember" placeholder="이름 소속 또는 연락처 검색" size="50"
					style=" margin-left:5px;  line-height: 30px;  outline: none; position: absolute; left: 50px; border: none;"> 
			<input type="button" style="display: none;" id="sbm">
	</div>
</div>

<div id="hd_chat_sec3">
	<div id="hd_chat_mynumber">
		<span class="bold">내 프로필</span>
		<div class="div_chat">
			<a href="#">
				<%
					if(my_mb.getImage() == null){
						
				%>
						<img src="./img/top_header/thumb26.gif" width="40px">
				<%
					}else{
				%>
						<img src="./upload/<%=my_mb.getImage()%>" width="40px">
				<%
					}
				%>
			</a>
			<a href="#"><%=my_mb.getName() %></a>
			<a href="#" class="icon_chat"></a>
		</div>
	</div>
	<div id="hd_chat_allnumber">
		<span class="bold">전체 연락처</span>
		
		<%
			for(int i = 0; i<memList.size(); i++){
				MemberBean allListMB = (MemberBean)memList.get(i);
		%>
		<div class="div_chat">
			<a href="#">
				<%
					if(allListMB.getImage() == null){
				%>
					<img src="./img/top_header/thumb26.gif" width="40px">
				<%
					}else{
				%>
					<img src="./upload/<%=allListMB.getImage()%>" width="40px">
				<%
					}
				%>
			</a>
			<a href="#"><%=allListMB.getName() %></a>
			<a href="#" class="icon_chat"></a>
		</div>
		<%
			}
		%>
		
	<!-- 팝업창 div -->
	   <div id="profile_div" class="modal">
	      <div id="profilePopup" class="prdbx_wrap"
	         style="top: 50%; left: 50%; width: 400px; height: 672px; z-index: 9100; position: fixed; margin-top: -336px; margin-left: -200px;">
	         <div class="prof_bx">
	            <div class="prof_thumb">
	               <span class="bg"></span> <a class="btn_close" id="inviteBoxClose"
	                  title="닫기"></a> <img id="PRFL_PHTG"
	                  src="./img/right_menu/img_photo_null_for_prfl.png" alt=""
	                  onerror="this.src='/design2/img_rn/img_photo_null_for_prfl.png'"
	                  style="object-fit: cover; height: 400px; width: 400px;">
	            </div>
	            
	            
	            <%	
		            int mem_num = 0;
		            if(request.getParameter("mem_num") != null) {
		            	mem_num = Integer.parseInt(request.getParameter("mem_num"));
		            } 
		            
	            		ProjectDAO pdao = new ProjectDAO();
					MemberDAO p_mdao = new MemberDAO();
					MemberBean p_mb = new MemberBean();
	             	
	             	if(mem_num != 0) { p_mb = p_mdao.getMember(mem_num); }
	             %>
	            <div class="prof_info">
	               <div class="prof_top">
	                  <h2>
	                     <span id="FLNM"><%=p_mb.getName() %></span><span id="JBCL_NM"
	                        style="font-size: 20px; color: #969696; margin-left: 10px;"></span>
	                  </h2>
	                  <a id="EDIT" class="ico_mod" style="display: none;"></a>
	               </div>
	               <div class="prof_cn">
	                  <p id="EML" style="visibility: visible;"><%=p_mb.getEmail() %></p>
	                  <p id="CLPH_NO" style="visibility: hidden;"></p>
	                  <p id="CMPN_TLPH_NO" style="visibility: hidden;"></p>
	                  <input type="hidden" id="receive_email" value="<%=p_mb.getEmail()%>">
	               		<input type="button" value="server" onclick="server()">
	               </div>
	               <div class="prof_btn">
	                  <a id="CHAT" class="btn_prd_sty1_b" onclick="go_pop()"><span>채팅하기</span></a>
	                  <a id="PROFILE_EDIT" class="btn_prd_sty1" style=""><span
	                     style="color: #28272c">프로필 수정</span></a>
	               </div>
	            </div>
	         </div>
	      </div>
	   </div>		
		
		
	</div>
	
</div>




