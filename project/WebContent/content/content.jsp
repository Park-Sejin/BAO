<%@page import="project.member.db.ProjectMemberBean"%>
<%@page import="project.member.db.ProjectMemberDAO"%>
<%@page import="project.db.ProjectBean"%>
<%@page import="java.util.List"%>
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
	<jsp:include page="../default/LeftHeader.jsp"></jsp:include>
	<jsp:include page="../default/top3.jsp"></jsp:include>
	
	<%
		List projectList = (List)request.getAttribute("projectList");
	
	
	%>
		
		
		
	<article>
		<div class="content">
			<div>
				<div class="left">
					<span>전체</span><span>(<%=projectList.size() %>)</span>
				</div>
				<div class="right">
					<a class="myset">설정</a> | <a class="myset">편집</a>
				</div>
			</div>
			<div class="btn_pj_work" id="myBtn">
				<a href="#">프로젝트 만들기</a>
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
			  			<form action="./ProjectInsert.pr">
			  				<!-- 추후 아이디 세션값으로 히든주기 -->
			  				<input type="text" size="65" class="sec2_txt" placeholder="프로젝트명 입력(최대 50자)" name="proName">
			  			
				  			<br><Br>
				  			
				  			<div class="bbb">참여자 옵션</div>
				  			<input type="radio" name="option" value="1" checked><span class="rd_sp">초대된 사람만</span>
				  			<input type="radio" name="option" value="2"><span class="rd_sp">전체직원 초대(자동관리)</span>
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
			
			<%
				for(int i=0; i<projectList.size(); i++){
					ProjectBean pb = (ProjectBean)projectList.get(i);
					int num = pb.getNum();
					String content = pb.getProName();
					if(content.length() > 40){
						content = content.substring(0, 40);
					}
					ProjectMemberDAO pmdao = new ProjectMemberDAO();
					pmdao.getProjectMember(num);
			%>
				<div class="collabo_list">
					<div class="collabo_title">
						<a class="star"></a>
						<p class="collabo_title_txt">
							<a><%=content %></a> <span class="big_num">123?</span>
						</p>
					</div>
					<div class="folow_user_list">
						<div>
						<%
						for(int j=0; j<pmdao.getProjectMember(num).size(); j++){
							ProjectMemberBean pmb = (ProjectMemberBean)pmdao.getProjectMember(num).get(j);
						%>
							<span class="rd_li"><%=pmb.getMember_name() %></span>
						<%
						}
						%>
						</div>
						<div class="userli_num">
							<strong><%=pb.getId() %></strong>님 외 <%=pmdao.getProjectMember(num).size()-1 %>명
						</div>
					</div>
				</div>
			<%
				} 
			%>
			
			<a class="btn_btmfix">1:1문의</a>
	
		</div>

	</article>

</body>
</html>