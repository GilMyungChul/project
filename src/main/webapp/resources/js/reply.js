var replyFun = (function(){
	
	function replyList(param, back){
		$.ajax({
			url: "replies/" + param.marketId,
			type: "get",
			dataType: "json",
			success: function(result){
				if(back) back(result);
			},
			error: function(){console.log("요청실패");}
		});
	};
	
	function replyAdd(reply, back) {
		$.ajax({
			url: "replies",
			type: "post",
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success: function(result){
				if(back) back(result);
			},
			error: function(){console.log("요청실패");}
		});
	}
	
	function replyDel(param, back) {
		$.ajax({
			url: "replies/" + param.reply_no,
			type: "delete",
			dataType: "json",
			success: function(result){
				if(back) back(result);
			},
			error: function(){console.log("요청실패");}
		});
	}
	
	function replyModi(reply, back) {
		$.ajax({
			url: "replies/" + reply.reply_no,
			type: "put",
			data: JSON.stringify(reply),
			contentType: "application/json; charset=utf-8",
			success: function(result){
				if(back) back(result);
			},
			error: function(){console.log("요청실패");}
		});
	}
	
	return {
		replyList : replyList,
		replyAdd : replyAdd,
		replyDel : replyDel,
		replyModi : replyModi
	};
})();