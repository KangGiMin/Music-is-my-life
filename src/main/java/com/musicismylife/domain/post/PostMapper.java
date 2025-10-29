package com.musicismylife.domain.post;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PostMapper {

	List<PostDTO> getPostList();

	PostDTO getPost(String postID);

	List<PostDTO> getPostListByEmotion(String emotionCode);

	void increaseViewCount(String postID);

	void insertPost(PostDTO postDTO);

  void updatePost(PostDTO postDTO);

  void deletePost(String postID);
}
