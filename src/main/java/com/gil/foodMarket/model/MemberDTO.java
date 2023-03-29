package com.gil.foodMarket.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberDTO {
	
	private int member_no;
	private String id;
	private String pw;
	private String name;
	private String ph;
	private String lv;
	private String deleteYN;
	private String staff;
	private String email;
	private Date join_date;
	private String images;
	private String strDate;
	
	public String getSimpleDate(Date simpleDate) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss"); 
		this.strDate = simpleDateFormat.format(simpleDate);
		return this.strDate;
	}
	
	public String levels() {
		if (this.lv.equals("B")) { 
			return "구멍가게";
		} else if (this.lv.equals("S")) { //게시글 50개 이상
			return "편의점";
		} else if (this.lv.equals("G")) { // 게시글 100개 이상
			return "마트";
		} else if (this.lv.equals("P")) { // 게시글 150개 이상
			return "대형마트";
		}
		
		return "";
	}
	
}
