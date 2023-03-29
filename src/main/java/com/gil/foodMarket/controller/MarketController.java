package com.gil.foodMarket.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gil.foodMarket.model.CommonDTO;
import com.gil.foodMarket.model.MarketDTO;
import com.gil.foodMarket.model.UploadFileDTO;
import com.gil.foodMarket.service.MarketService;
import com.gil.foodMarket.service.UploadFileService;

@Controller
public class MarketController {
	
	@Autowired
	private MarketService service;
	
	@Autowired
	private UploadFileService upService;
	
	@RequestMapping("/market.do")
	public String moveMarket(CommonDTO dto, Model model) {
		dto.setAdminChk("N");
		CommonDTO comDto = service.marketList(dto);
		
		model.addAttribute("menuMode", "market");
		model.addAttribute("comDto", comDto);
		
		return "market/market";
	}
	
	// 맛.집 게시글 등록 페이지
	@RequestMapping("/marketAddForm.do")
	public String marketAddForm(Model model) {
		model.addAttribute("menuMode", "market");
		model.addAttribute("menuMode", "market");
		return "market/marketAdd";
	}
	
	// 맛.집 게시글 등록
	@RequestMapping("/marketAdd.do")
	public String marketAdd(@RequestParam("img") List<MultipartFile> files, MarketDTO dto, UploadFileDTO fDto, HttpServletRequest request, Model model) throws Exception {
		Random random = new Random();
		int no = random.nextInt(10000);
		
		dto.setMarket_no(no);
		int n = service.marketAdd(dto);
		
		String UPLOAD_DIR = "resources/images/market";
		
		// 서버의 실제 경로 얻어오기
		String uploadPath = request.getServletContext().getRealPath("") + UPLOAD_DIR + File.separator;
		
		ArrayList<String> originalFileNameList = new ArrayList<String>();
		if (n > 0) {
			for(MultipartFile file : files) {
				
				// 2. 원본 파일 이름 알아오기
				String originalFileName = file.getOriginalFilename();
				
				if(!originalFileName.equals("")) {
					// 3. 파일 이름을 리스트에 추가
					originalFileNameList.add(originalFileName);
					// 4. 파일 이름 중복되지 않게 이름 변경(서버에 저장할 이름) UUID 사용
					UUID uuid = UUID.randomUUID();
					String savedFileName = uuid.toString().substring(0,6) + "_" + originalFileName;
					
					fDto.setGroupId(no);
					fDto.setGroupType(UPLOAD_DIR);
					fDto.setFileName(savedFileName);
					fDto.setOriginName(originalFileName);
					fDto.setFilePath(uploadPath);
					
					upService.fileUpload(fDto);
					
					// 5. 파일 생성
					File fileA = new File(uploadPath + savedFileName);
					if (fileA.exists() == false) {
						fileA.mkdirs();
					}
					
					// 6. 서버로 전송
					file.transferTo(fileA);
				}
					
			} // for문
		} // if문 n > 0
		
		return "redirect:market.do";
	}
	
	// 맛.집 게시글 상세정보
	@RequestMapping("/marketDetail.do")
	public String marketDetail(@RequestParam("market_no") int market_no, Model model) {
		MarketDTO dto = service.marketDetail(market_no);
		model.addAttribute("dto", dto);
		model.addAttribute("menuMode", "market");
		return "market/marketDetail";
	}
	
	// 맛.집 게시글 좋아요 증가
	@GetMapping("/marketGood.do")
	@ResponseBody
	public int marketGood(@RequestParam("market_no") int market_no) {
		MarketDTO dto  = service.goodAdd(market_no);
		return dto != null ? dto.getGood() : 0;
	}
	
	// 맛.집 게시글 수정 페이지
	@GetMapping("/marketModify.do")
	public String marketModifyForm(@RequestParam("market_no") int market_no, Model model) {
		MarketDTO dto = service.marketDetail(market_no);
		model.addAttribute("dto", dto);
		model.addAttribute("menuMode", "market");
		return "market/marketModify";
	}
	
	// 맛.집 게시글 수정
	@PostMapping("/marketModify.do")
	public String marketModify(MarketDTO dto) {
		service.marketModify(dto);
		return "redirect:market.do";
	}
	
	// 맛.집 게시글 삭제
	@RequestMapping("/marketDelete.do")
	public String marketDelete(@RequestParam("market_no") int market_no) {
		int n = service.marketDelete(market_no);
		return "redirect:market.do";
	}
	
}
