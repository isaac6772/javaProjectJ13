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
	<title>memberInfo.jsp</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/0989d78570.js" crossorigin="anonymous"></script>
	<jsp:include page="/css/myInfoCss.jsp"></jsp:include>
	<%-- <jsp:include page="/js/myInfoJs.jsp"></jsp:include> --%>
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
				<div class = "img"><img src = "${ctp}/images/profile/${vo.profile}" /></div>
				<c:if test="${vo.level==1}"><c:set var = "level" value = "준회원" /></c:if>
				<c:if test="${vo.level==2}"><c:set var = "level" value = "정회원" /></c:if>
				<c:if test="${vo.level==77}"><c:set var = "level" value = "관리자" /></c:if>
				<span>등급 : (${level})<br/>닉네임 : ${vo.nickName}</span>
			</div>
		</div>
		<div class = "info">
			<div class = "title">
				<div style = "display : inline-block; width : 45%">개인정보</div>
			</div>
			<div class = "content">
				<div class = "tr">
					<div class = "th">전화번호</div>
					<div class = "td phone">
						<span id = "phoneInvalid"></span>
						<input type = "text" id = "phone" value = "${vo.userInfo=='n'&&sLevel!=77 ? '비공개' : vo.phone}" readonly maxlength = "11" />
					</div>
				</div>
				<div class = "tr">
					<div class = "th">이름</div>
					<div class = "td name">
						<span id = "nameInvalid"></span>
						<input type = "text" id = "name" value = "${vo.userInfo=='n'&&sLevel!=77 ? '비공개' : vo.name}" readonly maxlength = "20" />
					</div>
				</div>
				<div class = "tr">
					<div class = "th">성별</div>
					<div class = "td">
						${vo.userInfo=='n'&&sLevel!=77 ? '비공개' : vo.gender}
					</div>
				</div>
				<div class = "tr">
					<div class = "th">가입일자</div>
					<div class = "td">
						<c:if test="${vo.userInfo == 'y' || sLevel == 77}">
							<fmt:parseDate value = "${vo.joinDate}" pattern = "yyyy-MM-dd" var = "joinDate" />
							<fmt:formatDate value="${joinDate}" pattern="yyyy년 MM월 dd일" />
						</c:if>
						<c:if test="${vo.userInfo != 'y' && sLevel != 77}">비공개</c:if>
					</div>
				</div>
				<div class = "tr">
					<div class = "th">포인트</div>
					<div class = "td">
						${vo.userInfo=='n'&&sLevel!=77 ? '비공개' : vo.point}
					</div>
				</div>
				<div class = "tr">
					<div class = "th">추천수</div>
					<div class = "td">
						${vo.userInfo=='n'&&sLevel!=77 ? '비공개' : vo.good}
					</div>
				</div>
				<div class = "tr">
					<div class = "th">비추천수</div>
					<div class = "td">
						${vo.userInfo=='n'&&sLevel!=77 ? '비공개' : vo.bad}
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>