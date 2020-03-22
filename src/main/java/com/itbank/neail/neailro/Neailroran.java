package com.itbank.neail.neailro;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.ProcessBuilder.Redirect;
import java.net.URL;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Neailroran {
	@RequestMapping("neailrointroduce.do")
	public void neail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String URL = "http://www.rail-ro.com/new/about/about_01.php";
		Document doc = Jsoup.connect(URL).get();// 지정한 url의 html태그를 모두 가져온다.
												// html태그를 문자열 형태로 다 가져옴.
		Elements imgs = doc.select("p img");// 지정한 url에서 가져온 html태그 중에 원하는 태그를
											// 가져옴. 괄호 안에는 css 선택자를 지정하여 원하는 태그를
											// 가져옴.
		// Elements 배열 역할
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < imgs.size(); i++) {// for문을 돌려서
			String tmp = imgs.get(i).toString();
			String[] tmpList = tmp.split(" ");// 공백제거
			String[] test = tmpList[1].split("../");// ../기준으로제거
			String real = "http://www.rail-ro.com/new/images/" + test[2];// 주소값
			list.add(real);// 리스트에 주소값 추가 -->배열생성
		}
		request.setAttribute("list", list);// 리퀘스트 넣어줄 키값과 값
		RequestDispatcher rd = request.getRequestDispatcher("/neailroran/neailrointroduce.jsp");
		rd.forward(request, response);// 보내줍니다.
	}
}
