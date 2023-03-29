<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../inc/header.jsp" %>

 	<div class="wrap">
 		<%@ include file="../inc/aside.jsp" %>
 		<div class="contents">
	       <div class="admin">
	       		<h3 class="title">어드민</h3>
	       		
	       		<ul class="admin-menu">
	       			<li><a href="<c:url value='adminMemberList.do'/>">
	       				<div class="icon">
	       					<i class="fas fa-users"></i>
	       				</div>
	       				<p class="tit">회원정보</p>
	       				<p class="count"><strong>${memCount}</strong> 명</p>
	       			</a></li>
	       			<li><a href="<c:url value='adminMarketList.do'/>">
	       				<div class="icon"><i class="fas fa-map-marked"></i></div>
	       				<p class="tit">맛집정보</p>
	       				<p class="count"><strong>${marCount}</strong> 개</p>
	       			</a></li>
	       			<li class="not-open"><a href="javascript:void(0)">
	       				<div class="icon"><i class="fas fa-utensils"></i></div>
	       				<p class="tit">레시피정보</p>
	       				<p class="count"><strong>0</strong> 개</p>
	       			</a></li>
	       			<li class="not-open"><a href="javascript:void(0)">
	       				<div class="icon"><i class="fas fa-store"></i></div>
	       				<p class="tit">브랜드정보</p>
	       				<p class="count"><strong>0</strong> 개</p>
	       			</a></li>
	       		</ul>
	       </div>
	    </div>
    </div>
    
<%@ include file="../inc/footer.jsp" %>
