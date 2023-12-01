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
		margin : 35px auto;
		width : 82%;
	}
	.container .writeBtn {
		margin-top : 15px;
	}
	.container .title .td {
		display : inline-block;
	}
	.container .title .t1 {
		font-weight: bolder;
		font-size : 25px;
		margin-bottom : 15px;
	}
	.container .title .t2 {
		float : right;
	}
	.container .title select {
		width : 80px;
		height : 25px;
		border-radius: 5px;
	}
	.container .table {
		border-top : 2px solid rgb(117, 127, 214);
		border-bottom: 1px solid rgb(149, 156, 218);
	}
	.container .th {
		font-weight: bolder;
		font-size : 17px;
		text-align: center;
	}
	.container .thr {
		border-bottom:1px solid rgb(149, 156, 218);
	}
	.container .tr {
		border-bottom:1px solid #e0e0e0;
		height : 35px;
		overflow: hidden;
	}
	.container .tr:hover {
		background-color: rgb(249, 250, 255);
	}
	.container .td {
		display : inline-block;
		text-align: center;
		height : 35px;
		line-height: 35px;
		font-weight: bolder;
	}
	.container .td1 {
		width : 6%;
		font-size: 0.9em;
	}
	.container .td2 {
		width : 58%;
		text-align: left;
	}
	.container .td3 {
		width : 10%;
		font-size: 0.9em;
	}
	.container .td4 {
		width : 11%;
		font-size: 0.9em;
	}
	.container .td5 {
		width : 6%;
		font-size: 0.9em;
	}
	.container .td6 {
		width : 6%;
		font-size: 0.9em;
	}
	.container .writeBtn {
		padding : 5px 15px;
		border-radius: 5px;
		border : 0px;
		color : white;
		font-weight: bold;
		background : linear-gradient(to bottom left,rgb(151, 162, 208),rgb(101, 116, 203));
	}
	.container .writeBtn:hover {
		background : linear-gradient(to bottom left,rgb(153, 153, 175),rgb(91, 91, 133));
		cursor : pointer;
	}
	.container .pageBox {
		display : block;
		position : relative;
		width : 283px;
		margin : 0 auto;
		text-align: center;
	}
	.container .page {
		display : inline-block;
		float : left;
		width : 20px;
		height : 25px;
		font-weight: bold;
		text-align: center;
		padding : 1px 5px;
	}
	.container .page a {
		color : rgb(60, 101, 212);
	}
	.container .page:hover {
		background : rgb(86, 125, 233);
	}
	.container .page:hover a {
		color : white;
	}
	.container .pageStart {
		border : 1px solid rgb(168, 166, 166);
		border-right: 0px;
		border-top-left-radius: 5px;
		border-bottom-left-radius: 5px;
	}
	.container .pagePre {
		border : 1px solid rgb(168, 166, 166);
		border-right: 0px;
	}
	.container .page1 {
		border : 1px solid rgb(168, 166, 166);
		border-right: 0px;
	}
	.container .page2 {
		border : 1px solid rgb(168, 166, 166);
		border-right: 0px;
	}
	.container .page3 {
		border : 1px solid rgb(168, 166, 166);
		border-right: 0px;
	}
	.container .page4 {
		left : 163px;
		top : 0px;
		border : 1px solid rgb(168, 166, 166);
		border-right: 0px;
	}
	.container .page5 {
		border : 1px solid rgb(168, 166, 166);
		border-right: 0px;
	}
	.container .pageAfter {
		border : 1px solid rgb(168, 166, 166);
		border-right: 0px;
	}
	.container .pageEnd {
		border : 1px solid rgb(168, 166, 166);
		border-top-right-radius: 5px;
		border-bottom-right-radius: 5px;
	}
	.container .pageBox .selected {
		background : rgb(86, 125, 233);
	}
	.container a {
		color : black;
		text-decoration: none;
	}
	.container .pageBox .selected a {
		color : white;
	}
</style>