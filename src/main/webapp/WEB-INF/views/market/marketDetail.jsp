<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../inc/header.jsp" %>

 	<div class="wrap">
 		<%@ include file="../inc/aside.jsp" %>
 		<div class="contents">
			
			<div class="content">
	            <h3 class="title">맛.잘.맛집 상세정보</h3>
			
				<div class="btn-wrap top-btn">
	                <a href="javascript:void(0)" onclick="goodAdd(${dto.market_no})" class="btn good-btn"><i class="fas fa-heart"></i> 좋아요</a>
	                <c:if test="${sessionScope.loginDto.id == dto.id}">
		                <a href="<c:url value='marketModify.do?market_no=${dto.market_no}'/>" class="btn modify-btn">수정</a>
		                <a href="<c:url value='marketDelete.do?market_no=${dto.market_no}'/>" class="btn delete-btn">삭제</a>
                    </c:if>
	                <a href="<c:url value='market.do'/>" class="btn list-btn">리스트</a>
	            </div>
	            
	            <div class="detail-wrap">
		           	<table class="marketDetail-table">
		           		<colgroup>
		           			<col style="width:150px;">
		           			<col style="width:calc(50% - 150px);">
		           			<col style="width:150px;">
		           			<col style="width:calc(50% - 150px);">
		           		</colgroup>
		           		<tbody>
		           			<tr>
		           				<th>No</th>
		           				<td colspan="3">${dto.market_no}</td>
		           			</tr>
		           			<tr>
		           				<th>맛집 브랜드</th>
		           				<td colspan="3">${dto.store}</td>
		           			</tr>
		           			<tr>
		           				<th>맛집 키워드</th>
		           				<td colspan="3">${dto.keyword}</td>
		           			</tr>
		           			<tr>
		           				<th>맛집 위치</th>
		           				<td colspan="3">${dto.location}</td>
		           			</tr>
		           			<tr>
		           				<th>이미지</th>
		           				<td colspan="3">
		           					<div class="img-box">
		           						<c:forEach var="item" items="${dto.fileDto}">
				        					<img src="images/market/${item.fileName}" alt="" />
				        				</c:forEach>
		           					</div>
		           				</td>
		           			</tr>
		           			<tr>
		           				<th>맛집 설명</th>
		           				<td colspan="3">${dto.cont}</td>
		           			</tr>
		           			<tr>
		           				<th>조회수</th>
		           				<td>${dto.hit}</td>
		           				<th>좋아요</th>
		           				<td class="good">${dto.good}</td>
		           			</tr>
		           			<tr>
		           				<th>등록시간</th>
		           				<td colspan="3">${dto.getSimpleDate(dto.reg_date)}</td>
		           			</tr>
		           		</tbody>
		           	</table>
		           	<div class="reply-wrap">
		           		<div class="form-box">
		                    <div>
		                    	<textarea id="cont" name="cont" maxlength="250" <c:out value="${sessionScope.loginDto == null ? 'disabled' : ''}"/>><c:out value="${sessionScope.loginDto == null ? '로그인 후 사용해주세요' : ''}"/></textarea>
		                    	<c:if test="${sessionScope.loginDto != null}">
		                        <label for="cont">댓글쓰기 <p><span class="length">0</span> / 250</p></label>
		                        </c:if>
		                    </div>
		                    <button type="button" class="btn reply-add-btn" <c:out value="${sessionScope.loginDto == null ? 'disabled' : ''}"/>>댓글등록</button>
		                    <button type="button" class="btn modify-update displayNone" <c:out value="${sessionScope.loginDto == null ? 'disabled' : ''}"/>>댓글수정</button>
		                </div>
		                <ul class="reply-list"></ul>
		           	</div>
	           	</div>
           	</div>
	    </div>
    </div>
    
    <script>
    	function goodAdd(no) {
    		$.ajax({
    			url: "<c:url value='marketGood.do?market_no=" + no + "'/>",
    			type: "get",
    			dataType:"json",
    			success: function(result) {
    				$(".good").html(result);
    			},
    			error: function() {}
    		})
    	}
		
    	$(function(){
    		var _parent = $(".reply-list");
    		var _list;
    		
	    	var market_no = "<c:out value='${dto.market_no}'/>";
	    	var loginId = "<c:out value='${sessionScope.loginDto.id}'/>";
	    	
	    	var reply_no;
    		
	    	replyView();
    		function replyView() {
    			_parent.html("");
        		replyFun.replyList({marketId : market_no}, function(date){
        			
        			if (date.length == 0 || date == null) {
        				_list = "<li class='none-reply'>"
        					+ "<div class='cont'>작성된 댓글이 없습니다.</div>"
                			+ "</li>";
                			
       					_parent.html(_list);
       					return;
        			} 
        			
        			for (var i = 0; i < date.length; i++) {
        				var addClass = loginId == date[i].userId ? "" : "displayNone";
        				
						html = "<li><div class='top'><p class='user'>" + date[i].userId + "<input type='hidden' value='" + date[i].reply_no + "'></p><p class='date'>" + date[i].strDate + "</p></div>"
	            			+ "<div class='cont'>" + date[i].cont + "</div>"
	            			+ "<div class='btn-wrap " + addClass + "'><a class='btn modify-cancel-btn displayNone'>수정취소</a><a class='btn reply-modify-btn'>수정</a><a class='btn reply-delete-btn'>삭제</a></div>"
	            			+ "</li>"
	            			
	        			_parent.append(html);	
					}
        			
        		});
        	}
    		
    		$(document).on("click", ".reply-add-btn", function(){
    			var userId = "<c:out value='${sessionScope.loginDto.id}'/>"
    			var cont = $("#cont").val();
    			
    			var reply = {
    				marketId: market_no,
    				userId: userId,
    				cont: cont,
    			};
    			
    			replyFun.replyAdd(reply, function(date){
   					$("#cont").val("").removeClass("values");
   					$("label .length").html("0");

   					if (date == "success") {
    					replyView();
    				}
    			});
    		});
    		
    		$(document).on("click", ".reply-delete-btn", function(){
    			reply_no = $(this).closest("li").find("input").val();
    			
    			replyFun.replyDel({reply_no: reply_no}, function(date){
    				if (date == "success") {
    					replyView();
    				}
    			})
    		})
    		
    		$(document).on("click", ".reply-modify-btn", function(){
    			reply_no = $(this).closest("li").find("input").val();
    			var cont = $(this).closest("li").find(".cont").text();
    			var _length = cont.length;
    			
    			$("#cont").val(cont).addClass("values");
    			$(".reply-add-btn").addClass("displayNone");
    			$(this).addClass("displayNone");
    			$(".modify-update").removeClass("displayNone");
    			$(this).siblings(".modify-cancel-btn").removeClass("displayNone");
    			$(".length").text(_length);
    		})
    		
    		$(document).on("click", ".modify-update", function(){
    			var cont = $("#cont").val();
    			
    			var reply = {
    				reply_no : reply_no,
    				cont : cont
    			};
    			
    			replyFun.replyModi(reply, function(date){
    				$(".reply-add-btn").removeClass("displayNone");
    				$(".reply-modify-btn").removeClass("displayNone");
        			$(".modify-update").addClass("displayNone");
        			$(".modify-cancel-btn").addClass("displayNone");
        			
    				if (date == "success") {
    					$("#cont").val("").removeClass("values");
       					$("label .length").html("0");
       					
    					replyView();
    				}
    			});
    		});
    		
    		$(document).on("click", ".modify-cancel-btn", function(){
    			$(".reply-add-btn").removeClass("displayNone");
				$(this).siblings(".reply-modify-btn").removeClass("displayNone");
    			$(".modify-update").addClass("displayNone");
    			$(this).addClass("displayNone");
    			$("#cont").val("").removeClass("values");
				$("label .length").html("0");
    		})
    		
    	})
    </script>
   	<script src="js/reply.js"></script>
<%@ include file="../inc/footer.jsp" %>
