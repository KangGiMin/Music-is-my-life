<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<style>
.floating-btn {
	position: fixed;
	bottom: 30px;
	right: 30px;
	width: 60px;
	height: 60px;
	background: linear-gradient(45deg, #6a11cb, #2575fc);
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
	font-size: 28px;
	cursor: pointer;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
	z-index: 1000;
}

.modal-background {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: 998;
}

.modal-window {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: white;
	padding: 25px;
	border-radius: 10px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
	z-index: 999;
	width: 80%;
	max-width: 500px;
}

.modal-close {
	position: absolute;
	top: 10px;
	right: 15px;
	font-size: 24px;
	cursor: pointer;
}

#my_emote {
	width: 100%;
	height: 50px;
}

#youtube_link {
	margin-top: 15px;
	width: 100%;
	height: auto; /* 높이 auto로 변경하여 이미지 비율 유지 */
	background-color: #f0f0f0; /* 썸네일 로딩 전 배경 */
	border-radius: 8px;
	overflow: hidden;
	text-align: center; /* 썸네일/텍스트 중앙 정렬 */
	padding-bottom: 10px; /* 아래 여백 */
}

#youtube_link h3 {
	font-size: 1.1em;
	color: #444;
	margin-bottom: 10px;
	word-break: keep-all; /* 단어 단위로 줄바꿈 */
}

#youtube_link img {
	width: 100%;
	height: auto;
	display: block; /* 이미지 아래 여백 제거 */
	border-radius: 8px; /* 썸네일도 둥글게 */
}

.floating-btn {
	position: fixed;
	bottom: 30px;
	right: 30px;
	width: 60px;
	height: 60px;
	background: linear-gradient(45deg, #6a11cb, #2575fc);
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
	font-size: 28px;
	cursor: pointer;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
	z-index: 1000;
	transition: all 0.3s ease;
}

.floating-btn:hover {
	transform: translateY(-5px) rotate(90deg);
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.5);
}

/* 글쓰기 버튼은 오른쪽 버튼 왼쪽에 위치 */
.write-btn {
	position: fixed;
	bottom: 19px;
	right: 100px;
	background: linear-gradient(45deg, #e52e71, #ff8a00);
	font-size: 18px;
	font-weight: 700;
	border-radius: 30px;
	width: auto;
	padding: 0 18px;
	justify-content: center;
	letter-spacing: -0.03em;
	user-select: none;
	text-decoration: none;
	line-height: 60px; /* 세로 중앙 정렬용 */
	display: flex; /* 가운데 정렬 */
	box-shadow: 0 4px 8px rgba(229, 46, 113, 0.5);
	color: #fff;
}

.write-btn:hover {
	background: linear-gradient(90deg, #ff3e8d, #e52e71);
	box-shadow: 0 6px 16px rgba(255, 62, 141, 0.7);
	transform: translateY(-5px);
}
</style>


<div class="floating-btn" id="floatingBtn">+</div>
<c:if test="${ login.member_id != null }">
	<a href="/post/write/${login.member_id}" class="floating-btn write-btn">글쓰기</a>
</c:if>



<div class="modal-background" id="modalBackground"></div>
<div class="modal-window" id="modalWindow">
	<div class="modal-close" id="modalCloseBtn">&times;</div>
	<h2>감정을 고르면 음악을 준다는데?</h2>
	<select id="my_emote" name="my_emote">
		<c:forEach var="emotion" items="${emotionList}">
			<option value="${emotion.EMOTION_CODE}">${emotion.DESCRIPTION}</option>
		</c:forEach>
	</select>
	<div id="youtube_link">
		<p>감정을 선택하면 추천 영상이 나타납니다.</p>
	</div>
</div>

</div>


<script>
	const floatingBtn = document.getElementById('floatingBtn');
	const modalBackground = document.getElementById('modalBackground');
	const modalWindow = document.getElementById('modalWindow');
	const modalCloseBtn = document.getElementById('modalCloseBtn');
	
	 const youtubeDiv = document.getElementById('youtube_link'); // 썸네일이 들어갈 DIV
	 const emote = document.getElementById("my_emote"); // 감정 선택 select 박스
	  
	  const songRecommendations = {};
	  <c:forEach var="emotion" items="${emotionList}">
	    songRecommendations["${emotion.EMOTION_CODE}"] = {
	      title: "${emotion.DESCRIPTION}", // 감정 설명 그대로 제목으로
	      videoId: "${emotion.YOUTUBE_PLAYLIST_LINK}" // 유튜브 비디오 ID
	    };
	  </c:forEach>

	function toggleModal() {
		modalBackground.style.display = modalBackground.style.display === 'block' ? 'none'
				: 'block';
		modalWindow.style.display = modalWindow.style.display === 'block' ? 'none'
				: 'block';
		  // 모달 열릴 때 현재 선택된 감정에 맞는 썸네일 초기 로딩
	      const currentSelectedEmoteCode = emote.value;
	      updateYoutubeThumbnail(currentSelectedEmoteCode);
	}

	floatingBtn.addEventListener('click', toggleModal);
	modalCloseBtn.addEventListener('click', toggleModal);
	modalBackground.addEventListener('click', toggleModal);
	
	
	
	// 유튜브
	  function updateYoutubeThumbnail(emotionCode) {
	    const recommendation = songRecommendations[emotionCode];
	    console.log(recommendation);
	    
	    if (recommendation && recommendation.videoId) {
	      const videoId = recommendation.videoId;

	      youtubeDiv.innerHTML = 
	          "<img src='https://img.youtube.com/vi/" + videoId + "/hqdefault.jpg' " +
	          "style='width: 100%; height: auto; border-radius: 8px; cursor: pointer;' " + 
	          "onclick=\"window.open('https://www.youtube.com/watch?v=" + videoId + "', '_blank');\" >";
	          
	      console.log("감정 코드:", emotionCode);
	      console.log("추천 객체:", recommendation);
	      console.log("추천 객체:", recommendation.title);
	      console.log("비디오 ID:", recommendation ? recommendation.videoId : "없음");
	      
	    } else {
	      youtubeDiv.innerHTML = '<p>해당 감정에 맞는 노래 또는 링크를 찾을 수 없습니다.</p>';
	    }
	  }
	// 감정 선택 변경
	  emote.addEventListener("change", function () {
	    const selectedEmotionCode = this.value;
	    console.log("감정 변경됨:", selectedEmotionCode);
	    updateYoutubeThumbnail(selectedEmotionCode); // 썸네일 업데이트
	  });
	
</script>