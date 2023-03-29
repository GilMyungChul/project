package com.gil.foodMarket.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Param;

import com.gil.foodMarket.model.CommonDTO;
import com.gil.foodMarket.model.MemberDTO;

public interface MemberMapper {
	int memberTotal(CommonDTO dto);
	
	int memberJoin(MemberDTO dto);
	
	MemberDTO memberLogin(MemberDTO dto);
	
	int joinIdCheck(String id);
	
	MemberDTO findIdChk(MemberDTO dto);
	
	int findPwChk(MemberDTO dto);
	
	int updatePw(MemberDTO dto);
	
	List<MemberDTO> memberList(CommonDTO dto);
	
	MemberDTO memberDetail(String id);
	
	int memberDelete(String id);
	
	int memberDeletes(String id);
	
	int memberModify(MemberDTO dto);
	
	int levelUpdate(@Param("count") int count, @Param("id") String id);
}
