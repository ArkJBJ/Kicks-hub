<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="proj.stepUp.vo.UserVO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>슬라이더 관리</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
</head>
<body>
<%@include file="../include/header.jsp"%>
    <main><!--메인 시작-->
        <div class="mypagemain">
            <div class="mypage_menu"><!--마이페이지 메뉴 시작-->
                <div class="mypagehi">
                    <p>안녕하세요, ${login.getUserNick()} 님!</p>
                </div>
                <div class="mypage_gnb">
                    <span><a href="<%=request.getContextPath()%>/admin.do">슬라이더 관리</a></span>
                    <span><a href="<%=request.getContextPath()%>/restrict.do">회원 관리</a></span>
                    <span><a href="<%=request.getContextPath()%>/qna/qna_rspList.do">QnA 답변대기 리스트</a></span>
                    <span><a href="<%=request.getContextPath()%>/order/manager.do">주문내역 관리</a></span>
                    <span><a href="<%=request.getContextPath()%>/product/management.do">상품관리</a></span>
                </div>
            </div><!--마이페이지 메뉴 끝-->
            <article id="mypage_contain"><!--관심목록 페이지 시작-->
                 <div id="mypage_title">
                    <h2>슬라이드 관리</h2>
                    <p>
                        <i class="xi-angle-right-min"></i>
                       	 메인 화면의 대표 슬라이드 구성을 바꿉니다.
                    </p>
                </div>
                <div class="mplikecontain">
				   <div id="slideEdit" style="width:60%; margin:30px auto;">
						<form name="slidefrm" method="post" action="slide.do" enctype="multipart/form-data">
							<br/> <br/>
							<div>변경할 슬라이드의 번호를 선택하세요</div>
							 <br/>
				        		<label><input type="radio" name="slideNum" value="1"> 1</label>
				     			<label><input type="radio" name="slideNum" value="2"> 2</label>
				        		<label><input type="radio" name="slideNum" value="3"> 3</label>
				     			<label><input type="radio" name="slideNum" value="4"> 4</label>
							<br/> <br/>
							<div>슬라이드에 넣을 이미지를 선택하세요</div>
							<br/> 
							<input type="file" name="mainFile" style="width:300px; height: 40px;" />
							 <br/> <br/>
							<input type="text" name="slideUrl"  placeholder="해당 슬라이드에 연결할 url을 입력해주세요" style="width:80%; height: 40px;" /> <input type="submit" value="저장" style="width:10%; height: 40px;" >
						</form>
					</div>
                </div>
            </article>
        </div>
	</main>
<%@include file="../include/footer.jsp"%>
</body>
</html>
