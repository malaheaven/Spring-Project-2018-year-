package com.itbank.neail.weather;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.print.DocFlavor.STRING;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class nalci {
	@RequestMapping("nalci")
	@ResponseBody
	public NalciDTO json() throws Exception {
		NalciDTO nalciDTO = new NalciDTO();
		String URL = "";
		Document doc = Jsoup.connect(URL).get();
		Elements img = doc.select("table.tbl_type5.tbl_wk");
		String weather = null;
		for (int i = 0; i < img.size(); i++) {
			String tmp = img.get(i).toString();
			String[] tmpList = tmp.split("/rgn/");
			String r1 = tmpList[0];
			String r2 = tmpList[11];
			String[] gList = r1.split("</caption>");
			String[] hList = r2.split("<tr>");
			String real1 = "<table cellspacing='2' cellpadding='2'  border='0'>" + gList[1];
			String real2 = "" + tmpList[1];
			String real3 = "" + tmpList[2];
			String real4 = "" + tmpList[3];
			String real5 = "" + tmpList[4];
			String real6 = "" + tmpList[5];
			String real7 = "" + tmpList[6];
			String real8 = "" + tmpList[7];
			String real9 = "" + tmpList[8];
			String real10 = "" + tmpList[10];
			String real11 = "" + hList[0] + "</table>";
			weather = real1 + real2 + real3 + real4 + real5 + real6 + real7 + real8 + real9 + real10 + real11;
			nalciDTO.setNalci(weather);
		}
		return nalciDTO;
	}

}
