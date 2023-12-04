<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var = "ctp" value = "${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>boardContent.jsp</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> <!-- jquery -->
    <jsp:include page="/css/boardContentCss.jsp"></jsp:include>
    <jsp:include page="/js/boardContentJs.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<jsp:include page="/include/nav.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/modal/loginJoinModal.jsp"></jsp:include>
	
	<div class = "container">
		<div class = "contentBox">
			<div class = "title">${bVo.title}</div>
			<div class = "info">
				<img src = "${ctp}/images/profile/${bVo.memberProfile}" />
				<div style = "position : relative;">
					<c:if test="${sIdx!=bVo.memberIdx}">
						<span onclick = "showMemberInfo(this)" style = "cursor:pointer;">${bVo.nickName}</span>
						<div class = "memberInfo">
							<div><a href = "memberInfo.mem?idx=${bVo.memberIdx}">회원정보</a></div>
							<div><a>친구신청</a></div>
						</div>
					</c:if>
					<c:if test="${sIdx==bVo.memberIdx}">${bVo.nickName}</c:if>
					<span style = "font-weight: normal; font-size : 13px;font-family: Nanum Gothic;">
						<c:if test="${bVo.memberLevel==1}">준회원</c:if>
						<c:if test="${bVo.memberLevel==2}">정회원</c:if>
						<c:if test="${bVo.memberLevel==77}">관리자</c:if>
					</span><br/>
					<span style = "font-size: 13px">
						${fn:substring(bVo.writeDate,0,16)}
						조회 ${bVo.viewNum}
					</span>
				</div>
				<div class = "contentMenu" id = "contentMenu">
					<i class="fa-solid fa-ellipsis-vertical" style="color: #7b808a;"></i>
					<div id = "contentSubMenu">
						<c:if test="${bVo.memberIdx==sIdx}"><div id = "boardUpdate">수정</div></c:if>
						<c:if test="${bVo.memberIdx==sIdx || sLevel==77}"><div id = "boardDelete">삭제</div></c:if>
						<div>신고</div>
					</div>
				</div>
			</div>
			<div class = "line"></div>
			<div class = "content">
				<!-- 파일이름이 null이 아닐 경우(이미지파일이 존재하는 경우) 이미지를 출력하도록 처리 -->
				<c:if test="${!empty bVo.fSName}">
					<img src = "${ctp}/images/board/${bVo.fSName}" /><br/>
				</c:if>
				${fn:replace(bVo.content,newLine,"<br/>")}
			</div>
			<div class = "info2">
				<i class="fa-regular fa-thumbs-up gb" style="color: #5e8dde;" id = "good"></i>
				<i class="fa-solid fa-thumbs-up gb" style="color: #5e8dde; display : none;" id = "goodChecked"></i>
				추천 ${bVo.good}&nbsp;&nbsp;&nbsp;
				<i class="fa-regular fa-thumbs-down gb" style="color: #f45d5d;" id = "bad"></i>
				<i class="fa-solid fa-thumbs-down gb" style="color: #f45d5d; display : none;" id = "badChecked"></i>
				비추천 ${bVo.bad}&nbsp;&nbsp;&nbsp;
				<i class="fa-regular fa-comment-dots" style="color: rgb(115, 115, 115);"></i> 댓글 ${fn:length(vos)}
			</div>
			<c:forEach var = "vo" items = "${vos}" varStatus = "st">
				<div class = "repl">
					<img src = "${ctp}/images/profile/${vo.memberProfile}" class = "profile" />
					<div class = "replContentBox">
						<div class = "replNick">
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
							<c:if test="${vo.memberIdx == sIdx || sIdx == bVo.memberIdx}">
								<span class = "deleteRepl">
									<a href = "javascript:deleteRepl(${vo.idx })">
										<i class="fa-solid fa-xmark" style="color: #838a95;"></i>
									</a>
								</span>
							</c:if>
						</div>
						<div class = "replContent">${vo.content}</div>
						<div class = "replDate">${fn:substring(vo.writeDate,0,16)}&nbsp;&nbsp;&nbsp;&nbsp;답글</div>
					</div>	
				</div>
			</c:forEach>
			<div class = "replBox">
				<textarea id = "replContent" maxlength = "3000"></textarea>
				<span class = "replLimit"><span id = "cnt">0</span>/3000</span>
			</div>
			<div class = "replBtn"><input type = "button" onclick = "replInput()" value = "등록" /></div>
		</div>
	</div>
</body>
</html>