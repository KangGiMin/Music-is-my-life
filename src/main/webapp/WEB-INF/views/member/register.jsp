<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols"/>
  <link rel="icon" type="image/ico" href="/img/favicon.ico" />
  <title>Music is MyLife : 회원가입</title>
  <style>
			* {
			  margin: 0; padding:0;
			  box-sizing: border-box;
			  font-family: 'Noto Sans KR', '맑은 고딕', Arial, sans-serif;
			}  
			
			html,body{
			  width: 100%; height: 100%;
			  margin: 0; padding: 0;
			  overflow: hidden;
			  font-size: 10px; /* 1rem = 10px */
			  background: radial-gradient(circle at top left, #ff8a00, #e52e71 70%); /* 메인 테마 그라데이션 */
			}
			
			body{
			  display: flex;
			  justify-content: center;
			  align-items: center;
			  min-width: 100rem;
			  min-height: 70rem;
			}
			
			/** === 전체 테두리 === **/
			.main{ 
			  display: flex;
			  flex-direction: column; 
			  justify-content: center;
			  align-items: center;
			  flex-wrap: wrap;
			  border: none; /* 기존 테두리 제거 */
			  width: 50rem; 
			  height: 70rem;
			  background: white; /* 흰색 배경 */
			  border-radius: 2.2rem; /* 둥근 모서리 */
			  box-shadow: 0 1.6rem 4rem rgba(229, 46, 113, 0.45), /* 깊이감 있는 그림자 */
			              0 0 4.5rem rgba(255, 62, 141, 0.2);
			  animation: fadeScaleUp 0.8s ease forwards; /* 등장 애니메이션 */
			}
			
			/* 등장 애니메이션 키프레임 */
			@keyframes fadeScaleUp {
			  0% {opacity: 0; transform: scale(0.85);}
			  100% {opacity: 1; transform: scale(1);}
			}
			
			/** === 항목체크 메세지표시 **/  
			.main > .box + div{
			  display: flex;
			  align-items: center;
			  box-sizing: border-box;
			  padding-bottom: 1rem;
			  font-size: 1.5rem; /* 메시지 글자 크기 조정 */
			  color: #e52e71; /* 브랜드 컬러로 변경 */
			  width: 80%;
			}
			
			/** === 텍스트로고: Music is MyLife **/  
			.main > .head {
			  color: #e52e71; /* 브랜드 컬러로 변경 */
			  text-align: center;
			  font-size: 5rem;
			  font-weight: 900; /* 더 굵게 */
			  height: 10rem;
			  margin-bottom: 4rem; /* 여백 추가 */
			  animation: titleJump 1.2s ease infinite; /* 흔들리는 애니메이션 */
			}
			
			/* 타이틀 흔들림 애니메이션 키프레임 */
			@keyframes titleJump {
			  0%, 100% {transform: translateY(0);}
			  50% {transform: translateY(-0.5rem);}
			}
			
			/**=== input ===**/  
			input {
			  border-radius: 1rem; /* 둥근 모서리 */
			  outline: none;
			  border: 0.2rem solid rgba(229, 46, 113, 0.3); /* 연한 브랜드 컬러 테두리 */
			  transition: all 0.3s ease; /* 애니메이션 효과 */
			  padding-left: 2rem; /* 패딩 넓히기 */
			  width: 40rem;
			  height: 5.5rem; /* 높이 조정 */
			  font-size: 1.8rem; /* 글자 크기 조정 */
			  color: #444; /* 글자색 조정 */
			}
			
			.box input:focus { 
			  border-color: #e52e71; /* 포커스 시 브랜드 컬러 강조 */
			  box-shadow: 0 0 1rem rgba(229, 46, 113, 0.2); /* 은은한 그림자 효과 */
			}
			
			/**=== btn회원가입 ===**/
			input[type="submit"] {
			  background: linear-gradient(45deg, #e52e71, #ff3e8d); /* 그라데이션 배경 */
			  border: none;
			  border-radius: 5rem; /* 완전 둥근 버튼 (필박스) */
			  text-align: center;
			  text-decoration: none;  
			  font-size: 2rem;
			  font-weight: 700; /* 더 굵게 */
			  color: white;
			  cursor: pointer;
			  height: 6rem; /* 높이 조정 */
			  width: 65%;
			  margin-top: 2rem; /* 위쪽 여백 */
			  box-shadow: 0 1rem 2.2rem rgba(229, 46, 113, 0.5); /* 그림자 */
			  transition: all 0.35s cubic-bezier(.25,.8,.25,1); /* 부드러운 애니메이션 */
			}
			
			input[type="submit"]:hover {
			  transform: translateY(-0.5rem); /* 호버 시 살짝 위로 */
			  box-shadow: 0 1.4rem 2.8rem rgba(255, 62, 141, 0.7); /* 그림자 더 강조 */
			  background: linear-gradient(45deg, #ff3e8d, #e52e71); /* 그라데이션 반전 */
			}
			
			/**=== btn회원가입: 비활성화 ==**/  
			input[type="submit"]:disabled{
			  background-color: #cccccc;
			  box-shadow: none; /* 그림자 제거 */
			  cursor: not-allowed; /* 커서 변경 */
			  transform: translateY(0); /* 호버 효과 제거 */
			}
  </style>
</head>
<body onload="init()">
  <form action="/member/insert" method="POST" onsubmit="return doSignUp();">
    <div class="main">
      <div class="head">Music is MyLife</div>
      <div class="box"><input type="text" name="member_id" placeholder="아이디" /></div><div></div>
      <div class="box"><input type="password" name="member_pw" placeholder="비밀번호" /></div><div></div>
      <div class="box"><input type="password" name="member_repwd" placeholder="비밀번호 확인" /></div><div></div>
      <div class="box"><input type="text" name="member_nickname" placeholder="닉네임" /></div><div></div>
      <div class="box"><input type="text" name="member_email" placeholder="이메일" /></div><div></div>
      <input id="btnsend" type="submit" value="회원가입" />
    </div>
  </form>

  <script>
     /** init */
    let init = () => {
      let el, els = document.querySelectorAll('.box');
      let btnsendEl = document.getElementById('btnsend'); //가입버튼 활성 or 비활성화
      
      // 아이디 유효성 체크
      el = els[0].children[0];
      el.onkeyup = e => {
        let el = e.target;
        
        if( el.value.length !== 0 ) {
          let msg = e.target.parentElement.nextElementSibling;

          if( onlyNumberAndEng(el.value) === false ) {
        	  msg.innerText = '아이디: 영문 또는 숫자만 가능합니다.';
        	  btnsendEl.disabled = true;
          } else if( idLength(el.value) === false ) {
        	  msg.innerText = '아이디: 5~20자의 글자여야 합니다.';
        	  btnsendEl.disabled = true; } 
        } 
      }
      // 아이디 중복 체크
      el = els[0].children[0];
      el.onblur = e => {
    	  let el = e.target;
    	  if (( onlyNumberAndEng(el.value) || idLength(el.value) )){
          verifyUserId(el.value); }
      }
      
      // 비밀번호 유효성 체크
      el = els[1].children[0]; 
      el.onkeyup = e => {
        let el = e.target;

        if( el.value.length !== 0 ) {
          let msg = e.target.parentElement.nextElementSibling;

          if( checkPassword(el.value) === false ) {
        	  msg.innerText = '비밀번호: 8글자 이상의 영문, 숫자, 특수문자 조합으로 사용하세요.';
        	  btnsendEl.disabled = true;
          } else {
        	  msg.innerText = '';
        	  btnsendEl.disabled = false; }
        } 
      }

      // 비밀번호 재입력란 일치 체크
      el = els[2].children[0]; 
      el.onkeyup = e => {
        let el = e.target;

        if( el.value.length !== 0 ) {
          let msg = e.target.parentElement.nextElementSibling;

          if( isMatch(els[1].children[0].value, el.value) === false ) {
        	  msg.innerText = '비밀번호 확인: 비밀번호와 일치하지 않습니다.';
        	  btnsendEl.disabled = true;
          } else {
        	  msg.innerText = '';
        	  btnsendEl.disabled = false; }
        } 
      }
      
      // 닉네임 중복 체크
      el = els[3].children[0];
      el.onblur = e => {
        let el = e.target;
        verifyNickName(el.value);
      }
      
      // 이메일 유효성 체크
      el = els[4].children[0]; 
      el.onkeyup = e => {
        let el = e.target;
        
        if( el.value.length !== 0 ) {
          let msg = e.target.parentElement.nextElementSibling;

          if( validateEmail(el.value) === false ) {
        	  msg.innerText = '유효하지 않은 이메일입니다.';
        	  btnsendEl.disabled = true;
          } else {
        	  msg.innerText = '';
        	  btnsendEl.disabled = false; }
        } 
      }
    } // End of ## init

    /** 아이디: 글자수 제한 체크*/
    let idLength = value => value.length >= 5 && value.length <= 20;
    /** 아이디: 숫자, 영문 제한 체크*/
    let onlyNumberAndEng = str =>  /^[A-Za-z0-9][A-Za-z0-9]*$/.test(str);
    /** 비밀번호: 숫자, 영문, 특수문자 체크*/
    let checkPassword = str =>  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/.test(str);
    /** 비밀번호: 재입력 체크 */
    let isMatch = (password1, password2) => password1 === password2;
    /** 이메일: 유효성 체크 */
    let validateEmail = (email) => /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+$/.test(email);

    /** 필수항목 입력체크 */
    function doSignUp() {
      let el, els = document.querySelectorAll('.box');
      
      el = els[0].children[0]; 
      if( el.value.length == 0 ) {
        let msg = el.parentElement.nextElementSibling;

        msg.innerText = '아이디를 입력해주세요.'; return false;
      }
      
      el = els[1].children[0]; 
      if( el.value.length == 0 ) {
        let msg = el.parentElement.nextElementSibling;

        msg.innerText = '비밀번호를 입력해주세요.'; return false;
      }
      
      el = els[2].children[0]; 
      if( el.value.length == 0 ) {
        let msg = el.parentElement.nextElementSibling;

        msg.innerText = '비밀번호 확인을 입력해주세요.'; return false;
      }
      
      el = els[3].children[0]; 
      if( el.value.length == 0 ) {
        let msg = el.parentElement.nextElementSibling;

        msg.innerText = '닉네임을 입력해주세요.'; return false;
      }
      
      el = els[4].children[0]; 
      if( el.value.length == 0 ) {
        let msg = el.parentElement.nextElementSibling;

        msg.innerText = '이메일을 입력해주세요.'; return false;
      }

      return true;
    } // End of ## 필수항목 체크

    /** 아이디 중복 체크 */
    let verifyUserId = userId => {
    	let btnsendEl = document.getElementById('btnsend'); //가입버튼 활성 or 비활성화
    	let url = "/member/ajaxIdChk";
    	let json = { CheckId: userId };
      let data = {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(json) };

      fetch(url, data)
        .then(response => response.json())
        .then(data => { // 정상적인 통신이 되었을 때 실행되는 콜백
        	let el = document.getElementsByTagName("input")[0].parentElement.nextElementSibling;
        	
          if(data.result == "success"){ // 사용 가능
            el.innerText = "사용가능한 아이디입니다.";
            btnsendEl.disabled = false;
          } else{ // 사용 불가능
            el.innerText = "이미 사용중인 아이디입니다.";
            btnsendEl.disabled = true; }        	
        })
        .catch(error => console.log("error:", error)) // 정상적인 통신이 안 되었을 경우 실행되는 콜백
    } // End of verifyUserId*/
        
    /** 닉네임 중복 체크 */
    let verifyNickName = userNickName => {
      let btnsendEl = document.getElementById('btnsend'); //가입버튼 활성 or 비활성화
      let url = "/member/ajaxNickNameChk";
      let json = { CheckNickName: userNickName };
      let data = {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(json) };

      fetch(url, data)
        .then(response => response.json())
        .then(data => { // 정상적인 통신이 되었을 때 실행되는 콜백
          let el = document.getElementsByTagName("input")[3].parentElement.nextElementSibling;
          
          if(data.result == "success"){ // 사용 가능
            el.innerText = "사용가능한 닉네임입니다.";
            btnsendEl.disabled = false;
          } else{ // 사용 불가능
            el.innerText = "이미 사용중인 닉네임입니다.";
            btnsendEl.disabled = true; }         
        })
        .catch(error => console.log("error:", error)) // 정상적인 통신이 안 되었을 경우 실행되는 콜백
    } // End of verifyNickName*/
  </script>
  
</body>
</html>