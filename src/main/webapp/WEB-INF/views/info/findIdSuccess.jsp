<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../inc/header.jsp" %>

 	<div class="page-info">
 		<h3 class="title">아이디 찾기 결과</h3>
 		
 		<div class="info-txt">
	 		<p>${findId.name}님의 아이디는 <strong>${findId.id}</strong> 입니다.</p>
	 		<p>로그인을 하시면 더 많은 컨텐츠를 즐기실 수 있습니다.</p>
 		</div>
 		
 		<div class="btn-wrap">
            <a href="<c:url value='loginForm.do'/>" class="btn login-btn">로그인하기</a>
            <a href="<c:url value='findPw.do?mode=pwChange'/>" class="btn">비밀번호 찾기</a>
        </div>
 	</div>
   
<%@ include file="../inc/footer.jsp" %>
