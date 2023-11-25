<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	'use strict';
	let loginFlag = false;
	let pwdFlag = false;
	let pwdConfirmFlag = false;
	let nickNameFlag = false;
	let nameFlag = false;
	let phoneFlag = false;
	
	let regMid = /^[a-zA-Z0-9]{4,15}$/;
	let regPwd = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[`~!@#$%^&*()_\-+=\[\]{};:'",<\.>/?])[\w`~!@#$%^&*()_\-+=\[\]{};:'",<\.>/?]{4,15}$/;
	let regNickName = /^[a-zA-Z0-9가-힣]{2,15}$/;
	let regName = /^[가-힣]{1,20}$/;
	let regPhone = /^[0-9]{9,11}$/;

	function joinModalShow() {
		$('#joinModal').show();
		$('#joinModal .idbox input').focus();
	}
	
	function loginModalShow() {
		$('#loginModal').show();
		$('#loginModal .idbox input').focus();
  	}

	window.onclick = function(e) {
		if(e.target == document.getElementById("joinModal")) {
		    $('#joinModal').hide();
		    $('#joinModal .validIcon, #joinModal .inValidIcon').hide();
		    $('.invalidMsg').html("");
		    $('.valid').removeClass('valid');
		    $('.inValid').removeClass('inValid');
		    document.getElementById('joinForm').reset();
		}
		if(e.target == document.getElementById("loginModal")) {
  			$('#loginModal').hide();
  		}
	}
	
	function joinCheck() {
	    let sw = 1;
	
	    if(!loginFlag) {
	        $('#mid').addClass('inValid');
	        sw = 0;
	    }
	    if(!pwdFlag) {
	        $('#pwd').addClass('inValid');
	        sw = 0;
	    }
	    if(!pwdConfirmFlag) {
	        $('#pwdConfirm').addClass('inValid');
	        sw = 0;
	    }
	    if(!nickNameFlag) {
	        $('#nickName').addClass('inValid');
	        sw = 0;
	    }
	    if(!nameFlag) {
	        $('#name').addClass('inValid');
	        sw = 0;
	    }
	    if(!phoneFlag) {
	        $('#phone').addClass('inValid');
	        sw = 0;
	    }
	
	    if(sw == 1) joinForm.submit();
	}	

    $(function() {
    	$('#loginModal .close').click(function() {
  			$('#loginModal').hide();
  		});
    	
	    $('#joinModal .close').click(function() {
	        $('#joinModal').hide();
	        $('#joinModal .validIcon, #joinModal .inValidIcon').hide();
	        $('.invalidMsg').html("");
	        $('.valid').removeClass('valid');
	        $('.inValid').removeClass('inValid');
	        document.getElementById('joinForm').reset();
	    });

        $('#mid').keyup(function() {
        	if(regMid.test($('#mid').val())) {
		        $('#midInvalid').html("");
		        $('#joinModal .midValidIcon').show();
		        $('#joinModal .midInValidIcon').hide();
		        $('#mid').removeClass('inValid');
		        $('#mid').addClass('valid');
		        loginFlag = true;
	        }
            else {
                $('#midInvalid').html("아이디가 형식에 맞지 않습니다.");
                $('#joinModal .midValidIcon').hide();
                $('#joinModal .midInValidIcon').show();
                $('#mid').removeClass('valid');
                $('#mid').addClass('inValid');
                loginFlag = false;
            }
        });

        $('#pwd').keyup(function() {
        	if(regPwd.test($('#pwd').val())) {
	            $('#pwdInvalid').html("");
	            $('#joinModal .pwdValidIcon').show();
	            $('#joinModal .pwdInValidIcon').hide();
	            $('#pwd').removeClass('inValid');
	            $('#pwd').addClass('valid');
	            pwdFlag = true;
        	}
            else {
                 $('#pwdInvalid').html("비밀번호가 형식에 맞지 않습니다.");
                 $('#joinModal .pwdValidIcon').hide();
                 $('#joinModal .pwdInValidIcon').show();
                 $('#pwd').removeClass('valid');
                 $('#pwd').addClass('inValid');
                 pwdFlag = false;
        	}
    	});	

        $('#pwdConfirm').keyup(function() {
        	if($('#pwd').val() == $('#pwdConfirm').val()) {
	            $('#pwdConfirmInvalid').html("");
	            $('#joinModal .pwdConfirmValidIcon').show();
	            $('#joinModal .pwdConfirmInValidIcon').hide();
	            $('#pwdConfirm').removeClass('inValid');
	            $('#pwdConfirm').addClass('valid');
	            pwdConfirmFlag = true;
            }
            else {
	            $('#pwdConfirmInvalid').html("비밀번호가 일치하지 않습니다.");
	            $('#joinModal .pwdConfirmValidIcon').hide();
	            $('#joinModal .pwdConfirmInValidIcon').show();
	            $('#pwdConfirm').removeClass('valid');
	            $('#pwdConfirm').addClass('inValid');
	            pwdConfirmFlag = false;
            }
        });

	    $('#nickName').keyup(function() {
  			if(regNickName.test($('#nickName').val())) {
		        $('#nickInvalid').html("");
		        $('#joinModal .nickValidIcon').show();
		        $('#joinModal .nickInValidIcon').hide();
		        $('#nickName').removeClass('inValid');
		        $('#nickName').addClass('valid');
		        nickNameFlag = true;
    		}
	     	else {
				$('#nickInvalid').html("닉네임이 형식에 맞지 않습니다.");
				$('#joinModal .nickValidIcon').hide();
				$('#joinModal .nickInValidIcon').show();
				$('#nickName').removeClass('valid');
				$('#nickName').addClass('inValid');
				nickNameFlag = false;
	     	}
		});	

      	$('#name').keyup(function() {
      		if(regName.test($('#name').val())) {
				$('#nameInvalid').html("");
				$('#joinModal .nameValidIcon').show();
				$('#joinModal .nameInValidIcon').hide();
				$('#name').removeClass('inValid');
				$('#name').addClass('valid');
				nameFlag = true;
         	}
         	else {
				$('#name').html("이름이 형식에 맞지 않습니다.");
				$('#joinModal .nameValidIcon').hide();
				$('#joinModal .nameInValidIcon').show();
				$('#name').removeClass('valid');
				$('#name').addClass('inValid');
				nameFlag = false;
        	}
		});

      	$('#phone').keyup(function() {
        	if(regPhone.test($('#phone').val())) {
	            $('#phoneInvalid').html("");
	            $('#joinModal .phoneValidIcon').show();
	            $('#joinModal .phoneInValidIcon').hide();
	            $('#phone').removeClass('inValid');
	            $('#phone').addClass('valid');
	            phoneFlag = true;
            }
           	else {
	            $('#phone').html("전화번호가 형식에 맞지 않습니다.");
	            $('#joinModal .phoneValidIcon').hide();
	            $('#joinModal .phoneInValidIcon').show();
	            $('#phone').removeClass('valid');
	            $('#phone').addClass('inValid');
	            phoneFlag = false;
			}
		});
	});
</script>