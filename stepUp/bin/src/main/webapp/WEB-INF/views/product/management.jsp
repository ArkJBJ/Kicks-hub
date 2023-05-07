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
    <title>상품관리</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
    <style>
        .prdList{
            border: 1px solid black;
            width: 100%;
            padding: 5%;
        }
        .prdList th, tr, td{border: 1px solid black;}
        .magSearch .btns{
            height: 100%;
            width: 100%;
        }
        .al-c{
            text-align: center;
        }
    </style>
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
                    <h2>상품관리</h2>
                </div>
                <div class="row gx-3 gy-2 align-items-center">
                    <div class="d-flex mb-3 magSearch">
                        <div class="d-flex">
                            <div>
                                <label class="visually-hidden" for="specificSizeSelect">Preference</label>
                                <select class="form-select" id="searchType" name="searchType">
                                    <option value="code">상품코드</option>
                                    <option value="name">상품명</option>
                                </select>
                            </div>
                            <div >
                                <label class="visually-hidden" for="specificSizeInputName">Name</label>
                                <input type="text" class="form-control" id="searchValue" name="searchValue" placeholder="검색창">
                            </div>
                            <div>
                                <button type="button" class="btns mx-2" onclick="searchPrdList(1)">검색</button>
                            </div>
                        </div>
                        <div>
                            <button class="btns" type="button" onclick="location.href='<%=request.getContextPath()%>/product/registration.do'">상품등록</button>
                        </div>
                    </div>
                </div>
                <div class="mplikecontain"> 
                    <div class="like-items">
                        <div class="main-brandBest-items-area">
                            <div class="table-responsive">
                                <table class="table table-bordered prdList">
                                    <thead>
                                        <tr class="al-c">
                                            <th scope="col">수정</th>
                                            <th scope="col">삭제</th>
                                            <th scope="col">상품코드</th>
                                            <th scope="col">상품명</th>
                                            <th scope="col">금액</th>
                                            <th scope="col">재고정보</th>
                                            <th scope="col">상세보기</th>
                                        </tr>
                                    </thead>
                                    <tbody id="listView">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <article id="pagingBtn">
                </article>
            </article><!--관심목록 페이지 끝-->
        </div>
	</main>
<%@include file="../include/footer.jsp"%>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script>
        function searchPrdList(nowPage){//상품 리스트ajax호출 함수
        	let searchType = $("#searchType").val();
        	let searchValue = $("#searchValue").val();
	    	$.ajax({
	    		url:"<%=request.getContextPath()%>/ajax/manageSearch.do",
	    		type:"get",
	    		traditional : true,
	    		data:{
	    			nowPage : nowPage,
	    			searchType : searchType,
	    			searchValue : searchValue
	    			},
	    		success:function(data){
	    			let prdHtml='';
	    			for(let i=0; i < data.length; i++){
	    				let prdList = data[i];
	    				let price = new Intl.NumberFormat('ko-kr').format(prdList.prdPrice);
	    				prdHtml += '<tr class="al-c">';
	    				prdHtml += '<td><button class="btns" onclick="goPrdModify('+prdList.prdIndex+')">수정</button></td>';
	    				prdHtml += '<td><button class="btns" onclick="prdDel('+prdList.prdIndex+')">삭제</button></td>';
	    				prdHtml += '<td>'+prdList.prdCode+'</td>';
	    				prdHtml += '<td>'+prdList.prdName+'</td>';
	    				prdHtml += '<td>'+price+'원</td>';
	    				prdHtml += '<td><button class="btns" onclick="sizeInfo('+prdList.prdIndex+')">재고정보</button></td>';	    					    				
	    				prdHtml += '<td><button class="btns" onclick="goPrdView('+prdList.prdIndex+')">상세보기</button></td>';	    					    				
	    				prdHtml += '</tr>';	    					    				
	    			}
	    			paging(nowPage);
	    			$("#listView").html(prdHtml);
	    		}
	    	});
	    }
	    function paging(nowPage){//페이징 버튼 ajax 처리 함수
        	let searchType = $("#searchType").val();
        	let searchValue = $("#searchValue").val();
	    	let pagingHtml = '';
	    	$.ajax({
	    		url:"<%=request.getContextPath()%>/ajax/manageSearchPaging.do",
	    		type:"get",
	    		traditional : true,
	    		data:{
	    			nowPage : nowPage,
	    			searchType : searchType,
	    			searchValue : searchValue
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
		    	pagingHtml += '<a href="javascript:void(0);" class="xi-angle-right" onclick="searchPrdList('+(now+ 1)+')" style= "display:'+(now != lastPage && lastPage != 0 ? 'block' : 'none')+'"></a>';
		    	pagingHtml += '</li>';
		    	$("#pagingBtn").html(pagingHtml);
 	    		}
	    	});
	    }
        
	    //페이지 로드시 호출
	    $(document).ready(function(){
	    	searchPrdList(1);
	    });
            function prdDel(prdIndex){
	    	if(confirm("해당 상품을 삭제 하시겠습니까?") == 0){
	 		return false;
	 	}
	 	$.ajax({
	 		url:"<%=request.getContextPath()%>/ajax/prdDel.do",
	 		type:"POST",
	 		data:{
	 			prdIndex : prdIndex
	 		},
	 		success:function(data){
	 			if(data == 1){
	 				alert("상품이 삭제되었습니다.");
	 				searchPrdList(1);
	 			}
	 		}
	 	})
	 	}
	 	
	 	function goPrdView(prdIndex){
	 		location.href="<%=request.getContextPath()%>/product/view.do?prdIndex="+prdIndex+"";
	 	}
	 	
	 	function sizeInfo(prdIndex){
	 		window.open("<%=request.getContextPath()%>/product/size.do?prdIndex="+prdIndex+"", "상품재고", "width=900,height=1000%, top=50, left=600");
	 	}
	 	
	 	function goPrdModify(prdIndex){
	 		location.href="<%=request.getContextPath()%>/product/productModify.do?prdIndex="+prdIndex+"";
	 	}
    </script>
</body>
</html>
