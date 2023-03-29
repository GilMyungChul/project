<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../inc/header.jsp" %>

 	<div class="page-info">
 		<h3 class="title">비밀번호 찾기 결과</h3>
 		
 		<div class="info-txt">
	 		<p>회원님의 <strong>${email}</strong> 이메일로</p>
	 		<p>임시비밀번호를 발송하였습니다.</p>
	 		<p>확인 후 비밀번호를 변경하실 수 있습니다.</p>
 		</div>
 		
 		<div class="btn-wrap">
            <a href="<c:url value='loginForm.do'/>" class="btn login-btn">로그인하기</a>
        </div>
 	</div>
   
<%@ include file="../inc/footer.jsp" %>
