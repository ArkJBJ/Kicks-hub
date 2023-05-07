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
    <title>상품등록 수정</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
    <!-- ㅆㅁㄴㅌ 연결-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/plugin/summernote/summernote-lite.js"></script>
    <script src="<%=request.getContextPath()%>/resources/plugin/summernote/summernote-ko-KR.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugin/summernote/summernote-lite.css">
</head>
<body>
<%@include file="../include/header.jsp"%>
    <main class="prd-registration">
        <article id="board_write">
            <div id="board_ttl">브랜드별 상품등록</div>
            <form name="frm" action="productModify.do" method="post" onsubmit="return check()" enctype="multipart/form-data">
            	<input type="hidden" name="prdIndex" value="${prdVO.prdIndex}">
                <div class="prd-Kategorie-area">
                    <div class="prdCode-title">
                        <h2>상품코드</h2>
                    </div>
                    <input type="hidden" name="prdCode" value="">
                    <c:set var="brandCode" value="${fn:substring(prdVO.prdCode,0,2)}"/>
                    <c:set var="typeCode" value="${fn:substring(prdVO.prdCode,2,4)}"/>
                    <c:set var="inputCode" value="${fn:substring(prdVO.prdCode,4,8)}"/>
                    <div class="d-flex justify-content-start">
                        <div class="w-25 me-4">
                            <label for="brand" class="form-label">브랜드</label>
                            <select name="brandCode" class="form-select" id="brandCode">
                                <option value="NK" <c:if test="${brandCode eq 'NK'}">selected</c:if>>나이키</option>
                                <option value="NB" <c:if test="${brandCode eq 'NB'}">selected</c:if>>뉴발</option>
                                <option value="VS" <c:if test="${brandCode eq 'VS'}">selected</c:if>>반스</option>
                                <option value="AD" <c:if test="${brandCode eq 'AD'}">selected</c:if>>아디다스</option>
                                <option value="CV" <c:if test="${brandCode eq 'CV'}">selected</c:if>>컨버스</option>
                                <option value="CR" <c:if test="${brandCode eq 'CR'}">selected</c:if>>크록스</option>
                                <option value="PM" <c:if test="${brandCode eq 'PM'}">selected</c:if>>푸마</option>
                                <option value="FL" <c:if test="${brandCode eq 'FL'}">selected</c:if>>휠라</option>
                            </select>
                        </div>   
                        <div class="w-25 me-4">
                            <label for="type" class="form-label">종류</label>
                            <select name="typeCode" class="form-select" id="typeCode">
                                <option value="01" <c:if test="${typeCode eq '01'}">selected</c:if>>운동화</option>
                                <option value="02" <c:if test="${typeCode eq '02'}">selected</c:if>>스포츠화</option>
                                <option value="03" <c:if test="${typeCode eq '03'}">selected</c:if>>크록스</option>
                                <option value="04" <c:if test="${typeCode eq '04'}">selected</c:if>>슬리퍼</option>
                                <option value="05" <c:if test="${typeCode eq '05'}">selected</c:if>>샌들</option>
                             </select>
                        </div>  
                        <div class="w-25">
                            <label for="code" class="form-label">코드</label>
                            <input type="text" name="inputCode" class="form-control" id="inputCode" value="${inputCode}"/>                       
                        </div> 
                        <button type="button" class="btn btn-light mt-auto mx-3" onclick="prdCodeCheck()">중복체크</button> 
                    </div>
                </div>
                <div class="mt-4">
                    <label for="prdName" class="form-label">상품명</label>
                    <input type="text" name="prdName" class="form-control" id="prdName" value="${prdVO.prdName}"/>
                </div>
                <div class="mt-4">
                    <label for="prdPrice" class="form-label">상품가격</label>
                    <input type="number" name="prdPrice" class="form-control" id="prdPrice" value="${prdVO.prdPrice}"/>
                </div>
                <div class="mt-4">
                    <label for="prdMadeIn" class="form-label">상품 제조국</label>
                    <input type="text" name="prdMadeIn" class="form-control" id="prdMadeIn" value="${prdVO.prdMadeIn}"/>
                </div>
                <div class="mt-4">
                    <label for="prdMt" class="form-label">상품 소재</label>
                    <input type="text" name="prdMt" class="form-control" id="prdMt" value="${prdVO.prdMt}"/>
                </div>
                <div class="mt-4">
                    <label for="prdQc" class="form-label">품질 보증기준</label>
                    <input type="text" name="prdQc" class="form-control" id="prdQc" value="${prdVO.prdQc}"/>
                </div>
                <div class="mt-4">
                    <label for="prdCare" class="form-label">소재관리 방법</label>
                    <textarea name="prdCare" class="form-control" id="prdCare">${prdVO.prdCare}</textarea>
                </div>
                <div class="mt-4">
                    <label for="prdMadeDate" class="form-label">제조일</label>
                    <input type="text" name="prdMadeDate" class="form-control" id="prdMadeDate" value="${prdVO.prdMadeDate}"/>
                </div>
                <div class="d-flex">
                    <div class="file-area">
                        <div class="mt-4 mainImg">
                            <h2>메인 이미지</h2>
                            <div class="file-input-container d-flex">
                                <input type="file" class="sm-input-file" name="mainFile" id="MainImg" value=""/>
                                <input type="hidden" name="mainPrdRname" value="${prdVO.prdRname}">
                            </div>
                        </div>
                        <div class="mt-2 subImg">
                            <h2>서브 이미지</h2>
                            <div class="file-input-container d-flex">
                                <input type="file" class="sm-input-file" name="subFile" id="subImg1"/>
                            </div>
                            <div class="file-input-container d-flex pt-0">
                                <input type="file" class="sm-input-file" name="subFile" id="subImg2"/>
                            </div>
                            <c:forEach var="subImg" items="${prdImgList}">
                            	<input type="hidden" name="subPrdImgIndex" value="${subImg.prdImgIndex}"/>
                            	<input type="hidden" name="subPrdImgRname" value="${subImg.prdImgRname}"/>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="file-info-area">
                        <span>&nbsp;&nbsp;&nbsp;이미지 등록시 주의 사항입니다.</span>
                        <br/>
                        <span>1. 이미지 크기는 ?x?로 맞춰 주세요.</span>
                        <br/>
                        <span>2. 이미지 확장자는 .???파일만 사용가능합니다.</span>
                        <br/>
                        <span>3. 메인 이미지는 상품 리스트 출력시 노출되는 사진입니다.</span>
                    </div>
                </div>            
                <div class="detail-info">
                    <h2>상품 상세 정보</h2>
                    <textarea id="summernote" name="prdCnt" id="prdCnt">${prdVO.prdCnt}</textarea>
                </div>
                <div id="board_button">
                    <input type="submit" class="btn btn-outline-secondary" value="저 장">
                    <input type="button" class="btn btn-outline-secondary" value="돌아가기" onclick="history.back()">
                </div>
            </form>
        </article> 
    </main>
<%@include file="../include/footer.jsp"%>
    <script>
        $(document).ready(function() {//썸머노트     
        //여기 아래 부분
        $('#summernote').summernote({
              height: 450,                 // 에디터 높이
              minHeight: null,             // 최소 높이
              maxHeight: null,             // 최대 높이
              focus: false,                // 에디터 로딩후 포커스를 맞출지 여부
              lang: "ko-KR",			       // 한글 설정
              callbacks:{
            	  onImageUpload: function(files, editor, welEditable){
  		            for (var i = files.length - 1; i >= 0; i--) {
		            	sendFile(files[i], this);
            	  }
              }
            }
        });
      }); 
        function sendFile(file, el){//썸머노트 콜백
        	let data = new FormData();
        	data.append('file', file);
        	$.ajax({
            	data: data,
            	type: "POST",
            	url: '${pageContext.request.contextPath}/ajax/SummerNoteImageFile.do',
            	cache: false,
            	contentType: false,
            	enctype: 'multipart/form-data',
            	processData: false,
            	success: function(data) {
              		$(el).summernote('editor.insertImage', data.url);
            	}
          	});
        }
        let prdCheck = "";
        function prdCodeCheck(){
        	let brandCode = $("#brandCode").val();
        	let crdCode =  $("#typeCode").val();
        	let inputCode = $('#inputCode').val();
        	let checkCode = /^[0-9]{4}$/;
        	if($("#inputCode").val() == "" || !checkCode.test(inputCode)){
        		alert("상품코드를 입력해주세요(숫자 4자리로 이루어진 코드여야합니다.)");
        		$("#inputCode").focus();
        		return false;
        	}
        	let prdCode = brandCode+crdCode+inputCode;
        	$.ajax({
        		url:"<%=request.getContextPath()%>/ajax/prdCodeCheck.do",
        		type:"GET",
        		data:{prdCode : prdCode},
        		success:function(data){
        			if(data > 0){
        				alert("중복된 상품 코드입니다.");
        			}else{
        				alert("사용가능한 상품 코드입니다.");
        				prdCheck = data;
        			}
        		}
        	});        	
        }
        function check(){//코드 조합 및 유효성 검사       	
        	let brandCode = $("#brandCode").val();
        	let crdCode =  $("#typeCode").val();
        	let inputCode = $('#inputCode').val();
        	let checkCode = /^[0-9]{4}$/;
        	if($("#inputCode").val() == "" || !checkCode.test(inputCode)){
        		alert("상품코드를 입력해주세요(숫자 4자리로 이루어진 코드여야합니다.)");
        		$("#inputCode").focus();
        		return false;
        	}
        	let prdCode = brandCode+crdCode+inputCode;
        	let orignalCode = "<c:out value='${prdVO.prdCode}'/>";
        	if(prdCode == orignalCode){
        		prdCheck = 1;
        	}
        	if(prdCheck == ""){
        		alert("상품 코드 중복확인을 실행해 주세요");
        		return false;
        	}
        	$('input[name=prdCode]').attr('value',prdCode);
        	if($("#prdName").val() == ""){
        		alert("상품명을 입력해주세요");
        		$("#prdName").focus();
        		return false;
        	}
        	if($("#prdPrice").val() == ""){
        		alert("상품가격을 입력해주세요");
        		$("#prdPrice").focus();
        		return false;
        	}
        	if($("#prdMadeIn").val() == ""){
        		alert("상품 제조국을 입력해주세요");
        		$("#prdMadeIn").focus();
        		return false;
        	}
        	if($("#prdMt").val() == ""){
        		alert("상품 소재를 입력해주세요");
        		$("#prdMt").focus();
        		return false;
        	}
        	if($("#prdQc").val() == ""){
        		alert("품질보증 기준을 입력해주세요");
        		$("#prdQc").focus();
        		return false;
        	}
        	if($("#prdCnt").val() == ""){
        		alert("상품 상세내용을 입력해주세요");
        		$("#prdCnt").focus();
        		return false;
        	}
        	return true
        }
        function add(){//재고 추가 버튼 클릭시 실행 함수
        	let check = 0;
        	let inputSize = $("#inputSize").val();
        	let sizeKind = document.querySelectorAll('input[name="sizeKind"]');
    		if(sizeKind.length != 0){
    			sizeKind.forEach(function(i){
    				if(inputSize == i.value){
    					alert("중복된 사이즈 입니다.");
    					check = 1;
    				}
    			});
    		}
        	if(check == 0 ){
		    let size = '';
		    size += '<li class="d-flex mt-2 size my-2 justify-content-start">';
		    size += '<div class="w-25 me-5">';
			size += '<input type="text" name="sizeKind" class="form-control" id="sizeKind" value="'+inputSize+'" readonly>' ;
			size += '</div>';
		    size += '<div class="w-25">';
		    size += '<input type="number" name="sizeStock" class="form-control" id="sizeStock" value="0" required="required"/>';  
		    size += '</div>';  
		    size += '</li>';  
        	$("#sizeWrap").append(size);
        	}
        }     
    </script>
</body>
</html>
