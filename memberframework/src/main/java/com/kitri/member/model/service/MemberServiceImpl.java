package com.kitri.member.model.service;

import java.util.*;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.member.model.*;
import com.kitri.member.model.dao.MemberDao;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public String idCheck(String id) {
		int cnt = memberDao.idCheck(id);
//		System.out.println("cnt = " + cnt);
		JSONObject json = new JSONObject();
		json.put("idcount", cnt);
		return json.toString();//{"idcount":0}
	}

	@Override
	public String zipSearch(String doro) {
		List<ZipcodeDto> list = memberDao.zipSearch(doro);
		JSONObject json = new JSONObject();
		JSONArray jarray = new JSONArray(list);
//		for(ZipcodeDto zipcodeDto : list) {
//			JSONObject zipcode = new JSONObject();
//			zipcode.put("zipcode", zipcodeDto.getZipcode());
//			zipcode.put("address", zipcodeDto.getSido()+" "+
//							zipcodeDto.getGugun()+" "+
//							zipcodeDto.getUpmyon()+" "+ 
//							zipcodeDto.getBuildingNumber()+""+
//							zipcodeDto.getSigugunBuildingName());
//			jarray.put(zipcode);
//		}
		json.put("ziplist", jarray);
//		System.out.println(json.toString());
		return json.toString();
	}

	@Override
	public int registerMember(MemberDetailDto memberDetailDto) {
		return memberDao.registerMember(memberDetailDto);
	}

	@Override
	public MemberDto loginMember(Map<String,String> map) {
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("userid", id);
//		map.put("userpwd", pass);
		return memberDao.loginMember(map);
	}

	@Override
	public MemberDetailDto getMember(String id) {
		return memberDao.getMember(id);
	}

	@Override
	public int modifyMember(MemberDetailDto memberDetailDto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(String id) {
		return memberDao.deleteMember(id);
	}


}
