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
		.container .head {
			font-size: 1.3em;
			font-weight: bolder;
			margin-bottom: 10px;
		}
		.container .line {
			border-top:1px solid #e0e0e0;
			margin-bottom: 20px;
		}
		.container .profile {
			border: 2px solid #e0e0e0;
			border-radius: 6px;
			margin-bottom: 20px;
		}
		.container .profile .title {
			height : 50px;
			border-bottom: 1px solid #e0e0e0;
			line-height: 2.8em;
    		padding-left: 20px;
    		font-size: 1.1em;
		}
		.container .profile .imgBox {
			height : 160px;
			background-color: #f1f1f1;
			position : relative;
		}
		.container .profile .imgBox .img {
			position : absolute;
			width : 120px;
			height : 120px;
			border-radius: 120px;
			left : 20px;
			top : 20px;
			background: linear-gradient(to bottom right,#9dacd9, #3f59c7);
		}
		.container .profile .imgBox .img img {
			width : 120px;
			height : 120px;
			border-radius: 120px;
		}
		.container .profile .imgBox span {
			position : absolute;
			top : 40px;
			left : 180px;
		}
		.container .profile .imgBox span i {
			cursor : pointer;
		}
		.container .profile .imgBox .imgPencil {
			position : absolute;
			width : 25px;
			height : 25px;
			border : 2px solid white;
			border-radius : 25px;
			left : 103px;
			top : 111px;
			background : linear-gradient(to bottom right,#9dacd9, #3f59c7);
		}
		.container .profile .imgBox .imgPencil img {
			width : 25px;
			height : 25px;
			border-radius : 25px;
			cursor: pointer;
		}
		.container .profile .imgBox #nickChange {
			display : none;
			position : absolute;
			left : 179px;
			top : 100px;
		}
		.container .profile .imgBox #invalidMsg {
			position : absolute;
			left : 181px;
			top : 130px;
			color : red;
			font-size: 0.8em;
		}
		.container .profile #nickChange input[type=text] {
			border : 1px solid rgb(190, 190, 190);
			border-radius: 5px;
			height : 25px;
			padding : 0px 5px 0px 5px;
			padding-left : 4px;
			outline : none;
			font-weight : bold;
			font-family: 'Gowun Batang';
		}
		.container .profile #nickChange input[type=button] {
			border : 1px solid rgb(190, 190, 190);
			border-radius: 5px;
			height : 27px;
			padding : 0px 10px 0px 10px;
			background : linear-gradient(to bottom, #aeb7d1, #5f6ca7);
			font-family: 'Gowun Batang';
			color : white;
			cursor : pointer;
		}
		.container .profile #nickChange input[type=button]:hover {
			box-shadow: 0px 0px 4px 1px #aeb7d1;
		}
		.container .info {
			border: 2px solid #e0e0e0;
			border-radius: 6px;
			margin-bottom: 20px;
		}
		.container .info .title{
			height : 50px;
			border-bottom: 1px solid #e0e0e0;
			line-height: 2.8em;
    		padding-left: 20px;
    		font-size: 1.1em;
		}
		.container .info .tr:hover {
			background-color: #f1f1f1;
		}
		.container .info .tr:hover input {
			background-color: #f1f1f1;
		}
		.container .info .tr:hover .pencil {
			display : inline-block;
			cursor : pointer;
		}
		.container .info .th, .info .td {
			display: inline-block;
			padding : 10px;
		}
		.container .info .th {
			width : 17%;
			padding-left: 20px;
		}
		.container .info .td {
			width : 75%;
			position : relative;
		}
		.container .info .td #phoneInvalid, .info .td #nameInvalid {
			position : absolute;
			top : 12px;
			left : 207px;
			font-size : 0.8em;
			color : red;
		}
		.container .info .td input {
			border : 1px solid #e0e0e0;
			border-radius : 3px;
			background-color : #f1f1f1;
			outline: none;
			font-family: 'Gowun Batang';
			font-weight: bold;
			font-size : 1em;
			padding : 0px;
			padding-left: 3px;
		}
		.container .info .pencil {
			display : none;
			position : absolute;
			right : 0px;
			top : 20px;
		}
		.container .info .check {
			display : none;
			position : absolute;
			right : 0px;
			top : 15px;
			cursor : pointer;
		}
		.container .account {
			border: 2px solid #e0e0e0;
			border-radius: 6px;
			margin-bottom: 20px;
		}
		.container .account .title {
			height : 50px;
			border-bottom: 1px solid #e0e0e0;
			line-height: 2.8em;
    		padding-left: 20px;
    		font-size: 1.1em;
		}
		.container .account .th {
			padding: 10px 10px 10px 20px;
		}
		.container .account a {
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
		let phoneFlag = false;
		
		$(function() {
			// 수정 버튼 처리
			$('.pencil').click(function() {
				$(this).hide();
				$(this).next().show();
				$(this).prev().removeAttr("readonly");
				let temp = $(this).prev().val();
				$(this).prev().val("");		// 커서를 뒤로 위치시키기 위해 값을 뺏다 넣는다.
				$(this).prev().focus();
				$(this).prev().val(temp);
			});
			// 체크 버튼(저장)을 눌렀을 때(전화번호인지 이름인지 검사해서 DB처리)
			$('.check').click(function() {
				if($(this).parent().hasClass('phone')) {
					phonefunction();
					if(phoneFlag == true) {
						$.ajax({
							url : "phoneUpdate.mem",
							type : "post",
							data : {phone : $(this).prev().prev().val()},
							success : function(res) {
								if(res == "1") {
									alert("수정성공");
								}
								else {
									alert("수정실패");
								}
							},
							error : function() {
								alert("전송오류");
							}
						});
						$(this).hide();
						$(this).prev().show();
						$(this).prev().prev().attr("readonly","true");
					}
				}
				else if($(this).parent().hasClass('name')) {
					namefunction();
					if(nameFlag == true) {
						$.ajax({
							url : "nameUpdate.mem",
							type : "post",
							data : {name : $(this).prev().prev().val()},
							success : function(res) {
								if(res == "1") {
									alert("수정성공");
								}
								else {
									alert("수정실패");
								}
							},
							error : function() {
								alert("전송오류");
							}
						});
						$(this).hide();
						$(this).prev().show();
						$(this).prev().prev().attr("readonly","true");
					}
				}
			});
			$('#changeNick').click(function() {
				if($('#nickChange').is(':visible')) $('#nickChange').hide();
				else $('#nickChange').show();
			});
			$('#nickName').keyup(function() {
				nickfunction();
			});
			$('#phone').keyup(function() {
				phonefunction();
			});
			$('#name').keyup(function() {
				namefunction();
			});
			$('#imgPencil').click(function() {
				$('#file').click();
			});
			// 파일업로드 창을 닫고난후(file요소에 변화가 생겼을때)
			$('#file').change(function() {
				let fName = document.getElementById("file").value;
				let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
				let maxSize = 1024 * 1024 * 5;
				if(fName.trim() == "") return;
				if(document.getElementById("file").files[0].size > maxSize) {
					alert("5MB이하의 자료만 업로드 가능합니다.");
				}
				else if(ext != 'jpg' && ext != 'png') {
					alert("jpg, png 형식만 업로드 가능합니다.");
				}
				else {
					fileUploadForm.submit();
				}
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
		
		// 이름 유효성 검사
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
		
		// 전화번호 유효성 검사
		function phonefunction() {
			let regPhone = /^[0-9]{9,11}$/;
			
			if(!regPhone.test($('#phone').val())) {
				$('#phoneInvalid').html("전화번호가 형식에 맞지 않습니다.");
				phoneFlag = false;
         	}
         	else {
         		$('#phoneInvalid').html("");
         		phoneFlag = true;
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
				<div class = "imgPencil">
					<img src = "${ctp}/images/util/pencil.jpg" id = "imgPencil" />
					<form name = "fileUploadForm" id = "fileUpload" method = "post" action = "profileUpdate.mem" enctype = "multipart/form-data" style = "display : none;" >
						<input type = "file" name = "file" id = "file" />
					</form>
				</div>
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
					<div class = "td phone">
						<span id = "phoneInvalid"></span>
						<input type = "text" id = "phone" value = "${vo.phone}" readonly maxlength = "11" />
						<i class="fa-solid fa-pen fa-sm pencil" style="color: #6c737f;"></i>
						<i class="fa-solid fa-check check" style="color: #6c737f;"></i>
					</div>
				</div>
				<div class = "tr">
					<div class = "th">이름</div>
					<div class = "td name">
						<span id = "nameInvalid"></span>
						<input type = "text" id = "name" value = "${vo.name}" readonly maxlength = "20" />
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