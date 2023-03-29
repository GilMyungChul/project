package com.gil.foodMarket.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MarketDTO {
	
	private int market_no;
	private String id;
	private String store;
	private String keyword;
	private String location;
	private String cont;
	private String image_yn;
	private int rating;
	private int hit;
	private int good;
	private Date reg_date;
	private Date up_date;
	private String deleteYN;
	private String strDate;
	private int replyCount;
	
	List<UploadFileDTO> fileDto;
	
	public String getSimpleDate(Date simpleDate) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss"); 
		this.strDate = simpleDateFormat.format(simpleDate);
		return this.strDate;
	}
}
