<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 상세</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->     
    <style>
		.orderImg{
			width: 20%;
		}
		.orderImg img{
			width: 100%;
			height: 100%;
		}
		.border-line tr, td, th{
			border: 1px solid #dee2e6;
		}
    </style>
</head>
<body>
<%@ include file="../include/header.jsp" %>

    <main><!--메인 시작-->
        <div class="mypagemain">
            <div class="mypage_menu"><!--마이페이지 메뉴 시작-->
                <div class="mypagehi">
                    <p>안녕하세요, ${login.userNick} 님!</p>
                </div>
                <div class="mypage_gnb">
                    <span><a href="<%=request.getContextPath()%>/order/user.do">주문배송조회</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_review.do">상품후기</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_like.do">관심목록</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_qna.do">QnA</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_posting.do">내가 작성한 글</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_sns.do">SNS연결설정</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_modify_check.do">개인정보수정</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_withdrawal.do">회원탈퇴</a></span>
                </div>
            </div><!--마이페이지 메뉴 끝-->

            <article id="mypageod_contain"><!--주문배송조회 페이지 시작-->
				<div class="p-3">
					<div class="border-bottom mb-4">
						<h3 class="fs-3">주문상세내역</h3>
					</div>
					<div>
						<div class="mt-1">
							<fmt:parseDate value="${orderVO.orderDate}" var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss"/>
							<span class="fw-bold fs-5"><fmt:formatDate pattern="yyyy.MM.dd" value="${dateFmt}"/></span>
							<span class="ms-3 fs-5">${orderVO.orderNum}</span>
						</div>
						<div class="card mt-3"><!-- 제품상세 영역 -->
						  <div class="card-body">
						  	<div class="table-responsive">
						  		<c:forEach var="prd" items="${orderItemVO}">
							   	<table class="table table-bordered border-line">
							   		<tr>
							   			<td rowspan='5' class="orderImg" >
							   				<a href="<%=request.getContextPath()%>/product/view.do?prdIndex=${prd.prdIndex}"><img src="<%=request.getContextPath() %>/resources/prdmainimg/${prd.prdRname}" alt="상품이미지"></a>
							   			</td>
							   			<th class="border-line">상품명</th>
							   			<td class="border-line"><a href="<%=request.getContextPath()%>/product/view.do?prdIndex=${prd.prdIndex}">${prd.prdName}</a></td>
							   		</tr>
							   		<tr>
							   			<th>사이즈</th>
							   			<td>${prd.sizeKind}</td>			   			
							   		</tr>
							   		<tr>
							   			<th>가격</th>
							   			<td><fmt:formatNumber value="${prd.prdPrice}"/>원</td>			   			
							   		</tr>
							   		<tr>
							   			<th>수량</th>
							   			<td>${prd.orderItemStock}개</td>			   			
							   		</tr>
							   		<tr>
							   			<c:set var="total" value="${prd.prdPrice * prd.orderItemStock}"/>
							   			<th>총가격</th>
							   			<td><fmt:formatNumber value="${total}"/>원</td>			   			
							   		</tr>			   					   					   		
							   	</table>
							   	</c:forEach>			   	
						   	</div>
						  </div>
						</div><!-- 제품상세 영역 -->
						<div class="mt-5"><!-- 배송정보 영역 -->
						  	<div class="mb-4">
						  		<h3 class="fs-5">배송정보</h3>
						  	</div>			
							<div class="card">
							  <div class="card-body">
									<table class="table table-bordered border-line">
										<tr>
											<th>주문자</th>
											<td>${orderVO.orderBuyerName}</td>
										</tr>
										<tr>
											<th>연락처</th>
											<td>${orderVO.orderPhone}</td>
										</tr>
										<tr>
											<th>배송지</th>
											<td>${orderVO.orderAddr}</td>
										</tr>
										<tr>
											<th>우편번호</th>
											<td>${orderVO.orderPost}</td>
										</tr>																			
									</table>
							  </div>
							</div>
						</div><!-- 배송정보 영역 -->	
						<div class="mt-5"><!-- 결제금액 영역 -->
							<div class="mb-4">
								<h3 clas="fs-5">결제정보</h3>
							</div>
							<div class="card">
							  <div class="card-body">
							    <table class="table table-bordered border-line">
							    	<tr>
							    		<th>결제 방식</th>
							    		<td>${orderVO.orderPay}</td>
							    	</tr>
							    	<tr>
							    		<th>결제 금액</th>
							    		<td><fmt:formatNumber value="${orderVO.orderTotalPrice}"/>원</td>
							    	</tr>
							    </table>
							  </div>
							</div>				
						</div><!-- 결제금액 영역 -->
						<div class="mt-4 d-flex justify-content-end">
							<button class="btn btn-secondary" onclick="location.href='<%=request.getContextPath()%>/order/user.do'">목록으로</button>
						</div>				
					</div>
				</div>	             	
            </article><!--주문배송조회 페이지 끝-->
        </div>
	</main>

	<%@ include file="../include/footer.jsp" %>
	
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script><!-- 부트스트랩 자바 스크립트연결 -->
    <script src="<%=request.getContextPath()%>/resources/JS/script.js"></script><!-- 자바 스크립트 연결 -->
</body>
</html>
