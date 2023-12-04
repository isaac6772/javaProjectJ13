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
	<title>myInfo.jsp</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/0989d78570.js" crossorigin="anonymous"></script>
	<jsp:include page="/css/myInfoCss.jsp"></jsp:include>
	<jsp:include page="/js/myInfoJs.jsp"></jsp:include>
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
				<div class = "img"><img src = "${ctp}/images/profile/${sProfile}" /></div>
				<div class = "imgPencil">
					<img src = "${ctp}/images/util/pencil.jpg" id = "imgPencil" />
					<form name = "fileUploadForm" id = "fileUpload" method = "post" action = "profileUpdate.mem" enctype = "multipart/form-data" style = "display : none;" >
						<input type = "file" name = "file" id = "file" />
					</form>
				</div>
				<span>
					등급 : (${strLevel})<br/>닉네임 : ${vo.nickName}
					<i class="fa-regular fa-pen-to-square" id = "changeNick" style="color: #5875a7;"></i>
				</span>
				<div id = "nickChange">
					<input type = "text" id = "nickName" value = "${vo.nickName}" />
					<input type = "button" onclick = "nickNameChange()" value = "닉네임변경" />
				</div>
				<div id = "invalidMsg"></div>
			</div>
		</div>
		<div class = "info">
			<div class = "title">
				<div style = "display : inline-block; width : 45%">개인정보</div>
				<div style = "display : inline-block; width : 52%; text-align: right; font-size : 0.8em">정보공개<input type = "checkbox" onchange = "changeUserInfo(this)" ${vo.userInfo == 'y' ? 'checked' : ''} /></div>
			</div>
			<div class = "content">
				<div class = "tr">
					<div class = "th">전화번호</div>
					<div class = "td phone">
						<span id = "phoneInvalid"></span>
						<input type = "text" id = "phone" value = "${vo.phone}" readonly maxlength = "11" />
						<i class="fa-solid fa-pen fa-sm pencil" style="color: #6c737f;"></i>
						<i class="fa-solid fa-check check" style="color: #6c737f;"></i>
					</div>
				</div>
				<div class = "tr">
					<div class = "th">이름</div>
					<div class = "td name">
						<span id = "nameInvalid"></span>
						<input type = "text" id = "name" value = "${vo.name}" readonly maxlength = "20" />
						<i class="fa-solid fa-pen fa-sm pencil" style="color: #6c737f;"></i>
						<i class="fa-solid fa-check check" style="color: #6c737f;"></i>
					</div>
				</div>
				<div class = "tr">
					<div class = "th">성별</div>
					<div class = "td">
						${vo.gender}
					</div>
				</div>
				<div class = "tr">
					<div class = "th">가입일자</div>
					<div class = "td">
						<fmt:parseDate value = "${vo.joinDate}" pattern = "yyyy-MM-dd" var = "joinDate" />
						<fmt:formatDate value="${joinDate}" pattern="yyyy년 MM월 dd일" />
					</div>
				</div>
				<div class = "tr">
					<div class = "th">포인트</div>
					<div class = "td">
						${vo.point}
					</div>
				</div>
				<div class = "tr">
					<div class = "th">추천수</div>
					<div class = "td">
						${vo.good}
					</div>
				</div>
				<div class = "tr">
					<div class = "th">비추천수</div>
					<div class = "td">
						${vo.bad}
					</div>
				</div>
			</div>
		</div>
		<div class = "account">
			<div class = "title">계정관리</div>
			<div class = "manage">
				<div class = "tr">
					<div class = "th"><a href = "javascript:pwdChangeToggle()">비밀번호 변경</a></div>
					<div class = "td pwdChangeBox" id = "pwdCheckBox" style = "display :none">
						<span style = "font-size : 0.94em;">기존 비밀번호를 입력해주세요</span>
						<input type = "password" id = "pwd" placeholder = "비밀번호" />
						<input type = "button" onclick = "pwdCheck()" value = "입력" />
					</div>
					<div class = "td pwdChangeBox" id = "pwdChangeBox" style = "display : none; width : 495px;">
						<span style = "font-size : 0.94em;">새 비밀번호를 입력해주세요</span>
						<input type = "password" id = "newPwd" placeholder = "새비밀번호" />
					</div>
				</div>
				<div class = "tr">
					<div class = "th"><a href = "javascript:DeleteModalShow()">회원탈퇴</a></div>
					<div class = "td pwdChangeBox" id = "pwdReCheck" style = "display : none">
						<span style = "font-size : 0.94em;">한번 더 입력해주세요</span>
						<input type = "password" id = "oneMorePwd" placeholder = "비밀번호" />
						<input type = "button" onclick = "pwdChange()" value = "변경" />
					</div>	
				</div>
				<div class = "tr">
					<div class = "th"></div>
					<div class = "td">
						<span class = "pwdChangeBox" style = "font-size : 0.94em; color : red; display : none;" id = "regInvalid">비밀번호는 4~15자 사이의 특수문자,영문자,숫자를 1개 이상 조합하여 만들어주세요</span>
						<span class = "pwdChangeBox" style = "font-size : 0.94em; color : red; display : none;" id = "notCorrect">비밀번호가 일치하지 않습니다</span>
					</div>	
				</div>
			</div>
		</div>
	</div>
	 
	 <div id = "memberDeleteModal">
	 	<div class = "content">
	 		<div class = "title">
	 			<span>회원탈퇴</span>
	 			<div><i class="fa-solid fa-xmark close" id = "closeMemberDelete" style="color: #94989e;"></i></div>
	 		</div>
	 		<div class = "info">
	 			<span style = "color : red;">
	 				회원탈퇴시 회원정보가 모두 삭제됩니다.<br/>
	 				(단, 아래 항목은 표기된 법률에 따라 특정 기간 동안 보관됩니다.)<br/>
	 			</span>
	 			<span style = "font-size: 0.8em">
	 				1. 계약 또는 청약철회 등에 관한 기록 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 / 보존 기간:5년<br/>
	 				2. 대금결제 및 재화 등의 공급에 관한 기록 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 / 보존 기간:5년<br/>
	 				3. 전자금융 거래에 관한 기록 보존 이유 : 전자금융거래법 보존 기간 / 5년<br/>
	 				4. 소비자의 불만 또는 분쟁처리에 관한 기록 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 보존 기간 / 3년<br/>
	 				5. 신용정보의 수집/처리 및 이용 등에 관한 기록 보존 이유 : 신용정보의 이용 및 보호에 관한 법률 보존기간 / 3년
	 			</span>
 			</div>
 			<div style = "font-weight: bolder">탈퇴사유</div>
	 		<div>
	 			<select class = "selectBox">
	 				<option>아이디변경 / 재가입 목적</option>
	 				<option>서비스 불만족</option>
	 				<option>더이상 이용하지 않음</option>
	 			</select>
 			</div>
 			<div class = "check">
 				<input type = "checkbox" id = "leaveCheck" /> 해당 내용을 모두 확인했으며, 회원탈퇴에 동의합니다.
 			</div>
 			<div class = "delete">
 				<input type = "button" onclick = "memberLeave()" value = "회원탈퇴" />
 			</div>
	 	</div>
	 </div>
</body>
</html>