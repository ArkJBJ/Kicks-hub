<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SNS 계정 연결</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
	<style type="text/css">
		.btn-naver{
			color: white;
    		background: #03c75a;
		}
		.btn-kakao{
			background: #FEE500;
		}
		.sns-btn{
		    --bs-btn-padding-x: 4rem;
    		--bs-btn-padding-y: 1rem;
    		--bs-btn-border-width: 1px;
    		--bs-btn-border-color: transparent;
    		padding: var(--bs-btn-padding-y) var(--bs-btn-padding-x);
    		border: var(--bs-btn-border-width) solid var(--bs-btn-border-color);
		}
		.sns-icon{
			vertical-align: baseline;
		}
	</style>
</head>
<body>
	<%@ include file="../include/header.jsp" %>
    <main><!--메인 시작-->
        <div class="mypagemain">
            <div class="mypage_menu"><!--마이페이지 메뉴 시작-->
                <div class="mypagehi">
                    <p>안녕하세요, ${login.getUserNick()} 님!</p>
                </div>
                <div class="mypage_gnb">
                    <span><a href="<%=request.getContextPath()%>/order/user.do">주문배송조회</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_review.do">상품후기</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_like.do">관심있는 상품</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_qna.do">QnA</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_posting.do">내가 작성한 글</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_sns.do">SNS연결설정</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_modify_check.do">개인정보수정</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_withdrawal.do">회원탈퇴</a></span>
                </div>
            </div><!--마이페이지 메뉴 끝-->

            <article id="mypage_contain"><!--회원탈퇴 페이지 시작-->
                <div id="mypage_title">
                    <h2>
                        	SNS연결설정
                    </h2>
                    <p>
                        <i class="xi-angle-right-min"></i>
                        	카카오, 네이버 계정과 연동하여 간편하게 로그인 할 수 있는 기능을 설정/해제 하실 수 있습니다.
                    </p>
                    <p>
                        <i class="xi-angle-right-min"></i>
                       	 로그인 연결 해제는 단순히 SNS 로그인 기능만을 해제 하는 것이며, 회원탈퇴가 되는 것은 아닙니다.
                    </p>
                </div>
                <div>
                <c:if test="${not empty sns.userNaverId}">
                	<button class="rounded-0 btn-naver sns-btn" onclick="location.href='disconectNaver.do'"><i class="xi-naver sns-icon"></i> 네이버 계정연동 해제</button>
                </c:if>
                <c:if test="${empty sns.userNaverId}">
                	<button class="rounded-0 btn-naver sns-btn" onclick="connectNaver()"><i class="xi-naver sns-icon"></i> 네이버 계정연동</button>
                </c:if>                
                <c:if test="${not empty sns.userKakaoId}">
                	<button class="rounded-0 btn-kakao sns-btn mx-3" onclick="location.href='disconectKakao.do'"><i class="xi-speech sns-icon"></i> 카카오 계정연동 해제</button>
                </c:if>
                <c:if test="${empty sns.userKakaoId}">
                	<button class="rounded-0 btn-kakao sns-btn mx-3" onclick="conectKakao()"><i class="xi-speech sns-icon"></i> 카카오 계정연동</button>
                </c:if>                                  
                </div>
            </article><!--회원탈퇴 페이지 끝-->
        </div>
	</main>

	<%@ include file="../include/footer.jsp" %>
    
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script><!-- 부트스트랩 자바 스크립트연결 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.0.0/crypto-js.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/JS/script.js"></script><!-- 자바 스크립트 연결 -->
    
    <script type="text/javascript">
		function conectKakao(){
			let url = "https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=0575c28de27e26d54b189d1b04528e6b&redirect_uri=http://jjezen.cafe24.com/stepUp/user/kakaoLogin.do";
			let name = "kakaoLogin";
			let option = "width = 500, height = 500, top = 100, left = 200, location = no";
			 window.open(url, name, option);
		}
		
		function connectNaver(){
			let url = "<%=request.getContextPath()%>/user/naverLogin.do";
			let name = "naverLogin";
			let option = "width = 500, height = 500, top = 100, left = 200, location = no";
			window.open(url, name, option);
		}		
    </script>
</body>
</html>
