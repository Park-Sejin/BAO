<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LeftHeader</title>
<link href="css/HeaderCss.css" rel="stylesheet">
<link href="css/content.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div class="LeftHeaderBody">
		<div class="LeftHeaderSub">
			<table width="200px">
				<tr height="40px">
					<td id = "promain"
						class="LeftMenuTb"
						onClick=""><img
						src="img/left_header/ico_cb_alleccb.png">&nbsp;&nbsp;전체</td>
				</tr>
				<tr height="40px">
					<td class="LeftMenuTb"
						onClick=" location.href='http://www.naver.com' "><img
						src="img/left_header/ico_cb_nsorteccb.png">&nbsp;&nbsp;미보관</td>
				</tr>
				<tr height="40px">
					<td id = "favorite"
					
					
					
					
					
					
						class="LeftMenuTb"
						><img
						src="img/left_header/ico_cb_importeccb.png">&nbsp;&nbsp;중요</td>
				</tr>
				<tr height="40px">
					<td class="LeftMenuTb"
						onClick=" location.href='http://www.naver.com' "><img
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
					<td class="LeftMenuTb"
						onClick=" location.href='http://www.naver.com' "><img
						src="img/left_header/ico_workreportc4ca.png">&nbsp;&nbsp;전체
						업무</td>
				</tr>
				<tr height="40px">
					<td class="LeftMenuTb"
						onClick=" location.href='./calendar.pr' "><img
						src="img/left_header/ico_schedules.png">&nbsp;&nbsp;전체 일정</td>
				</tr>
				<tr height="40px">
					<td class="LeftMenuTb" id="allfile"><img src="img/left_header/ico_cloudeccb.png">&nbsp;&nbsp;전체 파일</td>
						<!-- The Modal -->
						<div id="inAllfile" class="modal">
			
							<!-- Modal content -->
							<div class="file-content">
								<div class="file-top">
									<span>전체 파일</span>
								</div>
								<div class="file-bottom">
									<div>
										<div class="box1">
										</div>
										<img src="./img/top_header/if_icon-111-search_314478.png" width="25" id="file_search">
										<input type="text" size="55"
											style=" margin-left:5px;  line-height: 20px;  outline: none; border: none; position: relative; top: -27px; left: 22px;">
										<a href="#" id="file_button">문서</a>
										<a href="#" id="image_button">이미지</a>
									</div>
									<div>
										<select class="file_select">
											<option>참여중인 프로젝트의 전체파일</option>
											<option>내가 올린 파일</option>
											<option>내가 지정되어 공유된 파일</option>
										</select>
										<a href="#" id="file_download">내려받기</a>
									</div>
									<div class="file_zone">
										<div class="zone_top"><span>파일명</span> <span>등록정보</span></div>
										
									</div>
								</div>
							</div>
						</div>
							<script>
							// Get the modal
								var inAllfile = document.getElementById('inAllfile');
	
								// Get the button that opens the modal
								var allfile = document.getElementById("allfile");
	
								// When the user clicks the button, open the modal 
								allfile.onclick = function() {
									inAllfile.style.display = "block";
								}
							</script>
							
				</tr>
				<tr height="40px">
					<td class="LeftMenuTb"
						onClick=" location.href='http://www.naver.com' "><img
						src="img/left_header/ico_bookmarkeccb.png">&nbsp;&nbsp;담아둔 글
					</td>
				</tr>
				<tr height="40px">
					<td class="LeftMenuTb"
						onClick=" location.href='http://www.naver.com' "><img
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
</body>
</html>