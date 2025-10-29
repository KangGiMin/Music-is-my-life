package com.musicismylife.domain.member;

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.json.JSONObject;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberMapper memberMapper;
		
	@GetMapping("/register")
	public ModelAndView MemberForm() {
		/** 회원가입폼 페이지이동 */
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/register");
		return mv;
	}
	
	@PostMapping("/insert")
	public ModelAndView insertMember(MemberDTO memberDTO) {
		/** 회원가입 DB처리 */
		memberMapper.insertMember(memberDTO);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/login");
		
		return mv;
	}
	
	@RequestMapping("/mypage")
	public ModelAndView viewMyInfo(MemberDTO memberDTO) {
		/** 회원 개인정보 DB조회
		 *  입력값: member_id 
		 * */
		memberDTO = memberMapper.getMember(memberDTO);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("member", memberDTO);
		mv.setViewName("member/mypage");
		
		return mv;
	}
	
	@PostMapping("/UpdateForm")
	public ModelAndView updateForm(MemberDTO memberDTO) {
		/** 수정:회원 개인정보 DB조회
		 *  입력값: member_id 
		 */
		memberDTO = memberMapper.getMember(memberDTO);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("member", memberDTO);
		mv.setViewName("member/profileEdit");
		
		return mv;
	}
	
	@PostMapping("/UpdateAction")
	public ModelAndView updateAction(MemberDTO memberDTO) {
		/** 회원 개인정보 DB수정 
		 *  입력값: 수정 회원정보 
		 * */
		memberMapper.updateMember(memberDTO);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("member", memberDTO);
		mv.setViewName("member/mypage");
		
		return mv;
	}
	
	@GetMapping("/loseKey")
	public ModelAndView updateKeyForm() {
		/** 비밀번호 변경하기 페이지 이동 */ 
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/updateKeyForm");
		
		return mv;
	}
	
	@PostMapping("/updateKey")
	public ModelAndView updateKey(MemberDTO memberDTO) {
		/** 회원 비밀번호 수정
		 *  입력값: member_id, member_pw 
		 *  */
		ModelAndView mv = new ModelAndView();
		String member_id = "";
		String changeKey = "";
		
		member_id = memberDTO.getMember_id();
		changeKey = memberDTO.getMember_pw();
		
		// step1. DB 에서 회원 조회 
		memberDTO = memberMapper.getMember(memberDTO);
		// step2. 
		if (memberDTO != null) { // step2-1: 회원 아이디가 존재한다면 DB비밀번호 변경 후 로그인 페이지로 이동
			memberMapper.updateKey(member_id, changeKey);
			mv.setViewName("member/login");
		} else {                 // step2-2: 회원이 아니라면 회원가입 페이지로 이동
			mv.setViewName("member/register");
		}
		return mv;
	}

	@GetMapping("/login")
	public ModelAndView loginForm() {
		/** 로그인 페이지 이동 */
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/login");
		return mv;
	}
	
	@PostMapping("/loginAction")
	public ModelAndView loginAction(HttpServletRequest request, HttpServletResponse response) {
		/** 로그인 처리
		 * 입력값: member_id, member_pw
		 */
		// step1: 넘어온 로그인정보 받기
		String member_id = request.getParameter("member_id");
		String member_pw = request.getParameter("member_pw");

		// step2: DB 조회
		MemberDTO memberDTO = memberMapper.login(member_id, member_pw);
		
		// step3-1: DB 조회시 회원일 경우: 세션저장, 메인페이지로 이동
		if ( memberDTO != null ) {
			HttpSession session  =  request.getSession();
			session.setAttribute("login", memberDTO);
	
			ModelAndView mv = new ModelAndView();
			mv.setViewName("/post/view");
			return mv;
		} else { // step3-2: DB 조회시 회원이 아닐 경우: 로그인 페이지로 다시 이동
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/member/login?logTag=fail");
			return mv;
		}
	}
	
	@RequestMapping("/logout")
	public  String  logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		// 로그아웃 처리: session을 초기화
		session.invalidate();   
		
		return  "redirect:/";
	}
	
	@PostMapping("/ajaxIdChk")
	@ResponseBody
	public String postAjaxIdCheck(HttpServletRequest request, HttpServletResponse response, @RequestBody String rBody) {
		// 회원가입 시 아이디 중복체크
		
		JSONObject json = new JSONObject();
		JSONObject data = new JSONObject(rBody);
		String userId = null;
		
		// userId: 입력한 ID
		userId = data.getString("CheckId");
		
		// step1. DB에 userId 가 있는지 조회
		MemberDTO memberDTO = memberMapper.VariableId(userId);
		
		// step2. DB 조회 결과 리턴
		if( memberDTO == null ) json.put("result", "success"); // step2-1: 조회 결과가 없다면 사용가능 리턴
		else  json.put("result", "fail");                      // step2-1: 조회 결과 있다면 사용불가능 리턴
		
		return json.toString();
	}
	
	@PostMapping("/ajaxNickNameChk")
	@ResponseBody
	public String postAjaxNickNameCheck(HttpServletRequest request, HttpServletResponse response, @RequestBody String rBody) {
		// 회원가입, 회원정보 수정시 닉네임 중복체크
		
		JSONObject json = new JSONObject();
		JSONObject data = new JSONObject(rBody);
		String userNickName = null;
		
		// userNickName: 입력한 NickName
		userNickName = data.getString("CheckNickName");

		// step1. DB에 userNickName 있는지 조회
		MemberDTO memberDTO = memberMapper.VariableNickName(userNickName);
		
		// step2. DB 조회 결과 리턴
		if( memberDTO == null ) json.put("result", "success"); // step2-1: 조회 결과가 없다면 사용가능 리턴
		else  json.put("result", "fail");                      // step2-1: 조회 결과 있다면 사용불가능 리턴
		
		return json.toString();
	}
}
