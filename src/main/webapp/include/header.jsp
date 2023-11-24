<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
header {
    padding: 20px;
    position: relative;
    height: 5vh;
    border-bottom: 1px solid rgb(224, 219, 219);
}
.home, .login {
    display : inline-block;
    cursor: pointer;
}
.search {
    margin-left: 25vw;
    border: 1px solid rgb(190, 186, 186);
    border-radius: 20px;
    width: 950px;
    height: 40px;
    padding-left: 10px;
    background-color: rgb(243, 243, 243);
}
.search input[type = "text"]{
    border: 0px;
    outline: none;
    font-size: 1.2em;
    margin-left: 10px;
    width: 900px;
    background-color: rgb(243, 243, 243);
}
.search i {
    line-height: 40px;
}
.home {
    position: absolute;
    left: 23px;
    top: 25 px;
    font-size: 1.5em;
    font-weight: bolder;
}
.login {
    position: absolute;
    right: 30px;
    top: 25px;
    font-size: 1.2em;
    font-weight: bolder;
}
a {
	text-decoration: none;
	color : black;
}
</style>
<header>
	<div class = "home"><a href = "main.ad"><i class="fa-regular fa-comment" style="color: #547abb;"></i> 오늘뭐할까?</a></div>
    <div class = "search"><i class="fa-solid fa-magnifying-glass fa-xl" style="color: #547abb;"></i><input type = "text" placeholder = "검색어를 입력해주세요" /></div>
    <div class = "login"><a href = "javascript:modalShow()">로그인</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href = "">회원가입</a></div>
</header>