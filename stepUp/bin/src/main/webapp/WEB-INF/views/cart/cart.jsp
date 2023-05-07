<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="proj.stepUp.vo.CartVO" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% 
	List<CartVO> clist = (List<CartVO>)request.getAttribute("clist");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
</head>
<body>
<%@include file="../include/header.jsp"%>    
   <main class="d-flex justify-content-between"><!--메인 시작-->
   		<div class="container-fluid" style="margin-bottom: 70px;">
	        <section class="cart-top"><!--장바구니 탑메뉴-->
		        <div class="d-flex">
			        <h1>장바구니</h1>
			        <div class="cart-right">장바구니 <i class="xi-angle-right-thin"></i> 주문/결제 <i class="xi-angle-right-thin"></i> 주문완료</div>       
		        </div>
        		<div class="cart-line"></div>
        	</section><!--장바구니 탑메뉴 끝-->
        	
	        <section class="cart-table"><!--표입력-->
	            <table style="font-family: 'SpoqaHanSansNeo-Regular';">
	                <thead><!--표 상단시작-->
	                    <tr style="font-size:13px">
	                        <th class="th1"><div><input id="cart-checkbox-all" type="checkbox" checked="checked"></div></th>
	                        <th class="th2" colspan="2"><div>상품명</div></th>
	                        <th class="th3"><div>가격</div></th>
	                        <th class="th3"><div>수량</div></th>
	                        <th class="th3"><div>합계</div></th>
	                        <th class="th10"><div>배송비</div></th>
	                        <th class="th9"><div>삭제</div></th>
	                    </tr>
	                </thead><!--표상단 끝-->
	                <tbody><!--장바구니 상품 표시-->
	                <c:if test="${empty clist}">
		                <tr>
		                	<th colspan="8" style="padding:150px 0; background-color:#f5f5f5; font-size:15px;"><a>장바구니가 비었습니다.</a></th>
		                </tr>
	                </c:if>
	                <c:forEach var="vo" items="${clist}">
	               		<c:set var="BrandCode" value="${fn:substring(vo.prdCode,0,2)}"/>
	                   <tr class="cart-menu" name="trWrap">
	                    	<input type="hidden" value="${vo.cartIndex}" name="cart_hid"/>
							<input type="hidden" value="${vo.prdIndex}" name="cart_prd"/>
							<input type="hidden" name="sizeIndexs" value="${vo.sizeIndex}"/>
							<input type="hidden" id="cart_${vo.cartIndex}" value="${vo.sizeStock}"/>
	                        <th class="th1">
		                        <div>
		                        	<input name="cart_check" class="cart-checkbox" id="cart-check_${vo.cartIndex}" value="" type="checkbox" checked="true">
		                        </div>
	                        </th>
	                        <th class="th2 th7">
		                        <div>
		                        	<a href="<%=request.getContextPath()%>/product/view.do?prdIndex=${vo.prdIndex}"><img src="<%=request.getContextPath() %>/resources/prdmainimg/${vo.prdRname}"></a>
		                        </div>
	                        </th>
	                        <th class="th2 th6">
	                        	<a href="<%=request.getContextPath()%>/product/view.do?prdIndex=${vo.prdIndex}">
	                        		<div>
		                        		<span class="cnt_brand">
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
	                        			<br/>
	                        			${vo.prdName}
	                        			<br/>
	                        			<span>사이즈 : ${vo.sizeKind}</span>
	                        		</div>
	                        	</a>
	                        </th>
	                        <th class="th3"><div id="cart-price_${vo.cartIndex}"><fmt:formatNumber value="${vo.prdPrice}" pattern="#,###"/> 원</div></th>
	                        <th class="th5">
		                        <div>
			                        <button type="button" onclick="decrease(${vo.cartIndex})">&#45;</button>
			                        <input type="text" name="cartStock" id="quantity_${vo.cartIndex}" value="${vo.cartStock}" oninput="this.value = Math.min(Math.max(this.value.replace(/[^0-9]/g, ''), 1), ${vo.sizeStock}); totalPrice(${vo.cartIndex});" min="1" max="${vo.sizeStock}">
			                        <button type="button" onclick="increase(${vo.cartIndex})">&#43;</button>
		                        </div>
	                        </th>
	                        <th class="th3 th8"><div id="totalPrice_${vo.cartIndex}"></div></th>
	                        <th class="th3"><!--고정--><div>무료배송</div></th>
	                        <th class="th4"><div><input type="button" value="삭제" onclick="del(${vo.cartIndex})" style="font-size:13px"></div></th>
	                    </tr>
	                </c:forEach>
	                </tbody><!--장바구니 상품 표시 끝-->
	                <tfoot>
	                    <tr class="cart-foot">
	                        <th colspan="7"><div class="cash-1" style="font-size:16px">총 금액</div></th>
	                        <th colspan="2"><div class="cash-2" id="mainPrice" style="font-size:16px"></div></th>
	                    </tr>
	                </tfoot>
	            </table>
	         <div class="cart-button">
	         	<div class="text-end">
				    <a href="<%=request.getContextPath()%>/">쇼핑 계속하기</a>
				    <a href="#" onclick="goPayment()">결제하기</a>
			    </div>
			</div>
			<form action="<%=request.getContextPath()%>/order/payment.do" id="payFrm" method="get">
	        	<input type="hidden" name="sizeIndex" id="sizeIndexPay" value=""/>
	        	<input type="hidden" name="sizeStock" id="sizeStockPay" value=""/>
	        	<input type="hidden" name="userIndex" id="userIndexPay" value=""/>
	        </form> 
	        </section><!--표입력 끝-->
		</div>        
    </main><!--메인 끝-->
<%@include file="../include/footer.jsp"%>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<script type="text/javascript">
		let carthidden = document.querySelectorAll('input[name="cart_hid"]');
		if(carthidden.length != 0){
			carthidden.forEach(function(c){
				totalPrice(c.value);
			})
		}
		
          //수량조작
          //마이너스
          function decrease(cartindex) {
            const quantity = document.getElementById('quantity_'+cartindex);
            if (quantity.value > 1) {
            	quantity.value = parseInt(quantity.value) - 1;
            	}
            totalPrice(cartindex);
            mainPrice();
          }
          //플러스
          function increase(cartindex) {
        	const quantity = document.getElementById('quantity_'+cartindex);
        	const cart_sizeStock = document.getElementById('cart_'+cartindex);
        	const quantityP = parseInt(quantity.value);
        	const cart_sizeStockP = parseInt(cart_sizeStock.value);
        	if(quantityP == cart_sizeStockP){
        		alert("선택가능 한 최대 수량입니다.");
        	}else if(quantityP > cart_sizeStockP){
        		alert("선택가능 한 최대 수량을 넘었습니다.");
        		quantity.value = parseInt(cart_sizeStockP);
        	}else if(quantityP < cart_sizeStockP){
        		quantity.value = parseInt(quantity.value) + 1;
        	}
        	totalPrice(cartindex);
        	mainPrice();
          }
          //가격 * 개수 합산 가격
          function totalPrice(cartindex) {
        	const quantity = parseInt(document.getElementById('quantity_'+cartindex).value);
        	let cartprice = document.getElementById('cart-price_'+cartindex).innerHTML;
        	var prdPrice = cartprice.replace(/,/g, '').replace(/ 원/g, '');
			var totalPrice = prdPrice * quantity;
			let checkValue = document.getElementById('cart-check_'+cartindex);
			checkValue.value = totalPrice;
			const totalPriceElement = document.getElementById('totalPrice_'+cartindex);
			totalPriceElement.innerText = new Intl.NumberFormat().format(totalPrice) + "원";
          }
          
          //총금액 계산
          function mainPrice(){
        	  let cartcheck = document.querySelectorAll('input[name="cart_check"]:checked');
			  let mainprice = 0;
        	  if(cartcheck.length != 0){
				  cartcheck.forEach(function(i){
					  mainprice += parseInt(i.value);
				  })
			  }       	
          	const mainPriceElement = document.getElementById('mainPrice');
			mainPriceElement.innerText = new Intl.NumberFormat('ko-kr').format(mainprice) + "원";
          }
	  	  //체크박스 선택
          let allChecked = true;
          const checkboxAll = document.querySelector('#cart-checkbox-all');
          let checkboxes = document.querySelectorAll('input[name="cart_check"]');
          checkboxes.forEach(function(i){       	  
        	  i.addEventListener('change', function(){
        		  mainPrice();
        		  if(!i.checked){
        		  	checkboxAll.checked = false;
        		  }
        	  })
          })
          checkboxAll.addEventListener('change', (event) => {
            checkboxes.forEach((checkbox) => {
              checkbox.checked = event.target.checked;
              mainPrice();
            });
          });
          
          function del(cartIndex){
        	  let userIndex = "<c:out value='${login.userIndex}'/>";
        	  if(confirm("삭제하시겠습니까?") == 0){
        		  return false;
        	  }
        	  location.href="<%=request.getContextPath()%>/cart/cartdel.do?cartIndex="+cartIndex+"&userIndex="+userIndex;
          
        	  }
			
	  function goPayment(){
	  let userIndex =  "<c:out value='${login.userIndex}'/>";
	  let sizeIndex = [];
	  let sizeStock = [];
	  let trWrap = document.querySelectorAll("tr[name=trWrap]");
	  let cartIndex = document.querySelector("input[name=cart_hid]");
	  if(cartIndex == null){
		  location.href="<%=request.getContextPath()%>/";
		  alert("장바구니가 비어있습니다.");
	  }else if(trWrap.length != 0){
		  trWrap.forEach(function(i){
			  if(i.querySelector('input[name=cart_check]').checked){
				let size = i.querySelector('input[name=sizeIndexs]').value;
				let stock = i.querySelector('input[name=cartStock]').value;
				sizeIndex.push(size);
				sizeStock.push(stock);
			  }
		  })
	  }  
	  $("#userIndexPay").val(userIndex);
	  $("#sizeIndexPay").val(sizeIndex);
	  $("#sizeStockPay").val(sizeStock);
	  $("#payFrm").submit();
	  }          
	  mainPrice(); 
   	</script>
</body>
</html>
