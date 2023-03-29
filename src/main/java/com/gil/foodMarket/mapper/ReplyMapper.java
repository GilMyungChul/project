package com.gil.foodMarket.mapper;

import java.util.List;

import com.gil.foodMarket.model.CommonDTO;
import com.gil.foodMarket.model.MarketDTO;
import com.gil.foodMarket.model.ReplysDTO;

public interface ReplyMapper {
	List<ReplysDTO> replyList(int marketId);
	int replyAdd(ReplysDTO dto);
	int replyDel(int reply_no);
	int replyModi(ReplysDTO dto);
	int replyCount(int market_no);
}
