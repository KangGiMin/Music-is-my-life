package com.musicismylife.domain.member;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberDTO {

	private String member_id;
	private String member_pw;
	private String member_nickname;
	private String member_email;
	private String created_at;
	private String updated_at;
	
	public MemberDTO(String member_id, String member_pw, String member_nickname, String member_email, String created_at,
			String updated_at) {
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_nickname = member_nickname;
		this.member_email = member_email;
		this.created_at = created_at;
		this.updated_at = updated_at;
	}

	public MemberDTO() {}
}