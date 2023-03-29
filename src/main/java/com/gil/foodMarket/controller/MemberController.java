package com.gil.foodMarket.controller;

import java.net.http.HttpResponse;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gil.foodMarket.model.MemberDTO;
import com.gil.foodMarket.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	// 로그아웃
	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// 로그인 페이지 이동
	@RequestMapping("/loginForm.do")
	public String loginForm(Model model) {
		String mode = "login";
		model.addAttribute("menuMode", "login");
		model.addAttribute("mode", mode);
		return "login/loginForm";
	}
	
	// 로그인
	@RequestMapping("/login.do")
	public String login(MemberDTO dto, HttpServletRequest req, RedirectAttributes rttr) {
		boolean loginChk = service.memberLogin(dto, req);
		
		HttpSession session = req.getSession();
		
		if (loginChk) {
			return "redirect:/";
		} else {
			rttr.addFlashAttribute("loginMsg", 0);
			return "redirect:/loginForm.do";
		}
		
	}
	
	// 회원가입 페이지 이동
	@RequestMapping("/joinForm.do")
	public String joinFrom(Model model) {
		model.addAttribute("menuMode", "join");
		return "login/joinForm";
	}
	
	// 회원가입
	@RequestMapping("/join.do")
	public String join(MemberDTO dto, @RequestParam("emailSelect") String emailSelect) {
		service.memberJoin(dto, emailSelect);
		return "redirect:/loginForm.do";
	}
	
	// 회원가입 시 아이디 중복확인 체크
	@RequestMapping("/idCheck.do")
	@ResponseBody
	public String joinIdCheck(@RequestParam("id") String id, Model model) {
		String idChk = service.joinIdCheck(id);
		model.addAttribute("idChk", idChk);
		return idChk;
	}
	
	// 아이디 찾기 페이지 이동
	@GetMapping("/findId.do")
	public String findIdForm(@RequestParam(defaultValue="") String mode, Model model) {
		model.addAttribute("mode", mode);
		return "mypage/findUserInfo";
	}
	
	// 아이디 찾기
	@PostMapping("/findId.do")
	public String findId(MemberDTO dto, Model model) {
		MemberDTO idDto = service.findIdChk(dto);
		model.addAttribute("findId", idDto);
		return "info/findIdSuccess";
	}
	
	// 비밀번호 찾기 페이지 이동
	@GetMapping("/findPw.do")
	public String findPwForm(@RequestParam(defaultValue="") String mode, Model model) {
		model.addAttribute("mode", mode);
		return "mypage/findUserInfo";
	}
	
	// 비밀번호 찾기
	@PostMapping("/findPw.do")
	public String findPw(MemberDTO dto, Model model) {
		try {
			int n = service.findPwChk(dto);
			if (n == 0)
				throw new Exception();
			
			model.addAttribute("email", dto.getEmail());
			return "info/findPwSuccess";
		} catch (Exception e) {
			return "redirect:findPw.do?mode=pwChange";
		}
	}
	
	// 비밀번호 변경 페이지 이동
	@RequestMapping("/pwChangeForm.do")
	public String pwChangeForm() {
		return "mypage/pwChange";
	}
	
	// 비밀번호 변경
	@RequestMapping("/pwChange.do")
	public String pwChange(MemberDTO dto, @RequestParam("pw") String pw) {
		int n = service.updatePw(dto);
		if (n > 0) {
			return "redirect:/";
		} else {
			return "loginForm.do";
		}
	}
	
}
