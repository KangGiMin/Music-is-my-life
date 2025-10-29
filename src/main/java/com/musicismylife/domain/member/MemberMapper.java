package com.musicismylife.domain.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	
	// 회원등록
	void insertMember(MemberDTO memberDTO);

	// 로그인 처리
	MemberDTO login(String member_id, String member_pw);

	// 회원정보 조회
	MemberDTO getMember(MemberDTO memberDTO);

	// 회원정보 수정
	void updateMember(MemberDTO memberDTO);

	// 아이디 중복체크
	MemberDTO VariableId(String member_id);
	
	// 닉네임 중복체크
	MemberDTO VariableNickName(String member_nickname);
	
	// 비밀번호 수정
	void updateKey(String member_id, String member_pw);



}