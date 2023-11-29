<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var = "ctp" value = "${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>myInfo.jsp</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/0989d78570.js" crossorigin="anonymous"></script>
	<style>
		.container {
			width : 800px;
			margin : 30px auto;
			font-weight: bold;
		}
		.head {
			font-size: 1.3em;
			font-weight: bolder;
			margin-bottom: 10px;
		}
		.line {
			border-top:1px solid #e0e0e0;
			margin-bottom: 20px;
		}
		.profile {
			border: 2px solid #e0e0e0;
			border-radius: 6px;
			margin-bottom: 20px;
		}
		.profile .title {
			height : 50px;
			border-bottom: 1px solid #e0e0e0;
			line-height: 2.8em;
    		padding-left: 20px;
    		font-size: 1.1em;
		}
		.profile .imgBox {
			height : 160px;
			background-color: #f1f1f1;
			position : relative;
		}
		.profile .imgBox .img {
			position : absolute;
			width : 120px;
			height : 120px;
			border-radius: 120px;
			left : 20px;
			top : 20px;
			background: linear-gradient(to bottom right,#9dacd9, #3f59c7);
		}
		.profile .imgBox .img img {
			width : 120px;
			height : 120px;
			border-radius: 120px;
		}
		.profile .imgBox span {
			position : absolute;
			top : 40px;
			left : 180px;
		}
		.profile .imgBox span i {
			cursor : pointer;
		}
		.profile .imgBox .pencil {
			position : absolute;
			width : 25px;
			height : 25px;
			border : 2px solid white;
			border-radius : 25px;
			left : 103px;
			top : 111px;
			background : linear-gradient(to bottom right,#9dacd9, #3f59c7);
		}
		.profile .imgBox .pencil img {
			width : 25px;
			height : 25px;
			border-radius : 25px;
		}
		.profile .imgBox #nickChange {
			display : none;
			position : absolute;
			left : 179px;
			top : 100px;
		}
		.profile .imgBox #invalidMsg {
			position : absolute;
			left : 181px;
			top : 130px;
			color : red;
			font-size: 0.8em;
		}
		.profile #nickChange input[type=text] {
			border : 1px solid rgb(190, 190, 190);
			border-radius: 5px;
			height : 25px;
			padding : 0px 5px 0px 5px;
			padding-left : 4px;
			outline : none;
			font-weight : bold;
			font-family: 'Gowun Batang';
		}
		.profile #nickChange input[type=button] {
			border : 1px solid rgb(190, 190, 190);
			border-radius: 5px;
			height : 27px;
			padding : 0px 10px 0px 10px;
			background : linear-gradient(to bottom, #aeb7d1, #5f6ca7);
			font-family: 'Gowun Batang';
			color : white;
			cursor : pointer;
		}
		.profile #nickChange input[type=button]:hover {
			box-shadow: 0px 0px 4px 1px #aeb7d1;
		}
		.info {
			border: 2px solid #e0e0e0;
			border-radius: 6px;
			margin-bottom: 20px;
		}
		.info .title{
			height : 50px;
			border-bottom: 1px solid #e0e0e0;
			line-height: 2.8em;
    		padding-left: 20px;
    		font-size: 1.1em;
		}
		.info .tr:hover {
			background-color: #f1f1f1;
		}
		.info .tr:hover input {
			background-color: #f1f1f1;
		}
		.info .tr:hover .pencil {
			display : inline-block;
			cursor : pointer;
		}
		.info .th, .info .td {
			display: inline-block;
			padding : 10px;
		}
		.info .th {
			width : 17%;
			padding-left: 20px;
		}
		.info .td {
			width : 75%;
			position : relative;
		}
		.info .td #phoneInvalid, .info .td #nameInvalid {
			position : absolute;
			left : 207px;
		}
		.info .td input {
			border : 0px;
			outline: none;
			font-family: 'Gowun Batang';
			font-weight: bold;
			font-size : 1em;
			padding : 0px;
		}
		.info .pencil {
			display : none;
			position : absolute;
			right : 0px;
			top : 20px;
		}
		.info .check {
			display : none;
			position : absolute;
			right : 0px;
			top : 15px;
			cursor : pointer;
		}
		.account {
			border: 2px solid #e0e0e0;
			border-radius: 6px;
			margin-bottom: 20px;
		}
		.account .title {
			height : 50px;
			border-bottom: 1px solid #e0e0e0;
			line-height: 2.8em;
    		padding-left: 20px;
    		font-size: 1.1em;
		}
		.account .th {
			padding: 10px 10px 10px 20px;
		}
		.account a {
			color : rgb(55, 55, 155);
		}
	</style>
	<script>
		'use strict';
		
		let originalPhone = "${vo.phone}";
		let originalName = "${vo.name}";
		let originalNickName = "${vo.nickName}";
		
		let nickNameFlag = false;
		let nameFlag = false;
		
		$(function() {
			// 수정 버튼 처리
			$('.pencil').click(function() {
				$(this).hide();
				$(this).next().show();
				$(this).prev().removeAttr("readonly");
				$(this).prev().css("background-color","#f1f1f1");
				$(this).prev().css("border","1px solid #e0e0e0");
				$(this).prev().focus();
			});
			$('.check').click(function() {
				$(this).hide();
				$(this).prev().show();
				$(this).prev().prev().attr("readonly","true");
				$(this).prev().prev().css("background-color","");	// 배경색 제거
				$(this).prev().prev().css("border","0px");
			});
			$('#changeNick').click(function() {
				if($('#nickChange').is(':visible')) $('#nickChange').hide();
				else $('#nickChange').show();
			});
			$('#nickName').keyup(function() {
				nickfunction();
			});
			$('#phone').keyup(function() {
				
			});
			$('#name').keyup(function() {
				namefunction();
			});
			
		});
		
		// 닉네임 유효성 검사 후 서버 전송(업데이트 처리)
		function nickNameChange() {
			nickfunction();
			
			if(nickNameFlag == true) {
				$.ajax({
					url : "nickUpdate.mem",
					type : "post",
					data : {nickName : $('#nickName').val()},
					success : function(res) {
						if(res != "0") {
							alert("닉네임이 수정되었습니다.");
							location.reload();
						}
						else alert("수정 실패");
					},
					error : function() {
						alert("전송오류");
					}
				});
			}
		}
		
		// 닉네임체크 유효성 검사
		function nickfunction() {
			let regNickName = /^[a-zA-Z0-9가-힣]{2,15}$/;
			
			if(!regNickName.test($('#nickName').val())) {
				$('#invalidMsg').css("color","red");
  				$('#invalidMsg').html("닉네임이 형식에 맞지 않습니다.");
				nickNameFlag = false;
  			}
			else if($('#nickName').val() == originalNickName) {
				$('#invalidMsg').css("color","red");
				$('#invalidMsg').html("기존 닉네임과 동일합니다");
				nickNameFlag = false;
			}
  			else {
            	$.ajax({
            		url : "nickCheck.mem",
            		type : "post",
            		data : {nickName : $('#nickName').val()},
            		success : function(res) {
            			if(res != "1") {
            				$('#invalidMsg').css("color","red");
            				$('#invalidMsg').html("이미 존재하는 닉네임입니다.");
            				nickNameFlag = false;
            			}
            			else {
            				$('#invalidMsg').css("color","green");
            				$('#invalidMsg').html("사용가능한 닉네임 입니다.");
            		        nickNameFlag = true;
            			}
            		},
            		error : function() {
            			alert("전송오류");
            		}
            	});
            }
		}
		
		function namefunction() {
			let regName = /^[가-힣]{1,20}$/;
			
			if(!regName.test($('#name').val())) {
				$('#nameInvalid').html("이름이 형식에 맞지 않습니다.");
				nameFlag = false;
         	}
         	else {
         		$('#nameInvalid').html("");
				nameFlag = true;
        	}
		}
		
	</script>
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<jsp:include page="/include/nav.jsp"></jsp:include>
	
	<div class = "container">
		<div class = "head">나의정보</div>
		<div class = "line"></div>
		<div class = "profile">
			<div class = "title">프로필</div>
			<div class = "imgBox">
				<div class = "img"><img src = "${ctp}/images/profile/${sProfile}" /></div>
				<div class = "pencil"><img src = "${ctp}/images/util/pencil.jpg" /></div>
				<span>
					등급 : (${strLevel})<br/>닉네임 : ${vo.nickName}
					<i class="fa-regular fa-pen-to-square" id = "changeNick" style="color: #5875a7;"></i>
				</span>
				<div id = "nickChange">
					<input type = "text" id = "nickName" value = "${vo.nickName}" />
					<input type = "button" onclick = "nickNameChange()" value = "닉네임변경" />
				</div>
				<div id = "invalidMsg"></div>
			</div>
		</div>
		<div class = "info">
			<div class = "title">
				<div style = "display : inline-block; width : 45%">개인정보</div>
				<div style = "display : inline-block; width : 52%; text-align: right; font-size : 0.8em">정보공개<input type = "checkbox" ${vo.userInfo == 'y' ? 'checked' : ''} /></div>
			</div>
			<div class = "content">
				<div class = "tr">
					<div class = "th">전화번호</div>
					<div class = "td">
						<span id = "phoneInvalid"></span>
						<input type = "text" id = "phone" value = "${vo.phone}" readonly/>
						<i class="fa-solid fa-pen fa-sm pencil" style="color: #6c737f;"></i>
						<i class="fa-solid fa-check check" style="color: #6c737f;"></i>
					</div>
				</div>
				<div class = "tr">
					<div class = "th">이름</div>
					<div class = "td">
						<span id = "nameInvalid"></span>
						<input type = "text" id = "name" value = "${vo.name}" readonly/>
						<i class="fa-solid fa-pen fa-sm pencil" style="color: #6c737f;"></i>
						<i class="fa-solid fa-check check" style="color: #6c737f;"></i>
					</div>
				</div>
				<div class = "tr">
					<div class = "th">성별</div>
					<div class = "td">
						${vo.gender}
					</div>
				</div>
				<div class = "tr">
					<div class = "th">가입일자</div>
					<div class = "td">
						<fmt:parseDate value = "${vo.joinDate}" pattern = "yyyy-MM-dd" var = "joinDate" />
						<fmt:formatDate value="${joinDate}" pattern="yyyy년 MM월 dd일" />
					</div>
				</div>
				<div class = "tr">
					<div class = "th">포인트</div>
					<div class = "td">
						${vo.point}
					</div>
				</div>
				<div class = "tr">
					<div class = "th">작성글개수</div>
					<div class = "td">
						-
					</div>
				</div>
			</div>
		</div>
		<div class = "account">
			<div class = "title">계정관리</div>
			<div class = "manage">
				<div class = "th"><a href = "">비밀번호 변경</a></div>
				<div class = "th"><a href = "">회원탈퇴</a></div>
			</div>
		</div>
	</div>
	 
</body>
</html>