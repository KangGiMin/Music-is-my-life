<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<meta charset="UTF-8" />
<style>
  #sidebar {
    width: 250px; /* 사이드바 고정 너비 */
    background-color: #fff;
    border-radius: 12px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08); /* 컨텐츠 박스와 동일한 그림자 */
    padding: 25px 0;
    flex-shrink: 0; /* 컨텐츠 너비 줄어도 사이드바 너비 유지 */
  }

  #category {
    list-style: none;
    padding: 0;
    margin: 0;
  }

  #category > li {
    line-height: 1; /* 기본 줄간격 초기화 */
    margin-bottom: 5px; /* 항목 간 간격 */
  }

  #category > li:last-child {
    margin-bottom: 0; /* 마지막 항목 하단 간격 제거 */
  }

  #category > li > a {
    display: block; /* 링크 전체 클릭 가능 영역으로 */
    padding: 12px 25px; /* 패딩으로 클릭 영역 넓히고 정돈 */
    margin: 0; /* 마진 초기화 */
    width: 100%;
    border-radius: 0; /* 둥근 모서리 제거, 목록 형태로 */
    border: none; /* 테두리 제거 */
    background-color: transparent; /* 배경색 투명으로 초기화 */
    color: #444; /* 기본 글자색 */
    font-weight: 600;
    text-decoration: none;
    transition: all 0.2s ease;
  }

  #category > li > a:hover {
    background-color: #fff3e0; /* 호버 시 연한 핑크 배경 */
    color: #e52e71; /* 글자색 강조 */
  }

  /* 선택된 카테고리 스타일 (선택된 카테고리에 'active' 클래스 추가하면 됨) */
  #category > li > a.active {
    background-color: #ffe6dd; /* 활성화된 항목 배경 */
    color: #e52e71;
    font-weight: 700;
  }
</style>

<div id="sidebar">
  <ul id="category">
    <li><a href="/post/view">전체 보기</a></li>
    <c:forEach var="emotion" items="${emotionList}">
      <li>
        <c:set var="description" value="${emotion.DESCRIPTION}" />
        <c:set
          var="cutDescription"
          value="${fn:substringBefore(description, '(')}"
        />
        <a href="/post/view/${emotion.EMOTION_CODE}">${cutDescription}</a>
      </li>
    </c:forEach>
  </ul>
</div>

<script></script>
