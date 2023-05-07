<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>주문 결제</title>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
</head>
<body>
<%@include file="../include/header.jsp"%>    
	<main>
		<div class="container-fluid" style="margin-bottom: 70px;"><!-- 컨텐츠 영역 -->
		
        	<section class="payment-top"><!--주문결제 탑메뉴-->
		        <div class="d-flex">
			        <h1>주문/결제</h1>
			        <div class="cart-right">장바구니 <i class="xi-angle-right-thin"></i> 주문/결제 <i class="xi-angle-right-thin"></i> 주문완료</div>        
		        </div>
		        <div class="cart-line"></div>
	        </section><!--주문결제 탑메뉴 끝-->
	        
	        <section class="pmw">
				<div class="table-responsive">
					<table class="table table-boot-bd" style="font-family: 'SpoqaHanSansNeo-Regular'; text-align: center;">
						<thead>
							<tr style="font-size:13px">
								<th scope="col" class="text-center">주문상품</th>
								<th scope="col">상품명</th>
								<th scope="col">사이즈</th>
								<th scope="col">수량</th>
								<th scope="col">가격</th>
								<th scope="col">배송비</th>
							</tr>
						</thead>
						<c:forEach var="prd" items="${sizeVO}" varStatus="status">
							<tr class="cart-menu">
								<td class="img-size w-15">
									<img alt="상품이미지" src="<%=request.getContextPath()%>/resources/prdmainimg/${prd.prdRname}">
								</td>
								<td class="w-25" style="text-align: left;">
									<c:set var="BrandCode" value="${fn:substring(prd.prdCode,0,2)}"/>
									<span class="fw-bold">
									<c:choose>
										<c:when test='${BrandCode eq "NK"}'>NIKE</c:when>
						               	<c:when test='${BrandCode eq "AD"}'>ADIDAS</c:when>
						               	<c:when test='${BrandCode eq "VS"}'>VANS</c:when>
						               	<c:when test='${BrandCode eq "CV"}'>CONVERSE</c:when>
						               	<c:when test='${BrandCode eq "PM"}'>PUMA</c:when>
						               	<c:when test='${BrandCode eq "FL"}'>FILA</c:when>
						               	<c:when test='${BrandCode eq "CR"}'>CROCS</c:when>
						               	<c:when test='${BrandCode eq "NB"}'>NEWBALANCE</c:when>
									</c:choose>
									</span>
									<br>
									<span id="prdName">${prd.prdName}</span>
									<br>
									<span class="fs-7">상품코드 : ${prd.prdCode}</span>
								</td>
								<td>${prd.sizeKind}</td>
								<td name="sizeStock">${stock[status.index]}</td>
								<input type="hidden" name="sizeindex" value="${prd.sizeIndex}">
								<input type="hidden" name="orderitemStock" value="${stock[status.index]}">
								<c:set var="total" value="${prd.prdPrice * stock[status.index]}"/>
								<input type="hidden" name="itemPrice" value="${total}"/>
								<td><fmt:formatNumber value="${total}" pattern="#,###"/>원</td>
								<td>무료배송</td>							
							</tr>							
						</c:forEach>
						<tbody>
						</tbody>
					</table>
				</div>
				<div class="d-flex justify-content-end border-dark">
					<span style="font-size:12px; color:#848484; margin:20px 0;">&#8226;상품수량 및 옵션변경은 상품상세 또는 장바구니에서 가능합니다.</span>
				</div>
				
	        	<section class="delinfo">
			        <div class="d-flex">
				        <h1>배송정보</h1>
			        </div>
			        <div class="cart-line"></div>
		        </section>
				<div class="mb-3" style="border-bottom: 1px solid #eee; padding-bottom: 20px;">
					<table class="table-borderless table-boot-bd" style="width:100%">
						<tbody>
							<tr>
								<th scope="row" style="width: 9%;">
									<label for="buyerName" class="buyinfo">이름</label>
								</th>
								<td style="width: 45%;">
									<input class="input-style" id="buyerName" name="buyerName" type="text" placeholder="이름" value="${userVO.userName}">
								</td>
								<td rowspan="5" class="paymentcontain">
									<article class="pmc">
										<div style="text-align:center;">결제정보</div>
										<hr/><br/>
										<div class="d-flex allpr">
											<span>상품가격</span>
											<span class="ms-5" id="totalsee"></span>
										</div>
										<div class="d-flex allpr">
											<span>배송비</span>
											<span class="ms-5">무료배송</span>
										</div>
										<hr/><br/>
										<div class="d-flex allprrr">
											<span>최종결제금액</span>
											<span class="ms-5" id="totalPrice"></span>
											<input type="hidden" id="totalPriceHidden" value="">
										</div>
										<div class="d-flex">
											<button type="button" class="paymentbtn" onclick="callPay()">결제하기</button>
										</div>
									</article>
								</td>
							</tr>
							<tr>
								<th scope="row">
									<label for="buyerTel" class="buyinfo">전화번호</label>
								</th>
								<td>
									<input class="input-style" id="buyerTel" name="buyerTel" type="text" placeholder="연락처" value="${userVO.userPhone}">
								</td>
							</tr>
							<tr>
								<th scope="row">
									<label for="userZipCode" class="buyinfo">주소</label>
								</th>
								<td class="justify-content-start">
									<input type="text" class="input-style inst" id="userZipCode" name="userZipCode" placeholder="우편번호" value="${userVO.userZipCode}" readonly oninput="clearCheck()">
									<button type="button" onclick="sample6_execDaumPostcode()" class="btn btn-secondary btn-sm">우편번호 찾기</button>
								</td>
							</tr>
							<tr>
								<th scope="row">						
								</th>
								<td>
									<input type="text" class="input-style" id="userAddr" name="userAddr" placeholder="주소" value="${userVO.userAddr}" readonly>
								</td>
							</tr>
							<tr>
								<th scope="row">
								</th>
								<td>
									<input type="text" class="input-style" id="userAddrDetail" name="userAddrDetail" placeholder="상세주소" value="${userVO.userAddrDetail}">
							</tr>
						</tbody>
					</table>
				</div>
			</div><!-- 컨텐츠 영역 end-->
		</section>
	</main>
<%@include file="../include/footer.jsp"%>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.0.0/crypto-js.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script><!-- 부트스트랩 자바 스크립트연결 -->
    <script src="<%=request.getContextPath()%>/resources/JS/script.js"></script><!-- 자바 스크립트 연결 -->
    <script type="text/javascript">
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }   
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('userZipCode').value = data.zonecode;
                document.getElementById("userAddr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("userAddrDetail").focus();
            }
        }).open();
    }
    function totalprice(){
    	let itemPrice = document.querySelectorAll('input[name="itemPrice"]');
    	let totalPrice = 0;
    	if(itemPrice.length != 0){
    		itemPrice.forEach(function(i){
    			totalPrice += parseInt(i.value);
    		})
    	}
    	let total = new Intl.NumberFormat('ko-kr').format(totalPrice);
    	$("#totalPriceHidden").val(totalPrice);
    	$("#totalPrice").html(total+"원");
    	$("#totalsee").html(total+"원");
    }
	
    //결제
    function callPay() {//결제 버큰 클릭시 함수 호출
    	let totalPrice = $("#totalPriceHidden").val();
		$.ajax({
			url:"<%=request.getContextPath()%>/ajax/ordernum.do",
			type:"post",
			data:{totalPrice : totalPrice},
			success:function(data){
		        var IMP = window.IMP; 
		        IMP.init("imp73884570"); 
		        requestPay(data);
			}
		});
    }
	
    function requestPay(orderNum) {
    	let totalPrice = $("#totalPriceHidden").val();
    	let sizeindex = [];		//제품 사이즈 인덱스
    	let orderitemStock = [];//제품 수량
    	let buyerName = $("#buyerName").val();
    	let buyerTel = $("#buyerTel").val();
    	let userAddr = $("#userAddr").val();
    	let userAddrDetail = $("#userAddrDetail").val();
    	let buyerPostcode = $("#userZipCode").val();
    	let buyerAddr = userAddr+" "+userAddrDetail;
    	let prdName = $("#prdName").html();
    	let orderName = "";
    	let sizeindexHiddne = document.querySelectorAll('input[name="sizeindex"]');
    	let orderitemStockHidden = document.querySelectorAll('input[name="orderitemStock"]');
    	if(sizeindexHiddne.length != 0){
    		sizeindexHiddne.forEach(function(i){
    			sizeindex.push(i.value)
    		})    		
    	}
    	if(orderitemStockHidden.length != 0){
    		orderitemStockHidden.forEach(function(i){
    			orderitemStock.push(i.value)
    		})  
    	}
    	if(sizeindexHiddne.length > 1){
    		orderName = prdName+" 외 "+(sizeindexHiddne.length-1)+"건";
    	}else{
    		orderName = prdName;
    	}
    	$.ajax({
    		url:"<%=request.getContextPath()%>/ajax/checkStock.do",
    		type:"post",
    		traditional : true,
    		data:{
    			sizeindex : sizeindex,
    			orderitemStock : orderitemStock
    		},
    		success:function(data){
    			if(data != 0){
   			       IMP.request_pay({
   			            pg : 'kcp.9810030929',	
   			            pay_method : 'card',
   			            merchant_uid: orderNum, //주문번호
   			            name : orderName,		//상품 이름
   			            amount : totalPrice,	//결제될 가격
   			            buyer_name : buyerName,	//구매자 이름
   			            buyer_tel : buyerTel,//구매자 연락처
   			            buyer_addr : buyerAddr,		//구매자 주소(주소+상세주소)
   			            buyer_postcode : buyerPostcode	//구매자 우편번호
   			        }, function (rsp) { // callback
   			            if (rsp.success) {
   			            	let userIndex = '<c:out value="${login.userIndex}"/>';
   			                $.ajax({
   			                	url:"<%=request.getContextPath()%>/ajax/createOrder.do",
   			                	type:"post",
   			                	traditional : true,
   			                	data:{
   			                        imp_uid: rsp.imp_uid,            // 결제 고유번호
   			                        merchant_uid: rsp.merchant_uid,	 // 주문번호
   			                        totalPrice : totalPrice,		//결제금액
   			                        userIndex : userIndex,			//구매자 인덱스
   			                        sizeindex : sizeindex,			//구매할 상품 사이즈 인덱스(상품 특정)
   			                        orderitemStock : orderitemStock //각 상품당 구매수량
   			                	},
   			                	success:function(data){
   			                		if(data == 0){
   			                			location.href="<%=request.getContextPath()%>/order/paymentOk.do";
   			                		}
   			                	}
   			                });
   			            } else {
   			            	alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
   			            }
   			        });
    			}else{
           			alert("현재 주문 수량보다 준비된 재고가 부족합니다.");
           			location.href="<%=request.getContextPath()%>/";
    			}
    		}
    	})    	
    }
    totalprice();
    </script>
</body>
</html>
