<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols"/>
  <link rel="icon" type="image/ico" href="/img/favicon.ico" />
  <title>Music is MyLife : 마이페이지</title>
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
  flex-direction: column; 
  justify-content: center;
  align-items: center;
  min-width: 100rem;
  min-height: 70rem;
}

/** === wrapper === **/  
.wrap { 
  width: 45rem; 
  height: 70rem;
  animation: fadeScaleUp 0.8s ease forwards;
}

@keyframes fadeScaleUp {
  0% {opacity: 0; transform: scale(0.85);}
  100% {opacity: 1; transform: scale(1);}
}

/** === 항목 box === **/  
.main {       
  display: flex;
  flex-direction: column; 
  justify-content: start;
  flex-wrap: wrap;
  overflow: hidden;
  border: none;
  border-radius: 1.6rem; 
  background-color: white;
  box-shadow: 0 1.6rem 4rem rgba(229, 46, 113, 0.35);
  width: 45rem; 
  margin-bottom: 2rem;
}

.wrap > .main:nth-child(1) { 
  border: none;
  box-shadow: none;
  background-color: transparent;
  text-align: center; 
  font-size: 5rem;
  font-weight: 900;
  color: white; 
  height: 8rem; 
  margin-bottom: 1rem;
  animation: titleJump 1.2s ease infinite;
}

@keyframes titleJump {
  0%, 100% {transform: translateY(0);}
  50% {transform: translateY(-0.5rem);}
}

.wrap > .main:nth-child(2) { height: 45rem; }
.wrap > .main:nth-child(3) { height: 20rem; }    

/** === main > title === **/
.title {    
  background: linear-gradient(45deg, #e52e71, #ff8a00);
  font-size: 1.8rem;
  font-weight: 700; 
  color: white;      
  width: 100%;
  height: 5rem;
  padding: 1.8rem 2.5rem 0;
  margin-bottom: 3rem;
  border-radius: 1.6rem 1.6rem 0 0;
}

/** === main > box === **/  
.box {
  font-size: 1.2rem;
  padding: 0 2.5rem;
  width: 100%;
  height: 6.8rem;
}

/** === inputStyle :: 폰트아이콘 + input 처리 === **/
.inputWrap {
  display: flex;
  align-items: center;
}

.inputStyle {
  border: none;
  background: transparent;
  outline: none;
  border-bottom: 0.2rem solid rgba(229, 46, 113, 0.3);
  height: 3.5rem;
  width: 100%; 
  margin: 1rem;
  font-size: 1.6rem;
  color: #444;
  transition: border-color 0.3s ease;
}

.inputStyle:focus {
  border-color: #e52e71;
}

.material-symbols {
  color: #e52e71;
  font-size: 2rem;
}

/** === btn수정 === **/
input[type="submit"], [type="button"] {
  background: linear-gradient(45deg, #e52e71, #ff3e8d);
  border: none;
  border-radius: 2.5rem;
  text-align: center;
  text-decoration: none;  
  font-size: 1.5rem;
  font-weight: 700;
  color: white;
  cursor: pointer;
  margin: 0 2rem;
  width: 10rem;
  height: 3.5rem;
  box-shadow: 0 0.5rem 1.5rem rgba(229, 46, 113, 0.4);
  transition: all 0.3s ease;
}

input[type="submit"]:hover, [type="button"]:hover {
  transform: translateY(-0.3rem);
  box-shadow: 0 0.8rem 2rem rgba(229, 46, 113, 0.6);
}
  </style>
</head>
<body>
  <div class="wrap">
    <div class="main">Music is MyLife</div>
    <!-- ///// 개인 정보 box ///// -->
    <div class="main">
      <div class="title">기본정보</div>
      <form action="/member/UpdateForm" method="post">
	      <div class="box inputWrap">
	        <span class="material-symbols">artist</span>
	        <input class="inputStyle" type=“text” name="member_id" value="${ member.member_id }" />
	      </div>
	      <div class="box inputWrap">
	        <span class="material-symbols">lock</span>
	        <input class="inputStyle" type="password" name="member_pw" value="${ member.member_pw }"/>
	      </div>
	      <div class="box inputWrap">
	        <span class="material-symbols">account_circle</span>
	        <input class="inputStyle" type=“text” name="member_nickname" value="${ member.member_nickname }" />
	      </div>
	      <div class="box inputWrap">
	        <span class="material-symbols">mail</span>
	        <input class="inputStyle" type=“text” name="member_email" value="${ member.member_email }" />
	      </div>
      <div class="box">
        <input type="submit" value="수정">
        <input type="button" value="취소" onclick="goHome()">
      </div>
      </form> 
    </div>
    <!-- ///// 개인 컨텐트 box ///// -->
    <div class="main">
      <div class="title">내 컨텐츠</div> 
      <div class="box">임시</div>
    </div>
  </div>
<script>
let goHome = () => location.href="/";
</script>
</body>
</html>