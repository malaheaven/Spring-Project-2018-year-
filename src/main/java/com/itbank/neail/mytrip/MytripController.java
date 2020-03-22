package com.itbank.neail.mytrip;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.neail.member.MemberDTO;

@Controller
public class MytripController {
	@Autowired
	MytripDAO dao;

	@RequestMapping("mytripinsert.do")
	public String insert(HttpServletRequest request,HttpServletResponse response,MytripDTO mytripDTO) throws ServletException, IOException{
		
		List one = new ArrayList<>();List two = new ArrayList<>();
		List three = new ArrayList<>();List  four= new ArrayList<>();
		List five = new ArrayList<>();List six = new ArrayList<>();
		List seven = new ArrayList<>();
		String[] day1;
		String[] day2;
		String[] day3;
		String[] day4;
		String[] day5;
		String[] day6;
		String[] day7;
		try{
			day1=request.getParameterValues("day1"); 
			for(int i=0;i<day1.length;i++){
				one.add(day1[i]);
			}
		} catch(Exception e){
			day1 = null;
		}
	
		try{
			day2=request.getParameterValues("day2"); 
			for(int i=0;i<day2.length;i++){
				two.add(day2[i]);
			}
		} catch(Exception e){
			day2 = null;
		}
		
		try{
			day3=request.getParameterValues("day3"); 
			for(int i=0;i<day3.length;i++){
				three.add(day3[i]);
			}
		} catch(Exception e){
			day3 = null;
		}
		
		try{
			day4=request.getParameterValues("day4"); 
			for(int i=0;i<day4.length;i++){
				four.add(day4[i]);
			}
		} catch(Exception e){
			day4 = null;
		}
		
		try{
			day5=request.getParameterValues("day5"); 
			for(int i=0;i<day5.length;i++){
				five.add(day5[i]);
			}
		} catch(Exception e){
			day5 = null;
		}
	
		try{
			day6=request.getParameterValues("day6"); 
			for(int i=0;i<day6.length;i++){
				six.add(day6[i]);
			}
		} catch(Exception e){
			day6 = null;
		}
	
		try{
			day7=request.getParameterValues("day7"); 
			for(int i=0;i<day7.length;i++){
				seven.add(day7[i]);
			}
		} catch(Exception e){
			day7 = null;
		}
		dao.insert(mytripDTO);
		return "mytrip/mytripinsertresult";
		/*RequestDispatcher rd=request.getRequestDispatcher("/result.jsp");
	    rd.forward(request, response);*/
	   
	}
	
	@RequestMapping("mytripselect.do")
	public void select(MytripDTO mytripDTO,HttpServletRequest request,HttpServletResponse response,HttpSession session) throws ServletException, IOException{
		List<MytripDTO> list=dao.select((String)session.getAttribute("id"));
			if(list.isEmpty()){
			RequestDispatcher rd=request.getRequestDispatcher("member/mytripselectnullresult.jsp");
			rd.forward(request, response);
			}else
			request.setAttribute("mytripDTO2", list);
			RequestDispatcher rd=request.getRequestDispatcher("member/mytripselectresult.jsp");
		      rd.forward(request, response);
		}
		
	@RequestMapping("memberMytripAll.do")
	public String selectAll(Model model) {
		List<MytripDTO> mytriplist=dao.selectAll();
		model.addAttribute("mytriplist",mytriplist);
		return "mytripselectAllresult";
	}
	
	@RequestMapping("mytripdelete.do")
	public String delete(HttpServletRequest request) {
		String tripid=request.getParameter("tripid");
		dao.delete(tripid);
		return "mytrip/mytripdeleteResult";
	}
	
}
