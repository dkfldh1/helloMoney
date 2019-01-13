package com.go.ad.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.go.ad.vo.CategoryInfoVO;
import com.go.ad.vo.ValueTransferVO;
import com.go.ad.vo.VideoInfoVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String Namespace = "com.go.ad.youtubeMapper";

	@Override
	public String selectNextPageToken(String categoryName) throws Exception {
		return sqlSession.selectOne(Namespace + ".selectNextPageToken", categoryName);
	}

	@Override
	public int insertCategory(List<ValueTransferVO> videoList) {
		return sqlSession.insert(Namespace + ".insertCategory", videoList.get(0));
	}

	@Override
	public int insertVideo(List<ValueTransferVO> videoList) {
		insertCategory(videoList);
		return sqlSession.insert(Namespace + ".insertVideo", videoList);
	}

	@Override
	public List<CategoryInfoVO> categoryList() {
		return sqlSession.selectList(Namespace + ".selectCategoryList");
	}
	
	@Override
	public List<VideoInfoVO> retrieveVideo(String categoryName, String keyword) {
		Map<String, String> para = new HashMap<String, String>();
		para.put("categoryName",categoryName);
		para.put("keyword", keyword);
		return sqlSession.selectList(Namespace + ".retrieveVideo", para);
	}

	@Override
	public int deleteVideo(String id) {
		return sqlSession.delete(Namespace + ".deleteVideo", id);
	}

	@Override
	public int deleteCategory(String id) {
		return sqlSession.delete(Namespace + ".deleteCategory", id);
	}

	@Override
	public int videoView(String id, String flag) {
		Map<String, String> para = new HashMap<String, String>();
		para.put("id", id);
		para.put("flag", flag);
		return sqlSession.delete(Namespace + ".videoView", para);
	}

	@Override
	public VideoInfoVO detailPage(String id) {
		return sqlSession.selectOne(Namespace + ".detailPage", id);
	}

	@Override
	public List<CategoryInfoVO> retrieveVideo(String index, String categoryName, String keyword) {
		Map<String, String> para = new HashMap<String, String>();
		para.put("index", index);
		para.put("categoryName", categoryName);
		para.put("keyword", keyword);
		return sqlSession.selectList(Namespace + ".add", para);
	}

	@Override
	public int insertVideo(String videoId, String videoTitle, String thumbnail, String channelTitle,
			String viewCount, String category) {
		Map<String, String> para = new HashMap<String, String>();
		para.put("videoId",videoId);
		para.put("videoTitle",videoTitle);
		para.put("thumbnail",thumbnail);
		para.put("channelTitle",channelTitle);
		para.put("viewCount",viewCount);
		para.put("category",category);
		return sqlSession.insert(Namespace + ".manualInsertVideo", para);
	}

	@Override
	public int checkMember(String userID, String password) {
		Map<String, String> para = new HashMap<String, String>();
		para.put("userID", userID);
		para.put("password", password);
		return sqlSession.selectOne(Namespace + ".checkMember", para);
	}

}
