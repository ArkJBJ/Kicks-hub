<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->

</head>

<body style="background-color: #fafafa;">
    <main><!--메인 시작-->
        <div class="jointermslogo">
            <h1 class="jointerms_title">
                <a href="<%=request.getContextPath() %>/">
                    <img src="<%=request.getContextPath()%>/resources/image/kickshublogo.png" alt="kickshub">
                </a>
            </h1>
        </div>
        <article id="join_contain">
            <form name="frm" action="join.do" method="post" onsubmit = "return joinCheck()">
            
                <input type="hidden" name="loChk" id="loChk" value="${vo.loChk}">
                <input type="hidden" name="eveChk" id="eveChk" value="${vo.eveChk}">
                
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="userId" name="userId" placeholder="userId" oninput="checkId()">
                    <label for="userId">아이디</label>
                </div>
                <div id="checkIdResult" class="mb-3" style="font-size:13px;"></div>
                
                <div class="form-floating mb-3" >
                    <input type="password" class="form-control" id="userPw" name="userPw" placeholder="userPw" onblur="checkPw()">
                    <label for="userPw">비밀번호</label>
                    <div id="eyes">
                        <i class="xi-eye-o" id="i-eyes"></i>
                    </div>
                </div>
                <div id="checkPwResult" class="mb-3" style="font-size:13px;"></div>
                
                <div class="form-floating mb-3">
                    <input type="password" class="form-control" id="userPwc" name="userPwc"  placeholder="userPwc" onblur="checkPwc()">
                    <label for="userPwc">비밀번호 확인</label>
                    <div id="pwceyes">
                        <i class="xi-eye-o" id="c-eyes"></i>
                    </div>
                </div>
                <div id="checkPwcResult" class="mb-3" style="font-size:13px;"></div>
                
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="userName"  name="userName"  placeholder="이름" onblur="nameCheck()">
                    <label for="userName">이름</label>
                </div>
                <div id="checkNameResult" class="mb-3" style="font-size:13px;"></div>
                
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="userNick" name="userNick" placeholder="닉네임" oninput="checkNick()">
                    <label for="userNick">닉네임</label>
                </div>
                <div id="checkNickResult" class="mb-3" style="font-size:13px;"></div>
                
                <div class="form-floating mb-3 d-flex justify-content-between">
                    <input type="text" class="form-control w-80" id="userPhone" name="userPhone" placeholder="휴대폰 번호를 ‘-’ 없이 입력해주세요" onblur="PhoneCheck()" maxlength="11">
                    <label for="userPhone">휴대폰 번호를 ‘-’ 없이 입력해주세요"</label>
                    <button type="button" onclick="call()" class="btn btn-secondary btn-sm">인증번호 발송</button>
                </div>
                
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="userPchNum" name="userPchNum" placeholder="인증번호" onblur="Pch()" disabled>
                    <label for="userPchNum">인증번호</label>
                </div>
                <span id="timer"></span>
                <div id="check-Phone" style="margin-top: 16px; font-size:13px;"></div>
               	<div id="PchResult" class="mb-3" style="font-size:13px;"></div>
               	
                <div class="form-floating mb-3">
                    <input type="email" class="form-control" id="userMail" name="userMail" placeholder="이메일" onblur="checkEmail()">
                    <label for="userMail">이메일</label>         
                </div>
                <div id="checkEmailResult" class="mb-3" style="font-size:13px;"></div>
                
                <div class="form-floating mb-3 mt-3">
                    <input type="radio" id="userPhAc" name="userPhAc" value="Y" checked>연락처 수신동의
                    <input type="radio" id="userPhAc" class="upa2" name="userPhAc" value="N">연락처 수신비동의
                </div>
                
                <div class="form-floating mb-3 mt-3 d-flex justify-content-between">
                    <input type="text" class="form-control" id="userZipCode" name="userZipCode" placeholder="우편번호" readonly oninput="clearCheck()">
                    <label for="userZipCode">우편번호</label>
                    <button type="button" onclick="sample6_execDaumPostcode()" class="btn btn-secondary btn-sm">우편번호 찾기</button>
                </div>
                
                <div class="form-floating mb-3 mt-3">
                    <input type="text" class="form-control" id="userAddr" name="userAddr" placeholder="주소" readonly>
                    <label for="userAddr">주소</label>
                </div>
                
                <div class="form-floating mb-3 mt-3">
                    <input type="text" class="form-control" id="userAddrDetail" name="userAddrDetail" placeholder="상세주소">
                    <label for="userAddrDetail">상세주소</label>
                </div>
                
                <div id="checkAddrResult" class="mb-3" style="font-size:13px;"></div>
                <div class="mb-3 mt-3" id="join_btn">
                    <input type="button" value="취소" onclick="history.back()">
                    <input type="submit" value="가입하기">
                </div>
                
            </form>
        </article>
	</main><!-- 메인 끝 -->
    
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script><!-- 부트스트랩 자바 스크립트연결 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.0.0/crypto-js.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/JS/script.js"></script><!-- 자바 스크립트 연결 -->
    <script>
    
    	//비밀번호, 비밀번호 확인 보이기 숨기기
        let eyes = document.getElementById("eyes");
        let iEyes = document.getElementById("i-eyes");
        let UserPw = document.getElementById("userPw");
        eyes.addEventListener("click", function(){
            if(iEyes.classList.contains("xi-eye-o")){
                iEyes.classList.replace("xi-eye-o", "xi-eye-off-o");
                UserPw.setAttribute("type", "text");
            }else{
                iEyes.classList.replace("xi-eye-off-o", "xi-eye-o");
                UserPw.setAttribute("type", "password");
            }
        });

        let pwcEyes = document.getElementById("pwceyes");
        let cEyes = document.getElementById("c-eyes");
        let UserPwc = document.getElementById("userPwc");
        pwcEyes.addEventListener("click", function(){
            if(cEyes.classList.contains("xi-eye-o")){
                cEyes.classList.replace("xi-eye-o", "xi-eye-off-o");
                UserPwc.setAttribute("type", "text");
            }else{
                cEyes.classList.replace("xi-eye-off-o", "xi-eye-o");
                UserPwc.setAttribute("type", "password");
            }
        });


		//주소검색 api
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
    
                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수
    
                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }   
    
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('userZipCode').value = data.zonecode;
                    document.getElementById("userAddr").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("userAddrDetail").focus();
                }
            }).open();
        }
        
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
      		}
      		else if(!str.test(UserId)){
				let html = "4~11자의 영문으로 시작하는 숫자, 영문 소문자만 사용 가능합니다."
              	let checkIdResult = document.getElementById("checkIdResult");
          		$("#checkIdResult").html(html);
          		checkIdResult.style.color = '#ff0000';
          		checkIdOk = 0;
      		}else{
	      		$.ajax({
	      			url: "${pageContext.request.contextPath}/ajax/checkId.do",
	      			type: "post",
	      			data:{userId : UserId},
	      			success:function(data){ 
	   					 if(data != "failse"){
	      					let html = "사용가능한 아이디 입니다."
	      					let checkIdResult = document.getElementById("checkIdResult");
	      					$("#checkIdResult").html(html);
	      					checkIdResult.style.color = '#008000';
	      					checkIdOk = 1;
	      				}else{
	      					let html = "중복된 아이디 입니다."
	          				let checkIdResult = document.getElementById("checkIdResult");
	      					$("#checkIdResult").html(html);
	      					checkIdResult.style.color = '#ff0000';
	      					checkIdOk = 0;
	      				}
	      			},
	      			error:function(){
	      				alert("에러입니다.");
	      			}
	      		});
      		}
      	}
      	
      	
      	//비밀번호 유효성 체크
      	let checkPwOk = 0;
      	let comparisonPw;
      	function checkPw(){
	      	let UserPw = $('#userPw').val();
	      	let str = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,}$/;
	      	if(UserPw == ""){
				let html = "필수 정보입니다."
		        let checkIdResult = document.getElementById("checkPwResult");
		        $("#checkPwResult").html(html);
		        checkIdResult.style.color = '#ff0000';
		        comparisonPw = UserPw;
		        checkPwOk = 0;     
	      	}else if(!str.test(UserPw)){
				let html = "4자 이상의 영문, 숫자 를 사용하세요(특수문자 사용 불가)"
			    let checkIdResult = document.getElementById("checkPwResult");
			    $("#checkPwResult").html(html);
			    checkIdResult.style.color = '#ff0000';
			    comparisonPw = UserPw;
			    checkPwOk = 0; 
	      	}else{
				let html = "사용 가능한 비밀번호 입니다."
				let checkIdResult = document.getElementById("checkPwResult");
				$("#checkPwResult").html(html);
				checkIdResult.style.color = '#008000';
				comparisonPw = UserPw;
	      		checkPwOk = 1;
	      	}
      	
      	}
      	
      	
      	//비밀번호 확인 유효성 검사
      	let checkPwcOk = 0;
      	function checkPwc(){
      		let UserPwc = $('#userPwc').val();
      		if(UserPwc == ""){
				let html = "필수 정보입니다."
				let checkIdResult = document.getElementById("checkPwcResult");
				$("#checkPwcResult").html(html);
				checkIdResult.style.color = '#ff0000';
				checkPwcOk = 0;         			
      		}else if(UserPwc == comparisonPw){
				let html = "일치하는 비밀번호 입니다."
				let checkIdResult = document.getElementById("checkPwcResult");
				$("#checkPwcResult").html(html);
				checkIdResult.style.color = '#008000';
				checkPwcOk = 1;      			
      		}else{
				let html = "일치하지 않는 비밀번호 입니다."
				let checkIdResult = document.getElementById("checkPwcResult");
				$("#checkPwcResult").html(html);
				checkIdResult.style.color = '#ff0000';
				checkPwcOk = 0;           			
      		}
      	}
      	
      	
      	//닉네임 중복체크
      	let checkNickOk = 0;
     	function checkNick(){
      		let UserNick = $('#userNick').val();
      		let str = /^[a-zA-Z0-9가-힣]{2,10}$/;
      		
      		if(UserNick == ""){
				let html = "필수 정보입니다."
	            let checkIdResult = document.getElementById("checkNickResult");
	          	$("#checkNickResult").html(html);
	          	checkIdResult.style.color = '#ff0000';
	          	checkNickOk = 0;      			
      		}else if(!str.test(UserNick)){
				let html = "2~20자의 영문, 숫자,한글만 사용가능합니다. "
              	let checkIdResult = document.getElementById("checkNickResult");
          		$("#checkNickResult").html(html);
          		checkIdResult.style.color = '#ff0000';
          		checkNickOk = 0;
      		}else{
	      		$.ajax({
	      			url: "${pageContext.request.contextPath}/ajax/checkNick.do",
	      			type: "post",
	      			data:{userNick : UserNick},
	      			success:function(data){
	   					if(data != "failse"){
	      					let html = "사용가능한 닉네임 입니다."
	      					let checkIdResult = document.getElementById("checkNickResult");
	      					$("#checkNickResult").html(html);
	      					checkIdResult.style.color = '#008000';
	      					checkNickOk = 1;
	      				}else{
	      					let html = "중복된 닉네임 입니다."
	          				let checkIdResult = document.getElementById("checkNickResult");
	      					$("#checkNickResult").html(html);
	      					checkIdResult.style.color = '#ff0000';
	      					checkNickOk = 0;
      					}
      				},
      				error:function(){
      					alert("에러입니다.");
      				}
      			});
      		}
      	}
     	
     	
     	//이메일 유효성 검사
     	function checkEmail(){
     		let str = /^[a-z0-9]+@[a-z]+\.[a-z]{2,3}$/;
     		let UserMail = $('#userMail').val();
     		if(UserMail == ""||str.test(UserMail)){
     			let html = ""
     			let checkIdResult = document.getElementById("checkEmailResult");
     			$("#checkEmailResult").html(html);
     		}else{
     			let html = "잘못된 이메일 형식입니다."
         		let checkIdResult = document.getElementById("checkEmailResult");
         		$("#checkEmailResult").html(html);
         		checkIdResult.style.color = '#ff0000';
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
     	
     	//주소 입력 여부 체크
    	function addrCheck(){
     		let UserZipCode = $("#userZipCode").val();
     		let UserAddr = $("#userAddr").val();
     		if(UserZipCode == "" || UserAddr==""){
     			$("#checkAddrResult").html("필수 정보입니다.");
     			document.getElementById("checkAddrResult").style.color = '#ff0000';
     		}
     	}
     	
     	//주소 입력 여부 클리어
     	function clearCheck(){
     		$("#checkAddrResult").html("");
     	}

     	//회원가입 입력 및 인증 체크
     	function joinCheck(){
     		if(checkIdOk == 0){
     			checkId();
     			$("#userId").focus();
     			return false;
     		}
     		if(checkPwOk == 0){
     			checkPw();
     			$("#userPw").focus();
     			return false;
     		}
     		if(checkPwcOk == 0){
     			checkPwc();
     			$("#userPwc").focus();
     			return false;
     		}
     		if(checkNameOk == 0){
     			nameCheck();
     			$("#userName").focus();
     			return false;
     		}
     		if(checkNickOk == 0){
     			checkNick();
     			$("#userNick").focus();
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
     		
     		if($("#userZipCode").val() == "" || $("#userAddr").val() == ""){
     			addrCheck();
     			$("#userZipCode").focus();
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
