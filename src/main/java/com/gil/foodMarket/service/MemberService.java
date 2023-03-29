package com.gil.foodMarket.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.gil.foodMarket.model.CommonDTO;
import com.gil.foodMarket.model.MemberDTO;

public interface MemberService {
	int memberTotal(CommonDTO dto);
	
	int memberJoin(MemberDTO dto, String emailSelect);
	
	boolean memberLogin(MemberDTO dto, HttpServletRequest req);
	
	String joinIdCheck(String id);
	
	MemberDTO findIdChk(MemberDTO dto);
	
	int findPwChk(MemberDTO dto);
	
	int updatePw(MemberDTO dto);
	
	CommonDTO memberList(CommonDTO dto);
	
	MemberDTO memberDetail(String id);
	
	int memberDelete(String id);
	
	int memberDeletes(String id);
	
	int memberModify(MemberDTO dto);
}
