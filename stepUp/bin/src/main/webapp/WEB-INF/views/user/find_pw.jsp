<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body style="background-color: #fafafa;">
     <main class="loginlogo">
        <div class="jointermslogo">
            <h1 class="jointerms_title">
                <a href="<%=request.getContextPath()%>/">
                    <img src="<%=request.getContextPath()%>/resources/image/kickshublogo.png" alt="kickshub">
                </a>
            </h1>
        </div>
    	<div class="login-area">
	        <div class="login-main"><!--로그인 main 영역 시작-->
	            <form name="frm" action="find_pw.do" method="post" onsubmit = "return joinCheck()">
	                <div class="form-floating mb-3">
	                    <input type="text" class="form-control" id="userId" name="userId" placeholder="userId" oninput="checkId()">
	                    <label for="userId">아이디</label>
	                </div>
	                <div id="checkIdResult" class="mb-3" style="font-size:13px;"></div>
	                
	                <div class="form-floating mb-3">
	                    <input type="text" class="form-control" id="userName"  name="userName"  placeholder="이름" onblur="nameCheck()">
	                    <label for="userName">이름</label>
	                </div>
	                <div id="checkNameResult" class="mb-3" style="font-size:13px;"></div>
 					<div class="form-floating mb-3 d-flex justify-content-between">
	                    <input type="text" class="form-control w-80" id="userPhone" name="userPhone" placeholder="휴대폰 번호를 ‘-’ 없이 입력해주세요" onblur="PhoneCheck()" maxlength="11">
	                    <label for="userPhone">휴대폰 번호를 ‘-’ 없이 입력해주세요</label>
	                    <button type="button" onclick="call()" class="btn btn-secondary btn-sm">인증번호 발송</button>
	                </div>
	                <div class="form-floating mb-3">
	                    <input type="text" class="form-control" id="userPchNum" name="userPchNum" placeholder="인증번호" onblur="Pch()" disabled>
	                    <label for="userPchNum">인증번호</label>
	                </div>
	                <span id="timer"></span>
	                <div id="check-Phone" style="margin-top: 16px; font-size:13px;"></div>
	               	<div id="PchResult" class="mb-3" style="font-size:13px;"></div>
	                
	                <div class="d-flex justify-content-end find-area">
	                    <a href="javascript:history.back()">이전 페이지 </a>
	                    <span>&nbsp; | &nbsp; &nbsp;</span>
	                    <a href="find_id.do" class="find-btn">아이디 찾기</a>
	                </div>
	                <div class="d-grid gap-2 login-btn-area">
		                <div class="btngroup">
		                    <button class="btn btn-primary btn-lg">확인</button>
		                    <button class="btn btn-primary btn-lg" type="button" onclick="location.href='join.do'">회원가입</button>
	                    </div>
	                </div>
	            </form>
	        </div><!--로그인 main 영역 끝-->
        </div>
        </main>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script><!-- 부트스트랩 자바 스크립트연결 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.0.0/crypto-js.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/JS/script.js"></script><!-- 자바 스크립트 연결 -->
    <script>

      	//아이디 중복체크
      	let checkIdOk = 0;  
      	function checkId(){
      		let UserId = $('#userId').val();
      		let str = /^[a-z]{1}[a-z0-9]{3,10}$/;
      		if(UserId == ""){
				let html = "필수 정보입니다."
	            let checkIdResult = document.getElementById("checkIdResult");
	            $("#checkIdResult").html(html);
	          	checkIdResult.style.color = '#ff0000';
	          	checkIdOk = 0;      			
      		}else if(!str.test(UserId)){
				let html = "4~11자의 영문으로 시작하는 숫자, 영문 소문자만 사용 가능합니다."
	              	let checkIdResult = document.getElementById("checkIdResult");
	          		$("#checkIdResult").html(html);
	          		checkIdResult.style.color = '#ff0000';
	          		checkIdOk = 0;
      		}else{
				let html = ""
				let checkIdResult = document.getElementById("checkIdResult");
				$("#checkIdResult").html(html);
				checkIdOk = 1;
      		}
      	}
     	
      	//이름 유효성 검사
     	let checkNameOk = 0;
     	function nameCheck(){
     		let str =  /^[가-힣a-zA-Z]+$/;
     		let userName = $("#userName").val();
     		if(userName == ""){
     			$("#checkNameResult").html("필수 정보입니다.");
     			 document.getElementById("checkNameResult").style.color = "#ff0000";
     			 checkNameOk = 0;
     		}else if(!str.test(userName)){
     			$("#checkNameResult").html("한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)");
     			 document.getElementById("checkNameResult").style.color = "#ff0000";
     			 checkNameOk = 0;
     		}else{
     			$("#checkNameResult").html("");
     			checkNameOk = 1;
     		}
     	}
      	
     	// 핸드폰 문자 인증 및 유효성 체크
     	let PchOk = 0;
     	function call(){
     		let UserPchNumStyle = document.getElementById("userPchNum");
     		let UserPhone = $("#userPhone").val();
     		let str = /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;
     		if(UserPhone == "" || !str.test(UserPhone)){
     				$("#PchResult").html("형식에 맞지 않는 번호입니다.");
     				document.getElementById("PchResult").style.color = '#ff0000';
     		}else{
     			$.ajax({
     				url:"<%=request.getContextPath()%>/ajax/checkPhone.do",
     				type:"post",
     				data:{userPhone : UserPhone},
     				success:function(data){
     					sendAuthNum();
     					alert("인증번호가 전송되었습니다.");
     					UserPchNumStyle.disabled = false;	
     				},
     				error:function(){
     					alert("인증번호 전송에 실패했습니다.");
     				}
     			});
     		}
     	}
     	
     	//핸드폰 필수 입력 체크
     	function PhoneCheck(){
     		let UserPhone = $("#userPhone").val();
     		if(UserPhone == ""){
     			$("#PchResult").html("필수 정보입니다.");
     			document.getElementById("PchResult").style.color = '#ff0000';
     			PchOk = 0;
     		}else{
     			$("#PchResult").html("");
     		}
     	}
     	
     	//인증번호 일치 확인
     	function Pch(){//ajax로 처리 보안 문제(완료)
     		let PchNum = $("#userPchNum").val();
     		let checkPhone =  document.getElementById("check-Phone");
     		let UserPchNumStyle = document.getElementById("userPchNum");
			$.ajax({
				url:"<%=request.getContextPath()%>/ajax/checkPchNum.do",
				type:"post",
				data:{PchNum : PchNum},
				success:function(data){
					if(data == 1){
		     			PchOk = 1;
		     			$("#check-Phone").html("인증번호가 일치합니다.");
		     			checkPhone.style.color = "#008000";
		     			UserPchNumStyle.style.borderColor = "#008000";
		     			UserPchNumStyle.disabled = true;
	                    clearInterval(timer);
	                    document.querySelector('#timer').textContent = "";
	                    isRunning = false;
					}else{
		     			PchOk = 0;
		     			$("#check-Phone").html("인증번호가 일치하지 않습니다.");
		     			checkPhone.style.color = "#ff0000";
		     			UserPchNumStyle.style.borderColor = "#ff0000";
					}
				}
			});
     	}


     	//회원가입 입력 및 인증 체크
     	function joinCheck(){
     		if(checkIdOk == 0){
     			checkId();
     			$("#userId").focus();
     			return false;
     		}

     		if(checkNameOk == 0){
     			nameCheck();
     			$("#userName").focus();
     			return false;
     		}

     		if(PchOk == 0){
     			PhoneCheck();
     			$("#userPhone").focus();
     			return false;        			
     		}
     		if($("#userPchNum").val() == ""){
     			 $("#PchResult").html("인증번호를 입력해 주세요");
     			 document.getElementById("PchResult").style.color = '#ff0000';
      			 $("#UserPhone").focus();
     			 return false; 
     		}
     		return true;
     	}
     	
     	
     	//인증번호 타이머
        var timer;
        var isRunning = false;

        // 인증번호 발송 및 타이머 함수 실행
        function sendAuthNum(){
            // 남은 시간(초)
            var leftSec = 300,
            display = document.querySelector('#timer');
            // 이미 타이머가 작동중이면 중지
            if (isRunning){
                clearInterval(timer);
            }
            startTimer(leftSec, display);
        }

        function startTimer(count, display) {
            var minutes, seconds;
            timer = setInterval(function () {
                minutes = parseInt(count / 60, 10);
                seconds = parseInt(count % 60, 10);
                minutes = minutes < 10 ? "0" + minutes : minutes;
                seconds = seconds < 10 ? "0" + seconds : seconds;
                display.textContent = minutes + ":" + seconds;
                // 타이머 종료
                if (--count < 0) {
                    clearInterval(timer);
                    display.textContent = "";
                    isRunning = false;
                }
            }, 1000);
            isRunning = true;
        }
    </script>
</body>
</html>
