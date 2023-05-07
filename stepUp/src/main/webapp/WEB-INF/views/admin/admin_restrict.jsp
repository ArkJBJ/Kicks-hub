<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="proj.stepUp.vo.UserVO"%>
<% 
	List<UserVO> blist = (List<UserVO>)request.getAttribute("blist");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 제재</title>
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
                    <h2>회원 제재 관리</h2>
                    <p>
                        <i class="xi-angle-right-min"></i>
                       	회원의 자유게시판 및 댓글을 제한합니다.
                    </p>
                     <p>
                        <i class="xi-angle-right-min"></i>
                       	회원의 상태가 'F'일 경우 제재된 회원 입니다.
                    </p>
                </div>
                <div class="mplikecontain">
				    <form action="restrict.do" method="post">
						<br/> <br/>
						<input type="hidden" name="userGrade" value="F" >
						<input type="text" name="userId" placeholder="제재할 회원이 ID를 입력해주세요"  style="width:600px; height: 40px; border-radius: 0;" /> <input type="submit" class="srch-bt" value="저장" style="height: 40px;">
					</form>
                </div>
                <div id="mypage_title" style="margin-top:50px">
                    <h2>제재된 회원 내역</h2>
                    <p>
                        <i class="xi-angle-right-min"></i>
                       	현재 기능이 제한된 회원내역 입니다.
                    </p>
                    <table style="text-align:center; font-size:13px;">
						 	<tr> 
						 		<td style="width:150px; height:35px">회원아이디  </td>
						 		<td style="width:150px; ">닉네임</td>
						 		<td style="width:150px; ">회원번호</td>
						 		<td style="width:150px; ">상태</td>
						 		<td style="width:100px; "></td>
						 	<tr>
	                   	<c:forEach var="vo" items="${blist}">
							<tr>
								<form action="restrict.do" method="post">
								<input type="hidden" name="userGrade" value="U" >
								<input type="hidden" name="userId" value="${vo.userId}"> 
								<td style="width:150px; height:45px">${vo.userId}</td>
						 		<td>${vo.userNick}</td>
						 		<td>${vo.userIndex}</td>
						 		<td>${vo.userGrade}</td>
						 		<td><input type="submit" value="해제" style="width:100px; height: 30px;" ></td>
						 		</form>
							</tr>
						 </c:forEach>
                    </table>
                </div>
            </article>
        </div>
	</main>
<%@include file="../include/footer.jsp"%>
</body>
</html>
