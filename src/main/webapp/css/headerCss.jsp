<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	header {
	    padding: 20px;
	    position: relative;
	    height: 5vh;
	    border-bottom: 1px solid rgb(224, 219, 219);
	}
	header .home,header .login {
	    display : inline-block;
	    cursor: pointer;
	}
	header .search {
	    margin-left: 25vw;
	    border: 1px solid rgb(190, 186, 186);
	    border-radius: 20px;
	    width: 950px;
	    height: 40px;
	    padding-left: 10px;
	    background-color: rgb(243, 243, 243);
	}
	header .search input[type = "text"]{
	    border: 0px;
	    outline: none;
	    font-size: 1.2em;
	    margin-left: 10px;
	    width: 900px;
	    background-color: rgb(243, 243, 243);
	}
	header .search i {
	    line-height: 40px;
	}
	header .home {
	    position: absolute;
	    left: 23px;
	    top: 25 px;
	    font-size: 1.5em;
	    font-weight: bolder;
	}
	header .login {
	    position: absolute;
	    right: 30px;
	    top: 25px;
	    font-size: 1.2em;
	    font-weight: bolder;
	}
	header a {
		text-decoration: none;
		color : black;
	}
</style>