<%@page import="com.itbank.neail.review.ReviewDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itbank.neail.review.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../resources/css/reset.css" type="text/css"
	media="all">
<link rel="stylesheet" href="../resources/css/layout.css" type="text/css"
	media="all">
<link rel="stylesheet" href="../resources/css/style.css" type="text/css"
	media="all">
<meta charset="UTF-8">
<title>Canvas</title>
<style type="text/css">
body {
	line-height: 2em;
	font-family: "맑은 고딕";
}

ul, li {
	list-style: none;
	text-align: center;
	padding: 0;
	margin: 0;
}

#mainWrapper {
	width: 800px;
	margin: 0 auto;
	/*가운데 정렬*/
}

#mainWrapper>ul>li:first-child {
	text-align: center;
	font-size: 14pt;
	height: 40px;
	vertical-align: middle;
	line-height: 30px;
}

#ulTable {
	margin-top: 10px;
}

#ulTable>li:first-child>ul>li {
	background-color: #c9c9c9;
	font-weight: bold;
	text-align: center;
}

#ulTable>li>ul {
	clear: both;
	padding: 0px auto;
	position: relative;
	min-width: 40px;
}

#ulTable>li>ul>li {
	float: left;
	font-size: 10pt;
	border-bottom: 1px solid silver;
	vertical-align: baseline;
}

#ulTable>li>ul>li:first-child {
	width: 10%;
}

/*No 열 크기*/
#ulTable>li>ul>li:first-child+li {
	width: 45%;
}

/*제목 열 크기*/
#ulTable>li>ul>li:first-child+li+li {
	width: 20%;
}

/*작성일 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li {
	width: 15%;
}

/*작성자 열 크기*/
#ulTable>li>ul>li:first-child+li+li+li+li {
	width: 10%;
}

/*조회수 열 크기*/
#divPaging {
	clear: both;
	margin: 0 auto;
	width: 220px;
	height: 50px;
}

#divPaging>div {
	float: left;
	width: 30px;
	margin: 0 auto;
	text-align: center;
}

#liSearchOption {
	clear: both;
}

#liSearchOption>div {
	margin: 0 auto;
	margin-top: 30px;
	width: auto;
	height: 100px;
}

.left {
	text-align: left;
}

a {
	text-decoration: none;
	color: #494848;
}
</style>
</head>
<body id="page2">
	<div class="extra">
		<div class="main">
			<div class="wrapper">
				<h1>
					<a href="../rootmain.jsp" id="logo">내일로</a>
				</h1>
			</div>
			<nav>
				<ul id="menu">
					<li><a href="../locationinsert.jsp" class="nav1">명소등록</a></li>
					<li><a href="../memberselectAll.do" class="nav2">회원관리</a></li>
				</ul>
			</nav>
			<%!public Integer toInt(String x) {
		int a = 0;
		try {
			a = Integer.parseInt(x);
		} catch (Exception e) {
		}
		return a;
	}%>
			<%
				ArrayList<ReviewDTO> list = (ArrayList<ReviewDTO>) session.getAttribute("reviewList");
			%>
			<%
				int pageno = toInt(request.getParameter("pageno"));
				if (pageno < 1) {//현재 페이지
					pageno = 1;
				}
				int total_record = 754; //총 레코드 수
				int page_per_record_cnt = 10; //페이지 당 레코드 수
				int group_per_page_cnt = 5; //페이지 당 보여줄 번호 수[1],[2],[3],[4],[5]
				//					  									  [6],[7],[8],[9],[10]											

				int record_end_no = pageno * page_per_record_cnt;
				int record_start_no = record_end_no - (page_per_record_cnt - 1);
				if (record_end_no > total_record) {
					record_end_no = total_record;
				}

				int total_page = total_record / page_per_record_cnt + (total_record % page_per_record_cnt > 0 ? 1 : 0);
				if (pageno > total_page) {
					pageno = total_page;
				}

				// 	현재 페이지(정수) / 한페이지 당 보여줄 페지 번호 수(정수) + (그룹 번호는 현제 페이지(정수) % 한페이지 당 보여줄 페지 번호 수(정수)>0 ? 1 : 0)
				int group_no = pageno / group_per_page_cnt + (pageno % group_per_page_cnt > 0 ? 1 : 0);
				//		현재 그룹번호 = 현재페이지 / 페이지당 보여줄 번호수 (현재 페이지 % 페이지당 보여줄 번호 수 >0 ? 1:0)	
				//	ex) 	14		=	13(몫)		=	 (66 / 5)		1	(1(나머지) =66 % 5)			  

				int page_eno = group_no * group_per_page_cnt;
				//		현재 그룹 끝 번호 = 현재 그룹번호 * 페이지당 보여줄 번호 
				//	ex) 	70		=	14	*	5
				int page_sno = page_eno - (group_per_page_cnt - 1);
				// 		현재 그룹 시작 번호 = 현재 그룹 끝 번호 - (페이지당 보여줄 번호 수 -1)
				//	ex) 	66	=	70 - 	4 (5 -1)

				if (page_eno > total_page) {
					//	   현재 그룹 끝 번호가 전체페이지 수 보다 클 경우		
					page_eno = total_page;
					//	   현재 그룹 끝 번호와 = 전체페이지 수를 같게
				}

				int prev_pageno = page_sno - group_per_page_cnt; // <<  *[이전]* [21],[22],[23]... [30] [다음]  >>
				//		이전 페이지 번호	= 현재 그룹 시작 번호 - 페이지당 보여줄 번호수	
				//	ex)		46		=	51 - 5				
				int next_pageno = page_sno + group_per_page_cnt; // <<  [이전] [21],[22],[23]... [30] *[다음]*  >>
				//		다음 페이지 번호 = 현재 그룹 시작 번호 + 페이지당 보여줄 번호수
				//	ex)		56		=	51 - 5
				if (prev_pageno < 1) {
					//		이전 페이지 번호가 1보다 작을 경우		
					prev_pageno = 1;
					//		이전 페이지를 1로
				}
				if (next_pageno > total_page) {
					//		다음 페이지보다 전체페이지 수보가 클경우		
					next_pageno = total_page / group_per_page_cnt * group_per_page_cnt + 1;
					//		next_pageno=total_page
					//		다음 페이지 = 전체페이지수 / 페이지당 보여줄 번호수 * 페이지당 보여줄 번호수 + 1 
					//	ex)			   = 	76 / 5 * 5 + 1	???????? 		
				}

				// [1][2][3].[10]
				// [11][12]
			%>
			<hr />

			<div id="mainWrapper">
				<br>
				<ul>
					<!-- 게시판 제목 -->
					<li>후기 게시판</li>
					<button onclick="location.href = 'review.jsp'" class="button"
						style="margin-left: 717px;">글작성</button>

					<!-- 게시판 목록  -->
					<li>
						<ul id="ulTable">
							<li>
								<ul>
									<li>No</li>
									<li>제목</li>
									<li>작성일</li>
									<li>작성ID</li>
									<li>조회수</li>
								</ul>
							</li>
							<!-- 게시물이 출력될 영역 -->
<%
                     
                        int endIndex = record_end_no-1;
                     
                        if (record_end_no > list.size()) {
                           endIndex = list.size() - record_start_no + 1;
                        for (int i = (record_start_no) - 1; i < endIndex; i++) {
                     %>
                     <li>
                        <ul>
                           <li><%=list.get(i).getReviewid()%></li>
                           <li class="left"><a
                              href="../reviewSelectByReviewid.do?reviewid=<%=list.get(i).getReviewid()%>"><%=list.get(i).getName()%></a></li>
                           <li><%=list.get(i).getDate()%></li>
                           <li><%=list.get(i).getUserid()%></li>
                           <li><%=list.get(i).getLikecount()%></li>
                        </ul>
                     </li>
                     <%
                        }
                        }
                        else{
                           for (int i = (record_start_no) - 1; i < endIndex; i++) {
                              %>
                              <li>
                                 <ul>
                                    <li><%=list.get(i).getReviewid()%></li>
                                    <li class="left"><a
                                       href="../reviewSelectByReviewid.do?reviewid=<%=list.get(i).getReviewid()%>"><%=list.get(i).getName()%></a></li>
                                    <li><%=list.get(i).getDate()%></li>
                                    <li><%=list.get(i).getUserid()%></li>
                                    <li><%=list.get(i).getLikecount()%></li>
                                 </ul>
                              </li>
                              <%
                                 }
                        }
                     %>
						</ul>
					</li>

					<!-- 게시판 페이징 영역 -->
					<li>
						<div id="divPaging">

							<a href="reviewBoard.jsp?pageno=<%=prev_pageno%>">◀</a>

							<%
								for (int i = page_sno; i <= page_eno; i++) {
							%>
							<a href="reviewBoard.jsp?pageno=<%=i%>"> <%
 	if (pageno == i) {
 %> <b>[<%=i%>]
							</b> <%
 	} else {
 %> <b><%=i%></b> <%
 	}
 %>
							</a>
							<%
								}
							%>

							<a href="reviewBoard.jsp?pageno=<%=next_pageno%>">▶</a>

						</div>
					</li>

					<!-- 검색 폼 영역 -->
					<li id='liSearchOption'>
						<div>
							<select id='selSearchOption'>
								<option value='A'>제목+내용</option>
								<option value='T'>제목</option>
								<option value='C'>내용</option>
							</select> <input id='txtKeyWord' /> 
							<input type='button' value='검색' />
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>

</body>

</html>