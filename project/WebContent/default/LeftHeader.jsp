<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<link href="./css/filebox.css" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#file1").click(function() {
			$("#filebox_cont").load("#LeftHeader #file_detail_view div");

		});
	});

	/*  $(document).ready(function(){
	  $("p").click(function(){
	      $(this).hide();
	  });
	}); */
</script>

<div class="LeftHeaderBody">
	<div class="LeftHeaderSub">
		<table width="200px">
			<tr height="40px">
				<td id="promain" class="LeftMenuTb" onClick=""><img
					src="img/left_header/ico_cb_alleccb.png">&nbsp;&nbsp;전체</td>
			</tr>
			<tr height="40px">
				<td class="LeftMenuTb" onClick=" location.href='#' "><img
					src="img/left_header/ico_cb_nsorteccb.png">&nbsp;&nbsp;미보관</td>
			</tr>
			<tr height="40px">
				<td id="favorite" class="LeftMenuTb"><img
					src="img/left_header/ico_cb_importeccb.png">&nbsp;&nbsp;중요</td>
			</tr>
			<tr height="40px">
				<td class="LeftMenuTb" onClick=" location.href='#' "><img
					src="img/left_header/ico_cb_unreadeccb.png">&nbsp;&nbsp;읽지않음
				</td>
			</tr>
			<tr height="40px">
				<td style="border-bottom: 1px solid #D5D5D5"></td>
			</tr>
		</table>
		<table width="200px">
			<tr>
				<td style="font-size: 14px; color: #8C8C8C; text-align: left;">
					<br>모아보기
				</td>
			</tr>
			<tr height="40px">
				<td class="LeftMenuTb" onClick=" location.href='#' "><img
					src="img/left_header/ico_workreportc4ca.png">&nbsp;&nbsp;전체
					업무</td>
			</tr>
			<tr height="40px">
				<td class="LeftMenuTb" onClick=" location.href='./calendar.pr' "><img
					src="img/left_header/ico_schedules.png">&nbsp;&nbsp;전체 일정</td>
			</tr>
			<tr height="40px">
				<td class="LeftMenuTb" id="allfile"><img
					src="img/left_header/ico_cloudeccb.png">&nbsp;&nbsp;전체 파일</td>
				<!-- The Modal -->
				<div id="inAllfile" class="modal">
					<!-- Modal content -->
					<div class="file-content">
						<div class="file-top">
							<span>전체 파일</span>
						</div>
						<div class="file-bottom">
							<div>
								<div class="box1"></div>
								<img src="./img/top_header/if_icon-111-search_314478.png"
									width="25" id="file_search"> <input type="text" size="55"
									style="margin-left: 5px; line-height: 20px; outline: none; border: none; position: relative; top: -27px; left: 22px;">
								<a href="#" id="file_button">문서</a> <a href="#"
									id="image_button">이미지</a>
							</div>
							<div id="filebox_cont">
								<div>
									<select class="file_select">
						<option>참여중인 프로젝트의 전체파일</option>
										<option>내가 올린 파일</option>
										<option>내가 지정되어 공유된 파일</option>
									</select> <a href="#" id="file_download">내려받기</a>
								</div>
								<div class="file_zone">
									<div class="zone_top">
										<span>파일명</span> <span>등록정보</span>
									</div>
									<div>
										<ul>
											<a id="file1">파일1</a>
										</ul>
										<ul>
											<a class="file2">파일2</a>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div id="file_detail_view" class="modal">
					<div id="file_detail_view_default">
						<dl>
							<dt>
								<a class="outleft" onclick="goBack()">목록으로</a>
							</dt>

							<dd>
								<a id="gotopostBtn1" class="gowork"
									style="margin-bottom: 10px; margin-top: 10px;"> 이곳을 클릭하여 해당
									글로 이동할 수 있습니다.</a>
							</dd>
							<dd class="fdv_cont">
								<div class="left">
									<img src="">
								</div>
								<div class="right">
									<div class="filedbtn">
										<a class="download">다운로드</a>
									</div>
								</div>
							</dd>

							<dd class="fdv_ft">
								<div class="left" id="f_d_rgsr_nm">
									등록자&nbsp;:&nbsp;박수진(tnwls7514@hanmail.net)&nbsp;<span
										class="txt_gray">|&nbsp; </span>
								</div>
								<div class="right" id="f_d_rgsn_dttm">등록일자&nbsp;:&nbsp;2018-11-12 19:31</div>
							</dd>
						</dl>
						<dl>
							<dt>
								<span class="bul down">공유된 프로젝트</span>
							</dt>
							<dd class="list_scroll_bx" id="f_d_share_colabo">
								<ul>
									<li><span>ssss</span>
									<div style="padding-right: 10px; display: inline-block; width: 90px; font-size: 12px; vertical-align: middle; position: absolute; right: 25px;">
											<a id="goToPostBtn2"
												style="color: #656565; font-size: 14px; font-style: italic; overflow: visible; white-space: nowrap;">글
												바로가기 &gt;&gt;</a>
										</div></li>
								</ul>
							</dd>
						</dl>

					</div>
				</div>



				

				<script>
					function goBack() { /* 이전으로가기  */
						window.history.back();
					}
					// Get the modal
					var inAllfile = document.getElementById("inAllfile");

					// Get the button that opens the modal
					var allfile = document.getElementById("allfile");

					// When the user clicks the button, open the modal 
					allfile.onclick = function() {
						inAllfile.style.display = "block";
					}
				</script>
			</tr>
			<tr height="40px">
				<td class="LeftMenuTb" onClick=" location.href='#' "><img
					src="img/left_header/ico_bookmarkeccb.png">&nbsp;&nbsp;담아둔 글
				</td>
			</tr>
			<tr height="40px">
				<td class="LeftMenuTb" onClick=" location.href='#' "><img
					src="img/left_header/ico_my.png">&nbsp;&nbsp;나를 지정</td>
			</tr>
			<tr height="40px">
				<td style="border-bottom: 1px solid #D5D5D5"></td>
			</tr>
		</table>
		<table width="200px">
			<tr>
				<td style="font-size: 14px; color: #8C8C8C; text-align: left;">
					<br>보관함<input type="button"
					style="background: url(btn_lnbfolder_plus_offc4ca.gif) no-repeat; width: 14px; height: 14px; border: none; cursor: pointer;">
				</td>
			</tr>
		</table>
	</div>
</div>