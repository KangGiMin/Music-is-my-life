package com.musicismylife.domain.post;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PostDTO {
	private int POST_ID;
	private String MEMBER_ID;
	private String TITLE;
	private String CONTENTS;
	private String YOUTUBE_LINK;
	private String EMOTION_CODE;
	private String CREATED_AT;
	private String VIEW_COUNT;
	private String MEMBER_NICKNAME;
	private String EMOTION_NAME;
	
	public PostDTO() {}
	
	public PostDTO(int POST_ID, String MEMBER_ID, String TITLE, String CONTENTS, String YOUTUBE_LINK,
			String EMOTION_CODE, String CREATED_AT, String VIEW_COUNT, String MEMBER_NICKNAME, String EMOTION_NAME) {
	
		this.POST_ID = POST_ID;
		this.MEMBER_ID = MEMBER_ID;
		this.TITLE = TITLE;
		this.CONTENTS = CONTENTS;
		this.YOUTUBE_LINK = YOUTUBE_LINK;
		this.EMOTION_CODE = EMOTION_CODE;
		this.CREATED_AT = CREATED_AT;
		this.VIEW_COUNT = VIEW_COUNT;
		this.MEMBER_NICKNAME = MEMBER_NICKNAME;
		this.EMOTION_NAME = EMOTION_NAME;
	}
	
	
}
