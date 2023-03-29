<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="inc/header.jsp" %>

 	<div class="wrap">
 		<%@ include file="inc/aside.jsp" %>
 		<div class="contents">
            <h3 class="title">메인</h3>

            <div class="search-box">
            	<select class="select-form" name="searchSelect" id="searchSelect">
                    <option value="" selected>아이디</option>
                    <option value="">맛집이름</option>
                    <option value="">키워드</option>
                    <option value="">위치</option>
                </select>
            	<div class="form-box">
                    <div>
                        <input type="text" id="search" name="search" />
                        <label for="search">검색</label>
	                    <button type="button" class="search-btn"><i class="fas fa-search"></i></button>
                    </div>
                </div>
            </div>
	    </div>
    </div>
   
<%@ include file="inc/footer.jsp" %>
