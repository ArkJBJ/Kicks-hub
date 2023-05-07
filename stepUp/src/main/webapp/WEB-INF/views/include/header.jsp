<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>

    <div id="aaaa">
        <ul class="p-2 me-4" id="user"><!-- 로그인, 장바구니, 마이페이지 영역 시작-->
            <li>
            	<c:if test="${empty login}">
            		<a href="<%=request.getContextPath()%>/user/login.do"><i class="xi-user-o"></i></a>
                </c:if>
                <c:if test="${not empty login && login.userGrade == 'U' || login.userGrade == 'F'}">
                	<a href="<%=request.getContextPath()%>/order/user.do"><i class="xi-user-o"></i></a>
                </c:if>
                <c:if test="${not empty login && login.userGrade == 'A'}">
                	<a href="<%=request.getContextPath()%>/admin.do"><i class="xi-user-o"></i></a>
                </c:if>                
                <c:if test="${not empty login && login.userGrade == 'U' || login.userGrade == 'F'}">
                <div class="sub">
                    <ul><!-- 서브메뉴 -->
                        <li class="blank"><a href="<%=request.getContextPath()%>/order/user.do">주문배송조회</a></li>
                        <li class="blank"><a href="<%=request.getContextPath()%>/user/mypage_like.do">관심있는 상품</a></li>
                        <hr/>
                        <li class="blank"><a href="<%=request.getContextPath()%>/user/mypage_review.do">상품후기</a></li>
                        <li class="blank"><a href="<%=request.getContextPath()%>/user/mypage_qna.do">QnA</a></li>
                        <li class="blank"><a href="<%=request.getContextPath()%>/user/mypage_posting.do">내가 작성한 글</a></li>
                        <hr/>
                        <li class="blank"><a href="<%=request.getContextPath()%>/user/mypage_sns.do">SNS연결설정</a></li>
                        <li class="blank"><a href="<%=request.getContextPath()%>/user/mypage_modify_check.do">개인정보수정</a></li>
                        <li><a href="<%=request.getContextPath()%>/user/logout.do">로그아웃</a></li>
                    </ul>
                </div><!--//.sub-->
                </c:if>
                <c:if test="${not empty login && login.userGrade == 'A'}">
                <div class="sub adminSub">
                    <ul><!-- 서브메뉴 -->
                        <li class="blank"><a href="<%=request.getContextPath()%>/admin.do">슬라이더 관리</a></li>
                        <li class="blank"><a href="<%=request.getContextPath()%>/restrict.do">회원 관리</a></li>                    
                        <li><a href="<%=request.getContextPath()%>/qna/qna_rspList.do">QnA답변관리</a></li>                    
                        <hr/>
                        <li class="blank"><a href="<%=request.getContextPath()%>/order/manager.do">주문내역 관리</a></li>
                        <li><a href="<%=request.getContextPath()%>/product/management.do">상품관리</a></li>
                        <hr/>
                        <li><a href="<%=request.getContextPath()%>/user/logout.do">로그아웃</a></li>
                    </ul>
                </div><!--//.sub-->
                </c:if>                
            </li>
            <li>
            	<c:if test="${empty login}">
                	<a href="<%=request.getContextPath()%>/user/login.do"><i class="xi-cart-o"></i></a>
                </c:if>
                <c:if test="${not empty login}">
                	<a href="<%=request.getContextPath()%>/cart/cart.do?userIndex=${login.userIndex}"><i class="xi-cart-o"></i></a>
            	</c:if>
            </li>
        </ul><!-- 로그인, 장바구니, 마이페이지 영역 끝-->
    </div>
    
    <header id="header"><!--헤더 시작-->
        <div class="d-flex justify-content-between pt-5">
            <div class="p-2 logo-wrap" ><!-- 로고 영역 시작-->
                <h1 class="logo">
                    <a href="<%=request.getContextPath()%>/">
                        <span>kikshub</span>
                    </a>
                </h1>
            </div><!-- 로고 영역 끝-->

            <nav><!--메인 네비게이션 영역 시작-->
                <ul class="d-flex" id="gnb">
                    <li>
                        <a href="<%=request.getContextPath()%>/weare.do">WE ARE</a>
                        <ul class="mt-5"><!--sub 네비게이션 -->
                            <li><a href="<%=request.getContextPath()%>/weare.do">소개</a></li>
                            <li><a href="<%=request.getContextPath()%>/location.do">위치</a></li>
                        </ul><!--sub 네비게이션 끝-->
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/product/brand.do?searchType=NK">BRAND</a>
                        <ul class="mt-5"><!--sub 네비게이션 -->
                            <li><a href="<%=request.getContextPath()%>/product/brand.do?searchType=NK">나이키</a></li>
                            <li><a href="<%=request.getContextPath()%>/product/brand.do?searchType=NB">뉴발란스</a></li>
                            <li><a href="<%=request.getContextPath()%>/product/brand.do?searchType=AD">아디다스</a></li>
                            <li><a href="<%=request.getContextPath()%>/product/brand.do?searchType=VS">반스</a></li>
                            <li><a href="<%=request.getContextPath()%>/product/brand.do?searchType=PM">푸마</a></li>
                            <li><a href="<%=request.getContextPath()%>/product/brand.do?searchType=CR">크록스</a></li>
                            <li><a href="<%=request.getContextPath()%>/product/brand.do?searchType=CV">컨버스</a></li>
                            <li><a href="<%=request.getContextPath()%>/product/brand.do?searchType=FL">휠라</a></li>
                        </ul><!--sub 네비게이션 -->
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/product/new.do">NEW</a>
                    </li>
                    <li><a href="<%=request.getContextPath()%>/product/best.do">BEST</a></li>
                    <li><a href="<%=request.getContextPath()%>/event/event.do">EVENT</a></li>
                    <li>
                        <a href="<%=request.getContextPath()%>/free/free.do">COMMUNITY</a>
                        <ul class="mt-5"><!--sub 네비게이션 -->
                            <li><a href="<%=request.getContextPath()%>/free/free.do">자유게시판</a></li>
                        </ul><!--sub 네비게이션 -->
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/notice/notice.do">CUSTOMER</a>
                        <ul class="mt-5"><!--sub 네비게이션 -->
                            <li><a href="<%=request.getContextPath()%>/notice/notice.do">공지사항</a></li>
                            <li><a href="<%=request.getContextPath()%>/qna/qna.do">QnA</a></li>
                        </ul><!--sub 네비게이션 -->
                    </li>
                </ul>
            </nav><!--메인 네비게이션 영역 끝-->
            
            <ul class="p-2 me-4" id="iop"><!-- 안보이는 로그인, 장바구니, 마이페이지 영역 시작-->
                <li>
                    <a href="<%=request.getContextPath()%>/user/login.do"><i class="xi-user-o"></i></a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/cart/cart.do"><i class="xi-cart-o"></i></a>
                </li>
            </ul><!-- 안보이는  로그인, 장바구니, 마이페이지 영역 끝-->
    </header><!--헤더 끝-->
   
