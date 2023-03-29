<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../inc/header.jsp" %>

 	<div class="wrap">
 		<%@ include file="../inc/aside.jsp" %>
 		<div class="contents">
 			<h3 class="title">회원관리</h3>
 			<div class="content">
	 			<form action="adminMemberList.do" method="post">
		 			<div class="search-box">
		            	<select class="select-form" name="searchSelect" id="searchSelect">
		                    <option value="null" selected>검색어</option>
		                    <option value="id">아이디</option>
		                    <option value="name">이름</option>
		                    <option value="lv">등급</option>
		                    <option value="deleteYN">탈퇴여부</option>
		                   	<option value="staff">정직원</option>
		                </select>
		            	<div class="form-box">
		                    <div>
		                        <input type="text" id="search" name="search" autocomplete="off"/>
		                        <label for="search">회원 검색</label>
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
		       					<col>
		       					<col>
		       					<col>
		       					<col>
		       					<col style="width:80px">
		       					<col style="width:80px">
		       					<col style="width:80px">
		       				</colgroup>
		       				<thead>
		       					<tr>
		       						<th>번호</th>
		       						<th>아이디</th>
		       						<th>이름</th>
		       						<th>전화번호</th>
		       						<th>이메일</th>
		       						<th>등급</th>
		       						<th>탈퇴여부</th>
		       						<th>정직원</th>
		       					</tr>
		       				</thead>
		       				<tbody>
		       					<c:if test="${comDto.memList.size() == 0}">
		       					<tr>
		       						<td class="none-list" colspan="8"><p>회원정보가 없습니다.</p></td>
		       					</tr>
		       					</c:if>
		       					
		       					<c:if test="${comDto.memList.size() != 0}">
		       					<c:forEach var="list" items="${comDto.memList}">
			       					<tr>
			       						<td><c:out value="${list.member_no}"/></td>
			       						<td><a href="javascript:void(0);" data-target="memberDetailPopup" class="pop-open"><c:out value="${list.id}"/></a></td>
			       						<td><c:out value="${list.name}"/></td>
			       						<td><c:out value="${list.ph}"/></td>
			       						<td><c:out value="${list.email}"/></td>
			       						<td><c:out value="${list.levels()}"/></td>
			       						<td><c:out value="${list.deleteYN}"/></td>
			       						<td><c:out value="${list.staff}"/></td>
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
					  		<a class="page-link" href="<c:url value='adminMemberList.do?viewPage=${comDto.prevPage}&searchSelect=${comDto.searchSelect}&search=${comDto.search}'/>"><i class="fas fa-chevron-left"></i></a>
					  	</li>
					  	<c:forEach var="i" begin="${comDto.blockStart}" end="${comDto.blockEnd}">
					  	<li class="page-item <c:out value='${comDto.viewPage == i ? "active" : "" }'/>">
					  		<a class="page-link" href="<c:url value='adminMemberList.do?viewPage=${i}&searchSelect=${comDto.searchSelect}&search=${comDto.search}'/>">${i}</a>
					  	</li>
					  	</c:forEach>
					  	<li class="page-item <c:out value='${comDto.blockEnd >= comDto.totalPage? "disabled" : "" }'/>">
					  		<a class="page-link" href="<c:url value='adminMemberList.do?viewPage=${comDto.nextPage}&searchSelect=${comDto.searchSelect}&search=${comDto.search}'/>"><i class="fas fa-chevron-right"></i></a>
					  	</li>
	      			</ul>
	      		</div>
      		</div>
	    </div>
    </div>
    
    <div class="dimed"></div>
    <div class="popup-layer" id="memberDetailPopup">
    	<div class="layer-wrap">
	    	<div class="layer-head">
	    		<h3>회원상세정보</h3>
	    		<a class="pop-closed"><i class="fas fa-times"></i></a>
	    	</div>
	    	<div class="layer-body">
	    		<ul class="detailInfo">
	    			<li>
	    				<span>아이디</span>
	    				<span id="id"></span>
					</li>
	    			<li>
	    				<span>회원 이름</span>
	    				<span id="name"></span>
	    			</li>
	    			<li>
	    				<span>휴대폰 번호</span>
	    				<span id="ph"></span>
	    			</li>
	    			<li>
	    				<span>이메일</span>
	    				<span id="email"></span>
	    			</li>
	    			<li>
	    				<span>회원등급</span>
	    				<span id="lv"></span>
	    			</li>
	    			<li>
	    				<span>회원탈퇴 여부</span>
	    				<span id="deleteYN"></span>
	    			</li>
	    			<li>
	    				<span>정직원 여부</span>
	    				<span id="staff"></span>
	    			</li>
	    			<li>
	    				<span>가입일자</span>
	    				<span id="join_date"></span>
	    			</li>
	    		</ul>
	    		
	    		<div class="btn-wrap">
		            <a href="javascript:void(0)" class="btn update-btn">수정하기</a>
	            	<a href="javascript:void(0)" class="btn delete-btn">탈퇴하기</a>
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
			
    		var _id = $(this).text();
    		
			$.ajax({
    			url: "<c:url value='adminMemberDetail.do'/>",
    			type: "get", 
    			data: {"id": _id},
    			success: function(result){
    				if (result != null) {
    					$("#id", _popup).html(result.id);
    					$("#name", _popup).html(result.name);
    					$("#ph", _popup).html(result.ph);
    					$("#email", _popup).html(result.email);
    					$("#lv", _popup).html(result.lv);
    					$("#deleteYN", _popup).html(result.deleteYN);
    					$("#staff", _popup).html(result.staff);
    					$("#join_date", _popup).html(result.strDate);
    					
    					var delStr;
    					if (result.deleteYN == "No") {
    						delStr = "탈퇴하기";
    					} else {
    						delStr = "삭제하기";
    					}
   						$(".delete-btn", _popup).html(delStr)
    				} else {
    					alert("회원 상세정보 요청 실패!");
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
    		var _delete_yn = $("#delete_yn").text();
    		location.href="<c:url value='adminMemberDelete.do?id=" + _id + "&deleteYN=" + deleteYN + "'/>";
    	})
    	
    	$(document).on("click", ".update-btn", function(){
    		var _id = $("#id").text();
    		location.href="<c:url value='adminMemberModify.do?id=" + _id + "'/>";
    	})
    	
    	$(document).on("click", ".page-item.disabled a", function(e){
    		e.preventDefault();
    	})
   	</script>
<%@ include file="../inc/footer.jsp" %>
