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
						onClick=" location.href='http://www.naver.com' "><img
						src="img/left_header/ico_schedules.png">&nbsp;&nbsp;전체 일정</td>
				</tr>
				<tr height="40px">
					<td class="LeftMenuTb" id="allfile"><img src="img/left_header/ico_cloudeccb.png">&nbsp;&nbsp;전체 파일</td>
						<!-- The Modal -->
						<div id="inAllfile" class="modal">
			
							<!-- Modal content -->
							<div class="modal-content">
							fdsfds
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