package com.gil.foodMarket.service;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.mail.Session;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.gil.foodMarket.mapper.MemberMapper;
import com.gil.foodMarket.model.CommonDTO;
import com.gil.foodMarket.model.MemberDTO;

@Service
public class MemberServieImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	@Autowired
	private JavaMailSender mailSender;

	@Override
	public int memberTotal(CommonDTO dto) {
		return mapper.memberTotal(dto);
	}
	
	@Override
	public int memberJoin(MemberDTO dto, String emailSelect) {
		String userPw = dto.getPw();
		String cipherPW = pwEncoder.encode(userPw);
		
		String email = dto.getEmail() + "@" + emailSelect;
		
		dto.setEmail(email);
		dto.setPw(cipherPW);
		
		return mapper.memberJoin(dto);
	}

	@Override
	public boolean memberLogin(MemberDTO dto, HttpServletRequest req) {
		MemberDTO loginDto = mapper.memberLogin(dto);
		
		HttpSession session = req.getSession();
		boolean loginChk;
		
		try {
			String userPw = dto.getPw();
			String dbPw = loginDto.getPw();
			
			if (pwEncoder.matches(userPw, dbPw)) {
				session.setAttribute("loginDto", loginDto);
				loginChk = true;
			} else {
				throw new Exception();
			}
		} catch (Exception e) {
			loginChk = false;
		}
		
		return loginChk;
	}

	@Override
	public String joinIdCheck(String id) {
		int n = mapper.joinIdCheck(id);
		String idChk = "false";
		
		if (n == 0) { // 중복되는 아이디가 없는 경우
			idChk = "true";
		}
		
		return idChk;
	}

	@Override
	public MemberDTO findIdChk(MemberDTO dto) {
		return mapper.findIdChk(dto);
	}

	@Override
	public int findPwChk(MemberDTO dto) {
		// 임시 비밀번호 생성
		String changePw = UUID.randomUUID().toString().substring(0, 6);
		String email = dto.getEmail();
		
		MimeMessage mail = mailSender.createMimeMessage();
		String mailContents = "<div style='text-align:center'><h2>임시 비밀번호 발급</h2><br>"
							+ "<h2>" + changePw + "</h2>"
							+ "<p>로그인 후 마이페이지에서 비밀번호를 변경해주세요</p></div>";
		
		try {
			mail.setSubject("Taste Market [임시 비밀번호]", "utf-8"); // 메일 제목 세팅
			mail.setText(mailContents, "utf-8", "html"); // 메일 본문 세팅
			
			// 수신자 세팅
			mail.addRecipient(RecipientType.TO, new InternetAddress(email));
			mailSender.send(mail);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 임시 비밀번호 암호화
		String cipherPw = pwEncoder.encode(changePw);
		dto.setPw(cipherPw);
		
		int n = mapper.findPwChk(dto);
		
		return n;
	}

	@Override
	public int updatePw(MemberDTO dto) {
		String _pw = dto.getPw();
		String _cipherPw = pwEncoder.encode(_pw);
		dto.setPw(_cipherPw);
		
		return mapper.updatePw(dto);
	}

	@Override
	public CommonDTO memberList(CommonDTO dto) {
		int totalCnt = mapper.memberTotal(dto);
		dto.setTotalCnt(totalCnt);
		dto.setValue(totalCnt);
		
		List<MemberDTO> list = mapper.memberList(dto);
		
		dto.setMemList(list);
		
		return dto;
	}

	@Override
	public MemberDTO memberDetail(String id) {
		MemberDTO dto = mapper.memberDetail(id);
		dto.getSimpleDate(dto.getJoin_date());
		
		return dto;
	}

	@Override
	public int memberDelete(String id) {
		return mapper.memberDelete(id);
	}

	@Override
	public int memberDeletes(String id) {
		return mapper.memberDeletes(id);
	}

	@Override
	public int memberModify(MemberDTO dto) {
		return mapper.memberModify(dto);
	}

}
