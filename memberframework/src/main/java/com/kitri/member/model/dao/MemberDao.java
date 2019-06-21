package com.kitri.member.model.dao;

import java.util.List;
import java.util.Map;

import com.kitri.member.model.*;

public interface MemberDao {
	int idCheck(String id);
	List<ZipcodeDto> zipSearch(String doro);
	int registerMember(MemberDetailDto memberDetailDto);
	MemberDto loginMember(Map<String, String> map);//이름아이디이메일
	
	MemberDetailDto getMember(String id);//회원정보수정 회원1명
	int modifyMember(MemberDetailDto memberDetailDto);
	int deleteMember(String id);
}
