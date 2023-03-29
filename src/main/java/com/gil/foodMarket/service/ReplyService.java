package com.gil.foodMarket.service;

import java.util.List;

import com.gil.foodMarket.model.CommonDTO;
import com.gil.foodMarket.model.MarketDTO;
import com.gil.foodMarket.model.ReplysDTO;

public interface ReplyService {
	List<ReplysDTO> replyList(int marketId);
	int replyAdd(ReplysDTO dto);
	int replyDel(int reply_no);
	int replyModi(ReplysDTO dto);
}
