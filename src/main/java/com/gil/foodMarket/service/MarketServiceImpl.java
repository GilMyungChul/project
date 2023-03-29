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
import com.gil.foodMarket.model.UploadFileDTO;

@Service
public class MarketServiceImpl implements MarketService {
	
	@Autowired
	private MarketMapper mapper;
	
	@Autowired
	private MemberMapper memMapper;
	
	@Autowired ReplyMapper reMapper;
	
	@Autowired
	private UploadFileMapper ufMapper;
	
	@Override
	public int marketTotal() {
		return mapper.marketTotal();
	}
	
//	public int userAddTotal(String id) {
//		return mapper.userAddToTal(id);
//	}

	@Override
	public int marketAdd(MarketDTO dto) {
		int n = mapper.marketAdd(dto);
		int count = mapper.userAddToTal(dto.getId());
		
		if (n > 0) {
			// 게시글 등록수에 따른 회원등급 업데이트
			memMapper.levelUpdate(count, dto.getId());
		}
		return n;
	}

	@Override
	public CommonDTO marketList(CommonDTO dto) {
		dto.setValue(mapper.marketTotal());
		
		List<MarketDTO> marketList = mapper.marketList(dto);
		
		for (MarketDTO dtos : marketList) {
			int replyCount = reMapper.replyCount(dtos.getMarket_no());
			UploadFileDTO ufDto = new UploadFileDTO();
			
			ufDto.setGroupId(dtos.getMarket_no());
			List<UploadFileDTO> uploadList = ufMapper.fileList(ufDto);
			dtos.setKeyword(dtos.getKeyword().replace(" ", ""));
			dtos.setFileDto(uploadList);
			dtos.setReplyCount(replyCount);
		}
		
		dto.setMarList(marketList);
		
		return dto;
	}
	
	@Override
	public MarketDTO marketDetail(int market_no) {
		int n = mapper.hitAdd(market_no);
		MarketDTO dto = mapper.marketDetail(market_no);
		dto.getSimpleDate(dto.getReg_date());
		dto.setKeyword(dto.getKeyword().replace(" ", ""));
		
		UploadFileDTO ufDto = new UploadFileDTO();
		ufDto.setGroupId(dto.getMarket_no());
		
		List<UploadFileDTO> uploadList = ufMapper.fileList(ufDto);
		
		dto.setFileDto(uploadList);
		
		return dto;
	}

	@Override
	public int marketModify(MarketDTO dto) {
		return mapper.marketModify(dto);
	}

	@Override
	public MarketDTO goodAdd(int market_no) {
		int n = mapper.goodAdd(market_no);
		
		if (n > 0) {
			MarketDTO dto = mapper.marketDetail(market_no);
			return dto;
		}
		
		return null;
	}
	
	@Override
	public int marketDelete(int market_no) {
		int n = mapper.marketDelete(market_no);
		
		UploadFileDTO dto = new UploadFileDTO();
		dto.setGroupId(market_no);
		n = ufMapper.fileDelete(dto);
		
		return n;
	}

	@Override
	public int marketReset(MarketDTO dto) {
		return mapper.marketReset(dto);
	}

}
