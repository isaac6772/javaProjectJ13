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
    <script src="https://kit.fontawesome.com/0989d78570.js" crossorigin="anonymous"></script> <!-- 폰트어썸 -->
    <jsp:include page="/css/loginModalCss.jsp"></jsp:include>	<!-- 로그인모달에 적용할 css -->
    <jsp:include page="/css/joinModalCss.jsp"></jsp:include>	<!-- 회원가입모달에 적용할 css -->
    <jsp:include page="/js/joinModalJs.jsp"></jsp:include>	<!-- 회원가입모달에 적용할 js -->
    <style>
    	@import url('https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap');
    	body {
	        margin: 0px;
	        padding: 0px;
	        font-family: 'Gowun Batang';
    	}
    </style>
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<jsp:include page="/include/nav.jsp"></jsp:include>
	
	<div id = "loginModal">
		<div class = "loginContent">
			<div>로그인</div>
			<div class = "close"><i class="fa-regular fa-circle-xmark fa-sm"></i></div>
			<div class = "idbox"><i class="fa-solid fa-user" style="color: #547abb;"></i><input type = "text" placeholder = "아이디" maxlength ="15" /></div>
			<div class = "pwdbox"><i class="fa-solid fa-lock" style="color: #547abb;"></i><input type = "password" maxlength ="15" placeholder = "비밀번호"/></div>
			<div style = "margin-top : 20px;">
				<div style = "float: left; font-size:0.8em;"><input type = "checkbox"><span>아이디저장</span></div>
				<div style = "float: right; font-size:0.8em;">아이디/비밀번호찾기</div>
			</div>
			<div style = "clear: both;"><input type = "button" value = "로그인" class = "loginBtn"/></div>
			<div style = "font-size:0.8em">회원이 아니신가요?&nbsp;<span style = "color:rgb(5, 93, 170); font-size:1em">회원가입</span></div>
		</div>
	</div>
	
	<div id = "joinModal">
		<div class = "joinContent">
			<form name = "joinForm" id = "joinForm" method = "post" action = "joinOk.mem">
				<div class = "title">회원가입</div>
				<div class = "close"><i class="fa-regular fa-circle-xmark"></i></div>
				<div class = "box">
					<label for = "mid">아이디</label>
					<div>
						<i class="fa-solid fa-user fa-sm midIcon" style="color: #547abb;"></i>
						<input type = "text" name = "mid" id = "mid" placeholder = "4~15자 사이의 영문자,숫자 조합" maxlength ="15" autocomplete="off" />
                        <i class="fa-regular fa-circle-check validIcon midValidIcon" style="color: #34cd32;"></i>
                        <i class="fa-regular fa-circle-xmark inValidIcon midInValidIcon" style="color: #df3434;"></i>
                        <span id = "midInvalid" class = "invalidMsg"></span>
					</div>
				</div>
				<div class = "box">
					<label for = "pwd">비밀번호</label>
					<div>
						<i class="fa-solid fa-lock fa-sm pwdIcon" style="color: #547abb;"></i>
						<input type = "password" name = "pwd" id = "pwd" placeholder = "영문자,숫자,특수문자를 1개 이상 조합하여 15자 이내로 써주세요" maxlength ="15" autocomplete="off" />
                        <i class="fa-regular fa-circle-check validIcon pwdValidIcon" style="color: #34cd32;"></i>
                        <i class="fa-regular fa-circle-xmark inValidIcon pwdInValidIcon" style="color: #df3434;"></i>
                        <span id = "pwdInvalid" class = "invalidMsg"></span>
					</div>
				</div>
				<div class = "box">
					<label for = "pwdConfirm">비밀번호확인</label>
					<div>
						<i class="fa-solid fa-lock fa-sm pwdIcon" style="color: #547abb;"></i>
						<input type = "password" name = "pwdConfirm" id = "pwdConfirm" placeholder = "비밀번호를 한번 더 입력해주세요" maxlength ="15" autocomplete="off" />
                        <i class="fa-regular fa-circle-check validIcon pwdConfirmValidIcon" style="color: #34cd32;"></i>
                        <i class="fa-regular fa-circle-xmark inValidIcon pwdConfirmInValidIcon" style="color: #df3434;"></i>
                        <span id = "pwdConfirmInvalid" class = "invalidMsg"></span>
					</div>
				</div>
				<div class = "box">
					<label for = "nickName">닉네임</label>
					<div>
                        <input type = "text" name = "nickName" id = "nickName" placeholder = "2~15자 사이의 한글,영문,숫자 조합" maxlength ="15" autocomplete="off" />
                        <i class="fa-regular fa-circle-check validIcon nickValidIcon" style="color: #34cd32;"></i>
                        <i class="fa-regular fa-circle-xmark inValidIcon nickInValidIcon" style="color: #df3434;"></i>
                        <span id = "nickInvalid" class = "invalidMsg"></span>
                    </div>
				</div>
				<div class = "box">
					<label for = "name">이름</label>
					<div>
                        <input type = "text" name = "name" id = "name" placeholder = "이름" maxlength ="20" autocomplete="off" />
                        <i class="fa-regular fa-circle-check validIcon nameValidIcon" style="color: #34cd32;"></i>
                        <i class="fa-regular fa-circle-xmark inValidIcon nameInValidIcon" style="color: #df3434;"></i>
                        <span id = "nameInvalid" class = "invalidMsg"></span>
                    </div>
				</div>
				<div class = "box phoneBox">
					<label for = "phone">전화번호</label><br/>
					<select name = "nation" id = "nation">
						<option>대한민국 +82</option>
						<option>일본 +81</option>
						<option>중국 +86</option>
						<option>미국 +1</option>
					</select>
					<div>
						<input type = "text" name = "phone" id = "phone" placeholder = "('-')를 제외한 전화번호" maxlength ="11" autocomplete="off" />
                        <i class="fa-regular fa-circle-check validIcon phoneValidIcon" style="color: #34cd32;"></i>
                        <i class="fa-regular fa-circle-xmark inValidIcon phoneInvalidIcon" style="color: #df3434;"></i>
                        <span id = "phoneInvalid" class = "invalidMsg"></span>
					</div>
				</div>
				<div class = "box">
					<label>성별</label>
					<input type = "radio" name = "gender" id = "gender1" checked />남자
					<input type = "radio" name = "gender" id = "gender2" />여자
				</div>
				<div class = "box btnBox">
					<button type = "button" onclick = "joinCheck()">가입신청</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>