<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap');
	body {
        margin: 0px;
        padding: 0px;
        font-family: 'Gowun Batang';
	}
	header {
	    padding: 20px;
	    position: relative;
	    height: 5vh;
	    border-bottom: 1px solid rgb(224, 219, 219);
	}
	header .home, header .search, header .login1, header .login2{
	    display : inline-block;
	}
	header .search {
	    margin-left: 5vw;
	    border: 1px solid rgb(190, 186, 186);
	    border-radius: 20px;
	    width: 65%;
	    height: 40px;
	    padding-left: 10px;
	    background-color: rgb(243, 243, 243);
	}
	header .search input[type = "text"]{
	    border: 0px;
	    outline: none;
	    font-size: 1.2em;
	    margin-left: 10px;
	    width: 85%;
	    background-color: rgb(243, 243, 243);
	}
	header .search i {
	    line-height: 40px;
	}
	header .home {
	    font-size: 1.5em;
	    font-weight: bolder;
	    cursor: pointer;
	}
	header .login1 {
		position : relative;
		margin-left : 220px;
		width : 150px;
	    font-size: 1.2em;
	    font-weight: bolder;
	}
	header .login2 {
		position : fixed;
		top : 28px;
		margin-left : 150px;
		width : 200px;
	    font-size: 1.2em;
	    font-weight: bolder;
	    height : 60px;
	}
	header .login2 .profile {
		position : fixed;
		display : inline-block;
		background: linear-gradient(to bottom right,#9dacd9, #3f59c7);
		border-radius: 32px;
		width : 32px;
		height : 32px;
		top : 26px;
		right : 56px;
	}
	header .login2 img {
		border-radius: 32px;
		width : 32px;
		height : 32px;
	}
	header .info {
		display : none;
		position : fixed;
		top : 62px;
		right : 55px;
		width : 125px;
		border:1px solid rgb(155, 155, 155);
		border-radius: 6px;
		background-color: white;
	}
	header .info div {
		display: inline-block;
		width : 100%;
		font-size: 0.8em;
		text-align: center;
	}
	header .login1 a:hover, header .login2 a:hover {
		color : darkgray;
	}
	header a {
		text-decoration: none;
		color : black;
	}
	
</style>