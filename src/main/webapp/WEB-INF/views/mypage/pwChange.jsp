<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../inc/header.jsp" %>

 	<div class="wrap">
 		<%@ include file="../inc/aside.jsp" %>
 		<div class="contents" id="mypage">
	        <div class="mypage-cont">
	            <h3 class="title">비밀번호 변경</h3>
	            
	           	<div>
	           		<form action="pwChange.do" method="post">
	           			<input type="hidden" id="id" name="id" value="<c:out value='${loginDto.id}'/>">
		           		<div class="form-box">
		                    <div>
		                        <input type="password" id="pw" name="pw" />
		                        <label for="pw">비밀번호</label>
		                    </div>
		                    <div class="info-msg msg-pw-confrim">
		                        <p>영문, 숫자, 특수문자 사용하여 8자이상 입력해주세요</p>
		                    </div>
		                </div>
		
		                <div class="form-box">
		                    <div>
		                        <input type="password" id="pwChk" name="pwChk" />
		                        <label for="pwChk">비밀번호 재확인</label>
		                    </div>
		                    <div class="info-msg msg-warning msg-pwChk-confrim displayNone"><p></p></div>
		                    <div class="info-msg msg-pwChk-confrim">
		                        <p>비밀번호와 동일하게 입력해주세요</p>
		                    </div>
		                </div>
		                
		                <div class="btn-wrap">
			                <button type="submit" class="btn">비밀번호 변경</button>
			            </div>
	                </form>
	           	</div>
	           	
	        </div>
    	</div>
    </div>
    
    <script>
	    $(document).on("input", "#pwChk", function(){
			var _pw = $("#pw").val();
			var _pwChk = $("#pwChk").val();
			
			console.log(_pw, _pwChk)
			
			if (_pw.trim().length > 0) {
				if (_pw.trim() == _pwChk.trim()) {
	    			$(".msg-pwChk-confrim").addClass("displayNone");
	    			$(".msg-warning.msg-pwChk-confrim").removeClass("displayNone").find("p").text("비밀번호가 동일합니다.");
	    		} else {
	    			$(".msg-pwChk-confrim").addClass("displayNone");
	    			$(".msg-warning.msg-pwChk-confrim").removeClass("displayNone").find("p").text("비밀번호가 동일하지 않습니다.");
	    		}
			} else {
				$(".msg-pwChk-confrim").removeClass("displayNone");
				$(".msg-warning.msg-pwChk-confrim").addClass("displayNone");
			}
		})
    </script>
    
<%@ include file="../inc/footer.jsp" %>
