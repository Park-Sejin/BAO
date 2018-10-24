<%@page import="member.db.MemberDAO"%>
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
	
	<script type="text/javascript">
		function go_pop(){
			
			window.open("./chatting/chat.jsp","new","width=700, height=870, status=no, location=no, directories=no,scrollbars=no;");
		}
		
		
	</script>
	
	<script type="text/javascript">
	function chat_pop(){
		window.open("./chatting/chat.jsp","new","width=360, height=700, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
		}
	</script>
	
</head>
<body>

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

			
				
			<div id="projectChat" class="btn_prj_chat_box" >
				<a class="btn_prj_chat" onclick="chat_pop()" >프로젝트 채팅</a>
			</div>
			<div>
			
			</div>

			<div class="participant_wrap">
				<div id="JOIN_TITLE" class="aplct_title"
					style="cursor: pointer; display: none;">
					참여요청&nbsp;<img src="/design2/img_rn/ico/ico_new3.png" alt="">
					<a id="JOIN_CNT" style="display: none;"></a>
				</div>

				<div class="participant_scroll mCustomScrollbar">
					<!-- title -->
					<div id="sendienceFirst" class="part_title first">
						<h5>
							<strong>프로젝트 관리자</strong><span id="sendienceAdminCnt">(0)</span>
						</h5>
					</div>
					<!-- 이름 -->
					
					<ul id="sendienceAdminUl" style="display: block;">
					
						<li>
							<div class="photo">
								<img src="./img/right_menu/img_photo_null32.png" style="">
							</div>
							<div class="username" id="menu_profile">
								<a href="#">이름이름이름이름이름</a>
							</div>
							<div class="btn_right">
								<a class="btn_chat" onclick=""><span class="blind">채팅</span></a>
							</div>
						</li>
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
		<div id="profilePopup" class="prdbx_wrap" style="top: 50%; left: 50%; width: 400px; height: 672px; z-index: 9100; position: fixed; margin-top: -336px; margin-left: -200px; ">
			<div class="prof_bx">
				<div class="prof_thumb">
					<span class="bg"></span>
					<a class="btn_close" id="inviteBoxClose" title="닫기"></a>
					<img id="PRFL_PHTG" src="./img/right_menu/img_photo_null_for_prfl.png" alt="" onerror="this.src='/design2/img_rn/img_photo_null_for_prfl.png'" style="object-fit: cover; height: 400px; width: 400px;">
				</div>
				<div class="prof_info">
					<div class="prof_top">
						<h2>
							<span id="FLNM">박수진</span><span id="JBCL_NM" style="font-size: 20px; color: #969696; margin-left: 10px;"></span>
						</h2>
						<p id="CMNM">BAO</p>
						<a id="EDIT" class="ico_mod" style="display: none;"></a>
					</div>
					<div class="prof_cn">
						<p id="EML" style="visibility: visible;">sjin0425@naver.com</p>
						<p id="CLPH_NO" style="visibility: hidden;"></p>
						<p id="CMPN_TLPH_NO" style="visibility: hidden;"></p>
					</div>
					<div class="prof_btn">
						<a id="CHAT" class="btn_prd_sty1_b" onclick="go_pop()"><span>채팅하기</span></a>
						<a id="PROFILE_EDIT" class="btn_prd_sty1" style=""><span style="color: #28272c">프로필 수정</span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 초대하기 -->
	<div id="invite_div" class="modal"> 
	  <div class="invite_popup" style="    width: 500px;
    		height: 620px;
  			z-index: 1100;
    		position: fixed;
    		top: 50%;
    		left: 50%;
    		margin-top: -310px;
    		margin-left: -250px;">
		<div class="invite_divdefault" style="display:block; ">
		<div id="invite_top">
			<div id="invitePrjname"><h1>프로젝트이름</h1></div>
			<div id="inviteboxclose" title="닫기"></div>
		</div>
		
		<div id="invite_sub">
			<ul>
				<li><span class="ico ico1"></span><p class="tit">팀, 직원 동료 초대</p> <p class="txt">회사 직원 또는 조직도를 확인하고 초대할 수 있습니다.</p></li>
				<li><span class="ico ico2"></span><p class="tit">프로젝트 참여자</p> <p class="txt">프로젝트를 함께 했던 사람을 초대할 수 있습니다. </p></li>
				<li><span class="ico ico3"></span><p class="tit">이메일로 초대장 발송 </p> <p class="txt">초대장을 이메일로 발송할 수 있습니다.</p></li>
				<li><span class="ico ico4"></span><p class="tit">초대링크</p> <p class="txt">http://123456123456.123456</p></li>
			</ul>
		</div>
	 </div>
	 </div>
	</div>		

	<!-- 파일함 -->
	<div id="filebox_div" class="modal">
	
	</div>
	
	<!-- 전체보기 팝업창 -->
	<div id="part_member" class="modal">
	<div>아아아아아</div>
	
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
			btn = document.getElementById('allView');
			
			btn.onclick = function() {
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