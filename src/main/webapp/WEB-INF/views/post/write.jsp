<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>게시글 작성</title>

    <link rel="icon" type="image/ico" href="/img/favicon.ico" />
    <link rel="stylesheet" href="/css/common.css" />
    <style>
      .post-form {
        width: 80%;
        margin: 0 auto;
        padding: 20px;
      }

      .form-group {
        margin-bottom: 20px;
      }

      .form-group label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
      }

      .form-control {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
      }

      textarea.form-control {
        min-height: 300px;
        resize: vertical;
      }

      .btn-container {
        text-align: center;
        margin-top: 30px;
      }

      .btn-submit {
        padding: 10px 30px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
      }

      .btn-submit:hover {
        background-color: #0056b3;
      }

      .emotion-select {
        margin-bottom: 20px;
      }

      .emotion-select label {
        display: inline-block;
        margin-right: 10px;
      }
    </style>
  </head>
  <body>
    <main>
      <h2>게시글 작성</h2>
      <div class="post-form">
        <form action="/post/writePost" method="post">
          <input type="hidden" name="MEMBER_ID" value="${MEMBER_ID}" />
          <input
            type="hidden"
            name="MEMBER_NICKNAME"
            value="${MEMBER_NICKNAME}"
          />
          <div class="form-group">
            <label for="TITLE">제목</label>
            <input
              type="text"
              id="title"
              name="TITLE"
              class="form-control"
              required
            />
          </div>

          <div class="emotion-select">
            <label>감정 태그:</label>
            <select
              name="EMOTION_CODE"
              class="form-control"
              style="width: 200px"
              onchange="updateEmotionName(this)"
            >
              <option value="">-- 감정 선택 --</option>
              <c:forEach var="emotion" items="${emotionList}">
                <option
                  value="${emotion.EMOTION_CODE}"
                  data-name="${emotion.EMOTION_NAME}"
                >
                  ${emotion.EMOTION_NAME}
                </option>
              </c:forEach>
            </select>
            <input type="hidden" name="EMOTION_NAME" id="emotionNameField" />
          </div>

          <div class="form-group">
            <label for="CONTENTS">내용</label>
            <textarea
              id="content"
              name="CONTENTS"
              class="form-control"
              required
            ></textarea>
          </div>

          <div class="form-group">
            <label for="YOUTUBE_LINK">유튜브 링크</label>
            <input
              type="url"
              id="youtube"
              name="YOUTUBE_LINK"
              class="form-control"
              placeholder="https://www.youtube.com/watch?v=..."
            />
          </div>

          <div class="btn-container">
            <button type="submit" class="btn-submit">등록하기</button>
            <button
              type="button"
              class="btn-submit"
              id="cancelBTN"
              style="background-color: #6c757d"
            >
              취소
            </button>
          </div>
        </form>
      </div>
    </main>
    <script type="text/javascript">
      document
        .getElementById("cancelBTN")
        .addEventListener("click", function () {
          location.href = "/post/view";
        });

      function updateEmotionName(selectElement) {
        const selectedOption =
          selectElement.options[selectElement.selectedIndex];
        document.getElementById("emotionNameField").value =
          selectedOption.getAttribute("data-name");
      }
    </script>
  </body>
</html>
