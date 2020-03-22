package com.itbank.neail.review;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.ResponseWrapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itbank.neail.location.LocationDTO;
import com.itbank.neail.member.MemberDAO;
import com.itbank.neail.member.MemberDTO;

@Controller
public class ReviewController {

	@Autowired
	ReviewDAO dao;
	@Autowired
	MemberDAO memberdao;

	@RequestMapping("searchKeyWord")
	public String searchKeyWord(HttpServletRequest request, HttpSession session) {

		String keyword = request.getParameter("keyword");
		List<ReviewDTO> list;

		try {
			list = dao.selectAllByKeyWord(keyword);
			System.out.println("성공" + list.size());
			session.setAttribute("keywordResult", list);
		} catch (Exception e) {
			System.out.println("fail");
			list = null;
			session.setAttribute("keywordResult", list);
		}
		return "redirect:review/searchKeyWordResult.jsp";
	}

	@RequestMapping("insertReview.do")
	public String insertReview(HttpServletRequest request, HttpSession session) throws Exception {
		ReviewDTO reviewDTO = new ReviewDTO();

		List<MultipartFile> list = new ArrayList<MultipartFile>();
		MultipartHttpServletRequest mpf = (MultipartHttpServletRequest) request;
		String[] imgArray = new String[2];
		imgArray[0] = "";
		imgArray[1] = "";

		try {
			for (int i = 0; i < imgArray.length; i++) {
				String tmpImgName = "img" + (i + 1);
				MultipartFile tmpMpf = mpf.getFile(tmpImgName);
				list.add(tmpMpf);
			}
			for (int i = 0; i < list.size(); i++) {
				if (!list.get(i).isEmpty()) {
					String imagename = list.get(i).getOriginalFilename();
					imgArray[i] = imagename;
					String realpath = "C:/Users/user/workspace/Neal/src/main/webapp/resources/reviewImg/"
							+ (new String(imagename.getBytes("utf-8")));
					list.get(i).transferTo(new File(realpath));
				}
			}
			reviewDTO.setContent(mpf.getParameter("content"));
			reviewDTO.setName(mpf.getParameter("name"));
			reviewDTO.setUserid((String) session.getAttribute("id"));
			reviewDTO.setImg1(imgArray[0]);
			reviewDTO.setImg2(imgArray[1]);
		} catch (Exception e) {
			reviewDTO.setContent(request.getParameter("content"));
			reviewDTO.setName(request.getParameter("name"));
			reviewDTO.setUserid((String) session.getAttribute("id"));
			if (imgArray[0] == "")
				reviewDTO.setImg1("");
			if (imgArray[1] == "")
				reviewDTO.setImg2("");
		}
		dao.insert(reviewDTO);
		return "review/reviewResult";
	}


	@RequestMapping("reviewBoard.do")
	public String selectAllReview(HttpSession session,MemberDTO memberDTO) {
		String id= (String) session.getAttribute("id");
		List<ReviewDTO> list = dao.selectAll();
		if(id==null){
			session.setAttribute("reviewList", list);
			return "review/selectAllReviewResult";
		}else{
			memberDTO=memberdao.select(id);
		if(memberDTO.getId().equals("root")&&memberDTO.getPw().equals("root")){
			session.setAttribute("reviewList", list);
			return "review/selectRootAllReviewResult";
		}else{
		session.setAttribute("reviewList", list);
		return "review/selectAllReviewResult";
		}
		}
	}
	
	@RequestMapping("reviewSelectByReviewid")
	public String reviewSelectByReviewid(HttpServletRequest request, Model model, HttpSession session,
			MemberDTO memberDTO) {
		String id = (String) session.getAttribute("id");
		if (id == null) {
			int reviewid = Integer.parseInt(request.getParameter("reviewid"));
			dao.updateLike(reviewid);
			ReviewDTO result = dao.selectByReviewid(reviewid);
			model.addAttribute("result", result);
			return "review/reviewSelectByReviewidResult";

		} else {
			memberDTO = memberdao.select(id);
			if (memberDTO.getId().equals("root") && memberDTO.getPw().equals("root")) {
				int reviewid = Integer.parseInt(request.getParameter("reviewid"));
				dao.updateLike(reviewid);
				ReviewDTO result = dao.selectByReviewid(reviewid);
				model.addAttribute("result", result);
				return "review/rootreviewSelectByReviewidResult";
			} else {
				int reviewid = Integer.parseInt(request.getParameter("reviewid"));
				dao.updateLike(reviewid);
				ReviewDTO result = dao.selectByReviewid(reviewid);
				model.addAttribute("result", result);
				return "review/reviewSelectByReviewidResult";
			}
		}
	}

	@RequestMapping("deleteReview.do")
	public String deleteReview(HttpSession session, HttpServletRequest request) {
		try {
			String realUser = (String) session.getAttribute("id");

			if (realUser == null) {
				return "review/noUserReviewfaultResult";
			}

			System.out.println(realUser);
			String total = request.getParameter("totalid");

			String[] list = total.split(",");

			String writer = list[0];
			String reviewid = list[1];

			if (realUser.equals(writer)||realUser.equals("root")) {
				dao.deleteReview(reviewid);
				return "review/deleteReviewSuccessResult";
			} else {
				return "review/deleteReviewfaultResult";
			}
		} catch (Exception e) {
			return "review/noUserReviewfaultResult";
		}
	}

	@RequestMapping("updateReview.do")
	public String updateReview(HttpServletRequest request, HttpSession session) throws Exception {

		ReviewDTO reviewDTO = (ReviewDTO) session.getAttribute("review");

		System.out.println(reviewDTO.getContent());
		System.out.println(reviewDTO.getName());
		System.out.println(reviewDTO.getImg1());
		System.out.println(reviewDTO.getImg2());
		System.out.println(reviewDTO.getReviewid());

		List<MultipartFile> list = new ArrayList<MultipartFile>();
		String[] imgArray;
		try {
			MultipartHttpServletRequest mpf = (MultipartHttpServletRequest) request;
			imgArray = new String[2];
			for (int i = 0; i < imgArray.length; i++) {
				String tmpImgName = "img" + (i + 1);
				MultipartFile tmpMpf = mpf.getFile(tmpImgName);
				list.add(tmpMpf);
			}
			for (int i = 0; i < list.size(); i++) {
				if (!list.get(i).isEmpty()) {
					String imagename = list.get(i).getOriginalFilename();
					imgArray[i] = imagename;
					String realpath = "C:/Users/user/workspace/Neal/src/main/webapp/resources/reviewImg/"
							+ (new String(imagename.getBytes("utf-8")));
					list.get(i).transferTo(new File(realpath));
					if (i == 0) {
						reviewDTO.setImg1(imgArray[i]);
					} else if (i == 1) {
						reviewDTO.setImg2(imgArray[i]);
					}

				}
			}
			reviewDTO.setContent(mpf.getParameter("content"));
			reviewDTO.setName(mpf.getParameter("name"));
			reviewDTO.setUserid((String) session.getAttribute("id"));

		} catch (Exception e) {
			reviewDTO.setContent(request.getParameter("content"));
			reviewDTO.setName(request.getParameter("name"));
			reviewDTO.setUserid((String) session.getAttribute("id"));
		}

		dao.updateReview(reviewDTO);
		session.removeAttribute("review");
		return "review/updateReviewResult";
	}

	@RequestMapping("reviewValid.do")
	public String reviewValid(HttpServletRequest request, HttpSession session) {
		String userId;

		userId = (String) session.getAttribute("id");
		if (userId == null) {
			return "review/NoUserCheckResult";
		}

		String[] list = request.getParameter("totalid").split(",");
		int reviewId = Integer.parseInt(list[1]);
		if (userId.equals(list[0])) {
			try {
				ReviewDTO review = dao.selectByReviewid(reviewId);
				session.setAttribute("review", review);
			} catch (Exception e) {
				System.out.println("실패");
			}

			return "review/validCheckResult";
		} else {
			return "review/invalidCheckResult";
		}
	}

	@RequestMapping("myReview.do")
	public String myReview(HttpServletRequest request, HttpSession session) {
		String id = (String) session.getAttribute("id");
		if (id == null) {
			return "review/noUsermyReviewResult";
		}
		List<ReviewDTO> list;
		try {
			list = dao.selectAllByuserid(id);
			session.setAttribute("myReview", list);
		} catch (Exception e) {
			list = null;
			session.setAttribute("myReview", list);
		}
		return "redirect:member/myReviewResult.jsp";
	}

}
