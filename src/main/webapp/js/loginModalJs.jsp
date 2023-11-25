<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	// 로그인 모달띄우기
	function loginModalShow() {
		$('#loginModal').show();
		$('#loginModal .idbox input').focus();
  	}
  	
  	$(function() {
  		$('#loginModal .close').click(function() {
  			$('#loginModal').hide();
  		});
  	});
</script>