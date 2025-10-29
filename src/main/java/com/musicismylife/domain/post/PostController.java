package com.musicismylife.domain.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.musicismylife.domain.comment.CommentDTO;
import com.musicismylife.domain.comment.CommentMapper;
import com.musicismylife.domain.emotion.EmotionDTO;
import com.musicismylife.domain.emotion.EmotionMapper;
import com.musicismylife.domain.member.MemberDTO;
import com.musicismylife.domain.member.MemberMapper;


@Controller
public class PostController {
   @Autowired
   private PostMapper postMapper;
   @Autowired
   private EmotionMapper emotionMapper;
   @Autowired
   private MemberMapper memberMapper;
   
   @Autowired
   private CommentMapper commentMapper;
	
	@RequestMapping("/post/view")
	public String showPost(Model model) {
		List<PostDTO> postList = postMapper.getPostList(); 
		model.addAttribute("postList",postList);
		System.out.println("안녕~");
		System.out.println(postList);
		return "/post/view";
	}
	
	@RequestMapping("post/view/{emotionCode}")
	public String showEmoteCategory(@PathVariable String emotionCode, Model model) {
		
		List<PostDTO> postList = postMapper.getPostListByEmotion(emotionCode); 
		model.addAttribute("postList", postList);
		System.out.println("안녕~22");
		System.out.println(postList);
		return "/post/view";
	}
	
	
	@RequestMapping("/post/detail/{postID}")
	public String showPostDetail(@PathVariable String postID, Model model) {
      System.out.println("글번호: " + postID);
	    PostDTO post = postMapper.getPost(postID);
	 // 조회수 증가 처리 추가
	    postMapper.increaseViewCount(postID);
	    
	    // 댓글 목록이랑  댓글 수 가져와서 모델에 추가하셈...
	    List<CommentDTO> commentList = commentMapper.getCommentList(postID);
	    int commentCount = commentMapper.getCommentCount(postID);
	    
	    model.addAttribute("post", post);
	    model.addAttribute("comment", commentList);      // commentList.jsp에서 사용
	    model.addAttribute("commentList", commentList);  // 혹시 다른 곳에서 사용할 수도 있으니
	    model.addAttribute("count", commentCount);       // 댓글 수 (int 타입으로 반환!!!!!!!!!!)
	    
	    System.out.println("댓글 수: " + commentCount);
	    System.out.println("댓글 목록: " + commentList);
	    
	    return "post/viewDetail";
	}
	
	//글쓰기 입장
	@RequestMapping("/post/write/{member_id}")
	public String writePost(@PathVariable String member_id, Model model) {
	    // 멤버 정보 모델에 추가
	    model.addAttribute("MEMBER_ID", member_id);
	    
	    // 닉네임 가져오기
	    MemberDTO memberDTO = new MemberDTO();
	    memberDTO.setMember_id(member_id);
	    MemberDTO member = memberMapper.getMember(memberDTO);
	    
	    model.addAttribute("MEMBER_NICKNAME", member.getMember_nickname());
	    
	    return "/post/write";
	}
	
	//글쓰기 완료버튼 클릭 시
	@RequestMapping("/post/writePost")
	public String insertPost(PostDTO postDTO) {
		postMapper.insertPost( postDTO );		
		
		return "/post/view";
	}
	

  // 글 수정 페이지로 이동
@RequestMapping("/post/edit/{postID}")
public String editPost(@PathVariable String postID, Model model) {
    // 게시글 정보 가져오기
    PostDTO post = postMapper.getPost(postID);
    
    // 모델에 게시글 정보 추가
    model.addAttribute("post", post);
    
    return "/post/edit";
}

// 글 수정 처리
@RequestMapping("/post/updatePost")
public String updatePost(PostDTO postDTO) {
    // 게시글 수정 처리
    postMapper.updatePost(postDTO);
    
    // 수정 완료 후 상세 페이지로 리다이렉트
    return "redirect:/post/detail/" + postDTO.getPOST_ID();
}

// 글 삭제 처리
@RequestMapping("/post/delete/{postID}")
public String deletePost(@PathVariable String postID) {
    // 게시글 삭제 처리
    postMapper.deletePost(postID);
    
    // 삭제 완료 후 목록 페이지로 리다이렉트
    return "redirect:/post/view";
}
	
}
