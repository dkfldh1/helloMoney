package com.go.kr.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.go.ad.vo.VideoInfoVO;
import com.go.kr.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String ADMIN = "com.go.ad.youtubeMapper";
	private static final String Namespace = "com.go.kr.userMapper";

	@Override
	public List<String> categoryList() {
		return sqlSession.selectList(Namespace + ".itemCategoryList");
	}

	@Override
	public List<VideoInfoVO> videoList(String category) {
		Map<String, String> para = new HashMap<String, String>();
		para.put("categoryName", category);
		return sqlSession.selectList(Namespace + ".mainVideoList" ,para);
	}

	@Override
	public List<VideoInfoVO> searchList(String keyword, String category, String index) {
		Map<String, String> para = new HashMap<String, String>();
		para.put("keyword", keyword);
		para.put("category", category);
		para.put("index", index);
		return sqlSession.selectList(Namespace + ".searchList" ,para);
	}

}
