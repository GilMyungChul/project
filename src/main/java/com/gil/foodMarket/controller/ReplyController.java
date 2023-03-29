package com.gil.foodMarket.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.gil.foodMarket.model.ReplysDTO;
import com.gil.foodMarket.service.ReplyService;

@RestController
@RequestMapping("/replies")
public class ReplyController {
	
	@Autowired
	private ReplyService service;
	
	// 댓글 리스트
	@GetMapping("/{marketId}")
	public @ResponseBody List<ReplysDTO> replyList(@PathVariable("marketId") int marketId){
		List<ReplysDTO> rDto = service.replyList(marketId);
		return rDto;
	}
	
	// 댓글 등록
	@PostMapping("")
	public String replyAdd(@RequestBody ReplysDTO dto) {
		System.out.println("add");
		String str = service.replyAdd(dto) >= 0 ? "success" : "fail";
		return str;
	}
	
	// 댓글 삭제
	@DeleteMapping("/{reply_no}")
	public String replyDel(@PathVariable("reply_no") int reply_no) {
		return service.replyDel(reply_no) > 0 ? "success" : "fail";
	}
	
	// 댓글 수정
	@RequestMapping(value = "/{reply_no}", method = {RequestMethod.PUT, RequestMethod.PATCH})
	public String modify(@RequestBody ReplysDTO dto) {
		System.out.println(dto.toString());
		return service.replyModi(dto) > 0 ? "success" : "fail";
	}
	
	
}
