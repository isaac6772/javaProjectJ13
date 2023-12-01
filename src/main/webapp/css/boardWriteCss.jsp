<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	.container {
		margin-left : 13vw;
		width : 87vw;
		position : absolute;
		top : 104px;
		left : -23px;
		z-index: 1;
	}
	.container .boardContainer {
		margin : 45px auto;
		width : 82%;
	}
	.container .td {
		display : inline-block;
		width : 100%;
	}
	.container .part {
		margin-bottom : 15px;
		position : relative;
	}
	.container .part span {
		font-weight: bolder;
		font-size : 25px;
	}
	.container .part i {
		position : absolute;
		left : 74px;
		top : 19px;
	}
	.container .title {
		width : 100%;
		font-size: 1.1em;
		font-family: 'Gowun Batang';
		font-weight: bold;
		outline: none;
		border : 2px solid rgb(104, 104, 104);
		border-radius: 5px;
		padding : 5px;
		margin-bottom: 15px;
		box-sizing: border-box;
	}
	.container .textarea {
		width : 100%;
		height : 500px;
		font-size: 1.1em;
		font-family: 'Gowun Batang';
		font-weight: bold;
		outline: none;
		border : 2px solid rgb(104, 104, 104);
		border-radius: 5px;
		padding : 5px;
		margin-bottom: 15px;
		box-sizing: border-box;
	}
	.container input[type=file] {
		font-family: 'Gowun Batang';
		font-size: 1em;
		font-weight: bold;
	}
	.container .boardWrite {
		font-size: 1.1em;
		font-family: 'Gowun Batang';
		font-weight: 500;
		padding : 5px 40px;
		background: linear-gradient(to bottom right,#9dacd9, #3f59c7);
		border : 0px;
		border-radius: 7px;
		color : white;
	}
	.container .boardWrite:hover {
		background: linear-gradient(to bottom right,#a6b3db, #5366bd);
		cursor: pointer;
	}
	#alertModal {
		position : fixed;
		top : 0px;
		left : 0px;
		background-color: rgba(0, 0, 0, 0.5);
		width : 100%;
		height : 100%;
		display : none;
		z-index: 99;
	}
	#alertModal #modalContent {
		margin : 200px auto;
		width : 300px;
		height : 180px;
		background : white;
		border-radius: 10px;
		text-align: center;
		animation-name : myFade;
		animation-duration : 0.3s;
	}
	@keyframes myFade {
		from {opacity:0}
		to {opacity:1}
	}
	#alertModal #modalContent .icon {
		height : 30px;
		margin-top: 15px;
		display : inline-block;
	}
	#alertModal #modalContent #alertMsg {
		height : 90px;
		font-weight: bolder;
		line-height: 80px;
	}
	#alertModal #modalContent input[type=button] {
		font-size: 1em;
		font-family: 'Gowun Batang';
		font-weight: 500;
		padding : 5px 40px;
		background: linear-gradient(to bottom right,#9dacd9, #3f59c7);
		border : 0px;
		border-radius: 7px;
		color : white;
		cursor : pointer;
	}
	#alertModal #modalContent input[type=button]:hover {
		background: linear-gradient(to bottom right,#a6b3db, #5366bd);
	}
</style>