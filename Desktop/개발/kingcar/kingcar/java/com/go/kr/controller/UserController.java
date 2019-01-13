package com.go.kr.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.go.ad.vo.VideoInfoVO;
import com.go.kr.service.UserService;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/")
	public String goverment() throws Exception {
		logger.info("index.jsp!!");
		System.out.println("index.jsp!!");
		return "index";
	}

	@RequestMapping("/main.do")
	public String detailPage(Model model) throws Exception {
		List<String> categoryList = userService.categoryList();
		List<VideoInfoVO> videoList = userService.videoList("");
		model.addAttribute("category",categoryList);
		model.addAttribute("list", videoList); 
		logger.info("main!");
		return "main";
	}

	//key : categoryName value : List
	@RequestMapping("/addList.do")
	public  String addContent(Model model ) {
		//카테고리 리스트 뽑아오기
				List<String> categoryList = userService.categoryList();
				List<List<VideoInfoVO>> resultView = new ArrayList<List<VideoInfoVO>>();
				//동영상 리스트 뽑아오기
				for(String category : categoryList) {
					resultView.add(userService.videoList(category)); 
				}
				
//				for(int i=0; i<resultView.size(); i++) {
//					System.out.println("첫번째 리스트 : " +resultView.get(i));
//					for(int j=0; j<resultView.get(i).size(); j++) {
//						System.out.println("두번째 리스트 : " + resultView.get(i).get(j));
//					}   
//				}
				
				model.addAttribute("resultView",resultView);
				return "addList2";
	}
	

	@RequestMapping("/singlePage.do")
	public String singlePage() {
		return "singlePage";
	}

	@RequestMapping("/contact.do")
	public String contact() {
		return "contact";
	}
	
	@RequestMapping("/search.do")
	public String search(Model model, String keyword, String category, String index) {
		if(category==null) category="";
		if(keyword==null) keyword="";
		List<VideoInfoVO> list = userService.searchList(keyword,category, index);
		model.addAttribute("list",list);
		model.addAttribute("keyword",keyword);
		if(index.equals("0")) {  
		return "searchPage";
		}else {
			return "search";
		}
	}	
	
//	@RequestMapping("/searchAdd.do")
//	public String searchAdd(Model model, String keyword, String category, String index) {
//		if(category==null) category="";
//		if(keyword==null) keyword="";
//		List<VideoInfoVO> list = userService.searchList(keyword,category, index);
//		model.addAttribute("list",list);
//		model.addAttribute("keyword",keyword);
//		return "search";
//	}	

}
