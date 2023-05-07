<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 변경</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
    <!-- ㅆㅁㄴㅌ 연결-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="/plugin/summernote/summernote-lite.js"></script>
    <script src="/plugin/summernote/summernote-ko-KR.min.js"></script>
    <link rel="stylesheet" href="/plugin/summernote/summernote-lite.css">
</head>
<body style="background-color: #fafafa;">
    <main><!--메인 시작-->
        <div class="jointermslogo">
            <h1 class="jointerms_title">
                <a href="/">
                    <img src="<%=request.getContextPath()%>/resources/image/kickshublogo.png" alt="kickshub">
                </a>
            </h1>
        </div>
        <article id="join_contain">
            <form name="frm" action="pwChgOK.do" method="post" onsubmit = "return joinCheck()">
		<input type="hidden" name="userIndex" value="${vo.userIndex}">
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
                <div class="mb-3 mt-3" id="join_btn">
                    <input type="button" value="취소" onclick="history.back()">
                    <input type="submit" value="변경하기">
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
     	//회원가입 입력 및 인증 체크
     	function joinCheck(){
     		checkPwc();
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
     		return true;
     	}
    </script>
</body>
</html>
