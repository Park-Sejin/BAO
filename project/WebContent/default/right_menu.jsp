<%@page import="chat_test.ChatServerEx"%>
<%@page import="member.db.MemberDAO"%>
<%@page import="java.util.List"%>
<%@page import="project.member.db.ProjectMemberBean"%>
<%@page import="project.member.db.ProjectMemberDAO"%>
<%@page import="project.db.ProjectDAO"%>
<%@page import="project.db.ProjectBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.db.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	
	<link href="css/right_menu.css" rel="stylesheet">
	<link href="css/profile_popup.css" rel="stylesheet">
	<link href="css/invitebox.css" rel="stylesheet">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	
	<script type="text/javascript">
	
	function go_pop(){
		/* $(document).ready(function() {
			$('#server_cnt').attr('value',1);
		}); */
		
		var cnt = 0;
		if(cnt == 0){
			cnt = 1;
			/* new chat_test.ChatServerEx(); */
			
			<%-- <% ChatServerEx server = new ChatServerEx(); %> --%>
		}
		
		
		var receive_email = document.getElementById('receive_email').value;
		window.open("./chatPage.chat?receive_email="+receive_email,"new","width=700, height=870, status=no, location=no, directories=no,scrollbars=no;");
	}
		
		
	function chat_pop(){
		window.open("./chatting/chat2.jsp","new","width=360, height=700, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
		}
	
	/*  $("#invite2_div").click(function(){
		
		$("#invite2_div").addClass("black");
		$("#invite_div").empty();
	 	$("#invite_div").load("./timeline.jsp");
		
	}); */
	 
	
	
	</script>
</head>
<body>
	<%
		String email = (String) session.getAttribute("email");
		int num = Integer.parseInt(request.getParameter("num"));
	%>
	<!-- aside -->
	<div id="rightMenuBox">
		<div class="aside_wrap">
			<div>
				<a class="btn_listback">이전화면</a>
			</div>
			<!-- 콜라보설정 -->
			<div class="collabo_set_wrap">
				<ul>
					<li><a class="ico1" id="prjFileList">파일함</a></li>
					<li><a class="ico5" id="prjTaskList">업무</a></li>
					<li><a class="ico4" id="prjSchdList"><span class="date">1</span>일정</a></li>
					<li><a class="ico3" id="prjTodoList">할일</a></li>
				</ul>
			</div>
			<!-- 초대하기 -->

			<div class="r_invite_box">
				<a class="invite" id="rightBoxPrjInvite">초대하기</a>
				<!-- <a class="inviteurl">초대URL생성</a> -->
			</div>


			<!-- //콜라보설정 -->
			<!-- 참여자목록 -->
			<div class="all_aplct_title">
				전체 참여자&nbsp;<strong id="sendienceCnt">1명</strong><a id="allView">전체보기</a>
			</div>


			<div id="projectChat" class="btn_prj_chat_box">
				<a class="btn_prj_chat" onclick="chat_pop()">프로젝트 채팅</a>
			</div>


			<div class="participant_wrap">
				<div id="JOIN_TITLE" class="aplct_title"
					style="cursor: pointer; display: none;">
					참여요청&nbsp;<img src="/design2/img_rn/ico/ico_new3.png" alt="">
					<a id="JOIN_CNT" style="display: none;"></a>
				</div>

				<div class="participant_scroll mCustomScrollbar">
					<!-- title -->
					<% ProjectMemberDAO pmdao = new ProjectMemberDAO();
						List<ProjectMemberBean> arr = new ArrayList<ProjectMemberBean>();
						arr = pmdao.getProjectMember(num);%>
					<div id="sendienceFirst" class="part_title first">
						<h5>
							<strong>프로젝트 관리자</strong><span id="sendienceAdminCnt">(<%= arr.size()%>)</span>
						</h5>
					</div>
					<!-- 이름 -->
					<ul id="sendienceAdminUl" style="display: block;">		
						
								
								<%for(ProjectMemberBean pmb : arr){ 
									MemberDAO mdao = new MemberDAO();
									MemberBean mb = mdao.getMember(pmb.getMember_num()); %>
									
							<li>
								<div class="photo">
									<img src="./img/right_menu/img_photo_null32.png" style="">
								</div>
								<div class="username" id="menu_profile">
									<a href="#"><%= mb.getName()%></a>
								</div>
								<div class="btn_right">
									<a class="btn_chat" onclick=""><span class="blind">채팅</span></a>
								</div>
							</li>
							 <%} %>
							<!-- 계속해서참여자추가(?) -->


					</ul>

					<!-- title -->
					<div class="part_title sendienceOutsideTitle">
						<h5>
							<strong>외부참여자</strong><span id="sendienceOutsideCnt">(0)</span>
						</h5>
					</div>
					<!-- 이름 -->
					<ul id="sendienceOutsideUl">
					</ul>
					<!-- title -->
					<div class="part_title sendienceInsideTitle">
						<h5>
							<strong>내부참여자</strong><span id="sendienceInsideCnt">(0)</span>
						</h5>
					</div>
					<!-- 이름 -->
					<ul id="sendienceInsideUl">
					</ul>
				</div>
			</div>
			<!-- //참여자목록 -->

			<div id="addRcvList" style="display: none;"></div>
		</div>
	</div>
	<!-- //aside -->




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
				<div class="prof_info">
					<div class="prof_top">
						<h2>
							<span id="FLNM">박수진</span><span id="JBCL_NM"
								style="font-size: 20px; color: #969696; margin-left: 10px;"></span>
						</h2>
						<%ProjectDAO pdao = new ProjectDAO();
							ProjectBean pb = pdao.getProject(num);%>
						
						<p id="CMNM"><%=pb.getProName() %></p>
						<a id="EDIT" class="ico_mod" style="display: none;"></a>
					</div>
					<div class="prof_cn">
						<p id="EML" style="visibility: visible;">sujin11@naver.com</p>
						<p id="CLPH_NO" style="visibility: hidden;"></p>
						<p id="CMPN_TLPH_NO" style="visibility: hidden;"></p>
						<input type="hidden" id="receive_email" value="sujin11@naver.com"> <!-- 임의의 값 -->
					</div>
					
					<div class="prof_btn">
					<%int server_cnt = 0; %>
						<a id="CHAT" class="btn_prd_sty1_b" onclick="go_pop()"><span>채팅하기</span></a>
						
						
						<a id="PROFILE_EDIT" class="btn_prd_sty1" style="">
						<span style="color: #28272c">프로필 수정</span></a>
					</div>
					
			<%-- 		<% if(server_cnt == 1){
							ChatServerEx server = new ChatServerEx(); 
						}
					%> --%>
				</div>
			</div>
		</div>
	</div>
	

	
	
	<!-- 팝업창 div2  -->
	
	<div id="invite2_div" class="modal">
		  <div class="invite2_popup" style="width:500px; height:620px; z-index:1100; position:fixed; ">
			  <div id="invite2_top">
				  <div id="invite2_title">
					  <h2>초대하기</h2>
				  </div>			
		  </div>
		  <div id="invite2_sub">
		  	<ul>
		  	  <li><span class="profile_ico"></span><p class="invite2_name"></p><p class="invite2_team"></p></li>
		  	  <li><span class="profile_ico"></span><p class="invite2_name"></p><p class="invite2_team"></p></li>
		  	  <li><span class="profile_ico"></span><p class="invite2_name"></p><p class="invite2_team"></p></li>
		  	  <li></li>
		  	</ul>	
		  </div>		
		</div>
	</div>
	
	
	
	<!-- 초대하기 -->
	<div id="invite_div" class="modal">
		<div class="invite_popup"
			style="width: 500px; height: 620px; z-index: 1100; position: fixed; top: 50%; left: 50%; margin-top: -310px; margin-left: -250px;">
			<div class="invite_divdefault" style="display: block;">
				<div id="invite_top">
					<div id="invitePrjname">
						<h1>프로젝트이름</h1>
					</div>
					<div id="inviteboxclose" title="닫기"></div>
				</div>

				<div id="invite_sub">
					<ul>
						<li><p class="tit">팀, 직원 동료 초대</p>
							<p class="txt">회사 직원 또는 조직도를 확인하고 초대할 수 있습니다.</p>
						</li>
						<li><p class="tit">프로젝트 참여자</p>
							<p class="txt">프로젝트를 함께 했던 사람을 초대할 수 있습니다.</p>
						</li>
						<li><p class="tit">이메일로 초대장 발송</p>
							<p class="txt">초대장을 이메일로 발송할 수 있습니다.</p>
						</li>
						<li><p class="tit">초대링크</p>
							<p class="txt">http://123456123456.123456</p>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- 파일함 -->
	<div id="filebox_div" class="modal"></div>


	<!-- 전체보기 팝업창 -->
	<div id="part_member" class="modal" >
		<div id="part_member" class="AllView_div" 
		style="width: 556px; height: 483px; top: 50%; left: 50%; z-index: 1001; position: fixed; margin-top: -241.5px; margin-left: -278px; display: block;">
			<div class="layerstyle4_po">
				<div class="layerstyle4_title" style="height: 43px; background-color: #f4f4f4; border-radius: 7px 0;">
					<h4 style="padding: 11px 0 0 16px; font-weight: normal;">
						<span class="icon_url"></span>&nbsp;프로젝트 참여자
					</h4>
					<a class="btn_layerstyle4_close"
						style="position: absolute; top: 15px; right: 15px; width: 14px; height: 14px;">
						<img src="./img/popup/allview_close.png" alt="닫기">
					</a>
					
					<div id="ul_div">
						<ul id="part_ul">
							<%-- <% for(ProjectMemberBean pb : arr){%> --%>
							<li>
								<img src="./img/popup/default_profile.png" alt="프로필사진">
								<a href="">이름이름</a>
							</li>
							<%-- <%} %> --%>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>




	<!-- profile -->
	<script>
			var profile = document.getElementById('profile_div');
			var btn1 = document.getElementById('menu_profile');
			
			
			btn1.onclick = function() {
				profile.style.display = "block";
			}
			
			/* <!-- invite  --> */
			 
			var invite = document.getElementById('invite_div');
			var btn2 = document.getElementById('rightBoxPrjInvite');
			
			
			btn2.onclick = function() {
				invite.style.display = "block";
			}
			
			/* <!-- filebox --> */
			
			var filebox = document.getElementById('filebox_div');
			var btn3 = document.getElementById('prjFileList')
			
			btn3.onclick = function() {
				filebox.style.display = "block";
			}
			
			/* 전체보기 팝업창 */
			var part = document.getElementById('part_member');
			btn4 = document.getElementById('allView');
			
			btn4.onclick = function() {
				part.style.display = "block";
			}
			
			// When the user clicks anywhere outside of the modal, close it
			window.onclick = function(event){
			    if (event.target == profile) {
			    	profile.style.display = "none";
			    	
			    }else if(event.target == invite){
			    	invite.style.display = "none";
			    }else if(event.target == filebox){
			    	filebox.style.display = "none";
			    }else if(event.target == part){
			    	part.style.display="none";
			    }
			} 

	
	
	
			
			
	</script>









</body>
</html>