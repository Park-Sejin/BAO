<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/content.css" rel="stylesheet" type="text/css">



</head>
<body>
	<jsp:include page="default/LeftHeader.jsp"></jsp:include>
	<jsp:include page="default/top3.jsp"></jsp:include>
		
		
		
	<article>
		<div class="content">
			<div>
				<div class="left">
					<span>전체</span><span>(0)</span>
				</div>
				<div class="right">
					<a class="myset">설정</a> | <a class="myset">편집</a>
				</div>
			</div>
			<div class="btn_pj_work">
				<a href="#" id="myBtn">프로젝트 만들기</a>
			</div>
			
			<!-- The Modal -->
			<div id="myModal" class="modal">
			  <!-- Modal content -->
			  <div class="modal-content">
			  	<div class="modal_sec1">
				  	<span class="close">&times;</span>
				  	<div>프로젝트 만들기</div>
			  	
			  	</div>
			  	<div class="modal_sec2">
			  		<div>
			  			<div class="bbb">프로젝트명</div>
			  			<form action="">
			  				<input type="text" size="65" class="sec2_txt" placeholder="프로젝트명 입력(최대 50자)">
			  			
				  			<br><Br>
				  			
				  			<div class="bbb">참여자 옵션</div>
				  			<input type="radio" name="rd1" value="1"><span class="rd_sp">초대된 사람만</span>
				  			<input type="radio" name="rd1" value="2"><span class="rd_sp">전체직원 초대(자동관리)</span>
				  			<div class="bbb2">프로젝트 생성 후에는 '참여자 옵션' 변경이 불가능합니다.</div>
				  			<br>
				  			<hr>
				  			<Br>
				  			
				  			<input type="submit" value="만들기" class="modal_submit">
			  				<input type="button" value="취소" class="modal_btn">
			  			</form>
			  		</div>
			  	</div>
			    
			  </div>
			</div>
			<!-- /The Modal -->
			<!-- modal script -->
			<script>
			// Get the modal
			var modal = document.getElementById('myModal');
			
			// Get the button that opens the modal
			var btn = document.getElementById("myBtn");
			
			// Get the <span> element that closes the modal
			var span = document.getElementsByClassName("close")[0];
			
			var btn2 = document.getElementsByClassName("modal_btn")[0];
			
			// When the user clicks the button, open the modal 
			btn.onclick = function() {
			    modal.style.display = "block";
			}
			
			// When the user clicks on <span> (x), close the modal
			span.onclick = function() {
			    modal.style.display = "none";
			}
			
			btn2.onclick = function() {
				modal.style.display = "none";
			}
			
			// When the user clicks anywhere outside of the modal, close it
			window.onclick = function(event) {
			    if (event.target == modal) {
			        modal.style.display = "none";
			    }
			}
			</script>
			<!-- /modal script -->
			
			<div class="collabo_list">
				<div class="collabo_title">
					<a class="star"></a>
					<p class="collabo_title_txt">
						<a>업무공유방</a> <span class="big_num">3</span>
					</p>
				</div>
				<div class="right">
					<span class="ico_comy"></span>
				</div>
				<div class="folow_user_list">
					<div>
						<span class="rd_li">엄재철</span> 
						<span class="rd_li">여준혁</span>
						<span class="rd_li">이미진</span> 
						<span class="rd_li">박수진</span> 
						<span class="rd_li">류수재</span>
					</div>
					<div class="userli_num">
						<strong>박수진</strong>님 외 5명
					</div>
				</div>
			</div>
			<a class="btn_btmfix">1:1문의</a>
	
		</div>

	</article>

</body>
</html>