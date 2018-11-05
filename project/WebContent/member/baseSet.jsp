<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		//수정버튼숨기기
		$("#pro_table").find("input[type=button]").hide();
		
		//마우스올리면 배경색변경
		$("#pro_table").find("input[type=text]").mouseover(function(){
			 $(this).css('background-color', '#EEE');
		}).mouseout(function(){
			 $(this).css('background-color', 'rgba( 255, 255, 255, 0 )');
		});
		
		//회원정보 가져오기
		var email = document.getElementsByName("email")[0].value;
		var name = document.getElementsByName("name")[0].value;
		var mobile = document.getElementsByName("mobile")[0].value;
		var team = document.getElementsByName("team")[0].value;
		var part = document.getElementsByName("part")[0].value;
		var position = document.getElementsByName("position")[0].value;
		var phone = document.getElementsByName("phone")[0].value;
		
		
		//입력창선택하면 배경색 사라지고 수정버튼보이기
		$("#pro_table").find("input[type=text]").on('click',function(){
			$(this).css('background-color', 'rgba( 255, 255, 255, 0 )');
			var thisBtn = $(this).siblings("input[type=button]");
			$("#pro_table").find("input[type=button]").not(thisBtn).hide();
			thisBtn.show();
			
			//현재입력창이외에 작성하여 수정하지않은 항목은 기존 값으로 되돌리기
			$("#saveName").prev("input[type=text]").val(name);
			$("#saveMobile").prev("input[type=text]").val(mobile);
			$("#saveTeam").prev("input[type=text]").val(team);
			$("#savePart").prev("input[type=text]").val(part);
			$("#savePosition").prev("input[type=text]").val(position);
			$("#savePhone").prev("input[type=text]").val(phone);
		});
		
	});
	
	//취소버튼
	function closed(){
		//수정버튼 숨기기
		$("#pro_table").find("input[type=button]").hide();
		
		//기존값불러오기
		/* $("#saveName").prev("input[type=text]").val(name);
		$("#saveMobile").prev("input[type=text]").val(mobile);
		$("#saveTeam").prev("input[type=text]").val(team);
		$("#savePart").prev("input[type=text]").val(part);
		$("#savePosition").prev("input[type=text]").val(position);
		$("#savePhone").prev("input[type=text]").val(phone); */
	
	}
	
	//전화번호 자동하이픈
	function autoHypenPhone(str){
            str = str.replace(/[^0-9]/g, '');
            var tmp = '';
            if( str.length < 4){
                return str;
            }else if(str.length < 7){
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3);
                return tmp;
            }else if(str.length < 11){
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3, 3);
                tmp += '-';
                tmp += str.substr(6);
                return tmp;
            }else{              
                tmp += str.substr(0, 3);
                tmp += '-';
                tmp += str.substr(3, 4);
                tmp += '-';
                tmp += str.substr(7);
                return tmp;
            }
            return str;
        }
		//핸드폰번호
		var mobilePhone = document.getElementsByName("mobile")[0];
		mobilePhone.onkeyup = function(event){
	        event = event || window.event;
	        var _val = this.value.trim();
	        this.value = autoHypenPhone(_val);
		}
		//회사번호
		var cellPhone = document.getElementsByName("phone")[0];
		cellPhone.onkeyup = function(event){
	        event = event || window.event;
	        var _val = this.value.trim();
	        this.value = autoHypenPhone(_val);
		}

		
	//회원정보수정
	function save(){
		//수정된 정보 가져오기
		email = document.getElementsByName("email")[0].value;
		name = document.getElementsByName("name")[0].value;
		mobile = document.getElementsByName("mobile")[0].value;
		team = document.getElementsByName("team")[0].value;
		part = document.getElementsByName("part")[0].value;
		position = document.getElementsByName("position")[0].value;
		phone = document.getElementsByName("phone")[0].value;
	
		$.ajax({
			type : "POST",
			url : "./member/setMember.jsp",
			data:{
				"email":email,
				"name":name,
				"mobile":mobile,
				"team":team,
				"part":part,
				"position":position,
				"phone":phone
			},
			dataType : "text",
			error : function(){
				alert('통신실패!!');
			},
			success : function(data){
				//수정버튼 숨기기
				$("#pro_table").find("input[type=button]").hide();
			}
		}); 
	}
	
	//프로필 사진 업로드(이미지 선택 시 동작)
	$("#file").change(function(){
		var form = $("#file_form")[0];
		var formData = new FormData(form);
		var file = $("#file")[0].files[0];
		formData.append("file", file);
		formData.append("email", document.getElementsByName("email")[0].value);
			   
		$.ajax({
			url: "./ImageUpload.me",
			type: "POST",
			data: formData,
			processData: false,
			contentType: false,
			enctype: "multipart/form-data",
			error : function(){0
			alert('통신실패!!');
			},
			success: function(result){
				$("#image").attr("src","./upload/"+result);
				$("#text").html("사진이 수정되었습니다");
			}
		});
	});
	
   

</script>
</head>
<body>
	<h1>계정 기본 정보</h1>
	<%
		String email = (String)request.getAttribute("email");
		String name = (String)request.getAttribute("name");
		String mobile = (String)request.getAttribute("mobile");
		String team = (String)request.getAttribute("team");
		String part = (String)request.getAttribute("part");
		String position = (String)request.getAttribute("position");
		String phone = (String)request.getAttribute("phone");
		String image = (String)request.getAttribute("image");
	%>
	<div id="profile">
		<h3>내 프로필</h3><br>
      	<div id="userPhoto">
 	    	<form id="file_form" method="POST" enctype="multipart/form-data" action="">
    	    <input type="file" id="file" name="file" style="display: none;">
    	    	<%
    	    		if(image == null){
    	    			//db에 저장된 이미지가 없을때 지정된 이미지를 불러준다
    	    			%>
	    				<img src="./img/info/empty_photo.png" name="image" id="image" 
            				onclick="document.all.file.click();">
	    				<%
    	    		} else {
    	    			//db에 저장된 이미지가 있으면 저장된 이미지 불러온다
    	    			%>
    	    				<img src="./upload/<%=image%>" name="image" id="image" 
                				onclick="document.all.file.click();">
    	    			<%
    	    		}
    	    	%>
     	    	<br><div style="color: red" id="text"></div>
     	   </form>
     	</div>
		<table id="pro_table">
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="name" value="<%=name %>" >
					<input type="button" value="저장" id="saveName" onclick="save()">
					<input type="button" value="취소" onclick="closed()">
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" value="<%=email %>" readonly id="email"></td>
			</tr>
			<tr>
				<td>휴대폰번호</td>
				<td>
					<input type="text" name="mobile" value="<%=mobile %>" maxlength="13">
					<input type="button" value="저장" id="saveMobile" onclick="save()">
					<input type="button" value="취소" onclick="closed()">
				</td>
			</tr>
		<!-- </table>
		<table id="pro_table"> -->
			<tr>
				<td>회사 or 팀명</td>
				<td>
					<input type="text" name="team" value="<%=team%>">
					<input type="button" value="저장" id="saveTeam" onclick="save()">
					<input type="button" value="취소" onclick="closed()">
				</td>
			</tr>
			<tr>
				<td>부서명</td>
				<td>
					<input type="text" name="part" value="<%=part%>">
					<input type="button" value="저장" id="savePart" onclick="save()">
					<input type="button" value="취소" onclick="closed()">
				</td>
			</tr>
			<tr>
				<td>직책</td>
				<td>
					<input type="text" name="position" value="<%=position%>">
					<input type="button" value="저장" id="savePosition" onclick="save()">
					<input type="button" value="취소" onclick="closed()">
				</td>
			</tr>
			<tr>
				<td>회사연락처</td>
				<td>
					<input type="text" name="phone" value="<%=phone%>" maxlength="13">
					<input type="button" value="저장" id="savePhone" onclick="save()">
					<input type="button" value="취소" onclick="closed()">
				</td>
			</tr>
		</table>
	</div>
</body>
</html>