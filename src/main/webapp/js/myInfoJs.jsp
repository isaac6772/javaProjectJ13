<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	'use strict';
	
	let originalPhone = "${vo.phone}";
	let originalName = "${vo.name}";
	let originalNickName = "${vo.nickName}";
	
	let nicknameFlag22 = false;
	let nameFlag2 = false;
	let phoneFlag2 = false;
	let pwdFlag2 = false;
	let pwdConfirmFlag2 = false;
	
	$(function() {
		// 수정 버튼 처리
		$('.pencil').click(function() {
			$(this).hide();
			$(this).next().show();
			$(this).prev().removeAttr("readonly");
			let temp = $(this).prev().val();
			$(this).prev().val("");		// 커서를 뒤로 위치시키기 위해 값을 뺏다 넣는다.
			$(this).prev().focus();
			$(this).prev().val(temp);
		});
		// 체크 버튼(저장)을 눌렀을 때(전화번호인지 이름인지 검사해서 DB처리)
		$('.check').click(function() {
			if($(this).parent().hasClass('phone')) {
				phonefunction();
				if(phoneFlag2 == true) {
					$.ajax({
						url : "phoneUpdate.mem",
						type : "post",
						data : {phone : $(this).prev().prev().val()},
						success : function(res) {
							if(res == "1") {
								alert("수정성공");
							}
							else {
								alert("수정실패");
							}
						},
						error : function() {
							alert("전송오류");
						}
					});
					$(this).hide();
					$(this).prev().show();
					$(this).prev().prev().attr("readonly","true");
				}
			}
			else if($(this).parent().hasClass('name')) {
				namefunction();
				if(nameFlag2 == true) {
					$.ajax({
						url : "nameUpdate.mem",
						type : "post",
						data : {name : $(this).prev().prev().val()},
						success : function(res) {
							if(res == "1") {
								alert("수정성공");
							}
							else {
								alert("수정실패");
							}
						},
						error : function() {
							alert("전송오류");
						}
					});
					$(this).hide();
					$(this).prev().show();
					$(this).prev().prev().attr("readonly","true");
				}
			}
		});
		$('#changeNick').click(function() {
			if($('#nickChange').is(':visible')) {
				$('#nickChange').hide();
				$('#invalidMsg').html("");
			}
			else $('#nickChange').show();
		});
		$('#nickName').keyup(function() {
			nickfunction();
		});
		$('#phone').keyup(function() {
			phonefunction();
		});
		$('#name').keyup(function() {
			namefunction();
		});
		$('#imgPencil').click(function() {
			$('#file').click();
		});
		// 파일업로드 창을 닫고난후(file요소에 변화가 생겼을때)
		$('#file').change(function() {
			let fName = document.getElementById("file").value;
			let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
			let maxSize = 1024 * 1024 * 5;
			if(fName.trim() == "") return;
			if(document.getElementById("file").files[0].size > maxSize) {
				alert("5MB이하의 자료만 업로드 가능합니다.");
			}
			else if(ext != 'jpg' && ext != 'png') {
				alert("jpg, png 형식만 업로드 가능합니다.");
			}
			else {
				fileUploadForm.submit();
			}
		});
		$('#newPwd').keyup(function() {
			regPwdCheck();
		});
		$('#oneMorePwd').keyup(function() {
			regPwdConfirmCheck();
		});
		$('#closeMemberDelete').click(function() {
			$('#memberDeleteModal').hide();
		});
	});
	
	// 닉네임 유효성 검사 후 서버 전송(업데이트 처리)
	function nickNameChange() {
		nickfunction();
		
		if(nicknameFlag22 == true) {
			$.ajax({
				url : "nickUpdate.mem",
				type : "post",
				data : {nickName : $('#nickName').val()},
				success : function(res) {
					if(res != "0") {
						alert("닉네임이 수정되었습니다.");
						location.reload();
					}
					else alert("수정 실패");
				},
				error : function() {
					alert("전송오류");
				}
			});
		}
	}
	
	// 닉네임체크 유효성 검사
	function nickfunction() {
		let regNickName = /^[a-zA-Z0-9가-힣]{2,15}$/;
		
		if(!regNickName.test($('#nickName').val())) {
			$('#invalidMsg').css("color","red");
				$('#invalidMsg').html("닉네임이 형식에 맞지 않습니다.");
			nicknameFlag22 = false;
			}
		else if($('#nickName').val() == originalNickName) {
			$('#invalidMsg').css("color","red");
			$('#invalidMsg').html("기존 닉네임과 동일합니다");
			nicknameFlag22 = false;
		}
			else {
	    	$.ajax({
	    		url : "nickCheck.mem",
	    		type : "post",
	    		data : {nickName : $('#nickName').val()},
	    		success : function(res) {
	    			if(res != "1") {
	    				$('#invalidMsg').css("color","red");
	    				$('#invalidMsg').html("이미 존재하는 닉네임입니다.");
	    				nicknameFlag22 = false;
	    			}
	    			else {
	    				$('#invalidMsg').css("color","green");
	    				$('#invalidMsg').html("사용가능한 닉네임 입니다.");
	    		        nicknameFlag22 = true;
	    			}
	    		},
	    		error : function() {
	    			alert("전송오류");
	    		}
	    	});
	    }
	}
	
	// 이름 유효성 검사
	function namefunction() {
		let regName = /^[가-힣]{1,20}$/;
		
		if(!regName.test($('#name').val())) {
			$('#nameInvalid').html("이름이 형식에 맞지 않습니다.");
			nameFlag2 = false;
	 	}
	 	else {
	 		$('#nameInvalid').html("");
			nameFlag2 = true;
		}
	}
	
	// 전화번호 유효성 검사
	function phonefunction() {
		let regPhone = /^[0-9]{9,11}$/;
		
		if(!regPhone.test($('#phone').val())) {
			$('#phoneInvalid').html("전화번호가 형식에 맞지 않습니다.");
			phoneFlag2 = false;
	 	}
	 	else {
	 		$('#phoneInvalid').html("");
	 		phoneFlag2 = true;
		}
	}
	
	// 비밀번호 유효성 검사
	function regPwdCheck() {
		let regPwd = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*()_\-+=\|\]\[}{;:/?.>,<"'])[\w"'`~!@#$%^&*()_\-+=\|\]\[}{;:/?.>,<]{4,15}$/;
		
		if(!regPwd.test($('#newPwd').val())) {
			$('#notCorrect').hide();
			$('#regInvalid').show();
			pwdFlag2 = false;
		}
		else {
			$('#regInvalid').hide();
			pwdFlag2 = true;
		}
	}
	
	// 비밀번호 재확인 유효성 검사
	function regPwdConfirmCheck() {
		$('#oneMorePwd').keyup(function() {
			if($('#newPwd').val() != $('#oneMorePwd').val()) {
				$('#regInvalid').hide();
				$('#notCorrect').show();
				pwdConfirmFlag2 = false;
			}
			else {
				$('#notCorrect').hide();
				pwdConfirmFlag2 = true;
			}
		});
	}
	
	// 비밀번호 입력상자 토글
	function pwdChangeToggle() {
		if($('.pwdChangeBox').is(':visible')) {
			$('.pwdChangeBox').hide();
			$('#pwd').val("");
			$('#newPwd').val("");
			$('#oneMorePwd').val("");
		}
		else if($('#pwdCheckBox').is(':hidden')) $('#pwdCheckBox').show();
	}
	
	// 비밀번호 일치 여부
	function pwdCheck() {
		let pwd = $('#pwd').val();
		
		$.ajax({
			url : "pwdCheck.mem",
			type : "post",
			data : {pwd : pwd},
			success : function(res) {
				if(res == "1") {
					$('#pwdCheckBox').hide();
					$('#pwdChangeBox').show();
					$('#pwdReCheck').show();
				}
				else {
					alert("비밀번호가 일치하지 않습니다.");
				}
			},
			error : function() {
				alert("전송오류");
			}
		});
	}
	
	// 비밀번호 변경 처리
	function pwdChange() {
		regPwdCheck();
		regPwdConfirmCheck();
		
		if(pwdFlag2 == false || pwdConfirmFlag2 == false) return false;
		
		$.ajax({
			url : "pwdChange.mem",
			type : "post",
			data : {pwd : $('#newPwd').val()},
			success : function(res) {
				if(res == "1") {
					alert("비밀번호가 변경되었습니다.");
					location.reload();
				}
				else alert("변경 실패");
			},
			error : function() {
				alert("전송오류");
			}
		});
	}
	
	function DeleteModalShow() {
		$('#memberDeleteModal').show();
	}
	
	function memberLeave() {
		let check = document.getElementById("leaveCheck");
		if(check.checked) location.href = "memberLeave.mem";
		else alert("회원탈퇴에 동의를 해주세요");
	}
	
</script>