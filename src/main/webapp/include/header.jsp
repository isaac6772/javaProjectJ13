<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/css/headerCss.jsp"></jsp:include>
<header>
	<div class = "home"><a href = "main.ad"><i class="fa-regular fa-comment" style="color: #547abb;"></i> 오늘뭐할까?</a></div>
    <div class = "search"><i class="fa-solid fa-magnifying-glass fa-xl" style="color: #547abb;"></i><input type = "text" placeholder = "검색어를 입력해주세요" /></div>
    <div class = "login"><a href = "javascript:loginModalShow()">로그인</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href = "javascript:joinModalShow()">회원가입</a></div>
</header>