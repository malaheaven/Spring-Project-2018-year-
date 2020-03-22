package com.itbank.neail.location;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.neail.member.MemberDAO;
import com.itbank.neail.member.MemberDTO;

@Controller
public class LocationController {
	@Autowired
	LocationDAO dao;
	@Autowired
	MemberDAO memberdao;

	@RequestMapping("searcharea.do")
	public void searcharea(HttpServletRequest request, MemberDTO memberDTO, HttpServletResponse response,
			LocationDTO locationDTO, HttpSession session) throws ServletException, IOException {
		String location = request.getParameter("location");
		List<LocationDTO> list = dao.selectlocation(location);
		String id = (String) session.getAttribute("id");
		if (id == null) {
			if (location.equals("수도권")) {
				request.setAttribute("list", list);
				RequestDispatcher rd = request.getRequestDispatcher("areaattractions/capitalarea.jsp");
				rd.forward(request, response);
			}
			if (location.equals("강원권")) {
				request.setAttribute("list", list);
				RequestDispatcher rd = request.getRequestDispatcher("areaattractions/gangwon.jsp");
				rd.forward(request, response);
			}
			if (location.equals("충청권")) {
				request.setAttribute("list", list);
				RequestDispatcher rd = request.getRequestDispatcher("areaattractions/chungcheong.jsp");
				rd.forward(request, response);
			}
			if (location.equals("경상권")) {
				request.setAttribute("list", list);
				RequestDispatcher rd = request.getRequestDispatcher("areaattractions/kyungsang.jsp");
				rd.forward(request, response);
			}
			if (location.equals("전라권")) {
				request.setAttribute("list", list);
				RequestDispatcher rd = request.getRequestDispatcher("areaattractions/jeonlado.jsp");
				rd.forward(request, response);
			}
		} else {
			memberDTO = memberdao.select(id);
			if (memberDTO.getId().equals("root") && memberDTO.getPw().equals("root")) {
				if (location.equals("수도권")) {
					request.setAttribute("list", list);
					RequestDispatcher rd = request.getRequestDispatcher("rootareaupdate/capitalarea.jsp");
					rd.forward(request, response);
				}
				if (location.equals("강원권")) {
					request.setAttribute("list", list);
					RequestDispatcher rd = request.getRequestDispatcher("rootareaupdate/gangwon.jsp");
					rd.forward(request, response);
				}
				if (location.equals("충청권")) {
					request.setAttribute("list", list);
					RequestDispatcher rd = request.getRequestDispatcher("rootareaupdate/chungcheong.jsp");
					rd.forward(request, response);
				}
				if (location.equals("경상권")) {
					request.setAttribute("list", list);
					RequestDispatcher rd = request.getRequestDispatcher("rootareaupdate/kyungsang.jsp");
					rd.forward(request, response);
				}
				if (location.equals("전라권")) {
					request.setAttribute("list", list);
					RequestDispatcher rd = request.getRequestDispatcher("rootareaupdate/jeonlado.jsp");
					rd.forward(request, response);
				}
			} else {
				if (location.equals("수도권")) {
					request.setAttribute("list", list);
					RequestDispatcher rd = request.getRequestDispatcher("areaattractions/capitalarea.jsp");
					rd.forward(request, response);
				}
				if (location.equals("강원권")) {
					request.setAttribute("list", list);
					RequestDispatcher rd = request.getRequestDispatcher("areaattractions/gangwon.jsp");
					rd.forward(request, response);
				}
				if (location.equals("충청권")) {
					request.setAttribute("list", list);
					RequestDispatcher rd = request.getRequestDispatcher("areaattractions/chungcheong.jsp");
					rd.forward(request, response);
				}
				if (location.equals("경상권")) {
					request.setAttribute("list", list);
					RequestDispatcher rd = request.getRequestDispatcher("areaattractions/kyungsang.jsp");
					rd.forward(request, response);
				}
				if (location.equals("전라권")) {
					request.setAttribute("list", list);
					RequestDispatcher rd = request.getRequestDispatcher("areaattractions/jeonlado.jsp");
					rd.forward(request, response);
				}
			}
		}
	}

	@RequestMapping("insertarea.do")
	public String insertarea(LocationDTO locationDTO, MultipartHttpServletRequest request, HttpServletResponse response)
			throws IllegalStateException, IOException {
		List<MultipartFile> list = new ArrayList<MultipartFile>();
		String[] imgArray = new String[3];
		for (int i = 0; i < imgArray.length; i++) {
			String tmpImgName = "image" + (i + 1);
			MultipartFile tmpMpf = request.getFile(tmpImgName);
			list.add(tmpMpf);
		}
		for (int i = 0; i < list.size(); i++) {
			if (!list.get(i).isEmpty()) {
				String imagename = list.get(i).getOriginalFilename();
				imgArray[i] = imagename;
				String realpath = "C:/Users/user/workspace/Neal/src/main/webapp/resources/locationimage/"
						+ (new String(imagename.getBytes("utf-8")));
				list.get(i).transferTo(new File(realpath));
			}
		}
		locationDTO.setImagename1(imgArray[0]);
		locationDTO.setImagename2(imgArray[1]);
		locationDTO.setImagename3(imgArray[2]);
		dao.insert(locationDTO);
		return "location/locationinsertResult";
	}

	@RequestMapping("locationselect.do")
	public String locationselect(LocationDTO locationDTO, Model model, MemberDTO memberDTO, HttpSession session) {
		LocationDTO locationDTO2 = dao.select(locationDTO);
		String id = (String) session.getAttribute("id");
		if (id == null) {
			model.addAttribute("locationDTO2", locationDTO2);
			return "location/showimage";
		} else {
			memberDTO = memberdao.select(id);
			if (memberDTO.getId().equals("root") && memberDTO.getPw().equals("root")) {
				model.addAttribute("locationDTO2", locationDTO2);
				return "location/rootshowimage";
			}else{
			model.addAttribute("locationDTO2", locationDTO2);
			return "location/showimage";
			}
		}
	}

	@RequestMapping("checksights.do")
	@ResponseBody
	public Map<Object, Object> checksights(@RequestBody String sights) {
		boolean check = false;
		Map<Object, Object> map = new HashMap<Object, Object>();
		check = dao.sightscheck(sights);
		map.put("checksights", check);
		System.out.println(check);
		return map;

	}

	@RequestMapping("deletelocation.do")
	public String delete(LocationDTO locationDTO, HttpServletRequest request) {
		String sights = request.getParameter("sights");
		dao.delete(sights);
		return "location/deletelocation";

	}

}
