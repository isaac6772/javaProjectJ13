<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var = "ctp" value = "${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>main.jsp</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> <!-- jquery -->
    <style>
    	.mainContainer {
    		position : absolute;
    		left : 13vw;
    		top : 9vh;
    		width : 87vw;
    	}
    </style>
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<jsp:include page="/include/nav.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/modal/loginJoinModal.jsp"></jsp:include>	
	<div class = "mainContainer">
		<div style = "margin-top:200px; margin-left : 458px; font-size: 5em;">
			<i class="fa-solid fa-triangle-exclamation" style="color: #f54914;"></i>
			<span style = "font-family: 'Nanum Gothic';">공사중입니다.</span>
		</div>
	</div>
</body>
</html>