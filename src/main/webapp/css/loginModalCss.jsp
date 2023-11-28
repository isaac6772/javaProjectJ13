<style>
    #loginModal {
    	position : fixed;
    	top : 0px;
    	left : 0px;
    	width : 100%;
    	height : 100%;
    	background-color: rgba(0, 0, 0, 0.5);
    	display : none;
    }
    #loginModal .loginContent {
    	background-color : white;
    	margin : 200px auto;
    	border : 1px solid rgb(190, 186, 186);
    	border-radius : 12px;
    	width : 400px;
    	height : 390px;
    	text-align: center;
    	font-size: 1.2em;
    	font-weight: bolder;
    	padding : 15px;
    	animation-name : myFade;
    	animation-duration: 0.3s;
    	position : relative;
    }
    @keyframes myFade {
    	from {opacity : 0}
    	to {opacity : 1}
    }
    
    #loginModal input[type=text],#loginModal input[type=password]{
    	border : 0px;
    	outline: none;
    	font-size: 0.9em;
    	position : absolute;
    	top : 7px;
    	left : 35px;
    	width : 85%;
    }
    #loginModal .idbox,#loginModal .pwdbox {
    	border : 1px solid rgb(190, 186, 186);
    	border-radius: 5px;
    	margin-top: 30px;
    	height : 37px;
    	text-align: left;
    	padding-left : 10px;
    	position : relative;
    }
    #loginModal i{
    	position : absolute;
    	top : 7px;
    	left : 8px;
    }
    #loginModal .loginBtn {
    	border : 0px;
    	border-radius: 25px;
    	width : 100%;
    	height : 40px;
    	background-color: #547abb;
    	margin-top: 20px;
    	margin-bottom: 30px;
    	color : white;
    	font-size: 1em;
    }
    #loginModal .loginBtn:hover {
    	color : #eee;
    	background-color: #6b8dc6;
    }
    #loginModal .close {
    	position : absolute;
    	top : 10px;
    	right : 35px;
    }
    #loginModal .close i:hover {
    	color : #aaa;
    	cursor : pointer;
    }
    #loginModal a {
    	text-decoration: none;
    	color : black;
    }
</style>
