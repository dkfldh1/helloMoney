package com.go.ad.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.go.ad.dao.AdminDAO;
import com.go.ad.vo.CategoryInfoVO;
import com.go.ad.vo.UserInfoVO;
import com.go.ad.vo.ValueTransferVO;
import com.go.ad.vo.VideoInfoVO;
@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	AdminDAO dao;
	
	@Override
	public String selectNextPageToken(String categoryName) throws Exception {
		return dao.selectNextPageToken(categoryName);
	}

	@Override
	public int insertCategory(List<ValueTransferVO> videoList) {
		return dao.insertCategory(videoList);
	}

	@Override
	public int insertVideo(List<ValueTransferVO> videoList) {
		return dao.insertVideo(videoList);
	}

	@Override
	public List<CategoryInfoVO> categoryList() {
		return  dao.categoryList();
	}

	@Override
	public List<VideoInfoVO> retrieveVideo(String categoryName, String keyword) {
		return dao.retrieveVideo(categoryName, keyword);
	}

	@Override
	public int deleteVideo(String id) {
		return dao.deleteVideo(id);
	}

	@Override
	public int deleteCategory(String id) {
		return dao.deleteCategory(id);
	}

	@Override
	public int videoView(String id, String flag) {
		return dao.videoView(id, flag);
	}

	@Override
	public VideoInfoVO detailPage(String id) {
		return dao.detailPage(id);
	}

	@Override
	public List<CategoryInfoVO> categoryList(String index, String categoryName, String keyword) {
		return dao.retrieveVideo(index, categoryName, keyword);
	}

	@Override
	public int insertVideo(String videoId, String videoTitle, String thumbnail, String channelTitle,
			String viewCount, String category) {
		return dao.insertVideo(videoId, videoTitle, thumbnail, channelTitle,
				viewCount, category);
	}

	@Override
	public int checkMember(String userID, String password) {
		return dao.checkMember(userID, password);
	}

	
}
