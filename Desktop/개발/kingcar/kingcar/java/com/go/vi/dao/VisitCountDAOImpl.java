package com.go.vi.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
@Repository
public class VisitCountDAOImpl {
	private static final String Namespace = "com.go.vi.visitMapper";	
	
	@Inject
	private SqlSession sqlSession;
	
	private static VisitCountDAOImpl instance;
	
	public VisitCountDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public static VisitCountDAOImpl getInstance(SqlSession sqlSession) {
		if(instance==null) {
			instance = new VisitCountDAOImpl(sqlSession);
		}
		return instance;
	}
	
	public int setVisitTotalCount() {
		return sqlSession.insert(Namespace + ".setVisitTotalCount");
	}
	public int getVisitTodayCount() {
		return sqlSession.selectOne(Namespace + ".getVisitTodayCount");
	}
	public int getVisitTotalCount() {
		return sqlSession.selectOne(Namespace + ".getVisitTotalCount");
	}

}
