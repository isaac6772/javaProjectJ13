<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
'use strict';

function replInput() {
	let reply = $('#replContent').val().trim();
	if(reply=="") {
		alert("내용을 입력해주세요");
		return false;
	}
	
	$.ajax({
		url : "boardReplyInput.bo",
		type : "post",
		data : {
			content : reply,
   			boardIdx : ${vo.idx},
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
	let flag = ${goodBad};
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
		location.href = "boardUpdate.bo?idx=${vo.idx}";
	});
	$('#boardDelete').click(function() {
		let ans = confirm('정말 삭제하시겠습니까?');
		if(!ans) return false;
		location.href = 'boardDelete.bo?idx=${vo.idx}';
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
});

function recommend(flag) {
	$.ajax({
		url : "recommendUpdate.bo",
		type : "post",
		data : {
			memberIdx : ${sIdx},
			boardIdx : ${vo.idx},
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
</script>