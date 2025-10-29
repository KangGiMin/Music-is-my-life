package com.musicismylife.domain.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.musicismylife.domain.post.PostDTO;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/comment")
public class CommentController {

   @Autowired

   private CommentMapper commentMapper;
   @GetMapping("/commentList")
   public ModelAndView commentList(@RequestParam String post_id) { // PostDTO를 post_id로 바꿨음ㅋㅋ 매퍼에서 String을 받으니까
       
       // 댓글 수량 가져오기
       int commentCount = 0;
       commentCount = commentMapper.getCommentCount(post_id); // postDTO 대신 post_id 넣음
       
       // 댓글 목록 가져오기
       List<CommentDTO> commentDTO = commentMapper.getCommentList(post_id); // 여기도 post_id로 바꿈
       
       ModelAndView mv = new ModelAndView();
       mv.addObject("comment", commentDTO);
       mv.addObject("count", commentCount);
       mv.setViewName("comment/commentList");
       
       return mv;
   }

   @PostMapping("/commentWrite")
   public String commentWrite(CommentDTO commentDTO) {
       // getPost_id() -> getPost_id() / 확인하셈
       String postID = Integer.toString(commentDTO.getPost_id());
       
       System.out.println("작성내용: " + commentDTO);
       System.out.println("원글번호:" + postID);
       
       commentMapper.insertComment(commentDTO);
       
       return "redirect:/post/detail/" + postID;
   }

   @GetMapping("/commentDel")
   public String commentDelete(@RequestParam int comment_id, @RequestParam String post_id) { // 매개변수를 분리했어. deleteComment가 comment_id(int)를 받으니까
       commentMapper.deleteComment(comment_id); // CommentDTO 대신 comment_id만 넣음
       
       // 삭제 후에 그 게시글로 다시 가도록 바꿨어
       return "redirect:/post/detail/" + post_id;
   }

   @GetMapping("/commentUpdateForm")
   public ModelAndView getComment(@RequestParam int comment_id) { // CommentDTO 대신 comment_id만 받도록 바꿈. 매퍼에서 int를 받으니까
	   CommentDTO commentDTO = commentMapper.getComment(comment_id); // comment_id만 넣으면 됨
       
       ModelAndView mv = new ModelAndView();
       mv.addObject("comment", commentDTO);
       mv.setViewName("comment/commentUpdateForm");
       
       return mv;
   }

   @PostMapping("/commentUpdate")
   public String updateComment(CommentDTO commentDTO) { // 수정 후에도 게시글로 돌아가게 String으로 바꿨어
	   commentMapper.updateComment(commentDTO);
       
       String postID = Integer.toString(commentDTO.getPost_id()); // 수정한 댓글의 게시글 번호 가져와서
       
       // 수정 후에 그 게시글로 다시 가도록 바꿨어
       return "redirect:/post/detail/" + postID;
   }
}
