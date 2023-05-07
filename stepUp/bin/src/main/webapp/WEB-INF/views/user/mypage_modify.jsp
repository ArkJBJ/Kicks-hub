<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개인정보수정</title>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"><!-- xeicon 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"><!-- 부트스트랩 CSS 연결 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Style.css"><!-- CSS연결 -->
</head>	
<body>
	<%@ include file="../include/header.jsp" %>
    <main><!--메인 시작-->
        <div class="mypagemain">
            <div class="mypage_menu"><!--마이페이지 메뉴 시작-->
                <div class="mypagehi">
                    <p>안녕하세요, ${login.getUserNick()} 님!</p>
                </div>
                <div class="mypage_gnb">
                    <span><a href="<%=request.getContextPath()%>/order/user.do">주문배송조회</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_review.do">상품후기</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_like.do">관심있는 상품</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_qna.do">QnA</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_posting.do">내가 작성한 글</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_sns.do">SNS연결설정</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_modify_check.do">개인정보수정</a></span>
                    <span><a href="<%=request.getContextPath()%>/user/mypage_withdrawal.do">회원탈퇴</a></span>
                </div>
            </div><!--마이페이지 메뉴 끝-->

            <article id="mypage_contain"><!--개인정보수정 페이지 시작-->
                <div id="mypage_title">
                    <h2>
                        	개인정보수정
                    </h2>
                    <p>
                        <i class="xi-angle-right-min"></i>
                        	고객님의 주소와 연락처 등 개인정보를 수정하실 수 있습니다.
                    </p>
                </div>
                <form name="mpmFrm" action="mypage_modify.do" method="post" class="mpm"  onsubmit="return joinCheck();">
                	
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="userName"  name="userName" value="${mypage.userName}" onblur="nameCheck()" readonly>
                        <label for="userName">이름</label>
                    </div>
                    <div id="checkNameResult" class="mb-3" style="font-size:13px;"></div>
                    
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="userNick" name="userNick" value="${mypage.userNick}" oninput="checkNick()">
                        <label for="userNick">닉네임</label>
                    </div>
                    <div id="checkNickResult" class="mb-3" style="font-size:13px;"></div>                    
                    
                    <div class="form-floating mb-3" >
                        <input type="password" class="form-control" id="userNPw" name="userNPw" placeholder="userNPw"  onblur="checkNPw()">
                        <label for="userNPw">새 비밀번호</label>
                        <div id="npweyes">
                            <i class="xi-eye-o" id="i-eyes"></i>
                        </div>
                    </div>
                    <div id="checkNPwResult" class="mb-3" style="font-size:13px;"></div>
                    
                    <div class="form-floating mb-3">
                        <input type="password" class="form-control" id="userNPwc" name="userNPwc"  placeholder="userNPwc"  onblur="checkNPwc()">
                        <label for="userNPwc">새 비밀번호 확인</label>
                        <div id="npwceyes">
                            <i class="xi-eye-o" id="c-eyes"></i>
                        </div>
                    </div>
                    <div id="checkNPwcResult" class="mb-3" style="font-size:13px;"></div>
                    
                    <div class="form-floating mb-3 mt-3 d-flex justify-content-between">
                        <input type="text" class="form-control" id="userPhone" name="userPhone" value="${mypage.userPhone}" onblur="PhoneCheck()" maxlength="11">
                        <label for="userPhone">연락처</label>
                    <button type="button" onclick="call()" class="btn btn-secondary btn-sm">인증번호 발송</button>
                    </div>
                    
                    <div class="form-floating mb-3">
                    	<input type="text" class="form-control" id="userPchNum" name="userPchNum" placeholder="인증번호" onblur="Pch()" disabled>
                    	<label for="userPchNum">인증번호</label>
                	</div>
                	<div id="check-Phone" style="margin-top: 16px; font-size:13px;"></div>
                	<div id="PchResult" class="mb-3" style="font-size:13px;"></div>
                	
                    <div class="form-floating mb-3">
                        <input type="email" class="form-control" id="userMail" name="userMail" value="${mypage.userMail}" onblur="checkEmail()">
                        <label for="userMail">이메일</label>
                    </div>
                    <div id="checkEmailResult" class="mb-3" style="font-size:13px;"></div>
                    <div class="form-floating mb-3 mt-3 massagr">
                        <input type="radio" id="userPhAc"  name="userPhAc" value="Y" <c:if test="${mypage.userPhAc eq 'Y'}">checked</c:if>> 연락처 수신동의
                        <input type="radio" id="userPhAc" class="upa2"  name="userPhAc" value="N" <c:if test="${mypage.userPhAc eq 'N'}">checked</c:if>> 연락처 수신비동의
                    </div>
                    <div class="form-floating mb-3 mt-3 d-flex justify-content-between">
                        <input type="text" class="form-control" id="userZipCode" name="userZipCode" value="${mypage.userZipCode}" readonly oninput="clearCheck()">
                        <label for="userZipCode">우편번호</label>
                        <button type="button" onclick="sample6_execDaumPostcode()" class="btn btn-secondary btn-sm">우편번호 찾기</button>
                    </div>
                    <div class="form-floating mb-3 mt-3">
                        <input type="text" class="form-control" id="userAddr" name="userAddr" value="${mypage.userAddr}" readonly>
                        <label for="userAddr">주소</label>
                    </div>
                    <div class="form-floating mb-3 mt-3">
                        <input type="text" class="form-control" id="userAddrDetail" name="userAddrDetail" value="${mypage.userAddrDetail}">
                        <label for="userAddrDetail">상세주소</label>
                    </div>
                    <div id="checkAddrResult" class="mb-3"></div>
                    <div class="mb-3 mt-3" id="mypage_btn">
                        <input type="submit" value="수정">
                    </div>
                </form>
            </article><!--개인정보수정 페이지 끝-->
        </div>
	</main>
	
	<%@ include file="../include/footer.jsp" %>
    
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script><!-- 부트스트랩 자바 스크립트연결 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.0.0/crypto-js.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/JS/script.js"></script><!-- 자바 스크립트 연결 -->
    <script>
    	//비밀번호, 비밀번호 확인 보이기 숨기기
        let npwEyes = document.getElementById("npweyes");
        let iEyes = document.getElementById("i-eyes");
        let UserNPw = document.getElementById("userNPw");
        npwEyes.addEventListener("click", function(){
            if(iEyes.classList.contains("xi-eye-o")){
                iEyes.classList.replace("xi-eye-o", "xi-eye-off-o");
                UserNPw.setAttribute("type", "text");
            }else{
                iEyes.classList.replace("xi-eye-off-o", "xi-eye-o");
                UserNPw.setAttribute("type", "password");
            }
        });
        
        let npwcEyes = document.getElementById("npwceyes");
        let cEyes = document.getElementById("c-eyes");
        let UserNPwc = document.getElementById("userNPwc");
        npwcEyes.addEventListener("click", function(){
            if(cEyes.classList.contains("xi-eye-o")){
                cEyes.classList.replace("xi-eye-o", "xi-eye-off-o");
                UserNPwc.setAttribute("type", "text");
            }else{
                cEyes.classList.replace("xi-eye-off-o", "xi-eye-o");
                UserNPwc.setAttribute("type", "password");
            }
        });


    	function YnCheck(obj){
    		var checked = obj.checked;
    		if(checked){
    			obj.value = "Y";
    		}else{
    			obj.value="N";
    		}
    	}
    	
		//주소검색 api
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
		
      	
      	//새 비밀번호 유효성 체크
      	let checkNPwOk = 1;
      	function checkNPw(){
	      	let UserNPw = $('#userNPw').val();
	      	let str = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,}$/;
	      	if(UserNPw == ""){
	      		 $("#checkNPwResult").html("");
	      		checkNPwOk = 1; 
	      	}else if(!str.test(UserNPw)){
				let html = "4자 이상의 영문, 숫자 를 사용하세요(특수문자 사용 불가)"
			    let checkIdResult = document.getElementById("checkNPwResult");
			    $("#checkNPwResult").html(html);
			    checkIdResult.style.color = '#ff0000';
			    comparisonNPw = UserNPw;
			    checkNPwOk = 0; 
	      	}else{
				let html = "사용 가능한 비밀번호 입니다."
				let checkIdResult = document.getElementById("checkNPwResult");
				$("#checkNPwResult").html(html);
				checkIdResult.style.color = '#008000';
				comparisonNPw = UserNPw;
	      		checkNPwOk = 1;
	      	}
      	
      	}
      	
      	//새 비밀번호 확인 유효성 검사
      	let checkNPwcOk = 1;
      	function checkNPwc(){
      		let UserNPwc = $('#userNPwc').val();
      		let UserNPw = $('#userNPw').val();
      		if(UserNPwc == ""){
				$("#checkNPwcResult").html("");
				checkNPwcOk = 1;         			
      		}else if(UserNPwc != UserNPw){
				let html = "일치하지 않는 비밀번호 입니다."
				let checkIdResult = document.getElementById("checkNPwcResult");
				$("#checkNPwcResult").html(html);
				checkIdResult.style.color = '#ff0000';
				checkNPwcOk = 0;         			
      		}else if(UserNPwc == UserNPw){
				let html = "일치하는 비밀번호 입니다."
				let checkIdResult = document.getElementById("checkNPwcResult");
				$("#checkNPwcResult").html(html);
				checkIdResult.style.color = '#008000';
				checkNPwcOk = 1;      			
      		}
      	}
      	
      	
    	//닉네임 중복체크
      	let checkNickOk = 1;
    	let originalNick = $('#userNick').val();
     	function checkNick(){
      		let UserNick = $('#userNick').val();
      		let str = /^[a-zA-Z0-9가-힣]{2,10}$/;	
      		if(UserNick == ""){
				let html = "필수 정보입니다."
	            let checkIdResult = document.getElementById("checkNickResult");
	          	$("#checkNickResult").html(html);
	          	checkIdResult.style.color = '#ff0000';
	          	checkNickOk = 0;      			
      		}else if(!str.test(UserNick)){
				let html = "2~20자의 영문, 숫자,한글만 사용가능합니다. "
              	let checkIdResult = document.getElementById("checkNickResult");
          		$("#checkNickResult").html(html);
          		checkIdResult.style.color = '#ff0000';
          		checkNickOk = 0;
      		}else if(UserNick == originalNick){
      			$("#checkNickResult").html("");
      			checkNickOk = 1;
      		}else{	
	      		$.ajax({
	      			url: "${pageContext.request.contextPath}/ajax/checkNick.do",
	      			type: "post",
	      			data:{userNick : UserNick},
	      			success:function(data){
	   					if(data != "failse"){
	      					let html = "사용가능한 닉네임 입니다."
	      					let checkIdResult = document.getElementById("checkNickResult");
	      					$("#checkNickResult").html(html);
	      					checkIdResult.style.color = '#008000';
	      					checkNickOk = 1;
	      				}else{
	      					let html = "중복된 닉네임 입니다."
	          				let checkIdResult = document.getElementById("checkNickResult");
	      					$("#checkNickResult").html(html);
	      					checkIdResult.style.color = '#ff0000';
	      					checkNickOk = 0;
      					}
      				},
      				error:function(){
      					alert("에러입니다.");
      				}
      			});
      		}
      	}
     	
     	
     	//이메일 유효성 검사
     	function checkEmail(){
     		let str = /^[a-z0-9]+@[a-z]+\.[a-z]{2,3}$/;
     		let UserMail = $('#userMail').val();
     		if(UserMail == ""||str.test(UserMail)){
     			let html = ""
     			let checkIdResult = document.getElementById("checkEmailResult");
     			$("#checkEmailResult").html(html);
     			checkIdResult.style.color = '#ff0000';
     		}else{
     			let html = "잘못된 이메일 형식입니다."
         		let checkIdResult = document.getElementById("checkEmailResult");
         		$("#checkEmailResult").html(html);
         		checkIdResult.style.color = '#ff0000';
     		}
	     }
	     	
     	// 핸드폰 문자 인증 및 유효성 체크
     	let PchOk = 1;
     	let originalUserPhone = $("#userPhone").val();
     	function call(){
     		let UserPchNumStyle = document.getElementById("userPchNum");
     		let UserPhone = $("#userPhone").val();
     		let str = /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;
     		if(UserPhone == "" || !str.test(UserPhone)){
     				$("#PchResult").html("형식에 맞지 않는 번호입니다.");
     				document.getElementById("PchResult").style.color = '#ff0000';
     		}else{
     			$.ajax({
     				url:"<%=request.getContextPath()%>/ajax/checkPhone.do",
     				type:"post",
     				data:{userPhone : UserPhone},
     				success:function(data){
     					alert("인증번호가 전송되었습니다.");
     					UserPchNumStyle.disabled = false;
     				},
     				error:function(){
     					alert("인증번호 전송에 실패했습니다.");
     				}
     			});
     		}
     	}
     	
     	//핸드폰 필수 입력 체크
     	function PhoneCheck(){
     		let UserPhone = $("#userPhone").val();
     		if(UserPhone == ""){
     			$("#PchResult").html("필수 정보입니다.");
     			document.getElementById("PchResult").style.color = '#ff0000';
     			PchOk = 0;
     		}else{
     			$("#PchResult").html("");
     		}
     	}
     	
     	//인증번호 일치 확인
     	function Pch(){//ajax로 처리 보안 문제(완료)
     		let PchNum = $("#userPchNum").val();
     		let checkPhone =  document.getElementById("check-Phone");
     		let UserPchNumStyle = document.getElementById("userPchNum");
			$.ajax({
				url:"<%=request.getContextPath()%>/ajax/checkPchNum.do",
				type:"post",
				data:{PchNum : PchNum},
				success:function(data){
					if(data == 1){
		     			PchOk = 1;
		     			$("#check-Phone").html("인증번호가 일치합니다.");
		     			checkPhone.style.color = "#008000";
		     			UserPchNumStyle.style.borderColor = "#008000";
		     			UserPchNumStyle.disabled = true;
					}else{
		     			PchOk = 0;
		     			$("#check-Phone").html("인증번호가 일치하지 않습니다.");
		     			checkPhone.style.color = "#ff0000";
		     			UserPchNumStyle.style.borderColor = "#ff0000";
					}
				}
			});
     	}
     	
     	
     	//주소 입력 여부 체크
    	function addrCheck(){
     		let UserZipCode = $("#userZipCode").val();
     		let UserAddr = $("#userAddr").val();
     		if(UserZipCode == "" || UserAddr==""){
     			$("#checkAddrResult").html("필수 정보입니다.");
     			document.getElementById("checkAddrResult").style.color = '#ff0000';
     		}
     	}
     	
     	//주소 입력 여부 클리어
     	function clearCheck(){
     		$("#checkAddrResult").html("");
     	}

     	//회원가입 입력 및 인증 체크
     	function joinCheck(){     		     		     		
     		if(checkNickOk == 0){
     			checkNick();
     			$("#userNick").focus();
     			return false;     			
     		}    		
     		
     		if(checkNPwOk == 0){
     			checkNPw();
     			$("#userNPw").focus();
     			return false;
     		}
     		if(checkNPwcOk == 0){
     			checkNPwc();
     			$("#userNPwc").focus();
     			return false;
     		} 

     		if(PchOk == 0){
     			PhoneCheck();
 				$("#PchResult").html("핸드폰 인증을 진행해 주세요");
 				document.getElementById("PchResult").style.color = '#ff0000';
     			$("#userPhone").focus();
     			return false;        			
     		}
     		if($("#userPchNum").val() == "" && originalUserPhone != $("#userPhone").val()){
     			 $("#PchResult").html("인증번호를 입력해 주세요");
     			 document.getElementById("PchResult").style.color = '#ff0000';
      			 $("#UserPhone").focus();
     			 return false; 
     		}
     		if($("#userZipCode").val() == "" || $("#userAddr").val() == ""){
     			addrCheck();
     			$("#userZipCode").focus();
     			return false;
     		}
     		
			if( confirm("수정하시겠습니까?") != 1 )
			{
				return false;
			}
     		
     		return true;
     	}
    </script>
</body>
</html>
