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
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<jsp:include page="/include/nav.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/modal/loginJoinModal.jsp"></jsp:include>
	
	<div class = "container">
		<div class = "boardContainer">
			<div class = "part">
				<span>글쓰기</span>
				<i class="fa-solid fa-pencil fa-xl"></i>
			</div>
			<div class = "table">
				<div class = "tr">
					<div class = "td">
						<input type = "text" class = "title" placeholder = "제목을 입력해주세요" />
					</div>
				</div>
				<div class = "tr">
					<div class = "td">
						<textarea class = "textarea" placeholder = "내용을 입력해주세요"></textarea>
					</div>
				</div>
				<div class = "tr">
					<div class = "td" style = "width : 49%;">
						<input type = "file" id = "mfile" multiple class = "fileUpload"/>
					</div>
					<div class = "td" style = "width : 50%; text-align: right; float : right;">
						<input type = "button" class = "boardWrite" value = "등 록" />
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>