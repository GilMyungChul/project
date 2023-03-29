<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../inc/header.jsp" %>

 	<div class="wrap">
 		<%@ include file="../inc/aside.jsp" %>
 		<div class="contents">
	       <div class="admin-main">
	       		<div class="member-modify">
	       			<h3 class="title">회원정보 수정</h3>
		       		<form action="adminMemberModify.do" method="post" id="modify" autocomplete="off">
		                <div class="form-box">
		                    <div>
		                        <input type="text" class="values" id="id" name="id" value="<c:out value='${modifyDto.id}'/>" readonly />
		                        <label for="id">아이디</label>
		                    </div>
		                </div>
		    
		                <%-- <div class="form-box">
		                    <div>
		                        <input type="password" class="values" id="pw" name="pw" value="<c:out value='${modifyDto.pw}'/>" readonly />
		                        <label for="pw">비밀번호</label>
		                    </div>
		                </div> --%>
		    
		                <div class="form-box">
		                    <div>
		                        <input type="text" class="values" id="name" name="name" value="<c:out value='${modifyDto.name}'/>" />
		                        <label for="name">이름</label>
		                    </div>
		                </div>
		    
		                <div class="form-box">
		                    <div>
		                        <input type="text" class="values" id="ph" name="ph" value="<c:out value='${modifyDto.ph}'/>" />
		                        <label for="ph">휴대전화</label>
		                    </div>
		                </div>
		    
		                <div class="form-box">
		                	<div>
			                	<input type="text" class="values" id="email" name="email" value="<c:out value='${modifyDto.email}'/>" />
			                    <label for="email">E-mail</label>
		                	</div>
		                </div>
		                
		                <div class="form-box radio">
		                	<strong>회원등급</strong>
		                	<div>
			                	<div class="radio-box">
				                	<input type="radio" id="B" value="B" name="lv" class="<c:out value='${modifyDto.lv == "B" ? "values" : ""}'/>" <c:out value='${modifyDto.lv == "B" ? "checked" : ""}'/> />
				                    <label for="B">브론즈</label>
			                	</div>
			                	<div class="radio-box">
				                	<input type="radio" id="S" value="S" name="lv" class="<c:out value='${modifyDto.lv == "S" ? "values" : ""}'/>" <c:out value='${modifyDto.lv == "S" ? "checked" : ""}'/> />
				                    <label for="S">실버</label>
			                	</div>
			                	<div class="radio-box">
				                	<input type="radio" id="G" value="G" name="lv" class="<c:out value='${modifyDto.lv == "G" ? "values" : ""}'/>" <c:out value='${modifyDto.lv == "G" ? "checked" : ""}'/> />
				                    <label for="G">골드</label>
			                	</div>
			                	<div class="radio-box">
				                	<input type="radio" id="P" value="P" name="lv" class="<c:out value='${modifyDto.lv == "P" ? "values" : ""}'/>" <c:out value='${modifyDto.lv == "P" ? "checked" : ""}'/> />
				                    <label for="P">플레티넘</label>
			                	</div>
		                	</div>
		                </div>
		    
		                <div class="btn-wrap">
		                    <button type="submit" class="btn btn-join">수정하기</button>
		                </div>
		            </form>
	            </div>
	       </div>
	    </div>
    </div>
    
<%@ include file="../inc/footer.jsp" %>
