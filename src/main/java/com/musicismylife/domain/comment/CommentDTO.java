package com.musicismylife.domain.comment;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommentDTO {
	private int comment_id;
	private int post_id;
	private String member_id;
	private String content;
	private String created_at;
	private String updated_at;
	
	public CommentDTO() {}
	
	public CommentDTO(int comment_id, int post_id, String member_id, String content, String created_at, String updated_at) {
		this.comment_id = comment_id;
		this.post_id = post_id;
		this.member_id = member_id;
		this.content = content;
		this.created_at = created_at;
		this.updated_at = updated_at;
	}
}
