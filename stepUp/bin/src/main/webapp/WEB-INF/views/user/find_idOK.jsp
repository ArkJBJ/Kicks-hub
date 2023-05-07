<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="proj.stepUp.vo.UserVO" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
	<style type="text/css">

	</style>
</head>

<body style="background-color: #fafafa;">
	<main class="joinoklogo">
        <div class="jointermslogo">
            <h1 class="jointerms_title">
                <a href="<%=request.getContextPath()%>/">
                    <img src="<%=request.getContextPath()%>/resources/image/kickshublogo.png" alt="kickshub">
                </a>
            </h1>
        </div>
		<article id="joinok">			
			<c:if test="${not empty vo and vo.userGrade ne 'Q'}">
			<i class="xi-check"></i>
			<p>가입하신 ID는 ${vo.userId} 입니다.</p>
			<button type="button" id="joid_btn" onclick="location.href='login.do'">로그인</button>
			</c:if>
			<c:if test="${empty vo}">
			<i class="xi-close-thin find-closeIcon"}"></i>
			<p class="mt-3">가입하신 정보가 없습니다.</p>
			<button type="button" id="joid_btn" onclick="location.href='join.do'">회원가입</button>
			</c:if>
			<c:if test="${vo.userGrade eq 'Q'}">
			<i class="xi-close-thin find-closeIcon"}"></i>
			<p class="mt-3">탈퇴한 회원 입니다.</p>
			<button type="button" id="joid_btn" onclick="location.href='<%=request.getContextPath() %>/'">홈으로 가기</button>
			</c:if>			
		</article><!--end:#joinok-->
	</main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script><!-- 부트스트랩 자바 스크립트연결 -->
</body>
</html>
