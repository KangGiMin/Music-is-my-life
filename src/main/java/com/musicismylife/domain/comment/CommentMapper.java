package com.musicismylife.domain.comment;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.musicismylife.domain.post.PostDTO;

@Mapper
public interface CommentMapper {
    List<CommentDTO> getCommentList(String post_id);
    
    int getCommentCount(String post_id);
    
    CommentDTO getComment(int comment_id);
    
    void insertComment(CommentDTO commentDTO);
    
    void deleteComment(int comment_id);
    
    void updateComment(CommentDTO commentDTO);
}