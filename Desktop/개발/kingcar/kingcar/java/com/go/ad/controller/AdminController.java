package com.go.ad.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.go.ad.service.AdminService;
import com.go.ad.vo.CategoryInfoVO;
import com.go.ad.vo.CategorySearch;
import com.go.ad.vo.ValueTransferVO;
import com.go.ad.vo.VideoInfoVO;

@Controller
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	AdminService adminService;

	CategorySearch categorySearch = new CategorySearch();

	// 카테고리 목록 받아오기 + 초기페이지
	@RequestMapping("/admin.do")
	public String admin(Model model, HttpSession session) throws Exception {
		if(session.getAttribute("sessionId")==null) {
			logger.info("Login Fail!!");
			return "login";
		}
		else {
		logger.info("admin.jsp!!");
		List<CategoryInfoVO> categoryList = adminService.categoryList();

		model.addAttribute("categoryList", categoryList);
		return "/admin/admin";
		}
	}

	// 카테고리 첫 추가시
	@RequestMapping("/addCategory.do")
	// nextToken 받아옴..
	public String addCategory(@RequestParam String categoryName) throws Exception {

		// 비디오 리스트 세팅
		List<ValueTransferVO> videoList = categorySearch.retrieveVideoList(categoryName, "");
		adminService.insertCategory(videoList);

		logger.info(categoryName + " 카테고리가 추가 되었습니다");
		logger.info(adminService.insertVideo(videoList) + "건이 추가 되었습니다");

		return "redirect:/admin.do";
	}

	// 기존 동영상 추가시
	@RequestMapping("/addVideo.do")
	// nextToken 받아옴..
	public @ResponseBody void addVideo(Model model, String categoryName) throws Exception {
		// 다음 페이지 토큰값 받아오기
		String nextPageToken = adminService.selectNextPageToken(categoryName);

		// 비디오 리스트 세팅
		List<ValueTransferVO> videoList = categorySearch.retrieveVideoList(categoryName, nextPageToken);
		logger.info(adminService.insertVideo(videoList) + "건 추가 되었습니다");

		model.addAttribute("videoList", videoList);
	}

	// 동영상 목록
	@RequestMapping("/categoryDetail.do")
	public String categoryDetail(Model model, @RequestParam String categoryName, @RequestParam String keyword)
			throws Exception {
		if (keyword == null)
			keyword = "";

		List<VideoInfoVO> list = adminService.retrieveVideo(categoryName, keyword);
		logger.info("categoryDetail.do!!");
		model.addAttribute("CategoryDetailList", list);
		model.addAttribute("keyword", keyword);

		return "/admin/adminDetail";
	}

	@RequestMapping("/deleteVideo.do")
	public @ResponseBody void deleteVideo(String id) throws Exception {
		logger.info(adminService.deleteVideo(id) + "건 동영상이 삭제 되었습니다");
	}

	@RequestMapping("/deleteCategory.do")
	public @ResponseBody void deleteCategory(String id) throws Exception {
		logger.info(adminService.deleteCategory(id) + "건 카테고리가 삭제 되었습니다");
	}

	@RequestMapping("/videoView.do")
	public @ResponseBody void videoView(String id, String flag) throws Exception {
		logger.info(adminService.videoView(id, flag) + "건 동영상이 보여집니다");
	}

	@RequestMapping("/detailPage.do")
	public String detailPage(Model model, String id) throws Exception {
		VideoInfoVO vo = adminService.detailPage(id);
		model.addAttribute("vo", vo);
		return "/singlePage";
	}

	// 스크롤바 넘어갔을때
	@RequestMapping("/add.do")
	public String add(Model model, @RequestParam String index, @RequestParam String categoryName,
			@RequestParam String keyword) throws Exception {
		logger.info("data add!!");
		List<CategoryInfoVO> list = adminService.categoryList(index, categoryName, keyword);

		model.addAttribute("CategoryDetailList", list);
		model.addAttribute("keyword",keyword);
		return "/admin/add";
	}
	//동영상 추가(수동) 버튼 클릭
	@RequestMapping("/insert.do")
	public String insert(Model model, String categoryName) throws Exception {
		logger.info("insertVideo!!");

		model.addAttribute("categoryName", categoryName);
		return "/admin/insert";
	}
	
	@RequestMapping("/insertVideo.do")
	public @ResponseBody void insertVideo(@RequestParam String videoId, @RequestParam String videoTitle,
			@RequestParam String thumbnail,@RequestParam String channelTitle, @RequestParam String viewCount,
			@RequestParam String category ) throws Exception {
		logger.info(adminService.insertVideo(videoId, videoTitle, thumbnail, channelTitle, viewCount, category)+
				"동영상을 입력하였습니다.");
	}

	@RequestMapping("/modify.do")
	public String modifyVideo(Model model,@RequestParam String id) throws Exception {
		logger.info("수정 페이지!");
		VideoInfoVO vo = adminService.detailPage(id);
		model.addAttribute("vo",vo);
		return "admin/modify";
	}
	
	@RequestMapping("/loginClick.do")
	public String login(@RequestParam("userID") String userID, @RequestParam("password") String password,
			HttpSession session, Model model) {
		int check = adminService.checkMember(userID, password);
		if (check != 0) {
			session.setAttribute("sessionId", userID);
			model.addAttribute("checkLogin", 1);
			return "/admin/admin"; 
		} else {  
			model.addAttribute("checkLogin", 0);
			return "login";
		}
		
	}

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main.do";
	}
	 
	
	
}
