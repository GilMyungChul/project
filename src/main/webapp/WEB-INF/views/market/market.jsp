<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../inc/header.jsp" %>

 	<div class="wrap">
 		<%@ include file="../inc/aside.jsp" %>
 		<div class="contents">
			
			<div class="content">
	            <h3 class="title">맛.잘.맛집</h3>

				<div class="top-box">
		            <div class="search-box">
		            	<select class="select-form" name="searchSelect" id="searchSelect">
		                    <option value="" selected>검색어</option>
		                    <option value="">아이디</option>
		                    <option value="">맛집</option>
		                    <option value="">키워드</option>
		                    <option value="">위치</option>
		                </select>
		            	<div class="form-box">
		                    <div>
		                        <input type="text" id="search" name="search" autocomplete="off"/>
		                        <label for="search">맛집 검색</label>
			                    <button type="button" class="search-btn"><i class="fas fa-search"></i></button>
		                    </div>
		                </div>
		            </div>
		            
		            <a href="<c:url value='marketAddForm.do'/>" class="btn add-btn">맛집 등록하기</a>
		        </div>
		        
		        <div>
		        	<ul class="market-list">
		        		<c:forEach var="list" items="${comDto.marList}">
			        		<li><a href="<c:url value='marketDetail.do?market_no=${list.market_no}'/>">
			        			<div class="market-img">
			        				<c:forEach var="item" items="${list.fileDto}">
			        					<img src="images/market/${item.fileName}" alt="" />
			        				</c:forEach>
			        			</div>
			        			<div class="market-info">
			        				<div class="market-star">
			        					<c:if test="${list.rating == 5}">
				        					<c:forEach var="i" begin="1" end="${list.rating}">
				        						<i class="fas fa-star"></i>
				        					</c:forEach>
			        					</c:if>
			        					<c:if test="${list.rating != 5}">
			        						<c:forEach var="i" begin="1" end="${list.rating}">
				        						<i class="fas fa-star"></i>
				        					</c:forEach>
				        					
				        					<c:forEach var="i" begin="1" end="${5 - list.rating}">
				        						<i class="far fa-star"></i>
				        					</c:forEach>
			        					</c:if>
			        				</div>
			        				<p class="store">${list.store}</p>
			        				<p class="location">${list.location}</p>
			        				<p class="keyword">${list.keyword}</p>
			        				<p class="counting"><span>조회수 ${list.hit}</span><span>좋아요 ${list.good}</span><span>댓글수 ${list.replyCount}</span></p>
			        			</div>
			        		</a></li>
		        		</c:forEach>
		        	</ul>
		        </div>
			</div>
			
	    </div>
    </div>
   
<%@ include file="../inc/footer.jsp" %>
