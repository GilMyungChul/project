package com.gil.foodMarket.model;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommonDTO {
	private int viewPage = 1;		// 현재 페이지 위치
	private int blockSize = 5;
	private int blockNum; 			// 블럭의 위치
	private int blockStart;
	private int blockEnd;
	private int prevPage;
	private int nextPage;
	private int totalPage;
	private int totalCnt;			// 전체
	
	private int startIndex; 		// 각 페이지별 시작값
	private int cntPerPage = 10; 	// 페이지의 노출되는 수
	
	private String searchSelect;
	private String search;
	
	
	// 맴버리스트
	List<MemberDTO> memList;
	
	// 마켓리스트
	private String adminChk;
	List<MarketDTO> marList;

	public void setValue(int totalCnt) {
		// 전체 페이지 수
		this.totalPage = (int)Math.ceil((double)totalCnt/cntPerPage);
		
		// 페이지별 시작 인덱스 : 0, 10, 20, 30....
		this.startIndex = (viewPage - 1) * cntPerPage;
		
		// 현재 페이지의 블럭위치 : 0부터 시작
		this.blockNum = (viewPage - 1)/blockSize;
		
		// 블럭 시작값 : 1, 6, 11....
		this.blockStart = (blockSize * blockNum) + 1;

		// 블럭 시작값 : 5, 10, 15....		
		this.blockEnd = blockStart + (blockSize - 1);
		if(blockEnd > totalPage) blockEnd = totalPage;
		
		// 이전 페이지
		this.prevPage = blockStart - 1;
		
		// 다음 페이지
		this.nextPage = blockEnd + 1;
		if (nextPage > totalPage) nextPage = totalPage;
	}

}
