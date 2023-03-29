<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../inc/header.jsp" %>

 	<div class="wrap">
 		<%@ include file="../inc/aside.jsp" %>
 		<div class="contents" id="login">
	        <div class="login-form">
	            <h3 class="title">로그인</h3>
	            
	            <c:if test="${loginMsg == 0}">
	            <div class="info-msg msg-warning text-center">
	                <p>아이디와 비밀번호를 다시 확인해주세요.</p>
	            </div>
	            </c:if>
	            
		 		<form action="login.do" method="post" autocomplete="off">
		            <div class="form-box">
		                <div>
		                    <input type="text" id="id" name="id" />
		                    <label for="id">아이디</label>
		                </div>
		            </div>
		
		            <div class="form-box">
		                <div>
		                    <input type="password" id="pw" name="pw" />
		                    <label for="pw">비밀번호</label>
		                </div>
		            </div>
		
		            <div class="btn-wrap">
		                <button type="submit" class="btn login-btn">로그인</button>
		            </div>
	            </form>
	            
	            <div class="other-action">
	                <div class="find-user">
	                	<ul>
	                		<li><a href="<c:url value='findId.do?mode=idChange'/>">아이디 찾기</a></li>
	                		<li><a href="<c:url value='findPw.do?mode=pwChange'/>">비밀번호 찾기</a></li>
	                	</ul>
	                </div>
	                <div class="join">
	                    <a href="<c:url value='joinForm.do'/>">회원가입</a>
	                </div>
	            </div>
	        </div>
    	</div>
    </div>
    
    <script>
		$(".form-box").on("input", "input", function(){
		    var _val = $(this).val();
		    if (_val != 0) {
		        $(this).addClass('values');
		    } else {
		        $(this).removeClass('values');
		    }
		})
	</script>
