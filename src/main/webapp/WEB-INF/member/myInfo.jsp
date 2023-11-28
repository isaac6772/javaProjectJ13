<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>myInfo.jsp</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/0989d78570.js" crossorigin="anonymous"></script>
	<style>
		.container {
			width : 800px;
			margin : 30px auto;
			font-weight: bold;
		}
		.head {
			font-size: 1.3em;
			font-weight: bolder;
			margin-bottom: 10px;
		}
		.line {
			border-top:1px solid #eaeaea;
			margin-bottom: 20px;
		}
		.profile {
			border: 1px solid #eaeaea;
			border-radius: 6px;
			margin-bottom: 20px;
		}
		.profile .title {
			height : 50px;
			border-bottom: 1px solid #eaeaea;
			background-color: #f1f1f1;
			line-height: 2.8em;
    		padding-left: 20px;
    		font-size: 1.1em;
		}
		.profile .img {
			height : 140px;
		}
		.info {
			border: 1px solid #eaeaea;
			border-radius: 6px;
			margin-bottom: 20px;
		}
		.info .title{
			height : 50px;
			border-bottom: 1px solid #eaeaea;
			line-height: 2.8em;
    		padding-left: 20px;
    		font-size: 1.1em;
		}
		.info .tr:hover {
			background-color: #f1f1f1;
		}
		.info .th, .info .td {
			display: inline-block;
			padding : 10px;
		}
		.info .th {
			width : 17%;
			padding-left: 20px;
		}
		.info .td {
			width : 75%;
		}
		.account {
			border: 1px solid #eaeaea;
			border-radius: 6px;
			margin-bottom: 20px;
		}
		.account .title {
			height : 50px;
			border-bottom: 1px solid #eaeaea;
			line-height: 2.8em;
    		padding-left: 20px;
    		font-size: 1.1em;
		}
	</style>
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<jsp:include page="/include/nav.jsp"></jsp:include>
	
	<div class = "container">
		<div class = "head">나의정보</div>
		<div class = "line"></div>
		<div class = "profile">
			<div class = "title">프로필</div>
			<div class = "img"></div>
		</div>
		<div class = "info">
			<div class = "title">개인정보</div>
			<div class = "content">
				<div class = "tr">
					<div class = "th">가입일자</div>
					<div class = "td">2023-01-02</div>
				</div>
				<div class = "tr">
					<div class = "th">등급</div>
					<div class = "td"></div>
				</div>
				<div class = "tr">
					<div class = "th">포인트</div>
					<div class = "td"></div>
				</div>
				<div class = "tr">
					<div class = "th">작성글개수</div>
					<div class = "td"></div>
				</div>
				<div class = "tr">
					<div class = "th">전화번호</div>
					<div class = "td"></div>
				</div>
				<div class = "tr">
					<div class = "th">성별</div>
					<div class = "td"></div>
				</div>
			</div>
		</div>
		<div class = "account">
			<div class = "title">계정관리</div>
			<div class = "manage"></div>
		</div>
	</div>
	 
</body>
</html>