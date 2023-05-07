<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>      
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
</head>
<body>
<%@include file="../include/header.jsp"%>
    <main id="newjsp"><!--메인 시작-->
        <div class="d-flex justify-content-between">
            <article id="prd_filter">
                <div id="prd_addr">
                </div>
                <p class="filter_ttl">사이즈</p>
                <ul  id="size_check">
                    <li class="size_box">
                        <input type="checkbox" name="sizeKind" value="210" id="size01">
                        <label for="size01">
                            <span>210</span>
                        </label>
                    </li>
                    <li class="size_box">
                        <input type="checkbox" name="sizeKind" value="220" id="size02">
                        <label for="size02">
                            <span>220</span>
                        </label>
                    </li>
                    <li class="size_box">
                        <input type="checkbox" name="sizeKind" value="230" id="size03">
                        <label for="size03">
                            <span>230</span>
                        </label>
                    </li>
                    <li class="size_box">
                        <input type="checkbox" name="sizeKind" value="240" id="size04">
                        <label for="size04">
                            <span>240</span>
                        </label>
                    </li>
                    <li class="size_box">
                        <input type="checkbox" name="sizeKind" value="250" id="size05">
                        <label for="size05">
                            <span>250</span>
                        </label>
                    </li>
                    <li class="size_box">
                        <input type="checkbox" name="sizeKind" value="260" id="size06">
                        <label for="size06">
                            <span>260</span>
                        </label>
                    </li>
                    <li class="size_box">
                        <input type="checkbox" name="sizeKind" value="270" id="size07">
                        <label for="size07">
                            <span>270</span>
                        </label>
                    </li>
                    <li class="size_box">
                        <input type="checkbox" name="sizeKind" value="280" id="size08">
                        <label for="size08">
                            <span>280</span>
                        </label>
                    </li>
                </ul>
             	<p class="filter_ttl">가격</p>
	            <div id="prc_check">
					<fieldset class="price-range-slider">
						<div class="price-field">
							<input type="range" min="0" max="178000" value="0" id="lower">
							<input type="range" min="0" max="178000" value="178000" id="upper">
						</div>
						<div class="price-wrap align-items-baseline justify-content-end">
							<span id="price-min"></span>
							<span>~</span>
							<span id="price-max"></span>
							<span>원</span>
						</div>								
					</fieldset>			
	            </div>
                <p class="filter_ttl">종류</p>
                <ul id="type_check">
                    <li class="type_box">
                        <input type="checkbox" name="prdType" value="01" id="type01">
                        <label for="type01">
                            <span>운동화</span>
                        </label>
                    </li>
                    <li class="type_box">
                        <input type="checkbox" name="prdType" value="02" id="type02">
                        <label for="type02">
                            <span>스니커즈</span>
                        </label>
                    </li>
                    <li class="type_box">
                        <input type="checkbox" name="prdType" value="03" id="type03">
                        <label for="type03">
                            <span>크록스</span>
                        </label>
                    </li>
                    <li class="type_box">
                        <input type="checkbox" name="prdType" value="04" id="type04">
                        <label for="type04">
                            <span>슬리퍼</span>
                        </label>
                    </li>
                    <li class="type_box">
                        <input type="checkbox" name="prdType" value="05" id="type05">
                        <label for="type05">
                            <span>샌들</span>
                        </label>
                    </li>         
                </ul>
                <button class="fsbtn rounded-0" type="button" onclick="searchPrdList(1)">검색</button>
            </article>
            <article id="prd_cnt">
		    <div id="brand_main"></div>
		    <div id="prd_sort" class="d-flex justify-content-end"></div>
		    <div class="best-title">
                <h2>NEW</h2>
            </div>
            <ul id="cnt_list"><!-- 상품 출력 영역 -->
            </ul>
           	<div id="pagingBtn" class="mb-5"><!-- 페이징 버튼 출력 영역 -->
            </div>            
            </article>
        </div>
    </main><!--메인 끝-->
<%@include file="../include/footer.jsp"%>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script><!-- swiper JS 연결 -->
    <script>
    	    //range(가격 검색)관련 스크립트
	    var lowerSlider = document.querySelector('#lower');
	    var upperSlider = document.querySelector('#upper');
	    let priMax =  new Intl.NumberFormat('ko-kr').format(upperSlider.value);
	    let priMin =  new Intl.NumberFormat('ko-kr').format(lowerSlider.value);
	    $('#price-max').html(priMax);
	    $('#price-min').html(priMin);
	    var lowerVal = parseInt(lowerSlider.value);
	    var upperVal = parseInt(upperSlider.value);
	    upperSlider.oninput = function () {
	        lowerVal = parseInt(lowerSlider.value);
	        upperVal = parseInt(upperSlider.value);
	        if (upperVal < lowerVal + 4) {
	            lowerSlider.value = upperVal - 4;
	            if (lowerVal == lowerSlider.min) {
	                upperSlider.value = 4;
	            }
	        }
	        let thisMax =  new Intl.NumberFormat('ko-kr').format(this.value);
	        $('#price-max').html(thisMax); 
	    };
	    lowerSlider.oninput = function () {
	        lowerVal = parseInt(lowerSlider.value);
	        upperVal = parseInt(upperSlider.value);
	        if (lowerVal > upperVal - 4) {
	            upperSlider.value = lowerVal + 4;
	            if (upperVal == upperSlider.max) {
	                lowerSlider.value = parseInt(upperSlider.max) - 4;
	            }
	        }
	        let thisMin =  new Intl.NumberFormat('ko-kr').format(this.value);
	        $('#price-min').html(thisMin); 
	    };
	    function searchPrdList(nowPage){//상품 리스트ajax호출 함수
	    	let sizeKind = [];
	    	let prdType = [];
	    	let priceMin = $("#lower").val();
	    	let priceMax = $("#upper").val();
	    	let sort = "new";
	    	let pageType = "new";
	    	$('input[name=sizeKind]:checked').each(function() {
	    		sizeKind.push($(this).val());
	    	});
	    	$('input[name=prdType]:checked').each(function() {
	    		prdType.push($(this).val());
	    	});
	    	$.ajax({
	    		url:"<%=request.getContextPath()%>/ajax/search.do",
	    		type:"get",
	    		traditional : true,
	    		data:{
	    			sizeKind : sizeKind,
	    			prdType : prdType,
	    			priceMin : priceMin,
	    			priceMax : priceMax,
	    			nowPage : nowPage,
	    			sort : sort,
	    			pageType : pageType
	    			},
	    		success:function(data){
	    			let prdHtml='';
	    			for(let i=0; i < data.length; i++){
	    				let prdList = data[i];
	    				let price = new Intl.NumberFormat('ko-kr').format(prdList.prdPrice);
	    				let brandSub = prdList.prdCode.substring(0, 2);
	    				let brandName = "";
	    				switch (brandSub) {
	    			    case "NK":
	    			        brandName = "NIKE";
	    			        break;
	    			    case "AD":
	    			        brandName = "ADIDAS";
	    			        break;
	    			    case "VS":
	    			        brandName = "VANS";
	    			        break;
	    			    case "CV":
	    			        brandName = "CONVERSE";
	    			        break;
	    			    case "PM":
	    			        brandName = "PUMA";
	    			        break;
	    			    case "FL":
	    			        brandName = "FILA";
	    			        break;
	    			    case "CR":
	    			        brandName = "CROCS";
	    			        break;
	    			    case "NB":
	    			        brandName = "NEWBALANCE";
	    			        break;
	    				}
	    				prdHtml += '<li class="cnt_info">';
	    				prdHtml += '<a href="<%=request.getContextPath()%>/product/view.do?prdIndex='+prdList.prdIndex+'">';
	    				prdHtml += '<div><p class="cnt_img1" style="background-image:url(<%=request.getContextPath() %>/resources/prdmainimg/'+prdList.prdRname+')"></div></p>';
	    				prdHtml += '<P class="cnt_brand"><span>'+brandName+'</span></P>';
	    				prdHtml += '<P class="cnt_name"><span>'+prdList.prdName+'</span></P>';
	    				prdHtml += '<P class="cnt_prc"><span>'+price+'원</span></P>';
	    				prdHtml += '</a>';
	    				prdHtml += '</li>';	    					    				
	    			}
	    			paging(nowPage)
	    			$("#cnt_list").html(prdHtml);
	    		}
	    	});
	    }
	    function paging(nowPage){//페이징 버튼 ajax 처리 함수
	    	let sizeKind = [];
	    	let prdType = [];
	    	let priceMin = $("#lower").val();
	    	let priceMax = $("#upper").val();	
	    	let sort = "new";
	    	let pageType = "new";
	    	$('input[name=sizeKind]:checked').each(function() {
	    		sizeKind.push($(this).val());
	    	});
	    	$('input[name=prdType]:checked').each(function() {
	    		prdType.push($(this).val());
	    	});
	    	let pagingHtml = '';
	    	$.ajax({
	    		url:"<%=request.getContextPath()%>/ajax/searchPaging.do",
	    		type:"get",
	    		traditional : true,
	    		data:{
	    			sizeKind : sizeKind,
	    			prdType : prdType,
	    			priceMin : priceMin,
	    			priceMax : priceMax,
	    			nowPage : nowPage,
	    			sort : sort,
	    			pageType : pageType
	    			},
	    		success: function(data) {
				let startPage = Number(data.startPage);
				let endPage = Number(data.endPage);
				let perPage = Number(data.perPage);
				let total = Number(data.total);
				let now = Number(data.nowPage);
				let lastPage = Number(data.lastPage);
		    	pagingHtml += '<li class="d-flex justify-content-center">';
		    	pagingHtml += '<a href="javascript:void(0);" class="xi-angle-left"  onclick="searchPrdList('+(now - 1)+')" style= "display:'+(now != 1 ? 'block' : 'none')+'"></a>';
		    	pagingHtml += '<div id="pagingNumBtn">';
		    	for(let i = startPage; i <= endPage; i ++){
		    		if(now != i){
		    			pagingHtml += '<a href="javascript:void(0);" class="pe-1" onclick="searchPrdList('+i+')">'+i+'</a>';
		    		}else{
		    			pagingHtml += '<span class="pe-1 text-primary">'+i+'</span>';
		    		}
		    	}
		    	pagingHtml += '</div> ';
		    	pagingHtml += '<a href="javascript:void(0);" class="xi-angle-right" onclick="searchPrdList('+(now+ 1)+')" style= "display:'+(now != lastPage && lastPage != 0  ? 'block' : 'none')+'"></a>';
		    	pagingHtml += '</li>';
		    	$("#pagingBtn").html(pagingHtml);
 	    		}
	    	});
	    }
	    //brand paging 페이지 로드시 호출
	    $(document).ready(function(){
	    	searchPrdList(1);
	    });	
        function colorchange(){
            document.getElementById("colnk").style.background = "url('../image/new/new_logo_nk.png') no-repeat 0 0";
        }
    </script>
</body>
</html>
