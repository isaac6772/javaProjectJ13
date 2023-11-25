<style>
    #joinModal {
        position : fixed;
        top : 0px;
        left : 0px;
        width : 100%;
        height : 100%;
        background-color: rgba(0, 0, 0, 0.5);
        display : none;
    }
    #joinModal .joinContent {
        background-color : white;
        margin : 100px auto;
        border : 1px solid rgb(190, 186, 186);
        border-radius : 12px;
        width : 500px;
        height : 720px;
        text-align: left;
        font-size: 1.1em;
        font-weight: bold;
        padding: 18px 30px 18px 30px;
        animation-name : myFade;
        animation-duration: 0.3s;
        position : relative;
    }
    @keyframes myFade {
        from {opacity : 0}
        to {opacity : 1}
    }
    #joinModal .close {
        position : absolute;
        top : 6px;
        right : 12px;
    }
    #joinModal .close i:hover {
        color : #aaa;
        cursor : pointer;
    }
    #joinModal .title {
        font-size: 1.3em;
        font-weight: bolder;
        text-align: center;
        margin-bottom: 10px;
    }
    #joinModal .box {
        margin-bottom: 25px;
        position: relative;
    }
    #joinModal input[type=text],#joinModal input[type=password] {
        border : 1px solid rgb(190, 186, 186);
        border-radius: 10px;
        width : 487px;
        height : 32px;
        padding-left: 10px;
        padding-top: 2px;
        margin-top: 5px;
        font-size: 0.85em;
        outline: none;
        transition: 0.1s;
    }
    #joinModal #mid, #joinModal #pwd, #joinModal #pwdConfirm {
        padding-left: 27px;
        width : 470px;
    }
    #joinModal .midIcon, #joinModal .pwdIcon {
        position : absolute;
        top : 46px;
        left : 10px;
    }
    #joinModal .box select {
        width : 120px;
        border-radius: 10px;
        height: 32px;
        border : 1px solid rgb(190, 186, 186);
    }
    #joinModal .btnBox {
        margin-top: 25px;
        text-align: center;
    }
    #joinModal .btnBox button {
        width : 150px;
        height : 33px;
        border-radius: 10px;
        border: 0px;
        background-color: #547abb;
        color : white;
        font-size: 0.9em;
    }
    #joinModal .btnBox button:hover {
        color : #eee;
        background-color: #6b8dc6;
    }
    #joinModal .validIcon, #joinModal .inValidIcon {
        display: none;
        position : absolute;
        right : 7px;
        top : 38px;
    }
    #joinModal .invalidMsg {
        position: absolute;
        font-size: 0.7em;
        color: red;
        top: 67px;
        left: 0px;
    }
    #joinModal .valid {
        border: 1px solid #34cd32 !important;
        background-color: #e9f0e9 !important;
    }
    #joinModal .inValid {
        border: 1px solid rgb(205, 50, 50) !important;
        background-color: rgb(247, 237, 237) !important;
    }
</style>
