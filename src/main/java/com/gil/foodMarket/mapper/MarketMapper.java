package com.gil.foodMarket.mapper;

import java.util.List;

import com.gil.foodMarket.model.CommonDTO;
import com.gil.foodMarket.model.MarketDTO;

public interface MarketMapper {
	int marketTotal();
	int userAddToTal(String id);
	int marketAdd(MarketDTO dto);
	List<MarketDTO> marketList(CommonDTO dto);
	MarketDTO marketDetail(int market_no);
	int hitAdd(int market_no);
	int goodAdd(int market_no);
	int marketModify(MarketDTO dto);
	int marketDelete(int market_no);
	int marketReset(MarketDTO dto);
}
