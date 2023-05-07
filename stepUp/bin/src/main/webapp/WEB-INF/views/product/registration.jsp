<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품등록</title>
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
            <form name="frm" action="registration.do" method="post" onsubmit="return check()" enctype="multipart/form-data">
                <div class="prd-Kategorie-area">
                    <div class="prdCode-title">
                        <h2>상품코드</h2>
                    </div>
                    <input type="hidden" name="prdCode" value="">
                    <div class="d-flex justify-content-start">
                        <div class="w-25 me-4">
                            <label for="brand" class="form-label">브랜드</label>
                            <select name="brandCode" class="form-select" id="brandCode" onchange="selectCheck()">
                                <option value="NK">나이키</option>
                                <option value="NB">뉴발</option>
                                <option value="VS">반스</option>
                                <option value="AD">아디다스</option>
                                <option value="CV">컨버스</option>
                                <option value="CR">크록스</option>
                                <option value="PM">푸마</option>
                                <option value="FL">휠라</option>
                            </select>
                        </div>   
                        <div class="w-25 me-4">
                            <label for="type" class="form-label">종류</label>
                            <select name="typeCode" class="form-select" id="typeCode" onchange="selectCheck()">
                                <option value="01">운동화</option>
                                <option value="02">스포츠화</option>
                                <option value="03">크록스</option>
                                <option value="04">슬리퍼</option>
                                <option value="05">샌들 </option>
                             </select>
                        </div>  
                        <div class="w-25">
                            <label for="code" class="form-label">코드</label>
                            <input type="text" name="inputCode" class="form-control" id="inputCode" value=""/>                       
                        </div> 
                        <button type="button" class="btn btn-light mt-auto mx-3" onclick="prdCodeCheck()">중복체크</button> 
                    </div>
                </div>
                <div class="mt-4">
                    <label for="prdName" class="form-label">상품명</label>
                    <input type="text" name="prdName" class="form-control" id="prdName"/>
                </div>
                <div class="mt-4">
                    <label for="prdPrice" class="form-label">상품가격</label>
                    <input type="number" name="prdPrice" class="form-control" id="prdPrice" value="0"/>
                </div>
                <div class="mt-4">
                    <label for="prdMadeIn" class="form-label">상품 제조국</label>
                    <input type="text" name="prdMadeIn" class="form-control" id="prdMadeIn"/>
                </div>
                <div class="mt-4">
                    <label for="prdMt" class="form-label">상품 소재</label>
                    <input type="text" name="prdMt" class="form-control" id="prdMt"/>
                </div>
                <div class="mt-4">
                    <label for="prdQc" class="form-label">품질 보증기준</label>
                    <input type="text" name="prdQc" class="form-control" id="prdQc" value="구입 후 6개월. 유통 중 손상되었거나 품질에 이상이 있는 제품에 한하여 소비자피해보상규정에 의거 보상하여 드립니다.  제품에부착되어 있는 사용방법 및 취급시 주의사항에 따라 제품을 관리해주시기 바랍니다."/>
                </div>
                <div class="mt-4">
                    <label for="prdCare" class="form-label">소재관리 방법</label>
                    <textarea name="prdCare" class="form-control" id="prdCare">
                    1. 신발의 외형보호를 위해 뒤꿈치를 꺾어 신지마세요. 
                    2. 화기에 절대로 가까이 두지 마세요.
                    3. 천연가죽이나 천소재 상품은 물기 및 마찰에 의해 색깔이 변할 가능성이 있습니다. 
                    4. 가벼운 오염물이 묻었을 경우 마른 천으로 닦거나, 부드러운 솔로 털어 주세요.
                    5. 신발에 기름기가 묻지 않도록 주의해주세요.
                    </textarea>
                </div>
                <div class="mt-4">
                    <label for="prdMadeDate" class="form-label">제조일</label>
                    <input type="date" name="prdMadeDate" class="form-control" id="prdMadeDate"/>
                </div>
                <div class="d-flex">
                    <div class="file-area">
                        <div class="mt-4 mainImg">
                            <h2>메인 이미지</h2>
                            <div class="file-input-container d-flex">
                                <input type="file" class="sm-input-file" name="mainFile" id="MainImg"/>
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
                <div>
                <div class="d-flex justify-content-start">
			<select name="inputSize" class="form-select" id="inputSize">
			        <option value="210">210</option>
			        <option value="220">220</option>
			        <option value="230">230</option>
			        <option value="240">240</option>
			        <option value="250">250</option>
			        <option value="260">260</option>
			        <option value="270">270</option>
			        <option value="280">280</option>
			</select>
	                <button type="button" class="btn btn-outline-secondary" onclick="add()">사이즈 추가</button>
	                <button type="button" class="btn btn-outline-secondary mx-2" onclick="removeer()">사이즈 삭제</button>
                </div>
                <div class="my-4 d-flex justify-content-start">
	                <span class="w-25 me-5">사이즈</span>
	                <span>재고수량</span>
                </div>
                <div>
                	<ul id="sizeWrap">             		
                	</ul>
                </div>
                <div class="detail-info">
                    <h2>상품 상세 정보</h2>
                    <textarea id="summernote" name="prdCnt" id="prdCnt"></textarea>
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
        	let sizeKind = document.querySelectorAll('input[name="sizeKind"]');
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
        	if($("#prdCare").val() == ""){
        		alert("소재관리 방법을 입력해주세요");
        		$("#prdCare").focus();
        		return false;
        	}
        	if($("#prdMadeDate").val() == ""){
        		alert("상품 제조일을 입력해주세요");
        		$("#prdMadeDate").focus();
        		return false;
        	}
        	if($("#MainImg").val() == ""){
        		alert("메인이미지를 등록해주세요");
        		$("#MainImg").focus();
        		return false;
        	}
        	if($("#subImg1").val() == ""){
        		alert("서브이미지를 등록해주세요");
        		return false;
        	}
        	if($("#subImg2").val() == ""){
        		alert("서브이미지를 등록해주세요");
        		return false;
        	}
        	if(sizeKind.length == 0){
        		alert("기초 재고를 등록해주세요");
        		$("#inputSize").focus();
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
        function removeer(){//재고 삭제 버튼 클릭시 실행 함수
        	$("#sizeWrap").find(".size").last().remove();
        }
        function selectCheck(){
        	if($('#inputCode').val() != ""){
        		prdCheck = "";
        	}
        }
    </script>
</body>
</html>
