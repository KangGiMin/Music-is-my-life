package com.musicismylife.config;

import com.musicismylife.domain.emotion.EmotionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;
import com.musicismylife.domain.emotion.EmotionDTO;

@ControllerAdvice
public class GlobalModelAttributes {

    @Autowired
    private EmotionMapper emotionMapper;

    @ModelAttribute("emotionList")
    public List<EmotionDTO> addEmotionListToGlobalModel() {
        return emotionMapper.getEmotionList();
    }
}