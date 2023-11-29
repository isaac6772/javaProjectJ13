<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var = "ctp" value = "${pageContext.request.contextPath}" />
<jsp:include page="/css/headerCss.jsp"></jsp:include>
<script>
	'use strict';
	
	function infoShow() {
		if($('header .info').is(':visible')) {
			$('header .info').hide();
		}
		else {
			$('header .info').show();
		}
	}
</script>
<header>
	<div class = "home"><a href = "main.mem"><i class="fa-regular fa-comment" style="color: #547abb;"></i> 오늘뭐할까?</a></div>
    <div class = "search"><i class="fa-solid fa-magnifying-glass fa-xl" style="color: #547abb;"></i><input type = "text" placeholder = "검색어를 입력해주세요" /></div>
    <c:if test="${empty sMid}">
	    <div class = "login1">
		    <div style = "display : inline-block;"><a href = "javascript:loginModalShow()">로그인</a></div> |
		    <div style = "display : inline-block;"><a href = "javascript:joinModalShow()">회원가입</a></div>
	    </div>
    </c:if>
    <c:if test="${!empty sMid}">
    	<div class = "login2">
    		<span style = "display : inline-block; width : 160px; text-align: right"><span>${sNickName}</span><span style = "font-size : 0.85em"> 님</span></span>
    		<a href = "javascript:infoShow()" class = "profile"><img src = "${ctp}/images/profile/${sProfile}" /></a>
			<div class = "info">
				<div style = "border-bottom:1px solid rgb(190, 186, 186);border-radius: 6px 6px 0px 0px;"><a href = "myInfo.mem">내정보</a></div>
				<div style = "border-bottom:1px solid rgb(190, 186, 186);"><a href = "">설정</a></div>
				<div style = "border-radius: 0px 0px 6px 6px;"><a href = "javascript:location.href='logoutOk.mem'">로그아웃</a></div>
			</div>
    	</div>
    </c:if>
</header>