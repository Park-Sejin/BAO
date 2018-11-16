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

<div id="hd_chat_sec2">
	<div id="chat_search">
			<img src="./img/top_header/if_icon-111-search_314478.png" width="30" style="position: absolute; left: 10px;">
			<input type="text" name="searchMember" placeholder="이름 소속 또는 연락처 검색" size="50"
					style=" margin-left:5px;  line-height: 30px;  outline: none; position: absolute; left: 50px; border: none;"> 
			<input type="button" style="display: none;" onkeydown="onKeyDown();">
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
			<a class="icon_chat"  onclick="window.open('./chatPage.chat?receive_email=<%=allListMB.getEmail() %>', 'new','width=700, height=870, status=no, location=no, directories=no,scrollbars=no;');"></a>
		</div>
		<%
			}
		%>
		
	      </div>
	   </div>		
		




