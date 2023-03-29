package com.gil.foodMarket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gil.foodMarket.mapper.MarketMapper;
import com.gil.foodMarket.mapper.UploadFileMapper;
import com.gil.foodMarket.model.MarketDTO;
import com.gil.foodMarket.model.UploadFileDTO;

@Service
public class UploadFIleServiceImpl implements UploadFileService {
	
	@Autowired
	private UploadFileMapper mapper;

	@Override
	public int fileUpload(UploadFileDTO dto) {
		return mapper.fileUpload(dto);
	}

	@Override
	public int fileDelete(UploadFileDTO dto) {
		return mapper.fileDelete(dto);
	}
	
	
}
