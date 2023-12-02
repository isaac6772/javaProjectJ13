<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.container {
	margin-left : 13vw;
	width : 87vw;
	position : absolute;
	top : 145px;
	left : 130px;
	z-index: 1;
}
.container .contentBox {
	width : 80%;
	border : 1px solid rgb(228, 228, 228);
	border-radius: 7px;
	padding : 20px;
	font-weight: 600;
}
.container .title {
	font-size : 1.9em;
	margin-bottom: 10px;
}
.container .content {
	min-height: 400px;
}
.container .content img {
	max-width: 900px;
}
.container .line {
	border-top : 1px solid rgb(228, 228, 228);
	margin-bottom: 15px
}
.container .replBox {
	border : 2px solid rgb(228, 228, 228);
	border-radius : 6px;
	margin : 12px 0px 12px 0px;
	padding : 10px;
	width : 100%;
	height : 120px;
	box-sizing: border-box;
	position : relative;
}
.container .replBox textarea {
	border : 0px;
	outline : none;
	resize : none;
	width : 100%;
	height : 100%;
	font-family: 'Gowun Batang';
	font-size: 1em;
	font-weight: 600;
}
.container .replBox .replLimit {
	position: absolute;
	top : -27px;
	right : 3px;
	font-weight: normal;
	font-family: "돋움";
	color : lightgray;
}
.container .info img {
	background: linear-gradient(to bottom right,#9dacd9, #3f59c7);
	border-radius: 32px;
	width : 32px;
	height : 32px;
}
.container .info > div {
	display : inline-block;
	height : 50px;
	line-height: 19px;
}
.container .info .contentMenu {
	float : right;
	height: 20px;
	width : 10px;
	margin-top: 19px;
	text-align: center;
	cursor: pointer;
	position : relative;
}
.container .info .contentMenu #contentSubMenu {
	width : 82px;
	border : 1px solid rgb(228, 228, 228);
	border-radius : 3px;
	position : absolute;
	top : 23px;
	left : -74px;
	background-color: white;
	font-size : 15px;
	box-shadow: 0 1px 12px 0 rgba(0,0,0,.06);
	display : none;
}
.container .info .contentMenu #contentSubMenu div {
	margin : 5px 0px;
	padding : 4px 0px;
}
.container .info .contentMenu #contentSubMenu div:hover {
	background-color: rgb(245, 245, 245);
	cursor : pointer;
}
.container .info2 {
	margin-top : 10px;
	margin-bottom: 10px;
	user-select : none;		/* 드래그 선택 방지 */
}
.container .info2 .gb {
	cursor : pointer;
}
.container .replBtn {
	text-align: right;
	
}
.container .replBtn input[type=button] {
	padding : 5px 15px;
	border-radius: 5px;
	border : 0px;
	color : white;
	font-weight: bold;
	background : linear-gradient(to bottom left,rgb(151, 162, 208),rgb(101, 116, 203));
}
.container .replBtn input[type=button]:hover {
	background : linear-gradient(to bottom left,rgb(153, 153, 175),rgb(91, 91, 133));
	cursor : pointer;
}
.container .repl {
	position : relative;
	min-height: 70px;
	border-top : 1px solid rgb(228, 228, 228);
	padding-top : 4px;
}
.container .repl .profile {
	width : 32px;
	height : 32px;
	background: linear-gradient(to bottom right,#9dacd9, #3f59c7);
	border-radius: 32px;
	position : absolute;
	left : 0px;
	top : 10px;
}
.container .repl .replContentBox {
	margin-left : 43px;
}
.container .repl .replContentBox .replNick {
	
}
.container .repl .replContentBox .replContent {
	font-family: 'Nanum Gothic';
	font-size : 14px;
	margin : 5px 0px;
	font-weight: normal;
}
.container .repl .replContentBox .replDate {
	color : gray;
	font-size: 0.8em;
}
  </style>