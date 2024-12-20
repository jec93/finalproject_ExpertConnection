package kr.or.iei.cs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("csController")
@RequestMapping("/cs/")
public class CsController {

	//고객센터 메인페이지 이동
	@GetMapping("CS.exco")
	public String Cs() {
		return "cs/csMain";
	}
	
	//전문가회원 승인절차 안내 페이지로 이동
	@GetMapping("introExpertProcess.exco")
	public String introExpertProcess(){
		return "cs/introExpertProcess";
	}
}
