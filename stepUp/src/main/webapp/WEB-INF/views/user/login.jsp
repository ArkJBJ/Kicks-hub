<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>로그인</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->   
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
	            <form name="frm" action="login.do" method="post">
	                <div class="form-floating mb-3">
	                    <input type="text" class="form-control" id="userId" name="userId" placeholder="userId">
	                    <label for="userId">ID</label>
	                </div>
	                <div class="form-floating">
	                    <input type="password" class="form-control" id="userPw" name="userPw" placeholder="userPw">
	                    <label for="userPw">PASSWORD</label>
	                    <div id="eyes">
	                        <i class="xi-eye-o" id="i-eyes"></i>
	                    </div>
	                </div>
	                <div class="d-flex justify-content-end find-area">
	                    <a href="find_id.do">아이디 찾기 </a>
	                    <span>&nbsp; &nbsp; | &nbsp;</span>
	                    <a href="find_pw.do" class="find-btn">비밀번호 찾기</a>
	                </div>
	                <div class="d-grid gap-2 login-btn-area">
		                <div class="btngroup">
		                    <button class="btn btn-primary btn-lg">로그인</button>
		                    <button class="btn btn-primary btn-lg" type="button" onclick="location.href='join_terms.do'">회원가입</button>
	                    </div>
	                    <a href="#" onclick="kakaoLogin()" class="sns-login kakao">
	                        <img src="<%=request.getContextPath()%>/resources/image/btn_login_kakao.gif" alt="카카오 로그인">
	                    </a>
	                    <a href="#" onclick="naverLogin()" class="sns-login">
	                        <img src="<%=request.getContextPath()%>/resources/image/btn_login_naver.gif" alt="네이버 로그인">
	                    </a>
	                </div>
	                <c:if test="${not empty SNS}">
	                	<input type="hidden" valeu="${SNS}" name="sns">
	                </c:if>
	            </form>
	        </div><!--로그인 main 영역 끝-->
        </div>
        </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script><!-- 부트스트랩 자바 스크립트연결 -->
    <script>//비밀번호 입력창 암호 보이기 숨기기 JS
       window.onload = function(){
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
       }
   
   	function kakaoLogin(){
		location.href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=0575c28de27e26d54b189d1b04528e6b&redirect_uri=http://jjezen.cafe24.com/stepUp/user/kakaoLogin.do"
   	}
   	
   	function naverLogin(){
   		location.href="naverLogin.do"
   	}
   </script>
</body>
</html>
