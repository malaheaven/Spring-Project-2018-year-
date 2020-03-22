package com.itbank.neail.member;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.sql.SQLException;
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

@Controller
public class MemberController {

	@Autowired
	MemberDAO dao;

	@RequestMapping("memberinsert.do")
	public String insert(MemberDTO memberDTO) {
		dao.insert(memberDTO);
		return "member/insertResult";
	}

	@RequestMapping("memberdelete.do")
	public String delete(MemberDTO memberDTO, HttpSession session) {
		String id = (String) session.getAttribute("id");
		dao.delete(id);
		session.invalidate();
		return "member/deletemember";
	}

	@RequestMapping("memberupdate.do")
	public String update(MemberDTO memberDTO) {
		dao.update(memberDTO);
		return "member/updatemember";
	}

	@RequestMapping("memberselect.do")
	public void select(MemberDTO memberDTO, Model model, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws ServletException, IOException {
		String id = (String) session.getAttribute("id");
		MemberDTO memberDTO2 = dao.select(id);
		String email = memberDTO2.getEmail();
		String[] email1 = email.split(",");
		String email2 = email1[0];
		String email3 = email1[1];
		request.setAttribute("email2", email2);
		request.setAttribute("email3", email3);
		request.setAttribute("memberDTO2", memberDTO2);
		RequestDispatcher rd = request.getRequestDispatcher("member/mypage.jsp");
		rd.forward(request, response);
	}

	@RequestMapping("memberselectAll.do")
	public String selectAll(Model model) {
		List<MemberDTO> list = dao.selectAll();
		if (list.isEmpty()) {
			return "member/memberEmpty";
		}
		model.addAttribute("list", list);
		return "member/memberselectAllresult";
	}

	@RequestMapping("LoginOk.do")
	public String login(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			MemberDTO memberDTO) throws SQLException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String rootid = "root";
		String rootpw = "root";
		System.out.println(id);
		System.out.println(rootid);
		List<MemberDTO> list = dao.selectAll();
		if (id.equals(rootid) && pw.equals(rootpw)) {
			session.setAttribute("id", rootid);
			return "member/rootloginOK";
		} else {
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getId().equals(id) && list.get(i).getPw().equals(pw)) {
					session.setAttribute("id", id);
					return "member/loginOK";
				}
			}

		}
		return "member/loginNOT";
	}

	@RequestMapping("LogOut")
	public void logout(HttpSession session, HttpServletResponse response) throws IOException {
		session.invalidate();
		response.sendRedirect("loginmain.jsp");
		return;
	}

	@RequestMapping("checkid.do")
	@ResponseBody
	public Map<Object, Object> checkId(@RequestBody String id) {
		boolean check = false;
		Map<Object, Object> map = new HashMap<Object, Object>();
		check = dao.idcheck(id);
		map.put("checkId", check);
		System.out.println(check);
		return map;

	}

	@RequestMapping("checkpw.do")
	@ResponseBody
	public Map<Object, Object> checkpw(@RequestBody String pw, HttpSession session, HttpServletRequest request) {
		boolean check = false;
		Map<Object, Object> map = new HashMap<Object, Object>();
		String id = (String) session.getAttribute("id");
		System.out.println(id);
		System.out.println(pw);
		check = dao.checkpw(id, pw);
		map.put("checkpw", check);
		System.out.println(check);
		return map;
	}

}
