<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	.container {
		width : 800px;
		margin : 15px auto;
		font-weight: bold;
	}
	.container .head {
		font-size: 1.3em;
		font-weight: bolder;
		margin-bottom: 10px;
	}
	.container .line {
		border-top:1px solid #e0e0e0;
		margin-bottom: 20px;
	}
	.container .profile {
		border: 2px solid #e0e0e0;
		border-radius: 6px;
		margin-bottom: 20px;
	}
	.container .profile .title {
		height : 50px;
		border-bottom: 1px solid #e0e0e0;
		line-height: 2.8em;
		padding-left: 20px;
		font-size: 1.1em;
	}
	.container .profile .imgBox {
		height : 160px;
		background-color: #f1f1f1;
		position : relative;
	}
	.container .profile .imgBox .img {
		position : absolute;
		width : 120px;
		height : 120px;
		border-radius: 120px;
		left : 20px;
		top : 20px;
		background: linear-gradient(to bottom right,#9dacd9, #3f59c7);
	}
	.container .profile .imgBox .img img {
		width : 120px;
		height : 120px;
		border-radius: 120px;
	}
	.container .profile .imgBox span {
		position : absolute;
		top : 40px;
		left : 180px;
	}
	.container .profile .imgBox span i {
		cursor : pointer;
	}
	.container .profile .imgBox .imgPencil {
		position : absolute;
		width : 25px;
		height : 25px;
		border : 2px solid white;
		border-radius : 25px;
		left : 103px;
		top : 111px;
		background : linear-gradient(to bottom right,#9dacd9, #3f59c7);
	}
	.container .profile .imgBox .imgPencil img {
		width : 25px;
		height : 25px;
		border-radius : 25px;
		cursor: pointer;
	}
	.container .profile .imgBox #nickChange {
		display : none;
		position : absolute;
		left : 179px;
		top : 100px;
	}
	.container .profile .imgBox #invalidMsg {
		position : absolute;
		left : 181px;
		top : 130px;
		color : red;
		font-size: 0.8em;
	}
	.container .profile #nickChange input[type=text] {
		border : 1px solid rgb(190, 190, 190);
		border-radius: 5px;
		height : 25px;
		padding : 0px 5px 0px 5px;
		padding-left : 4px;
		outline : none;
		font-weight : bold;
		font-family: 'Gowun Batang';
	}
	.container .profile #nickChange input[type=button] {
		border : 1px solid rgb(190, 190, 190);
		border-radius: 5px;
		height : 27px;
		padding : 0px 10px 0px 10px;
		background : linear-gradient(to bottom, #aeb7d1, #5f6ca7);
		font-family: 'Gowun Batang';
		color : white;
		cursor : pointer;
	}
	.container .profile #nickChange input[type=button]:hover {
		box-shadow: 0px 0px 4px 1px #aeb7d1;
	}
	.container .info {
		border: 2px solid #e0e0e0;
		border-radius: 6px;
		margin-bottom: 20px;
	}
	.container .info .title{
		height : 50px;
		border-bottom: 1px solid #e0e0e0;
		line-height: 2.8em;
		padding-left: 20px;
		font-size: 1.1em;
	}
	.container .info .tr:hover {
		background-color: #f1f1f1;
	}
	.container .info .tr:hover input {
		background-color: #f1f1f1;
	}
	.container .info .tr:hover .pencil {
		display : inline-block;
		cursor : pointer;
	}
	.container .info .th, .info .td {
		display: inline-block;
		padding : 10px;
	}
	.container .info .th {
		width : 17%;
		padding-left: 20px;
	}
	.container .info .td {
		width : 75%;
		position : relative;
	}
	.container .info .td #phoneInvalid, .info .td #nameInvalid {
		position : absolute;
		top : 12px;
		left : 207px;
		font-size : 0.8em;
		color : red;
	}
	.container .info .td input {
		border : 1px solid #e0e0e0;
		border-radius : 3px;
		background-color : #f1f1f1;
		outline: none;
		font-family: 'Gowun Batang';
		font-weight: bold;
		font-size : 1em;
		padding : 0px;
		padding-left: 3px;
	}
	.container .info .pencil {
		display : none;
		position : absolute;
		right : 0px;
		top : 20px;
	}
	.container .info .check {
		display : none;
		position : absolute;
		right : 0px;
		top : 15px;
		cursor : pointer;
	}
	.container .account {
		border: 2px solid #e0e0e0;
		border-radius: 6px;
		margin-bottom: 20px;
	}
	.container .account .title {
		height : 50px;
		border-bottom: 1px solid #e0e0e0;
		line-height: 2.8em;
		padding-left: 20px;
		font-size: 1.1em;
	}
	.container .account .th {
		padding: 10px 10px 10px 20px;
		display : inline-block;
		width : 200px;
	}
	.container .account a {
		color : rgb(55, 55, 155);
		font-size: 0.9em;
	}
	.container .account .tr {
		height : 50px;
	}
	.container .account .td {
		display : inline-block;
		width : 550px;
		text-align: right;
		margin-right : 10px;
	}
	.container .account input[type=password] {
		border: 1px solid #dfdfdf;
		border-radius: 3px;
		outline: none;
		background-color: #f1f1f1;
		height : 24px;
		padding : 0px 0px 0px 3px;
	}
	.container .account input[type=button] {
	    border: 1px solid rgb(190, 190, 190);
	    border-radius: 3px;
	    background: linear-gradient(to bottom, #aeb7d1, #5f6ca7);
	    cursor: pointer;
	    color: white;
	    padding: 0px 11px 0px 11px;
	    height : 25px;
	}
	#memberDeleteModal {
		display : none;
		position : fixed;
		left : 0px;
		top : 0px;
		background-color: rgba(0, 0, 0, 0.5);
		width : 100%;
		height : 100%;
	}
	#memberDeleteModal .content {
		background-color: white;
		width : 650px;
		height : 400px;
		margin : 80px auto;
		border-radius: 5px;
		padding : 17px;
		animation-name : myFade;
		animation-duration : 0.3s;
		position : relative;
	}
	@keyframes myFade {
		from {top:-300px; opacity:0}
		to {top : 0px; opacity : 1}
	}
	#memberDeleteModal .title {
		font-size: 1.2em;
		font-weight: bolder;
	}
	#memberDeleteModal .title div {
		display : inline-block;
		width : 575px;
		text-align: right;
	}
	#memberDeleteModal .title div .close {
		cursor: pointer;
	}
	#memberDeleteModal .info {
		border: 2px solid #c4c4c4;
		border-radius: 6px;
		padding : 10px;
		font-weight: bold;
		font-size: 0.9em;
		margin : 7px 0px 7px 0px;
	}
	#memberDeleteModal .selectBox {
		border: 2px solid #c4c4c4;
		border-radius: 5px;
		height : 30px;
		width : 100%;
		margin : 7px 0px 15px 0px;
	}
	#memberDeleteModal .check {
		font-size : 0.8em;
		font-weight: bold;
		margin-bottom: 30px;
	}
	#memberDeleteModal .delete {
		text-align: center;
	}
	#memberDeleteModal .delete input {
		width : 160px;
		padding : 8px;
		font-size: 1.1em;
		color : white;
		background-color: red;
		border: 0px;
		border-radius: 5px;
		transition : 0.3s;
	}
	#memberDeleteModal .delete input:hover {
		background-color: rgb(189, 25, 25);
		cursor: pointer;
	}
</style>