<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
		<div class="aside">
		
			<div class="header">
				<div class="logo">
	                <a href="<c:url value='/'/>"><img src="images/logo3.png" alt="" /></a>
	            </div>
            </div>
            
   			<div class="user-info <c:out value='${loginMsg != "0" ? "" : "displayNone"}'/>">
           		<c:if test="${sessionScope.loginDto != null}">
    	            <a class="user-img user-1"></a>
            		<p>
            			<span>${sessionScope.loginDto.name} 님</span>
            			<span>Lv. <strong>${sessionScope.loginDto.levels()}</strong></span>
            		</p>
            	</c:if>
            </div>

   			<ul class="aside-menu">
   				<li class="<c:out value='${menuMode == "market" ? "active" : ""}'/>"><a href="<c:url value='market.do'/>">맛.잘.맛집</a></li>
   				<li class="<c:out value='${menuMode == "recipe" ? "active" : ""}'/>"><a href="">맛.잘.레시피</a></li>
   				<li class="<c:out value='${menuMode == "brand" ? "active" : ""}'/>"><a href="">맛.잘.브랜드</a></li>
   				<li class="<c:out value='${menuMode == "qna" ? "active" : ""}'/>"><a href="">맛.잘.무물보</a></li>
   				<li class="<c:out value='${menuMode == "admin" ? "active" : ""}'/>"><a href="<c:url value='admin.do'/>">어드민</a></li>
   			</ul>
   			
   			<ul class="aside-user">
   				<c:if test="${sessionScope.loginDto == null}">
	   				<li class="<c:out value='${menuMode == "login" ? "active" : ""}'/>"><a href="<c:url value='loginForm.do'/>">로그인</a></li>
	   				<li class="<c:out value='${menuMode == "join" ? "active" : ""}'/>"><a href="<c:url value='joinForm.do'/>">회원가입</a></li>
   				</c:if>
   				<c:if test="${sessionScope.loginDto != null}">
	   				<li><a href="<c:url value='pwChangeForm.do'/>">비밀번호 변경</a></li>
	   				<li><a href="<c:url value=''/>">회원탈퇴</a></li>
	   				<li><a href="<c:url value='logout.do'/>">로그아웃</a></li>
   				</c:if>
   			</ul>
   			
   			<!-- <ul class="sns-menu">
				<li><a href="javascript:void(0)"><i class="fab fa-facebook-square"></i></a></li>
				<li><a href="javascript:void(0)"><i class="fab fa-instagram-square"></i></a></li>
				<li><a href="javascript:void(0)"><i class="fab fa-twitter-square"></i></a></li>
				<li><a href="javascript:void(0)"><i class="fab fa-youtube-square"></i></a></li>
			</ul> -->

	   		<div class="footer">
				<p>ⓒ GIL Corp.</p>
			</div>
   		</div>