<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Music Is My Life</title>

    <link rel="icon" type="image/ico" href="/img/favicon.ico" />
    <link rel="stylesheet" href="/css/common.css" />

    <style type="text/css">
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Noto Sans KR", "Segoe UI", Tahoma, Geneva, Verdana,
          sans-serif;
      }

      body {
        /* 강렬하면서도 부드러운 그라데이션 배경 */
        background: radial-gradient(circle at top left, #ff8a00, #e52e71 70%);
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 20px;
        overflow: hidden; /* 페이지 넘치는 애니메이션 대비 */
      }

      /* main 박스에 살짝 그림자 입체감 + fade-in 애니메이션 */
      main {
        background: #fff;
        border-radius: 22px;
        box-shadow: 0 16px 40px rgba(229, 46, 113, 0.45),
          0 0 45px rgba(255, 62, 141, 0.2);
        max-width: 460px;
        width: 100%;
        padding: 48px 36px;
        text-align: center;
        animation: titleJump 1s ease infinite;
      }

      /* 타이틀에 비비드 핑크 + 살짝 흔들리는 애니메이션 */
      .title-tag {
        font-size: 58px;
        font-weight: 900;
        color: #e52e71;
        line-height: 1.1;
        letter-spacing: -1.2px;
        user-select: none;
        animation: titleJump 0.5s ease infinite;
        cursor: default;
      }

      /* 설명부분 */
      .title-main h3 {
        margin-top: 22px;
        font-size: 17px;
        color: #444;
        line-height: 1.6;
        font-weight: 600;
        letter-spacing: 0.04em;
        user-select: none;
        opacity: 0.87;
      }

      /* 버튼 대란 타임!  
둥글고 음영 살렸고, 호버 시 입체 돌출 + 색상 빛남 효과 */
      a {
        display: block;
        margin: 22px auto 0;
        max-width: 240px;
        padding: 14px 0;
        background: linear-gradient(45deg, #e52e71, #ff3e8d);
        color: white;
        font-weight: 800;
        font-size: 18px;
        border-radius: 50px;
        text-decoration: none;
        box-shadow: 0 10px 22px rgba(229, 46, 113, 0.5);
        transition: all 0.35s cubic-bezier(0.25, 0.8, 0.25, 1);
        user-select: none;
        position: relative;
        overflow: hidden;
        z-index: 0;
      }

      a::before {
        content: "";
        position: absolute;
        top: -50%;
        left: -50%;
        width: 200%;
        height: 200%;
        background: radial-gradient(
          circle at center,
          rgba(255, 255, 255, 0.2),
          transparent
        );
        transform: rotate(45deg);
        pointer-events: none;
        transition: all 0.6s ease;
        z-index: -1;
      }

      a:hover::before {
        top: -10%;
        left: -10%;
        background: radial-gradient(
          circle at center,
          rgba(255, 255, 255, 0.45),
          transparent
        );
        transform: rotate(0deg);
      }

      a:hover {
        background: linear-gradient(90deg, #ff3e8d, #e52e71);
        box-shadow: 0 14px 28px rgba(255, 62, 141, 0.7);
        transform: translateY(-6px);
        z-index: 10;
      }

      a + a {
        margin-top: 17px;
      }

      /* hr은 투명한 그라데이션 빛줄기 */
      hr {
        margin: 48px auto 0;
        width: 80%;
        border: 0;
        height: 2px;
        background: linear-gradient(
          to right,
          transparent,
          #e52e71,
          transparent
        );
        opacity: 0.8;
      }

      @keyframes titleJump {
        0%,
        100% {
          transform: translateY(0);
        }
        50% {
          transform: translateY(-5px);
        }
      }
    </style>
  </head>
  <body>
    <main>
      <div>
        <h1 class="title-tag">Music Is</h1>
        <h1 class="title-tag">My Life</h1>
      </div>
      <div class="title-main">
        <h3>
          MusicIsMyLife는 사용자의 감정을 기반으로 음악을 추천받고, 다른
          사용자들과 생각과 노래를 공유하며 소통할 수 있는 커뮤니티
          플랫폼입니다.
        </h3>
      </div>
      <a href="/post/view">입장하기</a><br />
      <a href="/member/login">로그인</a><br />
      <a href="/member/register">회원가입</a><br />
      <hr />
    </main>
  </body>
</html>
