<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/ico" href="/img/favicon.ico" />
<link rel="stylesheet"  href="/css/common.css" />
<style>
  input[type="submit"]{         
    background-color: #e52e71;
    border: none;
    border-radius: 1px;
    text-align: center;
    text-decoration: none;  
    color: white;
    cursor: pointer;
    height: 45px;
    width: 100px; }
</style>
</head>
<body>
  <main>
    <form action="/comment/commentUpdate" method="post" onsubmit="return doCheck();">
      <input type="hidden" name="post_id" value="${ comment.post_id }" /> <!--  게시글 번호가져오기 -->
      <input type="hidden" name="comment_id" value="${ comment.comment_id }" />
      <input type="hidden" name="member_id" value="${ login.member_id }" />
      <div>
        <textarea name="content">${ comment.content }</textarea>
      </div>
      <div>
         <input type="submit" value="확인">
         <input type="submit" value="취소">
      </div>
    </form>
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