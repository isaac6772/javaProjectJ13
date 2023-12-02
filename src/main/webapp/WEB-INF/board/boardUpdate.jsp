<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>boardUpdate.jsp</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> <!-- jquery -->
	<jsp:include page="/css/boardWriteCss.jsp"></jsp:include>
	<script>
		'use strict';
		let originalName = "${vo.fSName}";
		
		function boardUpdate() {
			if($('#title').val().trim()=="") {
				$('#alertModal').show();
				$('#alertMsg').html('제목을 입력해주세요');
			}
			else if($('#content').val().trim()=="") {
				$('#alertModal').show();
				$('#alertMsg').html('내용을 입력해주세요');
			}
			// 불러온 게시물에 파일이 존재하지 않는 경우 폼 그대로 전송
			else if(originalName=="") boardForm.submit();
			// 불러온 게시물에 fSName이 공백이 아닌경우(수정전 게시물 본래의 파일)
			else {
				boardForm.action = "boardUpdateOk.bo?flag=1";
				boardForm.submit();
			}
		}
		
		function alertModalClose() {
			$('#alertModal').hide();
		}
		
		// 업로드 파일 유효성 검사(프론트)
		$(function() {
			$('#file').change(function() {
				// 한번이라도 업로드하면 기존 파일 정보 초기화
				$('#file').width(294);
				$('#fileName').hide();
				originalName = "";
				
				let fName = document.getElementById('file').value;
				let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
				if(ext != 'jpg' && ext != 'png') {
					$('#alertModal').show();
					$('#alertMsg').html('업로드 가능한 파일은 jpg, png 입니다.');
					$('#file').val("");		// 조건에 맞지 않으면 업로드 시키지 않음
					document.getElementById('img').src = "${ctp}/images/board/noFileImage.png";
				}
				else if(file.size > 1024 * 1024 * 10) {
					$('#alertModal').show();
					$('#alertMsg').html('10Mbyte 이하의 파일만 업로드 가능합니다.');
					$('#file').val("");
					document.getElementById('img').src = "${ctp}/images/board/noFileImage.png";
				}
				else if(file.files && file.files[0]){
					let reader = new FileReader();
					reader.onload = function(e) {
						document.getElementById('img').src = e.target.result;
					};
					reader.readAsDataURL(file.files[0]);
				}
			});
			
			// 기존 게시물에 파일이 존재하면 파일이름이 뜨도록 꼼수(?) 처리
			if(originalName!='') {
				$('#file').width(87);
				$('#fileName').show();
			}
		});
	</script>
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<jsp:include page="/include/nav.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/modal/loginJoinModal.jsp"></jsp:include>
	
	<div class = "container">
		<form class = "boardContainer" name = "boardForm" method = "post" action = "boardUpdateOk.bo" enctype = "multipart/form-data" >
			<div class = "part">
				<span>게시물 수정</span>
				<i class="fa-solid fa-pencil fa-xl" style = "left:128px"></i>
			</div>
			<div class = "table">
				<div class = "tr">
					<div class = "td">
						<input type = "text" name = "title" id = "title" value = "${vo.title}" class = "title" placeholder = "제목을 입력해주세요" autofocus />
					</div>
				</div>
				<div class = "tr">
					<div class = "td">
						<textarea class = "textarea" name = "content" id = "content" placeholder = "내용을 입력해주세요">${vo.content}</textarea>
					</div>
				</div>
				<div class = "tr">
					<div class = "td" style = "width : 49%;">
						<input type = "file" name = "file" id = "file" class = "fileUpload"/>
						<span id = "fileName" style = "display:none;font-size:1em;font-weight:bold;margin-left:-4px">${vo.fName}</span>
					</div>
					<div class = "td" style = "width : 50%; text-align: right; float : right;">
						<input type = "button" class = "boardWrite" onclick = "boardUpdate()" value = "수 정" />
					</div>
				</div>
				<div class = "tr" style = "margin-top : 10px;">
					<div class = "td">
						이미지 미리보기
						<div id = "imageViewBox">
							<c:if test="${!empty vo.fSName}">
								<img src = "${ctp}/images/board/${vo.fSName}" id = "img"/>
							</c:if>
							<c:if test="${empty vo.fSName}">
								<img src = "${ctp}/images/board/noFileImage.png" id = "img"/>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<!-- 어떤 게시물을 수정할건지를 구별하기 위한 게시물 고유번호 -->
			<input type = "hidden" id = "boardIdx" name = "idx" value = "${vo.idx}" />
		</form>
	</div>
	
	<!-- 모달 -->
	<div id = "alertModal">
		<div id = "modalContent">
			<div class = "icon"><i class="fa-solid fa-circle-exclamation fa-2xl" style="color: #ff5252;"></i></div>
			<div id = "alertMsg"></div>
			<input type = "button" onclick = "alertModalClose()" value = "확인" />
		</div>
	</div>
</body>
</html>