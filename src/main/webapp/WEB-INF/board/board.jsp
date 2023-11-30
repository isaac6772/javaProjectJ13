<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>board.jsp</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> <!-- jquery -->
	<jsp:include page="/css/boardCss.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<jsp:include page="/include/nav.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/modal/loginJoinModal.jsp"></jsp:include>
	
	<div class = "container">
		<div class = "boardContainer">
			<div class = "title">자유게시판</div>
			<div class = "table">
				<div class = "tr">
					<div class = "th td td1">번호</div>
					<div class = "th td td2">제목</div>
					<div class = "th td td3">글쓴이</div>
					<div class = "th td td4">작성시간</div>
					<div class = "th td td5">조회수</div>
					<div class = "th td td6">추천</div>
				</div>
			</div>
			<div style = "text-align: right"><input type = "button" class = "writeBtn" onclick = "location.href='boardWrite.bo'" value = "글쓰기" /></div>
		</div>
	</div>
	
</body>
</html>