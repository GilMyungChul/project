<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../inc/header.jsp" %>

 	<div class="wrap">
 		<%@ include file="../inc/aside.jsp" %>
 		<div class="contents">
 			<h3 class="title">맛집관리</h3>
 			<div class="content">
	 			<form action="adminMarketList.do" method="post">
		 			<div class="search-box">
		            	<select class="select-form" name="searchSelect" id="searchSelect">
		                    <option value="null" selected>검색어</option>
		                   	<option value="id">작성자</option>
		                    <option value="store">맛집</option>
		                    <option value="keyword">키워드</option>
		                    <option value="location">위치</option>
		                    <option value="cont">내용</option>
		                </select>
		            	<div class="form-box">
		                    <div>
		                        <input type="text" id="search" name="search" autocomplete="off"/>
		                        <label for="search">맛집 검색</label>
			                    <button type="submit" class="btn search-btn"><i class="fas fa-search"></i></button>
		                    </div>
		                </div>
		            </div>
	            </form>
		       	<div class="admin-main" style="margin-top:50px;">
		       		<p class="page-num">${comDto.viewPage} /<strong> ${comDto.totalPage}</strong></p>
		       		<div class="member-list">
		       			<table>
		       				<colgroup>
		       					<col>
		       					<col style="width:80px">
		       					<col>
		       					<col>
		       					<col>
		       					<col style="width:80px">
		       					<col style="width:80px">
		       					<col style="width:80px">
		       				</colgroup>
		       				<thead>
		       					<tr>
		       						<th>아이디</th>
		       						<th>번호</th>
		       						<th>맛집</th>
		       						<th>키워드</th>
		       						<th>위치</th>
		       						<th>조회수</th>
		       						<th>좋아요</th>
		       						<th>삭제여부</th>
		       					</tr>
		       				</thead>
		       				<tbody>
		       					<c:if test="${comDto.marList.size() == 0}">
		       					<tr>
		       						<td class="none-list" colspan="8"><p>맛집정보가 없습니다.</p></td>
		       					</tr>
		       					</c:if>
		       					
		       					<c:if test="${comDto.marList.size() != 0}">
		       					<c:forEach var="list" items="${comDto.marList}">
			       					<tr>
			       						<td><c:out value="${list.id}"/></td>
			       						<td><a href="javascript:void(0);" data-target="marketDetailPopup" class="pop-open"><c:out value="${list.market_no}"/></a></td>
			       						<td><c:out value="${list.store}"/></td>
			       						<td><c:out value="${list.keyword}"/></td>
			       						<td><c:out value="${list.location}"/></td>
			       						<td><c:out value="${list.hit}"/></td>
			       						<td><c:out value="${list.good}"/></td>
			       						<td><c:out value="${list.deleteYN}"/></td>
			       					</tr>
		       					</c:forEach>
		       					</c:if>
		       				</tbody>
		       			</table>
		       		</div><!-- member-list -->
		       	</div>
	      		<div class="pagination">
	      			<ul>
	      				<li class="page-item <c:out value='${comDto.blockStart <= comDto.blockSize ? "disabled" : "" }'/>">
					  		<a class="page-link" href="<c:url value='adminMarketList.do?viewPage=${comDto.prevPage}&searchSelect=${comDto.searchSelect}&search=${comDto.search}'/>"><i class="fas fa-chevron-left"></i></a>
					  	</li>
					  	<c:forEach var="i" begin="${comDto.blockStart}" end="${comDto.blockEnd}">
					  	<li class="page-item <c:out value='${comDto.viewPage == i ? "active" : "" }'/>">
					  		<a class="page-link" href="<c:url value='adminMarketList.do?viewPage=${i}&searchSelect=${comDto.searchSelect}&search=${comDto.search}'/>">${i}</a>
					  	</li>
					  	</c:forEach>
					  	<li class="page-item <c:out value='${comDto.blockEnd >= comDto.totalPage? "disabled" : "" }'/>">
					  		<a class="page-link" href="<c:url value='adminMarketList.do?viewPage=${comDto.nextPage}&searchSelect=${comDto.searchSelect}&search=${comDto.search}'/>"><i class="fas fa-chevron-right"></i></a>
					  	</li>
	      			</ul>
	      		</div>
      		</div>
	    </div>
    </div>
    
    <div class="dimed"></div>
    <div class="popup-layer" id="marketDetailPopup">
    	<div class="layer-wrap">
	    	<div class="layer-head">
	    		<h3>맛집상세정보</h3>
	    		<a class="pop-closed"><i class="fas fa-times"></i></a>
	    	</div>
	    	<div class="layer-body">
	    		<ul class="detailInfo">
	    			<li>
	    				<span>No</span>
	    				<span id="market_no"></span>
					</li>
	    			<li>
	    				<span>아이디</span>
	    				<span id="id"></span>
					</li>
	    			<li>
	    				<span>맛집</span>
	    				<span id="store"></span>
					</li>
	    			<li>
	    				<span>키워드</span>
	    				<span id="keyword"></span>
	    			</li>
	    			<li>
	    				<span>위치</span>
	    				<span id="location"></span>
	    			</li>
	    			<li>
	    				<span>내용</span>
	    				<span id="cont"></span>
	    			</li>
	    			<li>
	    				<span>조회수</span>
	    				<span id="hit"></span>
	    			</li>
	    			<li>
	    				<span>좋아요</span>
	    				<span id="good"></span>
	    			</li>
	    			<li>
	    				<span>삭제 여부</span>
	    				<span id="deleteYN"></span>
	    			</li>
	    			<li>
	    				<span>등록일자</span>
	    				<span id="reg_Date"></span>
	    			</li>
	    			<li>
	    				<span>등록한 이미지</span>
	    				<span id="file_img"></span>
	    			</li>
	    		</ul>
	    		
	    		<div class="btn-wrap">
	            	<a href="javascript:void(0)" class="btn delete-btn">삭제하기</a>
		            <a href="javascript:void(0)" class="btn pop-closed">닫기</a>
		        </div>
	    	</div>
    	</div>
    </div>
	   
   
    <script>
    	var _dim = $(".dimed");
    	var _popup;
    
    	$(document).on("click", ".pop-open", function(){
    		var _target = $(this).data("target");
    		_popup = $("#" + _target);
    		
    		_dim.show();
    		_popup.show();
			
    		var market_no = $(this).text();
    		
			$.ajax({
    			url: "<c:url value='adminMarketDetail.do'/>",
    			type: "get", 
    			data: {"market_no": market_no},
    			success: function(result){
    				console.log(result.fileDto);
    				if (result != null) {
    					$("#market_no", _popup).html(result.market_no);
    					$("#id", _popup).html(result.id);
    					$("#store", _popup).html(result.store);
    					$("#keyword", _popup).html(result.keyword);
    					$("#location", _popup).html(result.location);
    					$("#cont", _popup).html(result.cont);
    					$("#hit", _popup).html(result.hit);
    					$("#good", _popup).html(result.good);
    					$("#deleteYN", _popup).html(result.deleteYN);
    					$("#reg_Date", _popup).html(result.strDate);
    					
    					for (var i = 0; i < result.fileDto.length; i++) {
    						var img = "<img src='images/market/" + result.fileDto[i].fileName + "' alt='' />";
    						$("#file_img", _popup).append(img);
    					}
    					
    					var delStr;
    					if (result.deleteYN == "No") {
    						delStr = "게시글 삭제";
    					} else {
    						delStr = "게시글 복구";
    					}
   						$(".delete-btn", _popup).html(delStr)
    				} else {
    					alert("맛집 상세정보 요청 실패!");
    				}
    				
    			},
    			error: function(){}
    		});
    	})
    	
    	$(document).on("click", ".pop-closed", function(){
    		var _target = $(this).closest(".popup-layer").attr("id");
    		_popup = $("#" + _target);
    		_dim.hide();
    		_popup.hide();
    	})
    	
    	$(document).on("click", ".delete-btn", function(){
    		var _id = $("#id").text();
    		var _delete_yn = $("#deleteYN").text();
    		var _market_no = $("#market_no").text();
    		
    		if (_delete_yn == "Yes") {
	    		location.href="<c:url value='adminMarketReset.do?market_no=" + _market_no + "'/>";
    		} else if (_delete_yn == "No"){
	    		location.href="<c:url value='marketDelete.do?market_no=" + _market_no + "'/>";
    		}
    	})
    	
    	$(document).on("click", ".page-item.disabled a", function(e){
    		e.preventDefault();
    	})
   	</script>
<%@ include file="../inc/footer.jsp" %>
