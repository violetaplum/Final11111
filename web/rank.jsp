
<%@page import="gamefile.GameInfor"%>
<%@page import="gamefile.GameStar"%>
<%@page import="gamefile.GameImg"%>
<%@page import="gamefile.GameName"%>
<%@page import="review.ReviewDAO"%>
<%@page import="member.MemberDAO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.BoardVO"%>
<%@ page import="member.MemberDAO"%>
<%@ page import="member.MemberVO"%>
<%@ page import="review.ReviewVO"%>
<%@ page import="review.ReviewDAO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="css/custom.css" />
<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<!-- <link href="css/business-casual.css" rel="stylesheet">  -->
<title>게시판 메인</title>
<script src="js/jquery-3.4.1.js"></script>

<style type="text/css">
	#starrating{
	CLEAR: both;	PADDING-RIGHT: 0px;	PADDING-LEFT: 0px;	BACKGROUND: url(images/icon_star2.png) 0px 0px;	FLOAT: left;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	WIDTH: 160px;	PADDING-TOP: 0px;	HEIGHT: 32px;
	
	}
	#starrating1{
	 PADDING-RIGHT:0px;	PADDING-LEFT:0px;	BACKGROUND: url(images/icon_star.png) 0px 0px;	PADDING-BOTTOM: 0px;	MARGIN: 0px;	PADDING-TOP: 0px;	HEIGHT: 32px;
	}
a, a:hover {
	color: #000000;
	text-decoration: none;
}

/*jquery별점  */
.starR1 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat -52px 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR2 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR1.on {
	background-position: 0 0;
}

.starR2.on {
	background-position: -15px 0;
}

/*script 별점  */
.star_input>.input, .star_input>.input>label:hover, .star_input>.input>input:focus+label,
	.star_input>.input>input:checked+label {
	display: inline-block;
	vertical-align: top;
	background:
		url(data:image/png;base64,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)
		no-repeat;
}

.star_input {
	white-space: nowrap;
}

.star_input>.input {
	display: inline-block;
	width: 100px;
	background-size: 100px;
	height: 19px;
	white-space: nowrap;
	overflow: hidden;
	position: relative;
}

.star_input>.input>input {
	position: absolute;
	width: 1px;
	height: 1px;
	opacity: 0;
}

.star_input>.input.focus {
	outline: 1px dotted #ddd;
}

.star_input>.input>label {
	width: 10px;
	height: 0;
	padding: 19px 0 0 0;
	overflow: hidden;
	float: left;
	cursor: pointer;
	position: absolute;
	top: 0;
	left: 0;
}

.star_input>.input>label:hover, .star_input>.input>input:focus+label,
	.star_input>.input>input:checked+label {
	background-size: 100px;
	background-position: 0 bottom;
}

.star_input>.input>label:hover ~label {
	background-image: none;
}

.star_input>.input>label[for="p1"] {
	width: 10px;
	z-index: 10;
}

.star_input>.input>label[for="p2"] {
	width: 20px;
	z-index: 9;
}

.star_input>.input>label[for="p3"] {
	width: 30px;
	z-index: 8;
}

.star_input>.input>label[for="p4"] {
	width: 40px;
	z-index: 7;
}

.star_input>.input>label[for="p5"] {
	width: 50px;
	z-index: 6;
}

.star_input>.input>label[for="p6"] {
	width: 60px;
	z-index: 5;
}

.star_input>.input>label[for="p7"] {
	width: 70px;
	z-index: 4;
}

.star_input>.input>label[for="p8"] {
	width: 80px;
	z-index: 3;
}

.star_input>.input>label[for="p9"] {
	width: 90px;
	z-index: 2;
}

.star_input>.input>label[for="p10"] {
	width: 100px;
	z-index: 1;
}

.star_input>output {
	display: inline-block;
	width: 36px;
	text-align: right;
}

.star_input>output>b {
	font: bold 18px Helvetica, Arial, sans-serif;
	vertical-align: middle;
}

.line {
	border-bottom: 1px solid red;
}

.table>thead>tr>th, .table>tbody>tr>th, .table>tfoot>tr>th, .table>thead>tr>td,
	.table>tbody>tr>td, .table>tfoot>tr>td {
	padding: 8px;
	line-height: 1.42857143;
	vertical-align: top;
	width: 200px;
	word-break: break-all;
	padding-left: 20px;
	border-top: 0px;
}
</style>

</head>
<body>

	<%
		PrintWriter script = response.getWriter();

		String id = null;//회원 아이디
		String game_name = null;//게임 네임
		int r_pageNumber = 1; //기본 페이지 번호 
		//다음 페이지 번호가 존재하면 페이지 번호를 적용해준다.

		BoardDAO bdao = new BoardDAO();
		MemberDAO mdao = new MemberDAO();
		ReviewDAO rdao = new ReviewDAO();
		ArrayList<ReviewVO> rlist = new ArrayList<>();

		//로그인을 이미 한 상태면 변수 id에 session으로 값을 받아온 id값을 넣어준다.
		if (session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
			System.out.println("리뷰 회원 아이디 : " + id);
		}

		//game_name
		if (request.getAttribute("game_name") != null) {
			game_name = request.getAttribute("game_name").toString();
			System.out.println("리뷰 게임: " + game_name);
		} else if (request.getParameter("game_name") != null) {
			game_name = request.getParameter("game_name");
		} else {
			System.out.println("게임이름을 받아오지 못했습니다.");
		}

		//리뷰 페이지 번호받기
		if (request.getAttribute("r_pageNumber") != null) {
			r_pageNumber = Integer.parseInt(request.getAttribute("r_pageNumber").toString());
			System.out.println("받아온 리뷰 페이지 : " + r_pageNumber);
		} else {
			System.out.println("어트리뷰트 리뷰 페이지 못받아옴");
		}

		if (request.getAttribute("rlist") == null) {
			System.out.println("rank.jsp에서 리뷰리스트를 불러오지 못했습니다.");
			script.println("<script>");
			script.println("alert('rlist를 받아오지 못했습니다.')");
			script.println("</script>");
			script.println("location.href='main.jsp'");
		} else {
			rlist = (ArrayList<ReviewVO>) request.getAttribute("rlist"); //리스트 생성
			System.out.println("리뷰리스트 블러오기 성공, r_pagenumber : " + r_pageNumber);
		}

		//페이징 처리 변수들

		int rowSize = 10; //게시물 숫자 
		int from = (r_pageNumber * rowSize) - (rowSize - 1); //(1*10)-(10-1)=10-9=1 //from
		int to = (r_pageNumber * rowSize); //(1*10) = 10 //to

		int total = rdao.getTotal(); //총 게시물 수
		int allPage = (int) Math.ceil(total / (double) rowSize); //총 페이지수

		//int totalPage = total/rowSize + (total%rowSize==0?0:1);
		int block = 10; //한페이지에 보여줄  범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>
		int fromPage = ((r_pageNumber - 1) / block * block) + 1; //보여줄 페이지의 시작
		int toPage = ((r_pageNumber - 1) / block * block) + block; //보여줄 페이지의 끝
		if (toPage > allPage) { // 예) 20>17
			toPage = allPage;
		}
		System.out.println("전체 페이지수 : " + allPage);
		System.out.println("현제 페이지 : " + r_pageNumber);
		System.out.println("페이지시작 : " + fromPage + " / 페이지 끝 :" + toPage);
		GameInfor gi=new GameInfor();
		
	%>



	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container" >
		<!-- Brand and toggle get grouped for better mobile display -->
	<nav class="navbar navbar-default navbar-fixed-top"  style="background-color:#eaeaea;height:70px;">
			<div class="container" >
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header page-scroll">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand page-scroll" href="start.jsp"><img src="images/MainL.png" height="43px" width="auto" alt="Sanza theme logo"></a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right" style="display:inline-block;">
						



			<%
				//로그인이 되있지 않다면 로그인, 회원가입 드롭다운 메뉴를 생성
				if (id == null) {
			%>
				<li><a href="main.jsp">Home</a></li>
				<li><a href="bbsAction.do">Community</a></li>
				<li class="active"><a href="reviewListAction.do">Review</a></li>
					<li><a class="page-scroll" href="login.jsp">Sign in</a></li>
					<li><a class="page-scroll" href="join.jsp">Sign up</a></li>


			<%
				} else { //로그인이 된 경우
			%>
				<li>
				<a href="mypage.jsp"><%=mdao.getNickuseid(id)%>님</a>
				</li>
				<li><a href="main.jsp">Home</a></li>
				<li><a href="bbsAction.do">Community</a></li>
				<li class="active"><a href="reviewListAction.do">Review</a></li>
						<li><a href="mypage.jsp">My Page</a></li>
						<!-- active :현재 선택됨  -->
						<li><a href="logoutAction.jsp">Sign out</a></li>


			<%
				}
			%></ul>
		</div></div>
	</nav></div></nav>

<%

String name=request.getParameter("name");
String img=request.getParameter("img");
String star=request.getParameter("star");
String info="gameinfo";
gi.create(info);

double sd=(Double.parseDouble(star)*20);
int si=(int)sd;
%>

<div class="container" style="margin-top:100px">

    <table class="table">
    <thead>
    <tr>
        <th colspan="9" style="text-align:left;height:60px; background-color:#5D5D5D;font-size:17px;color:white">GAME INFO</th>
    </tr>
    </thead>
    <tr align="center">
        <td style="font-size:20px;font-weight: bold; font-style: italic;display:" width="50px">
            <img src="<%=img%>" width="150px" height="150px"><br><br>
            <h4><strong><%=name%></strong></h4><br>
            <%Double rate=Double.valueOf(star);
            rate=rate*20;%>
            <div id="starrating" >
            <p id="starrating1" style="WIDTH: <%=rate%>%;margin-left:-10px;"></p>
												
		</div>
        </td>
        <td><h4>
                <%for(int i=0;i<gi.infoarr.size();i++)
                {
                    %>
            <%=gi.infoarr.get(i)%>
            <%
                }%>
        </h4>
        </td>
    </tr>
    <tr><td colspan="9" style="text-align:right;"><a href="Main.jsp" style="text-align:right;color:grey;">순위 전체보기</a></td></tr>
</table>

</div>


	<!-- ------------------------------------------------- -->

	<!--review list  -->
	<div align="center" style="margin-top:10%">
		<div class="container">
			<div align="left">
				<h3>
					<strong>Game Review</strong>
				</h3>

			</div>
				<hr style="background-color:#ddd;">
			<!-- 			<table frame=void class="table" > -->
			<table border=0 class="table">
				<%
					for (int i = 0; i < rlist.size(); i++) {
				%>
				<tbody>
					<tr style="height: 7px; font-size: 13px;">
						<td style="text-align: left; font-weight: 800; font-size: 13px;">
							&nbsp;&nbsp;&nbsp;&nbsp;<%=rlist.get(i).getNickname()%>
						</td>
						<%int r=rlist.get(i).getRating();
						r=r*10;%>
						<td style="text-align: left; font-weight: 800; font-size: 13px;">
							<div id="starrating" >
				    		<p id="starrating1" style="WIDTH: <%=r%>%;"></p>
												
							</div>
						</td>
						<td style="text-align: right; font-size: 13px;"><%=rlist.get(i).getDay()%>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					</tr>
					<tr style="height: 40px;">
						<td colspan="3" style="text-align: left">
							&nbsp;&nbsp;&nbsp;&nbsp;<%=rlist.get(i).getR_content()%>
						</td>
					</tr>
				</tbody>
				<%
					}
				%>
				
			</table>
			<button class="btn btn-danger pull-right" data-target="#myModal"
				data-toggle="modal">리뷰 작성하기</button>

		</div>
	</div>

<%-- <br><br><br><br><br><br>

		<section id="partners">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<div class="section-title">
							<h2>신규 인기 게임</h2>
							<p>오늘의 신작</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12 text-center">
						<div class="owl-partners owl-carousel">
						<%for(int p=0;p<15;p++){ %>
							<div class="item">
								<div class="partner-logo"><a href="FreeChart.jsp?name=<%=gn.namearr.get(p)%>"><img src="<%=gi.imgarr.get(p) %>" alt="partners"></a></div><br>
								<div class="partner-logo" style="font-size:15px;text-align:left;"><%=gs.stararr.get(p)%>★</div>
							</div>
							<%} %>
							
						</div>
					</div>
				</div>
			</div>
		</section>
		

		
		<section id="contact" class="dark-bg">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<div class="section-title">
							<h2>Mid Project</h2>
							
						</div>
					</div>
				</div>
				<div class="row" style="margin-left:10%">
					<div class="col-lg-6">
						<div class="section-text">
							<h4>KGITBANK</h4>
							<p>서울특별시 종로구 돈화문로 26, 5층(묘동, 단성사)</p>
							<p><i class="fa fa-phone"></i>1566-8497</p>
							<p><i class="fa fa-envelope"></i>FAX : 02-3672-5615</p>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="section-text">
							<h4>Business Hours</h4>
							<p><i class="fa fa-clock-o"></i> <span class="day">Weekdays:</span><span>3pm to 10pm</span></p>
							<p><i class="fa fa-clock-o"></i> <span class="day">Saturday:</span><span>Closed</span></p>
							<p><i class="fa fa-clock-o"></i> <span class="day">Sunday:</span><span>Closed</span></p>
						</div>
					</div>

				</div>
			</div>
		</section>
		<p id="back-top">
			<a href="#top"><i class="fa fa-angle-up"></i></a>
		</p>
		<footer>
			<div class="container text-center">
				 <p>This Homepage is powered by <span class="text-primary">2조</span> / Designed by <span class="text-primary">김민정 장희수 황상호 박시원</span></p>
			</div>
		</footer>

		<!-- Modal for portfolio item 1 -->
		<div class="modal fade" id="Modal-1" tabindex="-1" role="dialog" aria-labelledby="Modal-label-1">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="Modal-label-1">김민정</h4>
					</div>
					<div class="modal-body">
						<img src="images/demo/portfolio-1.jpg" alt="img01" class="img-responsive" />
						<div class="modal-works"><span>Branding</span><span>Web Design</span></div>
						<p>Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Modal for portfolio item 2 -->
		<div class="modal fade" id="Modal-2" tabindex="-1" role="dialog" aria-labelledby="Modal-label-2">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="Modal-label-2">장희수</h4>
					</div>
					<div class="modal-body">
						<img src="images/demo/portfolio-2.jpg" alt="img01" class="img-responsive" />
						<div class="modal-works"><span>Branding</span><span>Web Design</span></div>
						<p>Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Modal for portfolio item 3 -->
		<div class="modal fade" id="Modal-3" tabindex="-1" role="dialog" aria-labelledby="Modal-label-3">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="Modal-label-3">황상호</h4>
					</div>
					<div class="modal-body">
						<img src="images/demo/portfolio-3.jpg" alt="img01" class="img-responsive" />
						<div class="modal-works"><span>Branding</span><span>Web Design</span></div>
						<p>Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Modal for portfolio item 4 -->
		<div class="modal fade" id="Modal-4" tabindex="-1" role="dialog" aria-labelledby="Modal-label-4">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="Modal-label-4">박시원</h4>
					</div>
					<div class="modal-body">
						<img src="images/demo/portfolio-4.jpg" alt="img01" class="img-responsive" />
						<div class="modal-works"><span>Branding</span><span>Web Design</span></div>
						<p>Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Modal for portfolio item 5 -->
		<div class="modal fade" id="Modal-5" tabindex="-1" role="dialog" aria-labelledby="Modal-label-5">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="Modal-label-5">Fast People</h4>
					</div>
					<div class="modal-body">
						<img src="images/demo/portfolio-5.jpg" alt="img01" class="img-responsive" />
						<div class="modal-works"><span>Branding</span><span>Web Design</span></div>
						<p>Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe</p>
					</div>

				</div>
			</div>
		</div> --%>


	<!--페이징  -->
	<div align=center>
		<div class="container">
			<ul class="pagination justify-content-center">
				<%
					if (r_pageNumber > block) { //처음, 이전 링크
				%>
				<li><a
					href="reviewListAction.do?r_pageNumber=<%=fromPage - 1%>"><<</a></li>
				<%
					}
					if (r_pageNumber == 1) {
				%>
				<li class="page-item disabled"><a href="#">Previous</a></li>
				<%
					} else {
				%>
				<li><a
					href="reviewListAction.do?r_pageNumber=<%=r_pageNumber - 1%>">Previous</a></li>
				<%
					}
					for (int i = fromPage; i <= toPage; i++) {
						if (i == r_pageNumber) {
				%>
				<li class="active"><a href="#"><%=i%></a></li>
				<%
					} else {
				%>
				<li><a href="reviewListAction.do?r_pageNumber=<%=i%>"><%=i%></a></li>

				<%
					}
					}
					if (bdao.getTotal() > 1 && r_pageNumber != allPage) {
				%>

				<li><a
					href="reviewListAction.do?r_pageNumber=<%=r_pageNumber + 1%>">Next</a></li>
				<%
					} else {
				%>
				<li class="page-item disabled"><a href="#">Next</a></li>
				<%
					}
					if (toPage < allPage) {
				%>

				<li><a href="reviewListAction.do?r_pageNumber=<%=toPage + 1%>">>></a></li>
				<%
					}
				%>
			</ul>
		</div>
	</div>
	<!--/페이징  -->

	<%-- 

	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">내용</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;">별점</th>
					</tr>
				</thead>
				<tbody>

					<%
						for (int i = 0; i < rlist.size(); i++) {
					%>
					<!--닉네임, day, content rating  -->
					<tr>
						<td><%=blist.get(i).getB_id() %></td>
						<td><%=rdao.getTotal() - i - (r_pageNumber - 1) * 10%></td>
						<td><a href="viewAction.do?b_id=<%=rlist.get(i).getB_id()%>"><%=blist.get(i).getTitle()%></a></td>
						<td><%=rlist.get(i).getR_content()%></td>

						<td><%=rlist.get(i).getNickname()%></td>
						<td><%=rlist.get(i).getDay()%></td>
						<td><%=rlist.get(i).getRating()%></td>
					</tr>



					<%
						}
					%>
				</tbody>
			</table>
			<button class="btn btn-danger pull-right" data-target="#myModal"
				data-toggle="modal">리뷰 작성하기</button>


		</div>
	</div> --%>

	<!--/review list  -->








	<!--review list  -->
	<%-- <div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">내용</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;">별점</th>
					</tr>
				</thead>
				<tbody>
					<%
						BoardDAO bdao = new BoardDAO();

						ArrayList<BoardVO> blist = bdao.getList(pageNumber);
						
					<%
						for (int i = 0; i < rlist.size(); i++) {
					%>
					<!--닉네임, day, content rating  -->
					<tr>
						<td><%=blist.get(i).getB_id() %></td>
						<td><%=rdao.getTotal() - i - (r_pageNumber - 1) * 10%></td>
						<td><a href="viewAction.do?b_id=<%=rlist.get(i).getB_id()%>"><%=blist.get(i).getTitle()%></a></td>
						<td><%=rlist.get(i).getR_content()%></td>

						<td><%=rlist.get(i).getNickname()%></td>
						<td><%=rlist.get(i).getDay()%></td>
						<td><%=rlist.get(i).getRating()%></td>
					</tr>

					<%
						}
					%>
				</tbody>
			</table>
			<button class="btn btn-danger pull-right" data-target="#myModal"
				data-toggle="modal">리뷰 작성하기</button>
			<br />

		</div>
	</div>
 --%>
	<!--/review list  -->





	<%-- 
	<!--btn-arraw-left  -->
	<%
		if (r_pageNumber != 1) {
	%>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="reviewListAction.do?r_pageNumber=<%=r_pageNumber - 1%>"
		class="btn btn-success ">이전</a>
	<%
		}
		if (r_pageNumber != allPage) {
			if (rdao.getTotal() > 10) {
	%>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="reviewListAction.do?r_pageNumber=<%=r_pageNumber + 1%>"
		class="btn btn-success">다음</a>
	<%
		}
		}
	%> --%>
	<%-- 
	<!-- <table width="600"> -->
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center;">

				<tr>
					<td align="center">
						<%
							if (r_pageNumber > block) { //처음, 이전 링크
						%> [<a href="reviewListAction.do?r_pageNumber=1">◀◀</a>] [<a
						href="reviewListAction.do?r_pageNumber=<%=fromPage - 1%>">◀</a>] <%
							} else {
						%> [<span style="color: gray">◀◀</span>] [<span
						style="color: gray">◀</span>] <%
							}
						%> <%
 	for (int i = fromPage; i <= toPage; i++) {
 		if (i == r_pageNumber) {
 %> [<%=i%>] <%
 	} else {
 %> [<a style="color: blue"
						href="reviewListAction.do?r_pageNumber=<%=i%>"><%=i%></a>] <%
 	}
 	}
 %> <%
 	if (toPage < allPage) { //다음, 이후 링크
 %> [<a href="reviewListAction.do?r_pageNumber=<%=toPage + 1%>">▶</a>]
						[<a href="reviewListAction.do?r_pageNumber=<%=allPage%>">▶▶</a>] <%
 	} else {
 %> [<span style="color: gray">▶</span>] [<span
						style="color: gray">▶▶</span>] <%
 	}
 %>

					</td>
				</tr>
			</table>
		</div>
	</div>
 --%>




	<!-- 		<div class="modal fade" id="myModal" role="dialog"> -->

	<div class="modal fade" id="myModal" role="modal">
		<div class="modal-dialog">



			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="background-color: dark">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 align="center" class="modal-title">game review</h4>
				</div>

				<!--바로 reviewAction.jsp로 보낸다.  -->

				<div class="modal-body" style="background-color: ivory">
					<form action="reviewAction.do" method="post"
						class="form-horizontal">

						<div class="form-group">
							<label for="inputId3" class="col-sm-3 control-label">* 게임</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="inputId3"
									name="game_name" value="<%=game_name%>" readonly>
							</div>

						</div>

						<div class="form-group">
							<label for="inputPassword3" class="col-sm-3 control-label">*
								닉네임</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="inputPassword3"
									name="nickname" value="<%=mdao.getNickuseid(id)%>" readonly>
							</div>
						</div>
						<!--별점 -->
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-3 control-label">*
								평점</label>
							<div class="col-sm-6">
								<!-- <input type="password" class="form-control" id="inputPassword3-confirm" placeholder="위와 동일한 비밀번호를 입력하세요."> -->
								<span class="star_input"> <span class="input"> <input
										type="radio" name="star_input" id="p1" value="1"><label
										for="p1">1</label> <input type="radio" name="star_input"
										id="p2" value="2"><label for="p2">2</label> <input
										type="radio" name="star_input" id="p3" value="3"><label
										for="p3">3</label> <input type="radio" name="star_input"
										id="p4" value="4"><label for="p4">4</label> <input
										type="radio" name="star_input" id="p5" value="5"><label
										for="p5">5</label> <input type="radio" name="star_input"
										id="p6" value="6"><label for="p6">6</label> <input
										type="radio" name="star_input" id="p7" value="7"><label
										for="p7">7</label> <input type="radio" name="star_input"
										id="p8" value="8"><label for="p8">8</label> <input
										type="radio" name="star_input" id="p9" value="9"><label
										for="p9">9</label> <input type="radio" name="star_input"
										id="p10" value="10"><label for="p10">10</label>
								</span> <output for="star_input">
										<b>0</b>점
									</output>
								</span>
								<!--  <div class="starRev">
								  <span class="starR1 on">별1_왼쪽</span>
								  <span class="starR2">별1_오른쪽</span>
								  <span class="starR1">별2_왼쪽</span>
								  <span class="starR2">별2_오른쪽</span>
								  <span class="starR1">별3_왼쪽</span>
								  <span class="starR2">별3_오른쪽</span>
								  <span class="starR1">별4_왼쪽</span>
								  <span class="starR2">별4_오른쪽</span>
								  <span class="starR1">별5_왼쪽</span>
								  <span class="starR2">별5_오른쪽</span>
								</div> -->
							</div>
						</div>


						<!--별접 script  -->
						<script>
							/* $('.starRev span').click(function(){
								  $(this).parent().children('span').removeClass('on');
								  $(this).addClass('on').prevAll('span').addClass('on');
								  return false;
								}); */

							var starRating = function() {
								var $star = $(".star_input"), $result = $star
										.find("output>b");
								$(document)
										.on("focusin", ".star_input>.input",
												function() {
													$(this).addClass("focus");
												})
										.on(
												"focusout",
												".star_input>.input",
												function() {
													var $this = $(this);
													setTimeout(
															function() {
																if ($this
																		.find(":focus").length === 0) {
																	$this
																			.removeClass("focus");
																}
															}, 100);
												})
										.on(
												"change",
												".star_input :radio",
												function() {
													$result.text($(this).next()
															.text());
												})
										.on(
												"mouseover",
												".star_input label",
												function() {
													$result
															.text($(this)
																	.text());
												})
										.on(
												"mouseleave",
												".star_input>.input",
												function() {
													var $checked = $star
															.find(":checked");
													if ($checked.length === 0) {
														$result.text("0");
													} else {
														$result.text($checked
																.next().text());
													}
												});
							};
							starRating();
						</script>

						<div class="form-group">
							<label for="inputName3" class="col-sm-3 control-label">*평가
								남기기</label>
							<div class="col-sm-6">
								<textarea class="form-control" placeholder="글 내용"
									name="r_content" maxlength="1000" style="height: 200px"></textarea>
								<!-- <input type="text" class="form-control" id="inputName3"
									name="name"> -->
							</div>
						</div>

						<!-- <div class="form-group">
							<label for="inputaddr3" class="col-sm-3 control-label">*
								주소</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="inputaddr3"
									name="address">
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">*
								이메일</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="inputEmail3"
									name="email" placeholder="example@myworld.com">
							</div>
						</div>
 -->


						<div class="modal-footer">
							<!-- <input type="submit" class="btn btn-default" value="완료" onclick="return confirm('회원 가입을 완료하시겠습니까?')"> -->
							<input type="submit" class="btn btn-default" value="작성">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>



	
		<!-- Bootstrap core JavaScript
			================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/owl.carousel.min.js"></script>
		<script src="js/cbpAnimatedHeader.js"></script>
		<script src="js/jquery.appear.js"></script>
		<script src="js/SmoothScroll.min.js"></script>
		<script src="js/theme-scripts.js"></script>
	</body>
</html>