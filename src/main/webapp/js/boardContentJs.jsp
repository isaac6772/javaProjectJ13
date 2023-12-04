<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
'use strict';

function replInput() {
	let reply = $('#replContent').val().trim();
	
	if('${sIdx}'=='') {
		alert("로그인 후 이용가능합니다");
		return false;
	}
	if(reply=="") {
		alert("내용을 입력해주세요");
		return false;
	}
	
	$.ajax({
		url : "boardReplyInput.bo",
		type : "post",
		data : {
			content : reply,
   			boardIdx : ${bVo.idx},
			nickName : '${sNickName}',
			memberIdx : '${sIdx}',
		},
		success : function(res) {
			if(res==1) location.reload();
			else alert("댓글 입력 실패");
		},
		error : function() {
			alert("전송오류");
		}
	});
}

$(function() {
	let flag = '${goodBad}';
	if(flag==1) {
		$('#good').hide();
		$('#goodChecked').show();
	}
	else if(flag==2) {
		$('#bad').hide();
		$('#badChecked').show();
	}
	// 글 수정 삭제 버튼 리스너
	$('#contentMenu').click(function() {
		if($('#contentSubMenu').is(':hidden')) $('#contentSubMenu').show();
		else $('#contentSubMenu').hide();
	});
	$('#boardUpdate').click(function() {
		//location.href = "boardUpdate.bo?idx=" + $('#boardIdx').val();
		location.href = "boardUpdate.bo?idx=${bVo.idx}";
	});
	$('#boardDelete').click(function() {
		let ans = confirm('정말 삭제하시겠습니까?');
		if(!ans) return false;
		location.href = 'boardDelete.bo?idx=${bVo.idx}';
	});
	// 추천,비추천 처리
	$('#good').click(function() {
		recommend(1);
	});
	$('#goodChecked').click(function() {
		recommend(0);
	});
	$('#bad').click(function() {
		recommend(2);
	});
	$('#badChecked').click(function() {
		recommend(0);
	});
	$('#replContent').keyup(function(){
		$('#cnt').html($('#replContent').val().length);
	});
});

function recommend(flag) {
	if('${sIdx}'=='') {
		alert("로그인 후 이용가능합니다");
		return false;
	}
	if('${bVo.memberIdx}'=='${sIdx}') {
		alert("자신의 글은 추천할 수 없습니다.");
		return false;
	}
	$.ajax({
		url : "recommendUpdate.bo",
		type : "post",
		data : {
			memberIdx : '${sIdx}',
			boardIdx : '${bVo.idx}',
			flag : flag
		},
		success : function() {
			location.reload();
		},	
		error : function() {
			alert("전송오류");
		}
	});
}

function deleteRepl(idx) {
	let ans = confirm("댓글을 삭제합니다");
	if(!ans) return false;
	$.ajax({
		url : "deleteReply.bo",
		type : "post",
		data : {idx : idx},
		success : function(res) {
			if(res==1) location.reload();
			else alert("삭제실패");
		},
		error : function() {
			alert("전송오류");
		}
	});
}

function showMemberInfo(e) {
	if($(e).next().is(':hidden')) {
		$('.memberInfo').hide();	
		$(e).next().show();
	}
	else $(e).next().hide();
}
</script>