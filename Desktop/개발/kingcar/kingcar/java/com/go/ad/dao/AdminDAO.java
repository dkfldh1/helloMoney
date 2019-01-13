package com.go.ad.dao;

import java.util.List;

import com.go.ad.vo.CategoryInfoVO;
import com.go.ad.vo.ValueTransferVO;
import com.go.ad.vo.VideoInfoVO;

public interface AdminDAO {
	public String selectNextPageToken(String categoryName) throws Exception; 
	public int insertCategory(List<ValueTransferVO> videoList);
	public int insertVideo(List<ValueTransferVO> videoList);
	public List<CategoryInfoVO> categoryList();
	public List<VideoInfoVO> retrieveVideo(String categoryName, String keyword);
	public int deleteVideo(String id);
	public int deleteCategory(String id);
	public int videoView(String id, String flag);
	public VideoInfoVO detailPage(String id);
	public List<CategoryInfoVO> retrieveVideo(String index, String categoryName, String keyword);
	public int insertVideo(String videoId, String videoTitle, String thumbnail, String channelTitle,
			String viewCount, String category);
	public int checkMember(String userID, String password);
}
