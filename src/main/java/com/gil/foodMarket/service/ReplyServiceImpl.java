package com.gil.foodMarket.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gil.foodMarket.mapper.MarketMapper;
import com.gil.foodMarket.mapper.MemberMapper;
import com.gil.foodMarket.mapper.ReplyMapper;
import com.gil.foodMarket.mapper.UploadFileMapper;
import com.gil.foodMarket.model.CommonDTO;
import com.gil.foodMarket.model.MarketDTO;
import com.gil.foodMarket.model.ReplysDTO;
import com.gil.foodMarket.model.UploadFileDTO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyMapper mapper;

	@Override
	public List<ReplysDTO> replyList(int marketId) {
		List<ReplysDTO> list = mapper.replyList(marketId);
		for (ReplysDTO dto : list) {
			dto.setStrDate(dto.getSimpleDate(dto.getReg_date()));
		}
		
		return list;
	}

	@Override
	public int replyAdd(ReplysDTO dto) {
		return mapper.replyAdd(dto);
	}

	@Override
	public int replyDel(int reply_no) {
		return mapper.replyDel(reply_no);
	}

	@Override
	public int replyModi(ReplysDTO dto) {
		return mapper.replyModi(dto);
	}
	

}
