<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개인정보 수정</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
</head>

	<script>
	
		function DoSubmit(){
			
			if( document.mpcfrm.userPw.value == "" )
			{
				alert("비밀번호를 입력하세요.");
				document.mpcfrm.userPw.focus();
				return false;
			}

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
            
            <article id="mypage_contain"><!--개인정보수정-비번확인 페이지 시작-->
                <div id="mypage_title">
                    <h2>
                       	 개인정보수정
                    </h2>
                </div>

                <div id="mypage_subtitle">
                    <h3>비밀번호 확인</h3>
                    <p>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인합니다.</p>
                </div>
                <form name="mpcfrm" action="mypage_modify_check.do" method="post" class="mpmc" onsubmit="return DoSubmit();">
                    <div class="form-floating mb-3">
                    	<input type="hidden" name="userId" value="${login.userId}">
                        <input type="password" class="form-control" id="userPw" name="userPw" placeholder="userPw">
                        <label for="userPw">PASSWORD</label>
                    </div>
                    <div class="mb-3 mt-3" id="mypage_btn">
                        <input type="submit" value="확인">
                    </div>
                </form>
                <p class="modifypre">회원님의 개인정보를 신중히 취급하며, 회원님의 동의 없이는<br/>
                    기재하신 회원정보를 공개 및 변경하지 않습니다.</p>
            </article><!--개인정보수정-비번확인 페이지 끝-->
        </div>
	</main>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>
