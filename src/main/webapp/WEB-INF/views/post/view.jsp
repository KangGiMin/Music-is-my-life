<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>음악세상</title>
    <link rel="icon" type="image/ico" href="/img/favicon.ico" />
    <link rel="stylesheet" href="/css/common.css" />
    <style>
      /* 전체 배경은 아주 연하게. 흰색 배경의 컨텐츠가 돋보이도록 */
      body {
        background-color: #f7f7f7; /* 은은한 회색 배경 */
      }

      main {
        max-width: 1200px; /* 게시판 넓이 조절 (더 넓게 보여도 좋을 듯!) */
        margin: 40px auto; /* 중앙 정렬, 상하 여백 */
        padding: 20px; /* 좌우 패딩 */
      }

      h1 {
        color: #e52e71; /* 랜딩페이지 타이틀 색상 유지 */
        text-align: center;
        margin-bottom: 30px;
        font-size: 2.5rem;
        font-weight: 800;
        letter-spacing: -1px;
      }

      #container {
        display: flex;
        gap: 30px; /* 사이드바와 컨텐츠 사이 간격 추가 */
        align-items: flex-start; /* 상단 정렬 */
      }

      .content {
        width: 100%;
      }

      /* 게시글 목록 테이블 스타일 개선 */
      .post-list {
        width: 100%;
        border-collapse: separate; /* border-spacing 적용 위해 */
        border-spacing: 0;
        font-family: "Noto Sans KR", sans-serif;
        background-color: #fff;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08); /* 더 부드러운 그림자 */
        border-radius: 12px;
        overflow: hidden; /* 둥근 모서리에 맞게 내용 잘림 */
      }

      .post-list thead tr {
        background: linear-gradient(
          90deg,
          #ff8a00,
          #e52e71
        ); /* 랜딩 페이지 그라데이션 적용 */
        color: white;
        font-weight: 700;
        font-size: 1.05rem;
        text-align: left;
        user-select: none;
      }

      .post-list thead th {
        text-align: center;
        padding: 18px 20px; /* 헤더 패딩 늘리기 */
        border-bottom: none; /* 이전 border-bottom 제거 */
        white-space: nowrap; /* 제목, 작성일 등 줄바꿈 방지 */
      }

      /* 바디 셀 - 기본 텍스트 색상 및 간격 */
      .post-list tbody td {
        padding: 15px 20px; /* 바디 패딩 늘리기 */
        border-bottom: 1px solid #f0f0f0; /* 더 연한 구분선 */
        vertical-align: middle;
        color: #444;
        font-size: 0.95rem;
      }

      /* 링크 스타일 - 이전처럼 버튼 느낌 나던 배경 제거 */
      .post-list tbody td a {
        color: #555; /* 제목 링크 색상 */
        font-weight: 600;
        text-decoration: none;
        transition: color 0.3s ease, text-shadow 0.3s ease;
        border-radius: 0; /* 배경 없으므로 필요없음 */
        background-color: transparent; /* ⭐ 이거 꼭 넣어줘! ⭐ */
      }

      .post-list tbody td a:hover {
        color: #e52e71; /* 호버 시 강조색 */
        text-decoration: none; /* 밑줄 다시 없앰 */
        text-shadow: 0 0 5px rgba(229, 46, 113, 0.3); /* 은은한 그림자 효과 */
      }

      /* 감정 태그 스타일 - 둥글고 예쁘게 */
      .emotion-tag {
        padding: 6px 12px;
        border-radius: 20px;
        color: white; /* 텍스트 흰색으로 변경 */
        font-size: 0.8rem;
        font-weight: 600;
        display: inline-flex; /* flex로 변경하여 내부 요소 중앙 정렬 가능 */
        align-items: center;
        justify-content: center;
        min-width: 60px; /* 최소 너비 지정 */
        text-align: center;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      }

      /* 홀짝 행 배경색 */
      .post-list tbody tr:nth-child(even) {
        background-color: #fcfcfc; /* 홀수행보다 더 연한 배경색 */
      }

      /* 마우스 오버 시 효과 - 더 부드러운 하이라이트 */
      .post-list tbody tr:hover {
        background-color: #ffeeed; /* 브랜드 색상과 어울리는 연한 핑크 */
        cursor: pointer;
        transition: background-color 0.25s ease;
      }

      /* 정렬 */
      .post-list tbody td:nth-child(1), /* 번호 */
    .post-list tbody td:nth-child(6) /* 조회수 */ {
        text-align: center;
        font-variant-numeric: tabular-nums;
        font-weight: 500;
      }

      .post-list tbody td:nth-child(5) {
        /* 작성일 */
        text-align: center;
        font-size: 0.85rem;
        color: #777;
        white-space: nowrap;
      }

      .post-list tbody td:nth-child(3) {
        /* 작성자 */
        text-align: center;
        font-weight: 500;
        color: #666;
      }
    </style>
  </head>
  <body>
    <%@include file="/WEB-INF/include/floatingBTN.jsp"%>
    <main>
      <h1 class="post-title">Music Is My Life</h1>
      <div id="container">
        <div>
          <%@include file="/WEB-INF/include/profile.jsp"%> <%@include
          file="/WEB-INF/include/sidebar.jsp"%>
        </div>
        <div class="content">
          <table class="post-list">
            <thead>
              <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>감정</th>
                <th>작성일</th>
                <th>조회수</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="post" items="${postList}">
                <tr>
                  <td>${post.POST_ID}</td>
                  <td>
                   <a href="/post/detail/${post.POST_ID}" onclick="increaseViewCount(${post.POST_ID}); return true;">${post.TITLE}</a>
                  </td>
                  <td>${post.MEMBER_NICKNAME}</td>
                  <td>
                    <span class="emotion-tag ${post.EMOTION_CODE}"
                      >${post.EMOTION_NAME}</span
                    >
                  </td>
                  <fmt:parseDate
                    var="parsedDate"
                    value="${post.CREATED_AT}"
                    pattern="yyyy-MM-dd HH:mm:ss"
                  />
                  <td>
                    <fmt:formatDate
                      value="${parsedDate}"
                      pattern="yyyy-MM-dd"
                    />
                  </td>
                  <td>${post.VIEW_COUNT}</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </main>
    <script>
      // 1단계: 일단 모든 태그 찾기
      const emotionTags = document.querySelectorAll(".emotion-tag");
      const emotionColors = {};

      // 2단계: 각 태그마다 코드 추출하고 색상 만들기
      console.log(emotionTags);
      emotionTags.forEach(function (tag) {
        // 클래스 목록에서 코드 찾기
        const classes = Array.from(tag.classList);
        console.log(classes);
        const code = classes.find(function (c) {
          return c !== "emotion-tag";
        });
        console.log(code);

        // 코드 있으면 진행
        if (code) {
          // 코드에서 간단하게 색상 생성
          let hashValue = 0;
          for (let i = 0; i < code.length; i++) {
            hashValue = (hashValue * 31 + code.charCodeAt(i)) % 360;
            console.log(hashValue, "?");
          }

          // 색상 저장
          emotionColors[code] = "hsl(" + hashValue + ", 70%, 45%)";
          console.log(emotionColors);

          // 태그에 색상 적용
          tag.style.backgroundColor = emotionColors[code];
          tag.style.color = "#fff";

          // 디버깅용 (백틱 대신 일반 문자열 연결 사용)
          console.log(
            '코드 "' + code + '"에 색상 ' + emotionColors[code] + " 적용됨"
          );
        }
      });
      
      function increaseViewCount(postId) {
    	  // AJAX 요청으로 조회수 증가 처리
    	  fetch('/post/increaseViewCount/' + postId, {
    	    method: 'POST',
    	  })
    	  .then(response => {
    	    console.log('조회수 증가 완료');
    	  })
    	  .catch(error => {
    	    console.error('조회수 증가 실패:', error);
    	  });
    	}
      
    </script>
  </body>
</html>