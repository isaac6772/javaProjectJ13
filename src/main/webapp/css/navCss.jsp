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
	nav .submenu div{
	    padding-left: 57px;
	    font-size: 0.9em;
	}
	nav a {
		text-decoration: none;
		color : black;
		display : block;
	}
</style>