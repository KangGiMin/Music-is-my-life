<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/ico" href="/img/favicon.ico" />
<link rel="stylesheet" href="/css/common.css" />
<style>
main>div:nth-child(1) {
	text-align: left;
}

input[type="submit"] {
	background-color: #e52e71;
	border: none;
	border-radius: 1px;
	text-align: center;
	text-decoration: none;
	color: white;
	cursor: pointer;
	height: 45px;
	width: 100px;
}

.commentBtn>a {
	width: 30px;
	height: 25px;
	font-size: 10px;
	text-align: center;
	background-color: white;
	color: black;
}

.commentHead {
	height: 30px;
	text-align: left;
	font-size: 12px;
	font-weight: bold;
}

.commentContents {
	height: 40px;
	text-align: left;
	font-size: 15px;
	margin: 10px 0;
}
</style>
</head>
<body>
	<main>
		<!-- ///// 총 댓글 수 (수정함. count.cnt아니고 count긔윤)/////-->
		<div>댓글 ${ count }</div>
		<!--  ///// 댓글쓰기란 ///// -->
		<c:if test="${ login.member_id != null }">
			<div>
				<form action="/comment/commentWrite" method="post"
					onsubmit="return doCheck();">
					<!-- 이것도 수정함ㅋㅋㅋ -->
					<input type="hidden" name="post_id" value="${ post.POST_ID }" />
					<!--  게시글 번호가져오기 -->
					<input type="hidden" name="member_id" value="${ login.member_id }" />
					<textarea name="content" placeholder="댓글을 입력해주세요"></textarea>
					<input type="submit" value="등록" />
				</form>
			</div>
		</c:if>
		<hr>
		<!--  ///// 댓글 리스트 ///// -->
		<div>
			<c:forEach var="comment" items="${ comment }">
				<div class="commentHead">
					<span>작성자: ${ comment.member_id } | </span>
					<c:if test="${  comment.updated_at == null }">
						<span>작성일: ${ comment.created_at }</span>
					</c:if>
					<c:if test="${  comment.updated_at != null }">
						<span>작성일: ${ comment.updated_at }</span>
					</c:if>
				</div>
				<div class="commentContents">
					<span>${ comment.content }</span>
					<!--  로그인 아이디와 댓글작성자 아이디가 일치하면 수정/삭제 버튼을 보여준다 -->
					<c:if test="${ login.member_id == comment.member_id }">
						<span class="commentBtn"><a
							href="/comment/commentUpdateForm?comment_id=${ comment.comment_id}&post_id=${ comment.post_id }">[수정]</a></span>
						<span class="commentBtn"><a
							href="/comment/commentDel?comment_id=${ comment.comment_id}&post_id=${ comment.post_id }">[삭제]</a></span>
					</c:if>
				</div>
				<hr>
			</c:forEach>
		</div>
	</main>
	<script>
    let doCheck = () => {
      let contents = document.getElementsByTagName("textarea")[0];
      
      if(contents.value.length == 0){
        alert('댓글내용을 입력해주세요');
        contents.focus();
        return false;
      }
      return true;
    }
  </script>
</body>
</html>