package com.kitri.admin.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kitri.admin.model.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping(value="/mvmemberlist.kitri")
	public String getMemberList() {
		return "admin/member/memberlist";
	}
	
	@RequestMapping(value="/memberlist.kitri")
	@ResponseBody
	public String getMemberList(@RequestParam Map<String,String> map) {
//		System.out.println("C 진입성공");
		String json = adminService.getMemberList(map);
//		System.out.println(map.get("key"));
		return json;
	}
	
}