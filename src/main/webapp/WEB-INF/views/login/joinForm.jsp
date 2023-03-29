<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../inc/header.jsp" %>

 	<div class="wrap">
 		<%@ include file="../inc/aside.jsp" %>
 		<div class="contents">
	        <div class="join-form">
	            <h3 class="title">회원가입</h3>
	
	            <form action="join.do" method="post" id="joinForm" autocomplete="off">
	                <div class="form-box">
	                    <div>
	                        <input type="text" id="id" name="id" />
	                        <label for="id">아이디</label>
	                        <button type="button" class="btn btn-idChk">중복확인</button>
	                    </div>
	                    <div class="info-msg msg-warning msg-id-confrim displayNone"><p></p></div>
	                    <div class="info-msg msg-id-confrim">
	                        <p>아이디는 5글자 이상으로 입력해주세요</p>
	                    </div>
	                </div>
	    
	                <div class="form-box">
	                    <div>
	                        <input type="password" id="pw" name="pw" />
	                        <label for="pw">비밀번호</label>
	                    </div>
	                    <div class="info-msg msg-warning msg-pw-confrim displayNone"><p></p></div>
	                    <div class="info-msg msg-pw-confrim">
	                        <p>영문, 숫자, 특수문자 사용하여 8자이상 입력해주세요</p>
	                    </div>
	                </div>
	
	                <div class="form-box">
	                    <div>
	                        <input type="password" id="pwChk" name="pwChk" disabled />
	                        <label for="pwChk">비밀번호 재확인</label>
	                    </div>
	                    <div class="info-msg msg-warning msg-pwChk-confrim displayNone"><p></p></div>
	                    <div class="info-msg msg-pwChk-confrim">
	                        <p>비밀번호와 동일하게 입력해주세요</p>
	                    </div>
	                </div>
	    
	                <div class="form-box">
	                    <div>
	                        <input type="text" id="name" name="name" />
	                        <label for="name">이름</label>
	                    </div>
	                </div>
	    
	                <div class="form-box">
	                    <div>
	                        <input type="text" id="ph" name="ph" />
	                        <label for="ph">휴대폰 번호</label>
	                    </div>
	                    <div class="info-msg">
	                        <p>[-]를 제외하고 숫자만 입력해주세요</p>
	                    </div>
	                </div>
	    
	                <div class="form-box">
	                    <div>
	                        <input type="text" id="email" name="email" />
	                        <label for="email">E-mail</label>
	                        <i class="fas fa-at"></i>
	                        <select class="select-form" name="emailSelect" id="emailSelect">
	                            <option value="naver.com" selected>naver.com</option>
	                            <option value="daum.net">daum.net</option>
	                            <option value="gmail.com">gmail.com</option>
	                            <option value="nate.com">nate.com</option>
	                        </select>
	                    </div>
	                </div>
	    
	                <div class="btn-wrap">
	                    <button type="button" class="btn btn-join">회원가입</button>
	                </div>
	            </form>
	        </div>
	    </div>
    </div>
    
    <script>
    	var idConfirm = false;
    	var pwConfirm = false;
    	
    	$(document).on("input", ".form-box input", function(){
    		var _var = $(this).val().trim();
    		$(this).val(_var);
    	})
    	
    	$(document).on("input", "#pw", function(){
    		var _pw = $("#pw").val();
    		
    		if (_pw.trim().length < 8) {
    			$("#pwChk").prop("disabled", true);
    			$(".msg-pw-confrim").addClass("displayNone");
    			$(".msg-warning.msg-pw-confrim").removeClass("displayNone").find("p").text("8자리이상 입력해주세요.");
    		} else if (_pw.trim().length >= 8){
    			$("#pwChk").prop("disabled", false);
    			$(".msg-pw-confrim").addClass("displayNone");
    			$(".msg-warning.msg-pw-confrim").removeClass("displayNone").find("p").text("사용가능한 비밀번호입니다.");
    		} 
    			
    		if (_pw.trim().length <= 0) {
    			$(".msg-pw-confrim").removeClass("displayNone");
    			$(".msg-warning.msg-pw-confrim").addClass("displayNone");
    		}
    		
    	})
    	
    	$(document).on("input", "#pwChk", function(){
    		var _pw = $("#pw").val();
    		var _pwChk = $("#pwChk").val();
    		
   			if (_pw.trim() == _pwChk.trim()) {
   				pwConfirm = true;
       			$(".msg-pwChk-confrim").addClass("displayNone");
       			$(".msg-warning.msg-pwChk-confrim").removeClass("displayNone").find("p").text("비밀번호가 동일합니다.");
       		} else {
       			pwConfirm = false
       			$(".msg-pwChk-confrim").addClass("displayNone");
       			$(".msg-warning.msg-pwChk-confrim").removeClass("displayNone").find("p").text("비밀번호가 동일하지 않습니다.");
       		}
    		
    		if (_pwChk.trim().length <= 0) {
    			pwConfirm = false
    			$(".msg-pwChk-confrim").removeClass("displayNone");
    			$(".msg-warning.msg-pwChk-confrim").addClass("displayNone");
    		}
    	})
    	
    	$(document).on("click", ".btn-idChk", function(){
    		var _id = $("#id").val();
    		
    		if (_id.length >= 5) {
    			$.ajax({
        			url: "<c:url value='idCheck.do'/>",
        			type: "get",
        			data: {"id": _id},
        			success: function(result){
        				idConfirm = true;
        				$(".info-msg.msg-id-confrim").addClass("displayNone");
        				
        				if (result == "false") {
    	    				$(".msg-warning.msg-id-confrim").removeClass("displayNone").find("p").text("사용이 불가능한 아이디입니다.");
        				} else {
    	    				$(".msg-warning.msg-id-confrim").removeClass("displayNone").find("p").text("사용이 가능한 아이디입니다.");
        				}
        			},
        			error: function(){console.log("요청실패");}
        		});
    		} else {
    			$(".info-msg.msg-id-confrim").addClass("displayNone");
    			$(".msg-warning.msg-id-confrim").removeClass("displayNone").find("p").text("아이디를 5자이상 입력해주세요.");
    		}
    		
    	})
    	
    	$(document).on("click", ".btn-join", function(){
    		console.log(idConfirm, pwConfirm)
    		
    		if (!idConfirm || !pwConfirm) {
    			return false;
    		} else {
    			$("#joinForm").submit();
    		}
    	})
    </script>
<%@ include file="../inc/footer.jsp" %>
