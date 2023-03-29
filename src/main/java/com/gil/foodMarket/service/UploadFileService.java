package com.gil.foodMarket.service;

import com.gil.foodMarket.model.MarketDTO;
import com.gil.foodMarket.model.UploadFileDTO;

public interface UploadFileService {
	int fileUpload(UploadFileDTO dto);
	int fileDelete(UploadFileDTO dto);
}
