<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var = "ctp" value = "${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>main.jsp</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> <!-- jquery -->
    <style>
    	.container {
			margin-left : 13vw;
			width : 87vw;
			position : absolute;
			top : 145px;
			left : 130px;
			z-index: 1;
		}
		.container .contentBox {
			width : 80%;
			border : 1px solid rgb(228, 228, 228);
			border-radius: 7px;
			padding : 20px;
			font-weight: 600;
		}
		.container .title {
			font-size : 1.9em;
			margin-bottom: 10px;
		}
		.container .content {
			min-height: 400px;
		}
		.container .line {
			border-top : 1px solid rgb(228, 228, 228);
			margin-bottom: 15px
		}
		.container .replBox {
			border : 2px solid rgb(228, 228, 228);
			border-radius : 6px;
			margin : 12px 0px 12px 0px;
			padding : 10px;
			width : 100%;
			height : 120px;
			box-sizing: border-box;
			position : relative;
		}
		.container .replBox textarea {
			border : 0px;
			outline : none;
			resize : none;
			width : 100%;
			height : 100%;
			font-family: 'Gowun Batang';
			font-size: 1em;
			font-weight: 600;
		}
		.container .replBox .replLimit {
			position: absolute;
			top : -27px;
			right : 3px;
			font-weight: normal;
			font-family: "돋움";
			color : lightgray;
		}
		.container .info img {
			background: linear-gradient(to bottom right,#9dacd9, #3f59c7);
			border-radius: 32px;
			width : 32px;
			height : 32px;
		}
		.container .info div {
			display : inline-block;
			height : 50px;
			line-height: 19px;
		}
		.container .info2 {
			margin-bottom: 10px;
		}
		.container .replBtn {
			text-align: right;
			
		}
		.container .replBtn input[type=button] {
			padding : 5px 15px;
			border-radius: 5px;
			border : 0px;
			color : white;
			font-weight: bold;
			background : linear-gradient(to bottom left,rgb(151, 162, 208),rgb(101, 116, 203));
		}
		.container .replBtn input[type=button]:hover {
			background : linear-gradient(to bottom left,rgb(153, 153, 175),rgb(91, 91, 133));
			cursor : pointer;
		}
		.container .repl {
			position : relative;
			min-height: 70px;
			border-top : 1px solid rgb(228, 228, 228);
			padding-top : 4px;
		}
		.container .repl .profile {
			width : 32px;
			height : 32px;
			background: linear-gradient(to bottom right,#9dacd9, #3f59c7);
			border-radius: 32px;
			position : absolute;
			left : 0px;
			top : 10px;
		}
		.container .repl .replContentBox {
			margin-left : 43px;
		}
		.container .repl .replContentBox .replNick {
			
		}
		.container .repl .replContentBox .replContent {
			font-family: "나눔 고딕";
			margin : 5px 0px;
		}
		.container .repl .replContentBox .replDate {
			color : gray;
			font-size: 0.8em;
		}
    </style>
    <script>
    	'use strict';
    	
    	function replInput() {
    		let reply = $('#replContent').val().trim();
    		if(reply=="") {
    			alert("내용을 입력해주세요");
    			return false;
    		}
    		
    		$.ajax({
    			url : "boardReplyInput.bo",
    			type : "post",
    			data : {
    				content : reply,
        			boardIdx : ${vo.idx},
    				nickName : '${sNickName}',
    				memberIdx : ${sIdx},
    			},
    			success : function(res) {
    				if(res==1) location.reload();
    				else alert("댓글 입력 실패");
    			},
    			error : function() {
    				alert("전송오류");
    			}
    		});
    	}
    </script>
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<jsp:include page="/include/nav.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/modal/loginJoinModal.jsp"></jsp:include>
	
	<div class = "container">
		<div class = "contentBox">
			<div class = "title">${vo.title}</div>
			<div class = "info">
				<img src = "${ctp}/images/profile/noImage.jpg" />
				<div>
					<span>${vo.nickName}</span>&nbsp;<span style = "font-weight: normal; font-size : 15px;">준회원</span><br/>
					<span style = "font-size: 13px">
						${vo.writeDate}
						조회${vo.viewNum}
					</span>
				</div>
			</div>
			<div class = "line"></div>
			<div class = "content">${vo.content}</div>
			<div class = "info2">
				<i class="fa-regular fa-thumbs-up" style="color: #5e8dde;"></i> 추천 ${vo.good}&nbsp;&nbsp;&nbsp;
				<i class="fa-regular fa-thumbs-down" style="color: #f45d5d;"></i> 비추천 ${vo.bad}&nbsp;&nbsp;&nbsp;
				<i class="fa-regular fa-comment-dots" style="color: #b1bdd3;"></i> 댓글 ${fn:length(vos)}
			</div>
			<c:forEach var = "vo" items = "${vos}" varStatus = "st">
				<div class = "repl">
					<img src = "${ctp}/images/profile/noImage.jpg" class = "profile" />
					<div class = "replContentBox">
						<div class = "replNick">
							${vo.nickName}
							<c:if test="${vo.memberLevel ==  77}"><i class="fa-solid fa-crown fa-sm" style="color: #caa316;"></i></c:if>
							<c:if test="${vo.memberLevel ==  2}"><i class="fa-solid fa-shield-cat" style="color: #3d6cbd;"></i></c:if>
						</div>
						<div class = "replContent">${vo.content}</div>
						<div class = "replDate">${fn:substring(vo.writeDate,0,16)}&nbsp;&nbsp;&nbsp;&nbsp;답글</div>
					</div>	
				</div>
			</c:forEach>
			<div class = "replBox">
				<textarea id = "replContent"></textarea>
				<span class = "replLimit">23/3000</span>
			</div>
			<div class = "replBtn"><input type = "button" onclick = "replInput()" value = "등록" /></div>
		</div>
	</div>	
</body>
</html>