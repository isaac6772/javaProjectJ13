<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var = "ctp" value = "${pageContext.request.contextPath}" />
<jsp:include page="/css/headerCss.jsp"></jsp:include>
<header>
	<div class = "home"><a href = "main.mem"><i class="fa-regular fa-comment" style="color: #547abb;"></i> 오늘뭐할까?</a></div>
    <div class = "search"><i class="fa-solid fa-magnifying-glass fa-xl" style="color: #547abb;"></i><input type = "text" placeholder = "검색어를 입력해주세요" /></div>
    <c:if test="${empty sMid}">
	    <div class = "login" style = "margin-left:220px;">
		    <div style = "display : inline-block;"><a href = "javascript:loginModalShow()">로그인</a></div> |
		    <div style = "display : inline-block;"><a href = "javascript:joinModalShow()">회원가입</a></div>
	    </div>
    </c:if>
    <c:if test="${!empty sMid}">
    	<div class = "login">
    		<span>${sNickName} 님</span>
    		<a href = "javascript:infoShow()"><img src = "${ctp}/images/profile/${sProfile}" /></a>
			<div class = "info">
				<div style = "border-bottom:1px solid rgb(190, 186, 186);border-radius: 6px 6px 0px 0px;"><a href = "">내정보</a></div>
				<div style = "border-bottom:1px solid rgb(190, 186, 186);"><a href = "">설정</a></div>
				<div style = "border-radius: 0px 0px 6px 6px;"><a href = "javascript:location.href='logoutOk.mem'">로그아웃</a></div>
			</div>
    	</div>
    </c:if>
</header>