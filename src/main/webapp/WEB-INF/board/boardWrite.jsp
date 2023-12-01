<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>boardWrite.jsp</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> <!-- jquery -->
	<jsp:include page="/css/boardWriteCss.jsp"></jsp:include>
	<script>
		'use strict';
		
		function boardWrite() {
			if($('#title').val().trim()=="") {
				$('#alertModal').show();
				$('#alertMsg').html('제목을 입력해주세요');
			}
			else if($('#content').val().trim()=="") {
				$('#alertModal').show();
				$('#alertMsg').html('내용을 입력해주세요');
			}
			else boardForm.submit();
		}
		
		function alertModalClose() {
			$('#alertModal').hide();
		}
		
		// 업로드 파일 유효성 검사(프론트)
		$(function() {
			$('#file').change(function() {
				let fName = document.getElementById('file').value;
				let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
				if(ext != 'jpg' && ext != 'png') {
					$('#alertModal').show();
					$('#alertMsg').html('업로드 가능한 파일은 jpg, png 입니다.');
					$('#file').val("");		// 조건에 맞지 않으면 업로드 시키지 않음
				}
				else if(file.size > 1024 * 1024 * 10) {
					$('#alertModal').show();
					$('#alertMsg').html('10Mbyte 이하의 파일만 업로드 가능합니다.');
					$('#file').val("");
				}
			});
		});
	</script>
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<jsp:include page="/include/nav.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/modal/loginJoinModal.jsp"></jsp:include>
	
	<div class = "container">
		<form class = "boardContainer" name = "boardForm" method = "post" action = "boardWriteOk.bo" enctype = "multipart/form-data" >
			<div class = "part">
				<span>글쓰기</span>
				<i class="fa-solid fa-pencil fa-xl"></i>
			</div>
			<div class = "table">
				<div class = "tr">
					<div class = "td">
						<input type = "text" name = "title" id = "title" class = "title" placeholder = "제목을 입력해주세요" />
					</div>
				</div>
				<div class = "tr">
					<div class = "td">
						<textarea class = "textarea" name = "content" id = "content" placeholder = "내용을 입력해주세요"></textarea>
					</div>
				</div>
				<div class = "tr">
					<div class = "td" style = "width : 49%;">
						<input type = "file" name = "file" id = "file" class = "fileUpload"/>
					</div>
					<div class = "td" style = "width : 50%; text-align: right; float : right;">
						<input type = "button" class = "boardWrite" onclick = "boardWrite()" value = "등 록" />
					</div>
				</div>
			</div>
		</form>
	</div>
	
	<div id = "alertModal">
		<div id = "modalContent">
			<div class = "icon"><i class="fa-solid fa-circle-exclamation fa-2xl" style="color: #ff5252;"></i></div>
			<div id = "alertMsg"></div>
			<input type = "button" onclick = "alertModalClose()" value = "확인" />
		</div>
	</div>
</body>
</html>