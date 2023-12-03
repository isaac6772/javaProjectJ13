<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>board.jsp</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> <!-- jquery -->
	<jsp:include page="/css/boardListCss.jsp"></jsp:include>
	<script>
		'use strict';
		
		function pageSizeChange(e) {
			let Size = e.value;
			location.href = "boardList.bo?page=1&pageSize=" + Size;
		}
	</script>
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<jsp:include page="/include/nav.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/modal/loginJoinModal.jsp"></jsp:include>
	
	<div class = "container">
		<div class = "boardContainer">
			<div class = "title">
				<div class = "t1 td">공지사항</div>
				<div class = "t2 td">
					<select onchange = "pageSizeChange(this)">
						<option value = "10" ${pageSize==10 ? "selected" : ""}>10개</option>
						<option value = "20" ${pageSize==20 ? "selected" : ""}>20개</option>
						<option value = "30" ${pageSize==30 ? "selected" : ""}>30개</option>
					</select>
				</div>
			</div>
			<div class = "table">
				<div class = "thr">
					<div class = "th td td1">번호</div>
					<div class = "th td td2" style = "text-align: center">제목</div>
					<div class = "th td td3">글쓴이</div>
					<div class = "th td td4">작성시간</div>
					<div class = "th td td5">조회수</div>
					<div class = "th td td6">추천</div>
				</div>
				<c:forEach var = "vo" items = "${vos}" varStatus = "st">
					<div class = "tr">
						<div class = "td td1">공지</div>
						<div class = "td td2">
							<a href = "boardContent.bo?idx=${vo.idx}">
								<i class="fa-solid fa-volume-high" style="color: #e34a4a;"></i>
								${vo.title}
								<c:if test="${vo.replyCnt != 0}"><span style = "color : red; font-size : 14px;">[${vo.replyCnt}]</span></c:if>
							</a>
						</div>
						<div class = "td td3">
							${vo.nickName}
							<i class="fa-solid fa-crown fa-sm" style="color: #caa316;"></i>
						</div>
						<div class = "td td4">
							<c:if test="${vo.dateDiff > 0}">${fn:substring(vo.writeDate,0,10)}</c:if>
							<c:if test="${vo.dateDiff == 0}">${fn:substring(vo.writeDate,11,16)}</c:if>
						</div>
						<div class = "td td5">${vo.viewNum}</div>
						<div class = "th td td6">${vo.good}</div>
					</div>
				</c:forEach>
			</div>
			<div style = "text-align: right"><input type = "button" class = "writeBtn" onclick = "location.href='boardWrite.bo'" value = "글쓰기" /></div>
			<div class = "pageBox">
				<div class = "pageStart page">
					<c:if test="${curBlock>0}"><a href = "boardList.bo?page=1">&lt;&lt;</a></c:if>
					<c:if test="${curBlock==0}"><span style = "color:gray">&lt;&lt;</span></c:if>
				</div>
				<div class = "pagePre page">
					<c:if test="${page>1}"><a href = "boardList.bo?page=${page-1}">&lt;</a></c:if>
					<c:if test="${page==1}"><span style = "color:gray">&lt;</span></c:if>
				</div>
				<c:forEach var = "i" begin = "${curBlock*blockSize+1}" end = "${curBlock*blockSize+blockSize}" varStatus = "st">
					<c:if test="${page==i && i<=totPage}"><div class = "page${st.count} page selected"><a href = "boardList.bo?page=${i}">${i}</a></div></c:if>
					<c:if test="${page!=i && i<=totPage}"><div class = "page${st.count} page"><a href = "boardList.bo?page=${i}">${i}</a></div></c:if>
				</c:forEach>
				<div class = "pageAfter page">
					<c:if test="${page<totPage}"><a href = "boardList.bo?page=${page+1}">&gt;</a></c:if>
					<c:if test="${page==totPage}"><span style = "color:gray">&gt;</span></c:if>
				</div>
				<div class = "pageEnd page">
					<c:if test="${curBlock<lastBlock}"><a href = "boardList.bo?page=${totPage}">&gt;&gt;</a></c:if>
					<c:if test="${curBlock==lastBlock}"><span style = "color:gray">&gt;&gt;</span></c:if>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>