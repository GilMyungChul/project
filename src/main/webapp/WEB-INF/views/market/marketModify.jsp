<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../inc/header.jsp" %>

 	<div class="wrap">
 		<%@ include file="../inc/aside.jsp" %>
 		<div class="contents">
            <h3 class="title">맛.잘.맛집 게시글 수정하기</h3>
	
           	<form action="marketModify.do" method="post" id="marketModify" autocomplete="off" enctype="multipart/form-data">
           		<input type="hidden" id="id" name="id" value="${sessionScope.loginDto.id}" />
           		<input type="hidden" id="market_no" name="market_no" value="<c:out value='${dto.market_no}'/>" />
           	
                <div class="form-box">
                    <div>
                        <input type="text" id="store" name="store" class="values" value="<c:out value='${dto.store}'/>" />
                        <label for="store">맛집이름</label>
                    </div>
                </div>
    
                <div class="form-box">
                    <div>
                        <input type="text" id="keyword" name="keyword" class="values" value="<c:out value='${dto.keyword}'/>" />
                        <label for="keyword">키워드</label>
                    </div>
                    <div class="info-msg">
                        <p>#OOO #OOO 해당 형식으로 입력주세요</p>
                    </div>
                </div>

                <div class="form-box">
                    <div>
                        <input type="text" id="location" name="location" class="values" value="<c:out value='${dto.location}'/>" />
                        <label for="location">위치</label>
                    </div>
                    <div class="info-msg">
                        <p>시/도 OOO구까지 입력해주세요</p>
                    </div>
                </div>
    
                <div class="form-box">
                    <div>
                    	<textarea id="cont" name="cont" class="values"><c:out value='${dto.cont}'/></textarea>
                        <label for="cont">설명 <p><span class="length">0</span> / 1000</p></label>
                    </div>
                </div>
                
                <%-- <div class="form-box img-box">
                	<strong>이미지 등록</strong>
                	<div>
                		<c:forEach var='i' begin="1" end="${dto.fileDto.size()}">
	                		<div class="upload-box">
	                			<label for="img${i}">
	                				<i class="far fa-plus"></i>
			                		<input type="file" id="img${i}" name="img" multiple="multiple" />
	                			</label>
	                			<p class="file-name"></p>
		                	</div>
	                	</c:forEach>
	                	<c:forEach var='i' begin="${dto.fileDto.size()+1}" end="4">
	                		<div class="upload-box">
	                			<label for="img${i}">
	                				<i class="far fa-plus"></i>
			                		<input type="file" id="img${i}" name="img" multiple="multiple" />
	                			</label>
	                			<p class="file-name"></p>
		                	</div>
	                	</c:forEach>
                	</div>
                </div> --%>
    
                <div class="form-box radio">
                	<strong>맛집 별점</strong>
                	<div>
	                	<div class="radio-box">
		                	<input type="radio" id="1" value="1" name="rating" <c:out value="${dto.rating == 1 ? 'checked' : ''}"/> />
		                    <label for="1">1점</label>
	                	</div>
	                	<div class="radio-box">
		                	<input type="radio" id="2" value="2" name="rating" <c:out value="${dto.rating == 2 ? 'checked' : ''}"/> />
		                    <label for="2">2점</label>
	                	</div>
	                	<div class="radio-box">
		                	<input type="radio" id="3" value="3" name="rating" <c:out value="${dto.rating == 3 ? 'checked' : ''}"/> />
		                    <label for="3">3점</label>
	                	</div>
	                	<div class="radio-box">
		                	<input type="radio" id="4" value="4" name="rating" <c:out value="${dto.rating == 4 ? 'checked' : ''}"/> />
		                    <label for="4">4점</label>
	                	</div>
	                	<div class="radio-box">
		                	<input type="radio" id="5" value="5" name="rating" <c:out value="${dto.rating == 5 ? 'checked' : ''}"/> />
		                    <label for="5">5점</label>
	                	</div>
                	</div>
                </div>
    
                <div class="btn-wrap">
                    <button type="submit" class="btn">수정하기</button>
                </div>
            </form>
	    </div>
    </div>
   
<%@ include file="../inc/footer.jsp" %>
