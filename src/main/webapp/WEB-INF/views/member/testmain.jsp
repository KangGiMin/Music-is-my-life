<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트 메인페이지</title>

<link rel="icon" type="image/ico" href="/img/favicon.ico" />
<link rel="stylesheet"  href="/css/common.css" /> 

</head>
<body>
  <main>
   <hr>
   내 아이디: ${ login.member_id }
   <hr>
   <!-- 로그인성공시 내 정보 보기 버튼 보이고, 실패시 회원가입 페이지 또는 비밀번호 변경페이지로 이동할 수 있도록한다 -->
   <c:if test="${ login.member_id != null }">
	   <form action="/member/mypage" method="POST">
	     <input type="hidden" name="member_id" value="${ login.member_id }">
	     <input type="submit" value="내 정보 보기" >
	     <span>${ login.member_nickname }</span>
	   </form> 
   </c:if>
   <c:if test="${ login.member_id == null }">
    <a href="/member/register">회원가입</a>
    <a href="/member/loseKey">비밀번호 분실</a>
   </c:if> 
   <!-- 로그인성공시 로그아웃 버튼 보이고, 실패시 로그인 페이지로 이동할 수 있도록한다 -->
   <hr>
   <c:if test="${ login.member_id != null }">
     <form action="/member/logout" method="POST">
       <input type="hidden" name="member_id" value="${ login.member_id }">
       <input type="submit" value="로그아웃" >
     </form> 
   </c:if>
   <c:if test="${ login.member_id == null }">
    <a href="/member/login">로그인</a>
   </c:if> 
  </main>
 
</body>
</html>