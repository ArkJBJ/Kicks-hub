<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>        
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${prdVO.prdName}</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
</head>
<body>
<%@include file="../include/header.jsp"%>
    <main class="container-fluid"><!--메인 시작 -->
      <article id="prd_view"><!-- 상품 사진 + 선택 영역-->
        <div id="prd_pic">
            <ul>
                <li class="small_img" style="background-image:url(<%=request.getContextPath() %>/resources/prdmainimg/${prdVO.prdRname})" onclick="chgimg(this)"></li>
                <c:forEach var="subImg" items="${prdImgVO}">
               	<li class="small_img" style="background-image:url(<%=request.getContextPath() %>/resources/prdsubimg/${subImg.prdImgRname})" onclick="chgimg(this)"></li>
                </c:forEach>       
            </ul>
            <div class="big_img" style="background-image:url(<%=request.getContextPath() %>/resources/prdmainimg/${prdVO.prdRname}"></div>
        </div>
        <div id="prd_select">
           <ul id="prd_info">
                <li id="prd_brand"><span>
	               <c:set var="BrandCode" value="${fn:substring(prdVO.prdCode,0,2)}"/>
	               <c:choose>
		               	<c:when test='${BrandCode eq "NK"}'>NIKE</c:when>
		               	<c:when test='${BrandCode eq "AD"}'>ADIDAS</c:when>
		               	<c:when test='${BrandCode eq "VS"}'>VANS</c:when>
		               	<c:when test='${BrandCode eq "CV"}'>COVERSE</c:when>
		               	<c:when test='${BrandCode eq "PM"}'>PUMA</c:when>
		               	<c:when test='${BrandCode eq "FL"}'>FILA</c:when>
		               	<c:when test='${BrandCode eq "CR"}'>CROCS</c:when>
		               	<c:when test='${BrandCode eq "NB"}'>NEWBALANCE</c:when>
	               </c:choose>                
                </span></li>
                <li id="prd_name">
                <span id="productName">${prdVO.prdName}</span>
                <c:if test="${not empty login}">     
	                <c:choose>
		                <c:when test="${not empty markResult}">
		                	<span class="xi-heart" id="mark">
		                </c:when>
		     			<c:otherwise>
		     				<span class="xi-heart-o" id="mark">
		     			</c:otherwise>
	                </c:choose>
                </c:if>
                </li>
                <li id="prd_code"><span>상품코드 : ${prdVO.prdCode}</span></li>
                <li id="prd_price"><fmt:formatNumber value="${prdVO.prdPrice}" pattern="#,###"/>원</li>
                <input type="hidden" id="productPrice" value="${prdVO.prdPrice}">
           </ul>
           <div id="size_ttl">사이즈</div>
           <ul id="select_box">
           		<c:forEach var="sizeList" items="${sizeVO}">
	                <li class="select_size">
	                    <input type="checkbox" name="size" value="${sizeList.sizeKind}" id="size${sizeList.sizeKind}" onclick="updateSizeSelected(${sizeList.sizeIndex},${sizeList.sizeKind},${sizeList.sizeStock})" <c:if test="${sizeList.sizeStock == 0}">disabled</c:if>>
	                    <input type="hidden" name="sizeNum" id="sizeNum" value="${sizeList.sizeIndex}" />
	                    <label for="size${sizeList.sizeKind}" class="px-1">
	                        <span <c:if test="${sizeList.sizeStock == 0}">class="bg-light text-black-50"</c:if>>${sizeList.sizeKind}</span>
	                    </label>
	                </li>           		
           		</c:forEach>
           </ul>
	           <ul class="size_selected" id="prdSizeArea">
	           </ul>
	       <div class="cart_pop">
	           	<div class="cart_pop1"><a>장바구니 담기</a><button type="button" id="popclose1"><i class="xi-close"></i></button></a></div>
	           	<div class="cart_popimg"><img alt="대표사진" src="<%=request.getContextPath()%>/resources/prdmainimg/${prdVO.prdRname}">
	           	<p>선택한 상품이 장바구니에 담겼습니다.</p></div>
	           	<div class="cart_popbtn">
				<button type="button" id="popclose2" class="prdvbtn"><a>쇼핑 계속하기</a></button>
		           	<button type="button" class="prdvbtn"><a href="<%=request.getContextPath()%>/cart/cart.do?userIndex=${login.userIndex}">장바구니 바로가기</a></button>
	       		</div>
	       </div>
           <div class="total_price"></div>
           <c:if test="${empty login}">
	           <button type="button" id="cart_btnlogin" onclick="altCart()">장바구니</button>
	           <button id="buy_btnlogin" onclick="altBuy()">바로구매</button>
           </c:if>
           <c:if test="${not empty login}">
	           <button id="cart_btnlogin" onclick="inputCart()">장바구니</button>
	           <button id="buy_btnlogin" onclick="goPayment()">바로구매</button>
           </c:if>
        </article>
        <article id="info_link"> <!--상품 관련 링크 탭-->
            <div><a href="#prdinfo_tap1">상품정보</a></div>
            <span>|</span>
            <div><a href="#prdinfo_tap2">상품설명</a></div>
            <span>|</span>
            <div><a href="#prdinfo_tap3">반품/교환정보</a></div>
            <span>|</span>
            <div><a href="#prdinfo_tap4">상품평</a></div>
        </article>
        <article id="prdinfo_tap1"> <!--상품정보-->
           <table>
                <tr>
                    <td class="prd_table1">상품등록일</td>
                    <td>
                    	<fmt:parseDate value="${prdVO.prdDate}" var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss"/>
                    	<fmt:formatDate value="${dateFmt}" type="date" pattern="yyy-MM-dd"/>
                    </td>
                </tr>
                <tr>
                    <td class="prd_table1">제품제조국</td>
                    <td>${prdVO.prdMadeIn}</td>
                </tr>                
                <tr>
                    <td class="prd_table1">제품소재</td>
                    <td>${prdVO.prdMt}</td>
                </tr>
                <tr>
                    <td class="prd_table2">품질보증기준</td>
                    <td>${prdVO.prdQc}</td>
                </tr>
                <tr>
                    <td class="prd_table2">소재관리 방법</td>
                    <td>${prdVO.prdCare}</td>
                </tr>
           </table>
        </article>
        <article id="prdinfo_tap2"> <!--상품 설명-->
            ${prdVO.prdCnt}
        </article>
        <article id="prdinfo_tap3"><!--반품/교환정보-->
            <table>
                <tr>
                    <td class="prd_table1">배송사</td>
                    <td>CJ대한통운 (상품 준비 기간이 소요될 수 있습니다.)</td>
                </tr>
                <tr>
                    <td class="prd_table1">배송안내</td>
                    <td>- 전상품 무료배송입니다.<br>
                        - 상품 출고 후 영업일 기준 평균 배송일 2~3일내 받을 수 있습니다.(공휴일/주말 제외, 배송사 사정에 따라 지연될 수 있음)<br>
                        - 지정된 택배 이외의 타 택배사 이용시 추가되는 비용은 고객님께서 부담하셔야 합니다.<br>
                        [ 반송지 주소 : 전라북도 전주시 덕진구 백제대로 572 5층 ]</td>
                </tr>                
                <tr>
                    <td class="prd_table1">반품/교환 정보</td>
                    <td>- 상품이 이미 출고 되었을 때 수취 거부가 불가합니다.<br>
                        - 반품은 상품 수령일로부터 7일 이내에 반품접수를 하셔야 하며, 접수 후 (업무일) 3일이내에 본사 반송지에 도착하여야 합니다.<br>
                        - 반품/교환시, 반스 온라인몰에서 꼭 반품접수를 하신 후 진행하셔야 합니다.<br>
                        - AS 문의는 고객센터에 문의를 하여야 합니다.<br>
                        - 상품포장이 훼손되거나 상품가치가 상실된 경우 반품/교환이 불가합니다.<br>
                        - 교환 접수가 되었더라도, 교환 제품이 재 출고될 시점에 재고가 품절인 경우 반품으로 전환될 수 있습니다.</td>
                </tr>
                <tr>
                    <td class="prd_table2">반품 배송비</td>
                    <td>- 고객단순변심 시, 배송비는 고객 부담입니다.<br>
                        - 상품불량 및 오배송 시, 배송비는 판매자 부담입니다.<br>
                        - 주문시 무료배송으로 수령하신 경우, 고객단순 변심시 최초 배송비가 포함 부과됩니다.<br>
                        - 개별 반송 시, 추가적으로 발생하는 비용은 고객 부담입니다.</td>
                </tr>
                <tr>
                    <td class="prd_table2">교환 배송비</td>
                    <td>- 고객 단순 변심 시, 왕복 배송비는 고객 부담입니다.<br>
                        - 상품불량 및 오배송 시, 왕복 배송비는 판매자 부담입니다.<br>
                        - 단, 교환 상품에 대해 검수 시, 교환 사유가 당사 귀책 사유에 부합하지 않을 경우 배송비 결제 후 교환 처리가 가능합니다.</td>
                </tr>                
                <tr>
                    <td class="prd_table2">반품/교환 불가 경우</td>
                    <td>
                        - 반품/교환요청 기간(7일)이 지난 경우<br>
                        - 포장을 개봉하였거나 포장이 훼손되어(상품의 Tag분리/분실, 비닐포장 훼손, 신발박스 훼손 등) 상품가치가 현저히 감소한 경우<br>
                        - 악세서리 고유의 포장을 개봉 하였으나 단순 변심으로 교환, 반품 원하는 경우<br>
                        - 구매자의 책임있는 사유로 상품 등이 멸실 또는 훼손된 경우<br>
                        - 구매자의 사용 또는 일부 소비에 의하여 상품가치가 현저히 감소한 경우<br>
                        - 기간의 경과에 의하여 재판매가 곤란할 정도로 상품가치가 현저히 감소한 경우<br>
                        - 복제가 가능한 상품 등의 포장을 훼손한 경우<br>
                        - 단, 재화 등의 내용이 표시 (이미지 또는 기능을 포함) 및 광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급 받은 날부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약 철회 등을 할 수 있습니다.
                    </td>
                </tr>
            </table>
        </article> 
        <article id="prdinfo_tap4"><!--상품평-->
            <div id="review_write">
                <p id="review_formTtl">상품평</p>
                <c:if test="${not empty login}">
	                <div>
	                    <form name="reviewFrm" action="<%=request.getContextPath()%>/review/insert.do" method="post">
	                    	<input type="hidden" name="userIndex" value="${login.userIndex}"/>
	                    	<input type="hidden" name="prdIndex" value="${prdVO.prdIndex}"/>
	                        <textarea id="review_writeCnt" name="reviewContent" placeholder="상품평을 남겨주세요"></textarea>
	                        <div id="rating_ctn">
	                            <span>별점을 남겨주세요</span>
	                            <div class="star-rating">
	                                <input type="radio" id="5-stars" name="reviewScore" value="5" />
	                                <label for="5-stars" class="star">&#9733;</label>
	                                <input type="radio" id="4-stars" name="reviewScore" value="4" />
	                                <label for="4-stars" class="star">&#9733;</label>
	                                <input type="radio" id="3-stars" name="reviewScore" value="3" />
	                                <label for="3-stars" class="star">&#9733;</label>
	                                <input type="radio" id="2-stars" name="reviewScore" value="2" />
	                                <label for="2-stars" class="star">&#9733;</label>
	                                <input type="radio" id="1-star" name="reviewScore" value="1" />
	                                <label for="1-star" class="star">&#9733;</label>
	                            </div>
	                            <button>등록</button>
	                        </div>
	                    </form>
	                </div>
                </c:if>
            </div> 
            <ul id="review_ctn"><!-- 리뷰 보여주는 곳 -->	
            </ul>
            <ul id="reeview_page">
            </ul>
        </article>
        <!-- 수정버튼 클릭시 모달창 영역 -->
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">댓글 수정</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
				   <div>
					  <input type="hidden" name="reviewIndexs" id="reviewModifyIndex" value=""/>
			          <textarea id="review_writeCnt" class="reviewModifyCnt" name="reviewContent" placeholder="상품평을 남겨주세요"></textarea>
			          <div id="rating_ctn">
			              <span>별점을 남겨주세요</span>
			              <div class="star-rating">
			                  <input type="radio" id="5-starse" name="reviewScores" class="5-modifyStars" value="5"/>
			                  <label for="5-starse" class="star">&#9733;</label>
			                  <input type="radio" id="4-starse" name="reviewScores" class="4-modifyStars" value="4"/>
			                  <label for="4-starse" class="star">&#9733;</label>
			                  <input type="radio" id="3-starse" name="reviewScores" class="3-modifyStars" value="3"/>
			                  <label for="3-starse" class="star">&#9733;</label>
			                  <input type="radio" id="2-starse" name="reviewScores" class="2-modifyStars" value="2"/>
			                  <label for="2-starse" class="star">&#9733;</label>
			                  <input type="radio" id="1-starse" name="reviewScores" class="1-modifyStars" value="1"/>
			                  <label for="1-starse" class="star">&#9733;</label>
			              </div>
			          </div>
				  </div>		        
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary" onclick="modify()">수정하기</button>
		      </div>
		    </div>
		  </div>
		</div>
		 <!-- 수정버튼 클릭시 모달창 영역 end -->        
        <form action="<%=request.getContextPath()%>/order/payment.do" id="payFrm" method="get">
        	<input type="hidden" name="sizeIndex" id="sizeIndexPay" value="">
        	<input type="hidden" name="sizeStock" id="sizeStockPay" value="">
        	<input type="hidden" name="userIndex" id="userIndexPay" value="">
        </form> 
	</main>
<%@include file="../include/footer.jsp"%>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<script>
		function updateSizeSelected(sizeIndex, sizeKind, sizeStock) { 
			let productName = $("#productName").html();					
			let sizePrint = '';
			sizePrint += '<li id="sizeLi'+sizeKind+'">';
			sizePrint += '<div class="select_prdName"><span>'+productName+'</span> <span>사이즈 ' + sizeKind + '</span></div>';
			sizePrint += '<input type="hidden" id="sizeIndex" value="'+sizeIndex+'" name="sizeIndex">';
			sizePrint += '<button class="decrease-btn" onclick="decreaseQuantity('+sizeKind+')">-</button>';
			sizePrint += '<input class="qnt_numb" name="cartStock"  id="quantity_' + sizeKind + '" type="text" value="1" disabled>';
			sizePrint += '<button class="increase-btn" onclick="increaseQuantity('+sizeKind+','+sizeStock+')">+</button>';
			sizePrint += '<div class="selec_PrdPrice" id="priceWrap">';
			sizePrint += '<span id="price_' + sizeKind + '" name="itemPrice"></span>';
			sizePrint += '<label for="size' + sizeKind + '">';
			sizePrint += '<div class="x-btn, xi-close" ></div>';
			sizePrint += '</label>';
			sizePrint += '</div>';
			if($('#size'+sizeKind+'').is(':checked')){
				$("#prdSizeArea").append(sizePrint);
				sizePrice(sizeKind);
				totalPrice();
			}else{
				$('#sizeLi'+sizeKind+'').detach();
				totalPrice();
			}
		        };
		function increaseQuantity(size, sizeStock) {
			let stockNum = parseInt($('#quantity_'+size+'').val());
			if(stockNum < sizeStock){
				let sumNum = stockNum+1;
				 $('#quantity_'+size+'').val(sumNum);
				 sizePrice(size);
				 totalPrice();
			}else{
				alert("준비된 수량을 초과하였습니다.");
			}

		}
		function decreaseQuantity(size) {
			let stockNum = parseInt($('#quantity_'+size+'').val());
			if(stockNum > 1){
				let sumNum = stockNum-1;
				 $('#quantity_'+size+'').val(sumNum);
				 sizePrice(size);
				 totalPrice();
			}
		}
		function sizePrice(size) {   
			let stockNum = parseInt($('#quantity_'+size+'').val());
			let productPrice = $("#productPrice").val();
			let sizeTotal = stockNum * productPrice;
			let price = new Intl.NumberFormat('ko-kr').format(sizeTotal);
			$('#price_'+size+'').html(price+"원");
			
		}
		function totalPrice() {
			let totla = 0;
			let itemPrice = document.querySelectorAll("span[name=itemPrice]");
			$("#priceWrap span").each(function(){
				let te = $(this).text();
				let pri = te.replace(/,/g, '').replace(/ 원/g, '');
				totla += parseInt(pri);
			})
			let price1 = new Intl.NumberFormat('ko-kr').format(totla);
			let pricaeTotal = "총 금액 &nbsp; &nbsp; &nbsp;" + price1 + " 원";
			if(itemPrice.length == 0){
				pricaeTotal = "";
			}
			$(".total_price").html(pricaeTotal);
		}
	    var bigimg = document.querySelector(".big_img");
	    function chgimg(element){
	      var newimg = element.style.backgroundImage;
	      bigimg.style.backgroundImage = newimg;
	    } 
	    //찜버튼 변경 스크립트
	    $("#mark").click(function(){
	    	let userIndex = "<c:out value='${login.userIndex}'/>";
	    	let prdIndex = "<c:out value='${prdVO.prdIndex}'/>";
	    	if($("#mark").hasClass("xi-heart-o")){
	    		$.ajax({
	    			url:"<%=request.getContextPath()%>/ajax/addMark.do",
	    			type:"post",
	    			data:{userIndex : userIndex , prdIndex : prdIndex},
	    			success : function(){
	    				$("#mark").attr("class", "xi-heart");
	    				alert("관심목록에 추가되었습니다.");
	    			}
	    		});
	    	}else if($("#mark").hasClass("xi-heart")){
	    		$.ajax({
	    			url:"<%=request.getContextPath()%>/ajax/removeMark.do",
	    			type:"post",
	    			data:{userIndex : userIndex, prdIndex : prdIndex},
	    			success : function(){
	    				$("#mark").attr("class", "xi-heart-o");
	    				alert("관심목록에서 삭제되었습니다.");
	    			}
	    		});
	    	}
	    });
	    //장바구니 상품추가 ajax
	    function inputCart(){
	    	let userIndex =  "<c:out value='${login.userIndex}'/>";
	    	let sizeIndex = [];
	    	let sizeStock = [];
	    	const sIndex = document.querySelectorAll("input#sizeIndex");
	    	sIndex.forEach(function(sIndex) {
	    		sizeIndex.push(sIndex.value);
	    	});
	    	const selectedSizes = document.querySelectorAll('input[name="size"]:checked');
	    	if (selectedSizes.length !== 0) {
		    	selectedSizes.forEach(function(size){
		    	const sStock = document.querySelectorAll("input#quantity_"+size.value);	
			    	sStock.forEach(function(sStock){
			    		sizeStock.push(sStock.value);
			    	});
		    	});
	    	}else{
	    		alert("상품 사이즈를 추가하여 주세요.");
	    		return false;
	    	}
			$.ajax({
				url:"<%=request.getContextPath()%>/ajax/inputCart.do",
				type:"post",
				traditional : true,
				data:{
					sizeIndex : sizeIndex,
					sizeStock : sizeStock,
					userIndex : userIndex
				},
				success:function(data){
					if(data == 1){
						const cartpop = document.querySelector('.cart_pop');
						cartpop.style.display = 'block';
					}else{
						alert("이미 담겨있는 상품입니다.");
					}
				}
			})//ajax end
	    }
	    //장바구니 팝 지우기
	    const closeBtn1 = document.getElementById('popclose1');
	    const closeBtn2 = document.getElementById('popclose2');
		const cartpop = document.querySelector('.cart_pop');
		closeBtn1.addEventListener('click', function() {
			cartpop.style.display = 'none';
		});
		closeBtn2.addEventListener('click', function() {
			cartpop.style.display = 'none';
		});
		
	//로그인 안했을때 버튼 클릭시
       	function altCart(){
		alert("로그인이 필요한 서비스입니다.");
		window.location.href = '<%=request.getContextPath()%>/user/login.do';
       	}
       	function altBuy(){
		alert("로그인이 필요한 서비스입니다.");
		window.location.href = '<%=request.getContextPath()%>/user/login.do';
       	}
        //상품 리뷰 paging ajax
	function goPage(nowPage){
		let prdIndex = <c:out value="${prdVO.prdIndex}"/>
	    	let loginIndex = <c:out value="${login.userIndex}"/>
	    	$.ajax({
	    		url:"<%=request.getContextPath()%>/ajax/prdPaging.do",
	    		type:"get",
	    		data:{nowPage : nowPage, prdIndex : prdIndex},
	    	        success: function(data) { // Ajax 요청이 성공한 경우 실행될 콜백 함수
	    	    	let reviewHtml = '';
	    	    	for(let i = 0; i < data.length; i++){
	    	    		let reviewList = data[i];
	    	    		let reviewDate = moment(reviewList.reviewDate).format('YYYY-MM-DD');
	    	    		reviewHtml += '<li>';
	    	    		reviewHtml += '<input type="hidden" name="reviewIndex" value="'+reviewList.reviewIndex+'">';
	    	    		reviewHtml += '<input type="hidden" name="prdIndex" value="'+reviewList.prdIndex+'">';
	    	    		reviewHtml += '<span class="review_star" style="color:#7ae48f; font-size:18px; margin-left:20px;">';
	    	    		for(let j = 1; j <= reviewList.reviewScore; j++){
	    	    			reviewHtml += '&#9733;';
	    	    		}
	    	    		for(let j = 1; j <= (5 - reviewList.reviewScore); j++){
	    	    			reviewHtml += '&#9734;';
	    	    		}
					reviewHtml += '</span>';
					reviewHtml += '<span class="review_writer" style="font-size:13px;">'+reviewList.userNick+'</span>';
					reviewHtml += '<span class="review_wdate" style="font-size:13px;">';
					reviewHtml += ''+reviewDate+''
					reviewHtml += '</span>';
					if(loginIndex == reviewList.userIndex){
						reviewHtml += '<input class="re_del" type="button" onclick="reviewDel('+reviewList.reviewIndex+')" value="삭제">';
						reviewHtml += '<input class="re_edit"  type="button" value="수정" onclick="modaltest('+reviewList.reviewIndex+')">';
	    	    		}
						reviewHtml += '</div>';
						reviewHtml += '<div class="review_note">'+reviewList.reviewContent+'</div>';
						reviewHtml += '</li>'
						paging(nowPage, prdIndex);
	    	    	}
	    	    	$("#review_ctn").html(reviewHtml);
	    	    }
	    	})
	    }
	    //리뷰 페이징 버튼 ajax 처리
	    function paging(nowPage, prdIndex){
	    	let pagingHtml = '';
	    	$.ajax({
	    		url:"<%=request.getContextPath()%>/ajax/prdPaging.do",
	    		type:"post",
	    		data:{nowPage : nowPage, prdIndex : prdIndex},
	    		success: function(data) {
				let startPage = Number(data.startPage);
				let endPage = Number(data.endPage);
				let perPage = Number(data.perPage);
				let total = Number(data.total);
				let now = Number(data.nowPage);
				let lastPage = Number(data.lastPage);
				pagingHtml += '<li class="d-flex justify-content-center">';
				pagingHtml += '<a href="javascript:void(0);" class="xi-angle-left"  onclick="goPage('+(now - 1)+')" style= "display:'+(now != 1  ? 'block' : 'none')+'"></a>';
				pagingHtml += '<div id="pagingNumBtn">';
				for(let i = startPage; i <= endPage; i ++){
					if(now != i){
						pagingHtml += '<a href="javascript:void(0);" class="pe-1" onclick="goPage('+i+')">'+i+'</a>';
					}else{
						pagingHtml += '<span class="pe-1 text-primary" id="nowPage">'+i+'</span>';
					}
				}
				pagingHtml += '</div> ';
				pagingHtml += '<a href="javascript:void(0);" class="xi-angle-right" onclick="goPage('+(now+ 1)+')" style= "display:'+(now != lastPage ? 'block' : 'none')+'"></a>';
				pagingHtml += '</li>';
				$("#reeview_page").html(pagingHtml);
 	    		}
	    	}) 
	    }
	    //상품 리뷰 paging 페이지 로드시 호출
	    $(document).ready(function(){
	    	goPage(1);
	    });
	 	function reviewDel(reviewIndex){
	    	if(confirm("해당 리뷰를 삭제하시겠습니까?") == 0){
	    		return false;
	    	}
	    	$.ajax({
	    		url:"<%=request.getContextPath()%>/ajax/delete.do",
	    		type:"post",
	    		data:{
	    			reviewIndex : reviewIndex
	    		},
	    		success:function(data){
	    			if(data == 1){
	    				let nowPage = $("#nowPage").html();
	    				goPage(nowPage);	
	    			}
	    		}
	    	})
	    }
	    //바로구매 
	    function goPayment(){
	    	let userIndex =  "<c:out value='${login.userIndex}'/>";
	    	let sizeIndex = [];
	    	let sizeStock = [];
	    	const sIndex = document.querySelectorAll("input#sizeIndex");
	    	sIndex.forEach(function(sIndex) {
	    		sizeIndex.push(sIndex.value);
	    	});
	    	const selectedSizes = document.querySelectorAll('input[name="size"]:checked');
	    	if (selectedSizes.length !== 0) {
		    	selectedSizes.forEach(function(size){
		    	const sStock = document.querySelectorAll("input#quantity_"+size.value);	
			    	sStock.forEach(function(sStock){
			    		sizeStock.push(sStock.value);
			    	});
		    	});
	    	}else{
	    		alert("구매할 상품 사이즈를 선택해 주세요.");
	    		return false;
	    	}
	    	$("#userIndexPay").val(userIndex);
	    	$("#sizeIndexPay").val(sizeIndex);
	    	$("#sizeStockPay").val(sizeStock);
	    	$("#payFrm").submit();
	    }
	    function modaltest(reviewIndex){
	    	$('#staticBackdrop').modal('show');
	    	$.ajax({
			url:"<%=request.getContextPath()%>/ajax/reviewModify.do",
			type:"get",
			data:{
				reviewIndex : reviewIndex
			},
			success:function(data){
				$(".reviewModifyCnt").val(data.reviewContent);
				$("#reviewModifyIndex").val(data.reviewIndex);
				if(data.reviewScore == 5){
					$(".5-modifyStars").prop("checked", true);
				}else if(data.reviewScore == 4){
					$(".4-modifyStars").prop("checked", true);
				}else if(data.reviewScore == 3){
					$(".3-modifyStars").prop("checked", true);
				}else if(data.reviewScore == 2){
					$(".2-modifyStars").prop("checked", true);
				}else if(data.reviewScore == 1){
					$(".1-modifyStars").prop("checked", true);
				}
				}
			})
	    }
	    function modify(){
	    	let reviewIndex = $("#reviewModifyIndex").val();
	    	let reviewContent = $(".reviewModifyCnt").val();
	    	let reviewScore = $("input[name=reviewScores]:checked").val();
	    	$.ajax({
	    		url:"<%=request.getContextPath()%>/ajax/modify.do",
	    		type:"post",
	    		data:{
	    			reviewIndex : reviewIndex,
	    			reviewContent : reviewContent,
	    			reviewScore : reviewScore
	    		},
	    		success:function(data){
	    			if(data == 1){
	    				$('#staticBackdrop').modal('hide');
	    				alert("댓글이 수정되었습니다.");
	    				let nowPage = $("#nowPage").html();
	    				goPage(nowPage);	
	    			}
	    		}
	    	})
	    }
	</script>
</body>
</html>
