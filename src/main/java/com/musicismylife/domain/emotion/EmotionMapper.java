package com.musicismylife.domain.emotion;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmotionMapper {

	List<EmotionDTO> getEmotionList();

	String getEmotionByCode();
	
	EmotionDTO getEmotionByCode(String emotionCode);
}
