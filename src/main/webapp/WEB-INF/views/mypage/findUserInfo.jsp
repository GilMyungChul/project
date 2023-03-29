<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../inc/header.jsp" %>

 	<div class="wrap">
 		<%@ include file="../inc/aside.jsp" %>
 		<div class="contents" id="mypage">
	        <div class="mypage-cont">
	            <h3 class="title">회원정보 찾기</h3>
	            
	           	<div class="find-info">
	           		<div class="tabs tabs-column">
	           			<ul class="tab-menu col2">
	           				<li class="<c:out value='${mode != "pwChange" ? "active" : ""}'/>" data-tab="1"><a href="javascript:void(0)">아이디 찾기</a></li>
	           				<li class="<c:out value='${mode == "pwChange" ? "active" : ""}'/>" data-tab="2"><a href="javascript:void(0)">비밀번호 찾기</a></li>
	           			</ul>
	           			
	           			<div class="tab-cont">
	           				<div class="findInfo <c:out value='${mode != "pwChange" ? "active" : ""}'/>">
	           					<p>회원가입시 등록한 이름과, 휴대폰 번호를 입력해주세요.</p>
	           					<form action="findId.do" method="post">
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
					                
					                <div class="btn-wrap">
						                <button type="submit" class="btn">아이디 찾기</button>
						            </div>
					            </form>
	           				</div>
	           				
	           				<div class="findInfo <c:out value='${mode == "pwChange" ? "active" : ""}'/>">
	           					<p>회원가입시 등록한 아이디, E-mail을 통해 <br>비밀번호를 찾을 수 있습니다.</p>
	           					<form action="findPw.do" method="post">
		           					<div class="form-box">
					                    <div>
					                        <input type="text" id="id" name="id" />
					                        <label for="id">아이디</label>
					                    </div>
		               				</div>
		           				
		           					<div class="form-box">
					                    <div>
					                        <input type="text" id="email" name="email" />
					                        <label for="email">E-mail</label>
					                    </div>
					                    <div class="info-msg">
					                        <p>@0000.com 해당 형식으로 입력해주세요</p>
					                    </div>
					                </div>
					                
					                <div class="btn-wrap">
						                <button type="submit" class="btn">비밀번호 발송</button>
						            </div>
					            </form>
	           				</div>
	           			</div>
	           		</div>
	           	</div>
	           	
	        </div>
    	</div>
    </div>
    
<%@ include file="../inc/footer.jsp" %>
