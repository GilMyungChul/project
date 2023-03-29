package com.gil.foodMarket.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UploadFileDTO {
	private int upload_no;
	private int groupId;
	private String groupType;
	private String originName;
	private String fileName;
	private String filePath;
	private String deleteYN;
	private Date reg_date;
	private String strDate;
	
	public String getSimpleDate(Date simpleDate) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss"); 
		this.strDate = simpleDateFormat.format(simpleDate);
		return this.strDate;
	}
}
