<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols"/>
  <link rel="icon" type="image/ico" href="/img/favicon.ico" />
  <title>Music is MyLife : 비밀번호 변경</title>
  <style>
    * { margin : 0; padding:0;
    box-sizing : border-box; }  
    html,body{
      width: 100%; height: 100%;
      margin: 0;
      padding: 0;
      overflow: hidden;
      font-size: 10px; /* 삭제하면 안됨 */
      font-family: 'Nanum Gothic', '맑은 고딕', Arial, sans-serif;
      color: #333;
      background-color: #f9f9f9; }
    body{
      display: flex;
      justify-content: center;
      align-items: center;
      min-width: 100rem;     /* 1rem 은 html태그의 폰트사이즈임 // 10px => 1rem , 0.1rem => 1px */
      min-height: 70rem; }
    /** === 전체 테두리 ===**/  
    .main{ 
      display: flex;
      flex-direction: column; 
      justify-content: center;
      align-items: center;
      flex-wrap: wrap;
      border: 0.1rem solid orange; 
      width: 50rem; 
      height: 70rem; }
    /** === 항목체크 메시지 표시 ===**/  
    .main > .box + div{
      display: flex;
      align-items: center;
      box-sizing: border-box;
      padding-bottom: 1rem;
      font-size: 1.2rem;
      color: #ff6600;
      width: 80%;
      height: 3rem; }
    /** === 텍스트로고: Music is MyLife **/  
    .main > .head {
      color: #ff6600;
      text-align: center;
      font-size: 5rem;
      height: 10rem; }
    /** === input ===**/  
    input {
      border-radius: 0.5rem;
      outline: none;
      border: 0.15rem solid #a6a6a6;
      transition: 3s;
      padding-left: 1rem;
      width: 40rem;
      height: 5rem; }
    .box input:focus { border-color: #ff6600; }
    /** === btn비밀번호 수정 ===**/
    input[type="submit"] {
      background-color: #ff6600;
      border: none;
      border-radius: 0.4rem;
      text-align: center;
      text-decoration: none;  
      font-size: 2rem;
      color: white;
      cursor: pointer;
      height: 5rem;
      width: 65%; }
    /** === btn비밀번호수정: 비활성화 ===**/
    input[type="submit"]:disabled{
      background-color: #cccccc;
    }
  </style>
</head>
<body onload="init()">
  <form action="/member/updateKey" method="POST" onsubmit="return doSignUp();">
    <div class="main">
      <div class="head">Music is MyLife</div>
      <div class="box"><input name="member_id" placeholder="아이디" /></div><div></div>
      <div class="box"><input name="member_pw" placeholder="비밀번호" /></div><div></div>
      <div class="box"><input name="member_repwd" placeholder="비밀번호 확인" /></div><div></div>
      <input id="btnsend" type="submit" value="비밀번호 수정" />
    </div>
  </form>

  <script>
     /** init */
    let init = () => {
      let el, els = document.querySelectorAll('.box');
      let btnsendEl = document.getElementById('btnsend'); //수정버튼 활성 or 비활성화
      
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
        	  btnsendEl.disabled = false;
          }
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
        	  btnsendEl.disabled = false;
          }
        } 
      }
      
    } // End of ## init

    /** 비밀번호 숫자, 영문, 특수문자 체크*/
    let checkPassword = str =>  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/.test(str);
    /** 비밀번호 재입력 체크 */
    let isMatch = (password1, password2) => password1 === password2;
    
    /** 필수항목 체크 */
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
     
      return true;
    } // End of ## 필수항목 체크

  </script>
  
</body>
</html>