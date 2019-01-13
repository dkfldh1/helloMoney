package com.go.vi.vo;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.ibatis.session.SqlSession;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.go.vi.dao.VisitCountDAOImpl;

public class SessionListener implements HttpSessionListener {

    @Override
    public void sessionCreated(HttpSessionEvent arg0) {
    	
    	if(arg0.getSession().isNew()) {
    		execute(arg0);
    	}
        System.out.println("방문자 클래스---1");
    }
    
    private void execute(HttpSessionEvent arg0) {
    	HttpSession session = arg0.getSession();
    	
        ApplicationContext ctx = 
                WebApplicationContextUtils.
                      getWebApplicationContext(session.getServletContext());
        
        SqlSession sqlSession = (SqlSession) ctx.getBean("sqlSession");
        
    	VisitCountDAOImpl dao = VisitCountDAOImpl.getInstance(sqlSession);
    	
    	try {
        dao.setVisitTotalCount();
        int todayCount = dao.getVisitTodayCount();
        int totalCount = dao.getVisitTotalCount();
         
        session.setAttribute("totalCount", totalCount);
        session.setAttribute("todayCount", todayCount); 
        
    	}catch(Exception e){
    		System.out.println("방문자 카운터 에러");
    		e.printStackTrace();
    	}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		
	}
 
}