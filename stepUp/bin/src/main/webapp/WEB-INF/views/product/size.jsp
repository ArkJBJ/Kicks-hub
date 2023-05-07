<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>     
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사이즈</title>
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
        .ml{
        	margin-left:10%;
        }
       	#stock_title{
       		font-size:17.5px;
       		margin-bottom:5%;
       	}
       	#stock_title h2{
		    border-bottom: 2px solid #747474;
		    padding-bottom: 10px;
		    margin-bottom: 20px;
       	}       	
    </style>    
</head>
<body>
   <article id="mypage_contain" class="ml"><!--관심목록 페이지 시작-->
                <div id="stock_title">
                    <h2>재고관리</h2>
                </div>
                <div class="d-flex justify-content-start mb-3">
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
	                <button type="button" class="btn btn-outline-secondary" onclick="insertSize()">사이즈 추가</button>
                </div>                
                <div class="mplikecontain"> 
                    <div class="like-items">
                        <div class="main-brandBest-items-area">
                            <div class="table-responsive">
                                <table class="table table-bordered prdList">
                                    <thead>
                                        <tr class="al-c">
                                            <th scope="col">사이즈</th>
                                            <th scope="col">현재 재고</th>
                                            <th scope="col">수정 적용</th>
                                        </tr>
                                    </thead>
                                    <tbody id="listView">
                                    <c:forEach var="size" items="${sizeList}">  
					<tr class="al-c">
					<td id="sizeKind">${size.sizeKind}</td>
					<td><input type="number" value="${size.sizeStock}" id="stock_${size.sizeIndex}"></td>
					<td><button onclick="sizeModify('${size.sizeIndex}')">수정하기</button></td>
					</tr>
				    </c:forEach>										
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
      </article><!--관심목록 페이지 끝-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script type="text/javascript">
    	function sizeModify(sizeIndex){//재고수정 ajax
			let sizeStock = $("#stock_"+sizeIndex+"").val();
    		$.ajax({
    			url:"<%=request.getContextPath()%>/ajax/sizeModify.do",
    			type:"post",
    			data:{
    				sizeIndex : sizeIndex,
    				sizeStock : sizeStock
    			},
    			success:function(data){
    				if(data == 1){
    					alert("재고가 수정되었습니다.");
    					window.location.reload();
    				}
    			}
    		})
    	}
    	
    	function insertSize(){
    		let check = 0;
    		let inputSize = $("#inputSize").val();
    		let prdIndex = "<c:out value='${prdIndex}'/>";
    		let sizeKind = document.querySelectorAll("#sizeKind");
    		if(sizeKind.length != 0){    			
    			sizeKind.forEach(function(i){
    				if(inputSize == i.innerText){
    					alert("중복된 사이즈 입니다.");
    					check = 1;
    				}
    			});
    		}
			if(check == 0){
	    		$.ajax({
	    			url:"<%=request.getContextPath()%>/ajax/sizeinsert.do",
	    			type:"post",
	    			data:{
	    				prdIndex : prdIndex,
	    				inputSize : inputSize
	    			},
	    			success:function(data){
	    				if(data == 1){
	    					alert("재고가 추가되었습니다.");
	    					window.location.reload();
	    				}
	    			}
	    			
	    		})
			}
    	}	
    </script>
</body>
</html>
