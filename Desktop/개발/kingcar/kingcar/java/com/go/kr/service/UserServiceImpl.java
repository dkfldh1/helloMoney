package com.go.kr.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.go.ad.vo.VideoInfoVO;
import com.go.kr.dao.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO dao;

	@Override
	public List<String> categoryList() {
		return dao.categoryList();
	}

	@Override
	public List<VideoInfoVO> videoList(String category) {
		return dao.videoList(category);
	}

	@Override
	public List<VideoInfoVO> searchList(String keyword, String category, String index) {
		return dao.searchList(keyword, category, index);
	}

//	public List<VideoInfoVO> mainList() {
//		List<String> categoryList = categoryList();
//		List<VideoInfoVO> mainList = new ArrayList<VideoInfoVO>();
//		
//		
//		for(int i=0; i<categoryList.size(); i++) {
//			mainList.addAll(videoList(categoryList.get(i)));
//		}
//		
//		for(VideoInfoVO vo : mainList) {
//			System.out.println(vo.getTitle());
//		}
//		
//		return mainList;
//		
//	}

}
