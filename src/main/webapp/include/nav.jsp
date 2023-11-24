<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
nav {
    border-right: 1px solid rgb(224, 219, 219);
    height: 91vh;
    width: 260px;
    position: fixed;
}
nav  div {
    border-radius: 10px;
    text-align: left;
    line-height: 50px;
    font-size: 1.1em;
    font-weight: bolder;
    position: relative;
}
nav i {
    margin-left: 15px;
    display: inline-block;
    width:40px;
}
nav .mainmenu {
    margin-top: 12px;
}
nav .navhome:hover {
    background-color: rgb(238, 238, 238);
    cursor: pointer;
}
nav div.mainmenu:hover {
    background-color: rgb(238, 238, 238);
    cursor: pointer;
}
nav .submenu div:hover {
    background-color: rgb(238, 238, 238);
    cursor: pointer;
}
nav .fa-chevron-down {
    position:absolute;
    right:0px;
    top: 29px;
}
.submenu div{
    padding-left: 57px;
    font-size: 0.9em;
}
</style>
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
    <div style = "margin-top: 30px;" class = "navhome"><a href = "main.ad" style = "display:block"><i class="fa-solid fa-house fa-xl" style="color: #547abb;"></i>홈</a></div>
    <div class = "mainmenu">
        <i class="fa-regular fa-clipboard fa-xl" style="color: #547abb; margin-left: 19px;"></i><span style ="margin-left:-3px">자유게시판</span><i class="fa-solid fa-chevron-down fa-sm"></i>
    </div>
    <div class = "submenu">
        <div><a href = "" style = "display:block">인기글</a></div>
        <div><a href = "" style = "display:block">전체글</a></div>
        <div><a href = "" style = "display:block">공지사항</a></div>
    </div>
    <div class = "mainmenu">
        <i class="fa-regular fa-heart fa-xl" style="color: #547abb;"></i>친구<i class="fa-solid fa-chevron-down fa-sm"></i>
    </div>
    <div class = "submenu">
        <div><a href = "" style = "display:block">친구소식</a></div>
        <div><a href = "" style = "display:block">친구관리</a></div>
    </div>
    <div class = "mainmenu">
        <i class="fa-solid fa-cart-shopping fa-xl" style="color: #547abb;"></i>상점<i class="fa-solid fa-chevron-down fa-sm"></i>
    </div>
    <div class = "submenu">
        <div><a href = "" style = "display:block">중고거래</a></div>
        <div><a href = "" style = "display:block">이모티콘</a></div>
    </div>
    <div class = "mainmenu">
        <i class="fa-solid fa-repeat fa-xl" style="color: #547abb;"></i>고객센터<i class="fa-solid fa-chevron-down fa-sm"></i>
    </div>
    <div class = "submenu">
        <div><a href = "" style = "display:block">문의하기</a></div>
        <div><a href = "" style = "display:block">등업신청</a></div>
    </div>
    <div style = "border: 1px solid rgb(224, 219, 219); margin-top:20px"></div>
</nav>