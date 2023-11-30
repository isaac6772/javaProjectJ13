<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id = "loginModal">
	<div class = "loginContent">
		<form name = "loginForm" id = "loginForm" method = "post" action = "loginOk.mem">
			<div>로그인</div>
			<div class = "close"><i class="fa-regular fa-circle-xmark fa-sm"></i></div>
			<div class = "idbox"><i class="fa-solid fa-user" style="color: #547abb;"></i><input type = "text" name = "mid" id = "loginMid" placeholder = "아이디" maxlength ="15" /></div>
			<div class = "pwdbox"><i class="fa-solid fa-lock" style="color: #547abb;"></i><input type = "password" name = "pwd" id = "loginPwd" maxlength ="15" placeholder = "비밀번호"/></div>
			<div style = "margin-top : 20px;">
				<div style = "font-size:0.8em;display:inline-block;width:195px;text-align:left"><input type = "checkbox" name = "idSave" id = "idSave"><span>아이디저장</span></div>
				<div style = "font-size:0.8em;display:inline-block;width:195px;text-align:right"><a href = "">아이디/비밀번호찾기</a></div>
			</div>
			<div id = "wrongIdPwd"></div>
			<div style = "margin-top:40px;"><input type = "button" onclick = "loginCheck()" value = "로그인" class = "loginBtn"/></div>
			<div style = "font-size:0.8em">회원이 아니신가요?&nbsp;<a href = "javascript:loginModalClose()" style = "color:rgb(5, 93, 170); font-size:1em">회원가입</a></div>
		</form>
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
					<input type = "password" name = "pwd" id = "pwd" placeholder = "4~15자 사이의 영문자,숫자,특수문자 1개 이상의 조합" maxlength ="15" autocomplete="off" />
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
				<div>
					<input type = "text" name = "phone" id = "phone" placeholder = "('-')를 제외한 전화번호" maxlength ="11" autocomplete="off" />
                    <i class="fa-regular fa-circle-check validIcon phoneValidIcon" style="color: #34cd32;"></i>
                    <i class="fa-regular fa-circle-xmark inValidIcon phoneInvalidIcon" style="color: #df3434;"></i>
                    <span id = "phoneInvalid" class = "invalidMsg"></span>
				</div>
			</div>
			<div class = "box">
				<label>성별</label>
				<input type = "radio" name = "gender" value = "남자" id = "gender1" checked />남자
				<input type = "radio" name = "gender" value = "여자" id = "gender2" />여자
			</div>
			<div class = "btnBox">
				<button type = "button" onclick = "joinCheck()">가입신청</button>
			</div>
		</form>
	</div>
</div>