<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var = "ctp" value = "${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>main.jsp</title>
    <script src="https://kit.fontawesome.com/0989d78570.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>
    	@import url('https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap');
        body {
            margin: 0px;
            padding: 0px;
            font-family: 'Gowun Batang';
        }
        #modal {
        	position : fixed;
        	top : 0px;
        	left : 0px;
        	width : 100%;
        	height : 100%;
        	background-color: rgba(0, 0, 0, 0.5);
        	display : none;
        }
        .content {
        	background-color : white;
        	margin : 200px auto;
        	border : 1px solid rgb(190, 186, 186);
        	border-radius : 12px;
        	width : 400px;
        	height : 390px;
        	text-align: center;
        	font-size: 1.2em;
        	font-weight: bolder;
        	padding : 15px;
        	animation-name : myFade;
        	animation-duration: 0.3s;
        }
        @keyframes myFade {
        	from {opacity : 0}
        	to {opacity : 1}
        }
        
        #modal input[type=text],input[type=password]{
        	border : 0px;
        	outline: none;
        	font-size: 0.9em;
        	position : absolute;
        	top : 7px;
        	left : 35px;
        }
        .idbox, .pwdbox {
        	border : 1px solid rgb(190, 186, 186);
        	border-radius: 5px;
        	margin-top: 30px;
        	height : 37px;
        	text-align: left;
        	padding-left : 10px;
        	position : relative;
        }
        #modal i{
        	position : absolute;
        	top : 7px;
        	left : 8px;
        }
        .loginBtn {
        	border : 0px;
        	border-radius: 25px;
        	width : 100%;
        	height : 40px;
        	background-color: #547abb;
        	margin-top: 20px;
        	margin-bottom: 37px;
        	color : white;
        	font-size: 1em;
        }
    </style>
    <script>
    	'use strict';
    	
    	function modalShow() {
			$('#modal').show();
			$('.idbox input').focus();
    	}
    	
    	window.onclick = function(e) {
    		if(e.target == document.getElementById("modal")) {
    			$('#modal').hide();
    		}
    	}
    </script>
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<jsp:include page="/include/nav.jsp"></jsp:include>
	<div id = "modal">
		<div class = "content">
			<div>로그인</div>
			<div class = "idbox"><i class="fa-solid fa-user" style="color: #547abb;"></i><input type = "text" placeholder = "아이디" autofocus /></div>
			<div class = "pwdbox"><i class="fa-solid fa-lock" style="color: #547abb;"></i><input type = "password" placeholder = "비밀번호"/></div>
			<div style = "margin-top : 20px;">
				<div style = "float: left; font-size:0.8em;"><input type = "checkbox"><span>아이디저장</span></div>
				<div style = "float: right; font-size:0.8em;">아이디/비밀번호찾기</div>
			</div>
			<div style = "clear: both;"><input type = "button" value = "로그인" class = "loginBtn"/></div>
			<div style = "font-size:0.8em">회원이 아니신가요?&nbsp;<span style = "color:rgb(5, 93, 170); font-size:1em">회원가입</span></div>
		</div>
	</div>
</body>
</html>