package com.gil.foodMarket.service;

import java.util.List;

import com.gil.foodMarket.model.CommonDTO;
import com.gil.foodMarket.model.MarketDTO;

public interface MarketService {
	int marketTotal();
	int marketAdd(MarketDTO dto);
	CommonDTO marketList(CommonDTO dto);
	MarketDTO marketDetail(int market_no);
	MarketDTO goodAdd(int market_no);
	int marketModify(MarketDTO dto);
	int marketDelete(int market_no);
	int marketReset(MarketDTO dto);
}
