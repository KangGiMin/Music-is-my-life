<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols"/>
  <link rel="icon" type="image/ico" href="/img/favicon.ico" />
  <title>Music is MyLife : 로그인</title>
  <style>
	   * {
		  margin: 0;
		  padding: 0;
		  box-sizing: border-box;
		  font-family: 'Noto Sans KR', '맑은 고딕', Arial, sans-serif;
	    }
	
		html, body {
		  width: 100%;
		  height: 100%;
		  margin: 0;
		  padding: 0;
		  overflow: hidden;
		  font-size: 10px;
		  background: radial-gradient(circle at top left, #ff8a00, #e52e71 70%);
		}
	
		body {
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  min-width: 100rem;
		  min-height: 70rem;
		}
		
		.main {
		  display: flex;
		  flex-direction: column;
		  justify-content: center;
		  align-items: center;
		  flex-wrap: wrap;
		  border: none;
		  width: 50rem;
		  height: 70rem;
		  background: white;
		  border-radius: 2.2rem;
		  box-shadow: 0 1.6rem 4rem rgba(229, 46, 113, 0.45),
		    0 0 4.5rem rgba(255, 62, 141, 0.2);
		  animation: fadeScaleUp 0.8s ease forwards;
		}
		
		@keyframes fadeScaleUp {
		  0% {opacity: 0; transform: scale(0.85);}
		  100% {opacity: 1; transform: scale(1);}
		}
		
		.main > .head {
		  text-align: center;
		  font-size: 5rem;
		  font-weight: 900;
		  color: #e52e71;
		  height: 10rem;
		  margin-bottom: 4rem;
		  animation: titleJump 1.2s ease infinite;
		}
		
		@keyframes titleJump {
		  0%, 100% {transform: translateY(0);}
		  50% {transform: translateY(-0.5rem);}
		}
		
		.main > .box + div {
		  display: flex;
		  align-items: center;
		  box-sizing: border-box;
		  padding-bottom: 1rem;
		  font-size: 1.5rem;
		  color: #e52e71;
		  width: 80%;
		  height: 3rem;
		}
		
		input {
		  border-radius: 1rem;
		  border: 0.2rem solid rgba(229, 46, 113, 0.3);
		  outline: none;
		  transition: all 0.3s ease;
		  padding-left: 2rem;
		  width: 40rem;
		  height: 5.5rem;
		  font-size: 1.8rem;
		  color: #444;
		}
		
		.box input:focus {
		  border-color: #e52e71;
		  box-shadow: 0 0 1rem rgba(229, 46, 113, 0.2);
		}
		
		input[type="submit"] {
		  background: linear-gradient(45deg, #e52e71, #ff3e8d);
		  border: none;
		  border-radius: 5rem;
		  text-align: center;
		  text-decoration: none;
		  font-size: 2rem;
		  font-weight: 700;
		  color: white;
		  cursor: pointer;
		  height: 6rem;
		  width: 65%;
		  margin-top: 2rem;
		  box-shadow: 0 1rem 2.2rem rgba(229, 46, 113, 0.5);
		  transition: all 0.35s cubic-bezier(.25,.8,.25,1);
		}
		
		input[type="submit"]:hover {
		  transform: translateY(-0.5rem);
		  box-shadow: 0 1.4rem 2.8rem rgba(255, 62, 141, 0.7);
		  background: linear-gradient(45deg, #ff3e8d, #e52e71);
		}
		
		/* 추가: 회원가입 링크 스타일 */
		.signup-link {
		  margin-top: 3rem;
		  font-size: 1.6rem;
		  color: #666;
		}
		
		.signup-link a {
		  color: #e52e71;
		  text-decoration: none;
		  font-weight: 600;
		  transition: all 0.3s ease;
		}
		
		.signup-link a:hover {
		  text-decoration: underline;
		}
  </style>
</head>
<body onload="doMsg()">
<form action="/member/loginAction" method="POST" onsubmit="return doSignUp();">
  <div class="main">
    <div class="head">Music is MyLife</div>
    <div class="box"><input type="text" name="member_id" placeholder="아이디" /></div><div></div>
    <div class="box"><input type="password" name="member_pw" placeholder="비밀번호" /></div><div></div>
    <!--<c:if test="${param.logTag eq 'fail'}">
    <div class="signup-link">로그인 정보가 일치하지 않습니다.</div>
    </c:if> -->
    <input type="submit" value="로그인" />
		<div class="signup-link">아직 회원이 아니신가요? <a href="/member/register">회원가입</a></div>
  </div>
</form>

<script>
/** init */
let doMsg = () => {
  let el, els = document.querySelectorAll('.box');
  let url = location.href;
  let queryString = url.split("?")[1];
  
  // 아이디 입력시 메시지 삭제
  el = els[0].children[0];
  el.onkeyup = e => {
    let el = e.target;
    
    if( el.value.length !== 0 ) {
      let msg = e.target.parentElement.nextElementSibling;
      msg.innerText = '';
    }
  }

  // 패스워드 입력시 메시지 삭제
  el = els[1].children[0];
  el.onkeyup = e => {
    let el = e.target;
    
    if( el.value.length !== 0 ) {
      let msg = e.target.parentElement.nextElementSibling;
      msg.innerText = '';
    }
  }
  
  // 로그인 실패시 메시지 보여주기(패스워드 메시지 칸에 보여줌)
  if( queryString == 'logTag=fail'){
	  let msg = el.parentElement.nextElementSibling;
    msg.innerText = '로그인 정보가 일치하지 않습니다.';  
  }
} // end of ## init

/** 필수항목 체크 */

function doSignUp() {
  let el, els = document.querySelectorAll('.box');
  
  // 아이디 공백 체크
  el = els[0].children[0];  
  
  if( el.value.length == 0) {
    let msg = el.parentElement.nextElementSibling;
    msg.innerText = '아이디를 입력해주세요.'; return false; 
  } 

  // 패스워드 공백 체크
  el = els[1].children[0];  
  if( el.value.length == 0) {
    let msg = el.parentElement.nextElementSibling;
    msg.innerText = '비밀번호를 입력해주세요.'; return false; 
  }
  
  return true;
} // end of ## doSignUp
</script>
</body>
</html>