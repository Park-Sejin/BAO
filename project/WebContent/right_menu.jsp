<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/right_menu.css" rel="stylesheet">

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


			<div id="projectChat" class="btn_prj_chat_box">
				<a class="btn_prj_chat">프로젝트 채팅</a>
			</div>


			<div class="participant_wrap">
				<div id="JOIN_TITLE" class="aplct_title"
					style="cursor: pointer; display: none;">
					참여요청&nbsp;<img src="/design2/img_rn/ico/ico_new3.png" alt=""><a
						id="JOIN_CNT" style="display: none;"></a>
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
								<img src="img/right_menu/img_photo_null32.png" style="">
							</div>
							<div class="username">
								<a onclick="">이름이름</a>
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
	
</body>
</html>