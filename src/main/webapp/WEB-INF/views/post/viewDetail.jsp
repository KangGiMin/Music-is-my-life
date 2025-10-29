<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="icon" type="image/ico" href="/img/favicon.ico" />
<link rel="stylesheet" href="/css/common.css" />
<style type="text/css">
/* 전체 게시글 컨테이너 */
#postContainer {
	width: 90%;
	max-width: 900px;
	margin: 40px auto;
	font-family: "Noto Sans KR", "맑은 고딕", Arial, sans-serif;
	color: #333;
}

#titleContainer {
  display: flex;
  align-items: center;
  gap: 10px; /* 버튼과 제목 사이 간격 */
  margin-bottom: 15px;
}

#postContents {
 margin-top : 15px;
}

#titleContainer button,
#titleContainer .btn-edit,
#titleContainer .btn-delete {
  background-color: #ff6f00;
  border: none;
  border-radius: 20px;
  color: white;
  padding: 6px 16px;
  font-size: 14px;
  cursor: pointer;
  transition: background-color 0.3s ease;
  height: 36px;
  line-height: 24px;
  white-space: nowrap;
}

#titleContainer .btn-edit,
#titleContainer .btn-delete{
width : 60px;}

#titleContainer button {
  font-weight: bold;
  font-size: 16px;
}

#titleContainer button:hover,
#titleContainer .btn-edit:hover {
  background-color: #ff8f00;
}

#titleContainer .btn-delete {
  background-color: #d32f2f;
  margin-left: 8px;
}

#titleContainer .btn-delete:hover {
  background-color: #e53935;
}

#titleContainer h2 {
  margin: 0;
  font-size: 22px;
  font-weight: 700;
  flex-grow: 1;
  text-align: center;
}

#youtubeLink {
  margin-left: auto;
}

#youtubeLink a {
  background-color: #f06292;
  padding: 6px 14px;
  border-radius: 20px;
  color: white;
  text-decoration: none;
  font-weight: 600;
  font-size: 14px;
  white-space: nowrap;
  transition: background-color 0.3s ease;
}

#youtubeLink a:hover {
  background-color: #f48fb1;
}text-decoration: underline;

/* 전체 작성자·날짜·조회수 컨테이너 */
#postInfoContainer {
	display: flex;
	justify-content: space-between;  
	margin: 0 auto 30px; 
	font-size: 1rem;
	color: #666;
	user-select: none;
	border-bottom: 1px solid #eee;
	/* 경계선 넣어 깔끔 */
	padding-bottom: 12px;
}

/* 작성자, 날짜, 조회수 각각 그룹 */
.postInfo {
	display: flex;
	justify-content: space-between;  
	gap: 30px;
	font-weight: 600;
	color: #555;
}

/* 작성자 및 기타 텍스트 요소에 마진 작은 간격 */
.postInfo>div {
	padding: 2px 8px;
	background: #fafafa;
	border-radius: 20px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.08);
	white-space: nowrap;
	transition: background-color 0.3s ease;
}

/* 호버시 약간 배경색 변하게 해줘서 인터랙티브 느낌 */
.postInfo>div:hover {
	background-color: #f0d0d6;
	color: #e52e71;
	box-shadow: 0 2px 6px rgba(229, 46, 113, 0.25);
	cursor: default;
}

/* 게시글 본문 */
#contentsContainer {
	max-width: 900px;
	margin: 0 auto;
}

/* 본문 내용 스타일 */
#postContents {
	padding: 20px 25px;
	background: white;
	border-radius: 15px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.12);
	min-height: 500px;
	font-size: 1.15rem;
	line-height: 1.7;
	color: #444;
	white-space: pre-wrap;
	word-break: break-word;
}

b {
color : blue;}
</style>
</head>

<body>
	<main>
		<div id="postContainer">
			<div id="titleContainer">
				<button id="backBTN">←</button>

				<c:if test="${login.member_id == post.MEMBER_ID}">
					<a href="/post/edit/${post.POST_ID}" class="btn-edit">수정</a>
					<a href="/post/delete/${post.POST_ID}" class="btn-delete"
						onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a>
				</c:if>

				<h2>${post.TITLE}</h2>

				<div id="youtubeLink">
					<a href="${post.YOUTUBE_LINK}" target="_blank">유투브가서 바로봐야징</a>
				</div>
			</div>
			<div id="postInfoContainer">
				<div class="postInfo">
					<div><b>글번호</b> ${post.POST_ID}</div>
					<div><b>닉네임</b> ${post.MEMBER_NICKNAME}</div>
				</div>
				<div class="postInfo">
					<div><b>날짜</b> ${post.CREATED_AT}</div>
					<div><b>조회수</b> ${post.VIEW_COUNT}</div>
				</div>
			</div>
			<div id="contentsContainer">
				<div id="postContents">${post.CONTENTS}</div>
			</div>
		</div>
		<%@include file="/WEB-INF/views/comment/commentList.jsp"%>
	</main>
	<script>
      document.getElementById("backBTN").addEventListener("click",
        function () {
          location.href = "/post/view";
        });
    </script>
</body>

</html>