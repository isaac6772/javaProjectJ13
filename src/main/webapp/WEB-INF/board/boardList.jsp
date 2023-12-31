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
			location.href = "boardList.bo?search=${search}&page=1&pageSize=" + Size;
		}
		
		function showMemberInfo(e) {
			if($(e).next().is(':hidden')) {
				$('.memberInfo').hide();	// 여러 정보 상자가 열리지 않도록, 클릭한 회원의 정보만 띄우고 나머지는 사라짐
				$(e).next().show();
			}
			else $(e).next().hide();
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
				<div class = "t1 td">자유게시판</div>
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
				
				<c:forEach var = "vo" items = "${iVos}" varStatus = "st">
					<c:if test="${vo.boardType=='공지' && page==1}">
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
								<c:if test="${sIdx!=vo.memberIdx}">
									<span onclick = "showMemberInfo(this)" style = "cursor:pointer;">${vo.nickName}</span>
									<div class = "memberInfo">
										<div><a href = "memberInfo.mem?idx=${vo.memberIdx}">회원정보</a></div>
										<div><a>친구신청</a></div>
									</div>
								</c:if>
								<c:if test="${sIdx==vo.memberIdx}">${vo.nickName}</c:if>
								<i class="fa-solid fa-crown fa-sm" style="color: #caa316;"></i>
							</div>
							<div class = "td td4">
								<c:if test="${vo.dateDiff > 0}">${fn:substring(vo.writeDate,0,10)}</c:if>
								<c:if test="${vo.dateDiff == 0}">${fn:substring(vo.writeDate,11,16)}</c:if>
							</div>
							<div class = "td td5">${vo.viewNum}</div>
							<div class = "th td td6">${vo.good}</div>
						</div>
					</c:if>
				</c:forEach>
				
				<c:forEach var = "vo" items = "${vos}" varStatus = "st">
					<div class = "tr">
						<div class = "td td1">${curScrStartNo}</div>
						<!-- 글제목 -->
						<div class = "td td2">
							<c:if test="${vo.good>=10}">
								<i class="fa-solid fa-medal fa-lg" style="color: #2f369d;"></i>
							</c:if>
							<c:if test="${vo.good<10}">
								<c:if test="${!empty vo.fName}"><i class="fa-regular fa-image" style="color: #20bc8d;"></i></c:if>
								<c:if test="${empty vo.fName}"><i class="fa-regular fa-comment-dots" style="color: #808080;"></i></c:if>
							</c:if>
							<a href = "boardContent.bo?idx=${vo.idx}">
								${vo.title}
								<c:if test="${vo.replyCnt != 0}"><span style = "color : red; font-size : 14px;">[${vo.replyCnt}]</span></c:if>
							</a>
						</div>
						<!-- 관리자이면 왕관을 씌운다 -->
						<div class = "td td3">
							<c:if test="${sIdx!=vo.memberIdx}">
								<span onclick = "showMemberInfo(this)" style = "cursor:pointer;">${vo.nickName}</span>
								<div class = "memberInfo">
									<div><a href = "memberInfo.mem?idx=${vo.memberIdx}">회원정보</a></div>
									<div><a>친구신청</a></div>
								</div>
							</c:if>
							<c:if test="${sIdx==vo.memberIdx}">${vo.nickName}</c:if>
							<c:if test="${vo.memberLevel ==  77}"><i class="fa-solid fa-crown fa-sm" style="color: #caa316;"></i></c:if>
							<c:if test="${vo.memberLevel ==  2}"><i class="fa-solid fa-shield-cat" style="color: #3d6cbd;"></i></c:if>
						</div>
						<div class = "td td4">
							<c:if test="${vo.dateDiff > 0}">${fn:substring(vo.writeDate,0,10)}</c:if>
							<c:if test="${vo.dateDiff == 0}">${fn:substring(vo.writeDate,11,16)}</c:if>
						</div>
						<div class = "td td5">${vo.viewNum}</div>
						<div class = "th td td6">${vo.good}</div>
					</div>
					<c:set var = "curScrStartNo" value = "${curScrStartNo-1}" />
				</c:forEach>
			</div>
			<div style = "text-align: right"><input type = "button" class = "writeBtn" onclick = "location.href='boardWrite.bo'" value = "글쓰기" /></div>
			<div class = "pageBox">
				<div class = "pageStart page">
					<c:if test="${curBlock>0}"><a href = "boardList.bo?page=1&pageSize=${pageSize}&search=${search}">&lt;&lt;</a></c:if>
					<c:if test="${curBlock==0}"><span style = "color:gray">&lt;&lt;</span></c:if>
				</div>
				<div class = "pagePre page">
					<c:if test="${page>1}"><a href = "boardList.bo?page=${page-1}&pageSize=${pageSize}&search=${search}">&lt;</a></c:if>
					<c:if test="${page==1}"><span style = "color:gray">&lt;</span></c:if>
				</div>
				<c:forEach var = "i" begin = "${curBlock*blockSize+1}" end = "${curBlock*blockSize+blockSize}" varStatus = "st">
					<c:if test="${page==i && i<=totPage}"><div class = "page${st.count} page selected"><a href = "boardList.bo?page=${i}&pageSize=${pageSize}&search=${search}">${i}</a></div></c:if>
					<c:if test="${page!=i && i<=totPage}"><div class = "page${st.count} page"><a href = "boardList.bo?page=${i}&pageSize=${pageSize}&search=${search}">${i}</a></div></c:if>
				</c:forEach>
				<div class = "pageAfter page">
					<c:if test="${page<totPage}"><a href = "boardList.bo?page=${page+1}&pageSize=${pageSize}&search=${search}">&gt;</a></c:if>
					<c:if test="${page==totPage}"><span style = "color:gray">&gt;</span></c:if>
				</div>
				<div class = "pageEnd page">
					<c:if test="${curBlock<lastBlock}"><a href = "boardList.bo?page=${totPage}&pageSize=${pageSize}&search=${search}">&gt;&gt;</a></c:if>
					<c:if test="${curBlock==lastBlock}"><span style = "color:gray">&gt;&gt;</span></c:if>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>