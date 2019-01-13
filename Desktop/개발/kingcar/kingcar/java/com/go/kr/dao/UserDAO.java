package com.go.kr.dao;

import java.util.List;

import com.go.ad.vo.VideoInfoVO;
import com.go.kr.vo.UserVO;

public interface UserDAO {

	public List<String> categoryList();

	public List<VideoInfoVO> videoList(String category);

	public List<VideoInfoVO> searchList(String keyword, String category, String index);

}
