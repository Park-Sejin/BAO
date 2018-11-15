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
  
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>  
   <script type="text/javascript">
   
   function copyToClipboard(val) {
	   var t = document.createElement("textarea");
	   document.body.appendChild(t);
	   t.value = val;
	   t.select();
	   document.execCommand('copy');
	   document.body.removeChild(t);
	 }
   
	 
   
   function go_pop(){
      /* $(document).ready(function() {
         $('#server_cnt').attr('value',1);
      }); */
      var receive_email = document.getElementById('receive_email').value;
      window.open("./chatPage.chat?receive_email="+receive_email,"new","width=700, height=870, status=no, location=no, directories=no,scrollbars=no;");
      alert("ddd");
   }
   
   function server() {
      window.open("./serverStart.chat","new","width=100, height=100");
   }
      
      
   function chat_pop(){
      window.open("./chatPage.chat","new","width=360, height=700, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
      }
   

   
   function go_pop(){
      var receive_email = document.getElementById('receive_email').value;
      window.open("./chatPage.chat?receive_email="+receive_email,"new","width=700, height=870, status=no, location=no, directories=no,scrollbars=no;");
      }
      
  
   
   function goBack() { /* 이전으로가기  */
       location.href="./main.pr";
   }
   
   function closeWin() {
      part.close();
   }
	
   $(document).ready(function(){
		 $("#teaminvite").click(function(){
			 /* 	alert("teaminvite버튼"); */
				$(".invite_popup").load("#right_menu .invite2_popup");
			});
		 
		 
		 $("#btn_prd_add").click(function(){
			 alert("btn_prd_add");
		 });
		 
		 $("#invitelink").click(function() {			   
			   copyToClipboard('http://localhost:8088/project/5m2Zg4FH5jF5T.pr?num=1');
			   alert("복사완료");
			 });
		 
		
    }); 
   
 
   
    
   
   
   </script>

   <%
      String email = (String) session.getAttribute("email");
      int num = Integer.parseInt(request.getParameter("num"));
      
      
      int mem_num = 0;
      if(request.getParameter("mem_num") != null) {
         mem_num = Integer.parseInt(request.getParameter("mem_num"));
      } 
     
   %>
   <!-- aside -->
   <div id="rightMenuBox">
      <div class="aside_wrap">
         <div>
            <a class="btn_listback" onclick="goBack()">이전화면</a>
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
		 <% ProjectMemberDAO pmdao = new ProjectMemberDAO();
                  List<ProjectMemberBean> arr = new ArrayList<ProjectMemberBean>();
                  arr = pmdao.getProjectMember(num);%>

         <!-- //콜라보설정 -->
         <!-- 참여자목록 -->
         <div class="all_aplct_title">
                       전체 참여자&nbsp;<strong id="sendienceCnt"></strong><a id="allView" style="border: 1px solid black;">전체보기</a>
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
                           <img src="./img/right_menu/img_photo_null32.png" style="radius">
                        </div>
                        <div class="username" id="menu_profile">
                           <a href="Timeline.tl?num=<%=num%>&mem_num=<%=mb.getNum() %>"> <%= mb.getName()%></a>
                           <input type="hidden" id="mem_num" value="<%=mem_num%>">
                          <%--  <input type="hidden" id="mem_num" value="<%=mb.getNum()%>">
                           <a href="" class="a_name"><%= mb.getName()%></a> --%>
                        </div>
                        <div class="btn_right">
                           <a class="btn chat" onclick="go_pop()"><span class="blind">채팅</span></a>
                        </div>
                     </li>
                      <%} %>
                      
                     
                     <!-- 계속해서참여자추가(?) -->


               </ul>

               <!-- title -->
               <div class="part_title sendienceOutsideTitle">
                  <h5>
                     <strong>외부참여자</strong><span id="sendienceOutsideCnt">(외부참여자)</span>
                  </h5>
               </div>
               <!-- 이름 -->
               <ul id="sendienceOutsideUl">
               </ul>
               <!-- title -->
               <div class="part_title sendienceInsideTitle">
                  <h5>
                     <strong>내부참여자</strong><span id="sendienceInsideCnt">(내부참여자)</span>
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
            
            
            <%   ProjectDAO pdao = new ProjectDAO();
            ProjectBean pb = pdao.getProject(num);
            
            MemberDAO p_mdao = new MemberDAO();
            MemberBean p_mb = new MemberBean();
            
                
                if(mem_num != 0) { p_mb = p_mdao.getMember(mem_num); }
                %>
            <div class="prof_info">
               <div class="prof_top">
                  <h2>
                     <span id="FLNM"><%=p_mb.getName() %></span><span id="JBCL_NM"
                        style="font-size: 20px; color: #969696; margin-left: 10px;"></span>
                  </h2>
                  <p id="CMNM"><%=pb.getProName() %></p>
                  <a id="EDIT" class="ico_mod" style="display: none;"></a>
               </div>
               <div class="prof_cn">
                  <p id="EML" style="visibility: visible;"><%=p_mb.getEmail() %></p>
                  <p id="CLPH_NO" style="visibility: hidden;"></p>
                  <p id="CMPN_TLPH_NO" style="visibility: hidden;"></p>
                  <input type="hidden" id="receive_email" value="<%=p_mb.getEmail()%>">
                     <input type="button" value="server" onclick="server()">
               </div>
               <div class="prof_btn">
                  <a id="CHAT" class="btn_prd_sty1_b" onclick="go_pop()"><span>채팅하기</span></a>
                  <a id="PROFILE_EDIT" class="btn_prd_sty1" style=""><span style="color: #28272c">프로필 수정</span></a>
               </div>
            </div>
         </div>
      </div>
   </div>
   

   
   
   <!-- 팝업창 div2  -->
 
   <div id="invite2_div" class="modal">
        <div class="invite2_popup" style="width:500px; height:620px; z-index:1100; position:fixed;" >
        	<div class="prdbx_hd">
        		<!-- 상단 타이틀  -->
        		<div class="prdbx_hd_top">
        			<h1>초대하기</h1>
        			<div class="btn_1" id="inviteboxre"></div>
        			<div class="btn_2" id="inviteboxclose" onclick="document.getElementById('invite_div').style.display='none'"></div>
        		</div>
        		<!-- //상단 타이틀  -->
        		<div class="prdbx_hd_sch" id="invitesrchbox">
        			<div class="prd_prd_schbx_in">
        				<span role="status"></span>
        				<input type="text" placeholder="함께 프로젝트를 진행했었던 사람들을 찾아보세요!">
        			</div>
        		</div>  		
        	</div>   
            <div class="prdbx_cn">
            	<div class="prd_namebx_div">
            		<div class="prd_namebx_inside">
            			<div class="prd_namebx_container">
            			
            				<div class="prd_name_cn"></div>
            				<div class="prd_name_btn"><a class="all_del">전체삭제</a></div>
            			</div>
            		
            		</div>
            	
            	</div>
            <% for(ProjectMemberBean pmb : arr ){
			MemberDAO mdao = new MemberDAO();
			MemberBean mb = mdao.getMember(pmb.getMember_num()); %>
			
			<div class="prdcn_list">
				<ul>
					<li style=" width: 480px; height:63px; border: 1px solid #800080; ">
					<img id="prflImg" src="">
					<div class="prdcn_name"><%=mb.getName() %></div>
					<div class="btn_r"><a id="btn_prd_add">추가</a></div>
					</li>
				</ul>
			
			</div>
			<%}%>
			<button id="check" width:"30px";>버튼</button>
			
			<script>
			
			 $(document).ready(function(){
				 $("#btn_prd_add").click(function(){
					alert("ggg"); 
					
					
				 });
			 });
			
			
			</script>
			
            </div>
            <div class="prdbx_ft">
            	<a class="btn_prd_sty1_b2" id="inviteSelectId">
            		<span>초대</span>
            	</a>
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
                  <li id="teaminvite"><span class="ico ico1"></span><p class="tit">팀, 직원 동료 초대</p>
                     <p class="txt">회사 직원 또는 조직도를 확인하고 초대할 수 있습니다.</p>
                  </li>
                  <li id="alreadyinvite"><span class="ico ico2"></span><p class="tit">프로젝트 참여자</p>
                     <p class="txt">프로젝트를 함께 했던 사람을 초대할 수 있습니다.</p>
                  </li>
                  <li id="inviteemail"><span class="ico ico3"></span><p class="tit">이메일로 초대장 발송</p>
                     <p class="txt">초대장을 이메일로 발송할 수 있습니다.</p>
                  </li>
                  <li id="invitelink"><span class="ico ico4"></span><p class="tit">초대링크</p>
                     <p class="txt"><a>http://localhost:8088/project/5m2Zg4FH5jF5T.pr?num=<%=num %></a></p>
                  </li>
               </ul>
            </div>
         </div>
      </div>
   </div>

   <!-- 파일함 -->
   <div id="filebox_div" class="modal">
      <div id="part_memberPopup" class="AllView_div">
         <div class="layerstyle4_po">
            <div class="layerstyle4_title">
               <!-- style="height: 43px; background-color: #f4f4f4; border-radius: 7px 0;" -->
               <h4 style="padding: 11px 0 0 16px; font-weight: normal;">
                  <span class="icon_url"></span>&nbsp;프로젝트파일
               </h4>
               <a class="btn_layerstyle4_close" onclick="document.getElementById('filebox_div').style.display='none'"
                  style="position: absolute; top: 15px; right: 15px; width: 14px; height: 14px;">
                  <img src="./img/popup/allview_close.png" alt="닫기">
               </a>
            </div>
            
            <div class="layerstyle4_cont">
               <div id="contsearch">
                  <img src="../img/어쩌고저쩌고어쩌고..저쩌고 ㅠㅠㅠㅠㅠ">
                  <input type="text" value="파일명, 등록자명으로 검색이 가능합니다.">
                  <button id="clicktxt">문서</button>
                  <button id="clickimg">이미지</button>
               </div>
               
               <div></div>            
            </div>
         </div>
      </div>
      </div>



   <!-- 전체보기 팝업창 -->
   <div id="part_member" class="modal">
      <div id="part_memberPopup" class="AllView_div">
         <div class="layerstyle4_po">
            <div class="layerstyle4_title">
               <!-- style="height: 43px; background-color: #f4f4f4; border-radius: 7px 0;" -->
               <h4 style="padding: 11px 0 0 16px; font-weight: normal;">
                  <span class="icon_url"></span>&nbsp;프로젝트 참여자
               </h4>
               <a class="btn_layerstyle4_close" onclick="document.getElementById('part_member').style.display='none'"
                  style="position: absolute; top: 15px; right: 15px; width: 14px; height: 14px;">
                  <img src="./img/popup/allview_close.png" alt="닫기">
               </a>


            </div>
            <!-- top -->
            <div class="layerstyle4_cont">
               <div style="margin-right: 14px;">
                  <div class="mcustomScrollbar">
                     <div class="mcustominside">
                        <ul class="mcustominsidepeople">
                           <%
                              for (ProjectMemberBean pmb : arr) {
                              MemberDAO mdao = new MemberDAO();
                              MemberBean mb = mdao.getMember(pmb.getMember_num()); 
                              
                            
                                 
                           %>
                           <li><img style="cursor: pointer; object-fit: cover;" id="insidepeople" src="./img/right_menu/img_photo_null32.png" onerror="this.src='/design2/img_rn/img_photo_null40.png'" >
                           <a id="insidepeoplename"><%=mb.getName() %></a><b>|</b><strong>
                           <% if(pmb.getNum()==1){ %> <span>관리자</span>
                           <%} else{ %> <span>회원</span>
                        	   <%} %>
                           </strong>
                              <div class="AllViewbtn_right">
                                 <a class="btn set" id="moresetting"><span>채팅</span></a>
                              </div></li>
                           <%
                              }
                           %>
                           <!-- <li><img style="cursor: pointer; object-fit: cover;" id="insidepeople" src="./img/right_menu/img_photo_null32.png" onerror="this.src='/design2/img_rn/img_photo_null40.png'" >
                           <span id="insidepeople"></span>
                              <div class="AllViewbtn_right">
                                 <a class="btn set" id="moresetting"><span class="blind"></span></a>
                              </div>
                           </li> --> 

                        </ul>
                     </div>

                  </div>
               </div>
            </div>

         </div>
      </div>
   </div>

   
   
   
         
  

   <!-- profile -->
   <script>
         var profile = document.getElementById('profile_div');
         var btn1 = document.getElementById('menu_profile');
         
         var mem_num = $('#mem_num').val();
         
        <%-- $(document).ready(function() {
             $(".a_name").click(function() {
                var mem_num = $('#mem_num').val(); /* 더 좋은방법... 찾.. */
                alert(mem_num);
               $.ajax({
                  type: "post",
                  url: "./default/timeline.jsp?num="+<%=num%>+"&mem_num="+mem_num,
                  data: {
                     mem_num: $('#mem_num').val()
                  },
                  success: function(data){
                     if(mem_num > 0) {
                          profile.style.display = "block";
                       } 
                  }
               });
            });
            
            
         }); --%>
        
         
        
         if(mem_num > 0) {
           profile.style.display = "block";
        } 
         
         
         btn1.onclick = function() {
            /* $(document).ready(function() {
              $('#receive_email').attr('value',receive_email);
            } */
            
            
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
        
         
         /* 전체보기 팝업창에서 프로필  */
       var test = document.getElementById('profile_div');
       btn5 = document.getElementById('insidepeoplename');
       
       btn5.onclick = function() {
  
          test.style.display="block";
       }
       
       
         
         
         
         // When the user clicks anywhere outside of the modal, close it
         window.onclick = function(event){
             if (event.target == profile) {
                profile.style.display = "none";
                location.href="Timeline.tl?num=<%=num%>"; /* 더 좋은방법....찾.. */
             }else if(event.target == invite){
                invite.style.display = "none";
             }else if(event.target == filebox){
                filebox.style.display = "none";
             }else if(event.target == part){
                part.style.display="none";
             }else if (event.target == test) {
             test.style.display="none";
          }
         } 

         
         
   </script>