<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원탈퇴</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
</head>

	<script>
	
		function DoSubmit(){
			
			if( document.mpwdfrm.userPw.value == "" )
			{
				alert("비밀번호를 입력하세요.");
				document.mpwdfrm.userPw.focus();
				return false;
			}
			
			if( confirm("탈퇴하시겠습니까?") != 1 )
			{
				//true = 1     1이라고 쓰면 true로 인식함
				return false;
			}
			return true;
		}
	</script>

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
                        	회원탈퇴
                    </h2>
                    <p>
                        <i class="xi-angle-right-min"></i>
                        	회원탈퇴와 동시에 개인정보는 모두 삭제됩니다.
                    </p>
                    <p>
                        <i class="xi-angle-right-min"></i>
                       	 사용하고 계신 아이디는 탈퇴할 경우 재사용 및 복구가 불가능합니다.
                    </p>
                </div>

                <div id="mypage_subtitle">
                    <h3>본인 확인</h3>
                </div>
                <form name="mpwdfrm" action="mypage_withdrawal.do" method="post" class="mpwd" onsubmit="return DoSubmit();">

                    <div class="form-floating mb-3">
                        <input disabled type="text" class="form-control" id="userId" name="userId" placeholder="userId" value="${login.userId}">
                        <label for="userId">ID</label>
                    </div>

                    <div class="form-floating mb-3">
                        <input type="password" class="form-control" id="userPw" name="userPw" placeholder="userPw">
                        <label for="userPw">PASSWORD</label>
                    </div>
                    <div class="mb-3 mt-3" id="mypagewd_btn">
                        <input type="button" value="취소">
                        <input type="submit" value="확인">
                    </div>
                </form>
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
</body>
</html>
