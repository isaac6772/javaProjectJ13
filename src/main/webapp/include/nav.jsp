<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/css/navCss.jsp"></jsp:include>
<script>
	$(function() {
	    $('.submenu').hide();
	
	    $('.mainmenu').click(function() {
	        if($(this).next().is(':hidden')) $(this).next().stop().slideDown(300);
	        else $(this).next().stop().slideUp(300);
	    });
	});
</script>
<nav>
    <div style = "margin-top: 30px;" class = "navhome"><a href = "main.mem"><i class="fa-solid fa-house fa-xl" style="color: #547abb;"></i>홈</a></div>
    <div class = "mainmenu">
        <i class="fa-regular fa-clipboard fa-xl" style="color: #547abb; margin-left: 19px;"></i><span style ="margin-left:-3px">자유게시판</span><i class="fa-solid fa-chevron-down fa-sm"></i>
    </div>
    <div class = "submenu">
        <div><a href = "">인기글</a></div>
        <div><a href = "">전체글</a></div>
        <div><a href = "">공지사항</a></div>
    </div>
    <div class = "mainmenu">
        <i class="fa-regular fa-heart fa-xl" style="color: #547abb;"></i>친구<i class="fa-solid fa-chevron-down fa-sm"></i>
    </div>
    <div class = "submenu">
        <div><a href = "">친구소식</a></div>
        <div><a href = "">친구관리</a></div>
    </div>
    <div class = "mainmenu">
        <i class="fa-solid fa-cart-shopping fa-xl" style="color: #547abb;"></i>상점<i class="fa-solid fa-chevron-down fa-sm"></i>
    </div>
    <div class = "submenu">
        <div><a href = "">중고거래</a></div>
        <div><a href = "">이모티콘</a></div>
    </div>
    <div class = "mainmenu">
        <i class="fa-solid fa-repeat fa-xl" style="color: #547abb;"></i>고객센터<i class="fa-solid fa-chevron-down fa-sm"></i>
    </div>
    <div class = "submenu">
        <div><a href = "">문의하기</a></div>
        <div><a href = "">등업신청</a></div>
    </div>
    <div style = "border: 1px solid rgb(224, 219, 219); margin-top:20px"></div>
</nav>