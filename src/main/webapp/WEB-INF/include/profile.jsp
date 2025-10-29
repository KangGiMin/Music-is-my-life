<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8" />
<style>
  /* 프로필 박스 전체 스타일 */
  /* 프로필 박스 전체 스타일 */
  #profileBox {
    display: flex;
    flex-direction: column;
    text-align: center;
    justify-content: center;
    width: 230px;
    padding: 25px 15px;
    border-radius: 12px;
    background-color: white;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
    margin-bottom: 20px;
    border: none;
  }

  /* 닉네임 텍스트 스타일 */
  #profileBox > div:first-child {
    font-size: 18px;
    font-weight: 700;
    color: #e52e71;
    margin-bottom: 8px;
  }

  /* 환영 메시지 스타일 */
  #profileBox > div:nth-child(2) {
    font-size: 15px;
    color: #555;
    margin-bottom: 15px;
  }

  /* 버튼 공통 스타일 */
  .linkBTN a {
    display: inline-block;
    width: 120px;
    padding: 10px 0;
    margin: 5px 0;
    font-size: 14px;
    font-weight: 600;
    color: white;
    background: linear-gradient(45deg, #e52e71, #ff3e8d);
    border-radius: 25px;
    text-decoration: none;
    transition: all 0.3s ease;
    box-shadow: 0 4px 10px rgba(229, 46, 113, 0.3);
  }

  .linkBTN a:hover {
    transform: translateY(-3px);
    box-shadow: 0 6px 15px rgba(229, 46, 113, 0.5);
    background: linear-gradient(45deg, #ff3e8d, #e52e71);
  }

  /* 로그인/로그아웃 상태 표시 */
  .login {
    display: none;
  }

  .logout {
    display: block;
    margin: 3px 0;
  }
</style>

<div id="profileBox">
  <c:if test="${ login.member_id != null }">
    <div>${ login.member_nickname } 님,</div>
    <div>반갑습니다.</div>
  </c:if>
  <c:if test="${ login.member_id != null }">
    <div class="linkBTN logout">
      <a href="/member/mypage?member_id=${ login.member_id }">마이페이지</a>
    </div>
  </c:if>
  <c:if test="${ login.member_id == null }">
    <div class="linkBTN logout"><a href="/member/login">로그인</a></div>
    <div class="linkBTN logout"><a href="/member/register">회원가입</a></div>
  </c:if>
  <c:if test="${ login.member_id != null }">
    <div class="linkBTN logout"><a href="/member/logout">로그아웃</a></div>
  </c:if>
</div>

<script></script>
