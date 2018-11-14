<%@page import="member.db.MemberDAO"%>
<%@page import="project.favorite.db.ProjectFavoriteBean"%>
<%@page import="project.member.db.ProjectMemberBean"%>
<%@page import="project.member.db.ProjectMemberDAO"%>
<%@page import="project.db.ProjectBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/content.css" rel="stylesheet" type="text/css">

<link href="css/top.css" rel="stylesheet"> 
<link href="css/AllView_popup.css" rel="stylesheet"> 
<link href="css/HeaderCss.css" rel="stylesheet"> 



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.starOn').click(function() {
			var id = $(this).attr('id');
			$.ajax({
				type : "POST",
				url : "content/starCheck.jsp",
				data : {
					"star" : "off",
					"idid" : id
				},
				//datatype:"html,json,jsp",  // "key":"value"
				success : function(date) {
					$('#'+id).removeClass("starOn").addClass("starOff");
				}
			});
		});
		$('.starOff').click(function() {
			var id = $(this).attr('id');
			$.ajax({
				type : "POST",
				url : "content/starCheck.jsp",
				data : {
					"star" : "on",
					"idid" : id
				},
				//datatype:"html,json,jsp",  // "key":"value"
				success : function(date) {
					$('#'+id).removeClass("starOff").addClass("starOn");
				}
			});
		});
		
		$('#promain').click(function(){
			$.ajax({
				type : "POST",
				url : "promain.pr",
				success : function(data){
					$('#content').empty();
					$('#content').append(data);
				}
			});
		});
		
		$('#favorite').click(function(){
			$.ajax({
				type : "POST",
				url : "fa.pr",
				success : function(data){
					$('#content').empty();
					$('#content').append(data);
				}
			});
		});
		
/* 		$('#favorite').click(function(){
		$('#div_emt').empty();
		$('#div_emt').load('fa.pr');
		});  */
/* 		$('#promain').click(function(){
			$('#div_emt').empty();
			$('#div_emt').load('promain.pr');
		}); */
		
/* 		$('#myset2').toggle(function() {
			$('#content').css('background-color','rgba(0,0,0,0.4)');
		}); */
	});
</script>

</head>
<body>

	<jsp:include page="../default/top_in.jsp"></jsp:include>
	<jsp:include page="../default/LeftHeader.jsp"></jsp:include>
	<%
		List projectList = (List) request.getAttribute("projectList");
		List projectFavoriteList = (List) request.getAttribute("projectFavoriteList");
		
	%>
	<article id="content">
	<div class="content">
		<div>
			<div class="left">
				<span>프로젝트</span><span><!-- (<projectList.size()%>) -->
				</span>
			</div>
		</div>
		<div class="btn_pj_work" id="myBtn11">
			<a href="#">프로젝트 만들기</a>
		</div>

		<!-- The Modal -->
		<div id="myModal11" class="modal">
			<!-- Modal content -->
			<div class="modal-content">
				<div class="modal_sec1">
					<span class="close">&times;</span>
					<div>프로젝트 만들기</div>

				</div>
				<div class="modal_sec2">
					<div>
						<div class="bbb">프로젝트명</div>
						<form action="./ProjectInsert.pr">
							<!-- 추후 아이디 세션값으로 히든주기 -->
							<input type="text" size="65" class="sec2_txt" placeholder="프로젝트명 입력(최대 50자)" name="proName"> <br>
							<Br>

							<div class="bbb">참여자 옵션</div>
							<input type="radio" name="option" value="1" checked><span
								class="rd_sp">초대된 사람만</span> <input type="radio" name="option"
								value="2"><span class="rd_sp">전체직원 초대(자동관리)</span>
							<div class="bbb2">프로젝트 생성 후에는 '참여자 옵션' 변경이 불가능합니다.</div>
							<br>
							<hr>
							<Br> <input type="submit" value="만들기" class="modal_submit">
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
			var modal11 = document.getElementById('myModal11');

			// Get the button that opens the modal
			var btn11 = document.getElementById("myBtn11");

			// Get the <span> element that closes the modal
			var span = document.getElementsByClassName("close")[0];

			var btn22 = document.getElementsByClassName("modal_btn")[0];

			// When the user clicks the button, open the modal 
			btn11.onclick = function() {
				modal11.style.display = "block";
			}

			// When the user clicks on <span> (x), close the modal
			span.onclick = function() {
				modal11.style.display = "none";
			}

			btn22.onclick = function() {
				modal11.style.display = "none";
			}

			// When the user clicks anywhere outside of the modal, close it
			window.onclick = function(event) {
				if (event.target == modal11) {
					modal11.style.display = "none";
				}
				if (event.target == modal1) {
					modal1.style.display = "none";
				}
				if (event.target == modal2) {
					modal2.style.display = "none";
				}
				if (event.target == modal3) {
					modal3.style.display = "none";
				}
				if (event.target == inAllfile) {
					inAllfile.style.display = "none";
				}
			}
		</script>
		<!-- /modal script -->
		<div id="div_emt">
		<%
			for (int i = 0; i < projectList.size(); i++) {
				ProjectBean pb = (ProjectBean) projectList.get(i);
				int num = pb.getNum();
				String content = pb.getProName();
				if (content.length() > 40) {
					content = content.substring(0, 40);
				}
				ProjectMemberDAO pmdao = new ProjectMemberDAO();
				pmdao.getProjectMember(num);
				MemberDAO mdao = new MemberDAO();
				int memNum = mdao.searchID(pb.getId());
				String masterName = mdao.getName(memNum);
				//1부터 7까지 랜덤으로 출력되는 값구하기
				int random = (int)Math.floor(Math.random()*6)+1;
				String color = "";

				switch(random) {
				   case 1 : color = "#eeac44"; break;
				   case 2 : color = "#ee6d66"; break;
				   case 3 : color = "#746fcc"; break;
				   case 4 : color = "#8d8e90"; break;
				   case 5 : color = "#16c79e"; break;
				   case 6 : color = "#5593e7"; break;
				}

		%>
		<div class="collabo_list">
			<div class="collabo_title" style="background-color: <%=color %>">
				<%
					for(int j = 0; j < projectFavoriteList.size(); j++){
						ProjectFavoriteBean pfb = (ProjectFavoriteBean)projectFavoriteList.get(j);
						int proNum = pfb.getProNum();
						if(proNum == num){
							if(pfb.getFavorite() == 1){
				%>
					<a class="starOn" id="<%=num%>"></a>
				<%
							}else{
				%>
					<a class="starOff" id="<%=num%>"></a>
				<%
							}
						}
					} 
				%>
				<p class="collabo_title_txt">
					<a href="timeline.tl?num=<%=num%>"><%=content%></a> <span class="big_num">123?</span>
				</p>
			</div>
			<div class="folow_user_list">
				<div>
					<%
						for (int j = 0; j < pmdao.getProjectMember(num).size(); j++) {
								ProjectMemberBean pmb = (ProjectMemberBean) pmdao.getProjectMember(num).get(j);
								String name = mdao.getName(pmb.getMember_num());
					%>
					<span class="rd_li"><%=name %></span>
					<%
						}
					%>
				</div>
				<div class="userli_num">
					<strong><%=masterName%></strong>님 외
					<%=pmdao.getProjectMember(num).size() - 1%>명
				</div>
			</div>
		</div>
		<%
			}
		%>
		</div>
		
		<a class="btn_btmfix">1:1문의</a>
	</div>
	</article>

</body>
</html>