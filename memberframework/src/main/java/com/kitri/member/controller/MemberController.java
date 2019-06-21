package com.kitri.member.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kitri.member.model.MemberDetailDto;
import com.kitri.member.model.MemberDto;
import com.kitri.member.model.service.MemberService;

@Controller
@RequestMapping("/user")
@SessionAttributes("userInfo")
//@SessionAttributes(names = {"userInfo", "b", "c"})세션 여러개 있을 때
public class MemberController {

	@Autowired
//	@Qualifier("impl1")
	private MemberService memberService;

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	// 가져가야할 때 return type ModelAndView
	// 단순 페이지 이동 return type String

	@RequestMapping(value = "/register.kitri", method = RequestMethod.GET)
	public String register() {
		return "user/member/member";
	}

	@RequestMapping(value = "/register.kitri", method = RequestMethod.POST)
	public String register(MemberDetailDto memberDetailDto, Model model) {
		int cnt = memberService.registerMember(memberDetailDto);
		if (cnt != 0) {
			model.addAttribute("registerInfo", memberDetailDto);
			return "user/member/registerok";
		}
		return "user/member/registerfail";
	}

	@RequestMapping(value = "/idcheck.kitri", method = RequestMethod.GET)
	// @ResponseBody 메소드 결과가 어차피 json형태이니깐 메소드에 적용해도 되고, return type에 적용해도 된다
	public @ResponseBody String idCheck(@RequestParam(name = "checkid", defaultValue = "") String id) {
		logger.info("검색 아이디 : " + id);
		String json = memberService.idCheck(id);
		return json;// WEB-INF/views/{"idcount" : 0}.jsp
	}

	@RequestMapping("/zipsearch.kitri")
	@ResponseBody
	public String zipSearch(@RequestParam("doro") String doro) {
//		logger.info("검색 도로명 : " + doro);
		String json = memberService.zipSearch(doro);
		return json;
	}

	@RequestMapping(value = "/login.kitri", method = RequestMethod.GET)
	public String login() {
		return "user/login/login";
	}

//	스프링을 사용할 이유가 없다
//	@RequestMapping(value="/login.kitri",method = RequestMethod.POST)
//	public String login(@RequestParam("id") String id,
//			@RequestParam("pass") String pass,HttpSession session) {
//		MemberDto memberDto = memberService.loginMember(id, pass);
//		if(memberDto != null) {
//			session.setAttribute("userInfo", memberDto);
//			return "user/login/loginok";
//		}
//			return "user/login/loginfail";
//	}

	@RequestMapping(value = "/login.kitri", method = RequestMethod.POST)
	public String login(@RequestParam Map<String, String> map, Model model) {
		MemberDto memberDto = memberService.loginMember(map);
		if (memberDto != null) {
			model.addAttribute("userInfo", memberDto);
			return "user/login/loginok";
		}
			return "user/login/loginfail";
	}
//	@RequestMapping(value = "/logout.kitri")
//	public String logout(HttpSession session) {
//		session.removeAttribute("userInfo");
//		return "redirect:/index.jsp";//페이지 이동만 할 때, redirect는 prefix를 붙여주면된다
//	}
	
	@RequestMapping(value = "/logout.kitri")
	public String logout(@ModelAttribute("userInfo") MemberDto memberDto, SessionStatus sessionStatus) {
			sessionStatus.setComplete();
			return "redirect:/index.jsp";//페이지 이동만 할 때, redirect는 prefix를 붙여주면된다
		
	}
}
