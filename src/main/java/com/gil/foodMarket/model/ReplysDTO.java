package com.gil.foodMarket.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReplysDTO {
	private int reply_no;
	private String userId;
	private int marketId;
	private int indent;
	private String cont;
	private String deleteYN;
	private Date reg_date;
	private Date up_date;
	private String strDate;
	
	public String getSimpleDate(Date simpleDate) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss"); 
		this.strDate = simpleDateFormat.format(simpleDate);
		return this.strDate;
	}
}
