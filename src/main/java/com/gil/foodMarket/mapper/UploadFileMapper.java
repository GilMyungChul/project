package com.gil.foodMarket.mapper;

import java.util.List;

import com.gil.foodMarket.model.UploadFileDTO;

public interface UploadFileMapper {
	int fileUpload(UploadFileDTO dto);
	List<UploadFileDTO> fileList(UploadFileDTO dto);
	int fileDelete(UploadFileDTO dto);
}
