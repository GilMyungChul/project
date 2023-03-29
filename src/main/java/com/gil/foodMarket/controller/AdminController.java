package com.gil.foodMarket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gil.foodMarket.mapper.MemberMapper;
import com.gil.foodMarket.model.CommonDTO;
import com.gil.foodMarket.model.MarketDTO;
import com.gil.foodMarket.model.MemberDTO;
import com.gil.foodMarket.service.MarketService;
import com.gil.foodMarket.service.MemberService;

@Controller
public class AdminController {
	
	@Autowired
	private MemberService memService;
	
	@Autowired
	private MarketService marService;
	
	@RequestMapping("/admin.do")
	public String admin(CommonDTO dto, Model model) {
		int memCount = memService.memberTotal(dto);
		int marCount = marService.marketTotal();
		model.addAttribute("memCount", memCount);
		model.addAttribute("marCount", marCount);
		model.addAttribute("menuMode", "admin");
		return "admin/main";
	}
	
	// 어드민 - 회원관리 리스트
	@RequestMapping("/adminMemberList.do")
	public String memberList(CommonDTO dto, Model model) {
		CommonDTO comDto = memService.memberList(dto);
		model.addAttribute("comDto", comDto);
		model.addAttribute("menuMode", "admin");
		return "admin/memberList";
	}
	
	// 어드민 - 회원관리 상세정보
	@RequestMapping("/adminMemberDetail.do")
	@ResponseBody
	public MemberDTO memberDetail(@RequestParam("id") String id, Model model) {
		MemberDTO detailDto = memService.memberDetail(id);
		model.addAttribute("detailDto", detailDto);
		model.addAttribute("menuMode", "admin");
		if (detailDto != null) {
			return detailDto;
		} else {
			return null;
		}
	}
	
	// 어드민 - 회원관리 회원삭제
	@RequestMapping("/adminMemberDelete.do")
	public String memberDelete(@RequestParam("id") String id, @RequestParam("deleteYN") String deleteYN) {
		int n = 0;
		if (deleteYN.equals("No")) {
			n = memService.memberDelete(id);
		} else {
			n = memService.memberDeletes(id);
		}
		return "redirect:admin.do";
	}
	
	// 어드민 - 회원관리 회원수정 페이지 
	@GetMapping("/adminMemberModify.do")
	public String memberModifyGet(@RequestParam("id") String id, Model model) {
		MemberDTO modifyDto = memService.memberDetail(id);
		model.addAttribute("modifyDto", modifyDto);
		model.addAttribute("menuMode", "admin");
		return "/admin/memberModify";
	}
	
	// 어드민 - 회원관리 회원수정
	@PostMapping("/adminMemberModify.do")
	public String memberModify(MemberDTO dto) {
		int n = memService.memberModify(dto);
		return "redirect:admin.do";
	}
	
	// 어드민 - 맛.집 게시글관리 리스트
	@RequestMapping("/adminMarketList.do")
	public String marketList(CommonDTO dto, Model model) {
		dto.setAdminChk("Y");
		CommonDTO comDto = marService.marketList(dto);
		model.addAttribute("comDto", comDto);
		model.addAttribute("menuMode", "admin");
		return "admin/marketList";
	}
	
	// 어드민 - 맛.집 게시글관리 상세정보
	@RequestMapping("/adminMarketDetail.do")
	@ResponseBody
	public MarketDTO marketDetail(@RequestParam("market_no") int market_no, Model model) {
		MarketDTO detailDto = marService.marketDetail(market_no);
		model.addAttribute("detailDto", detailDto);
		model.addAttribute("menuMode", "admin");
		if (detailDto != null) {
			return detailDto;
		} else {
			return null;
		}
	}
	
	// 어드민 - 맛.집 게시글관리 게시글삭제
	@RequestMapping("/adminMarketReset.do")
	public String marketReset(MarketDTO dto) {
		int n = marService.marketReset(dto);
		return "redirect:adminMarketList.do";
	}
}
