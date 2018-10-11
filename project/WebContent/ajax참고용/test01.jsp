<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
//var value = $('#test_id').val();
//var value = $('.test_class').val();
//var value = $('input[name=test_name]').val();

$(document).ready(function(){
	//$("#bb").click(function(){
	//$("#Na").keypress(function(){
		$("#Na").keyup(function(){
		var id=$("#Na").val();
		$.ajax({
			type:"POST",
			url:"test02.jsp",
			data:{
				"id":id
			},
			success:function(data){
				//if($.trim(data)==-1){
				if(data.trim()==-1){
					$("#Dup").html("중복").css("color","red");
				}else{
					$("#Dup").html("사용가능").css("color","blue");
				}
				/* if(data.trim()!=id){
					$("#Dup").html("사용가능").css("color","blue");
				} */
			}
		});
	});
});


</script>
</head>
<body>
아이디 : <input type="text" id="Na">
<div id="Dup"></div>
<!-- <input type="button" id="bb"> -->

</html>