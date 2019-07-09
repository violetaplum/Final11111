
<%@page import="gamevo.GameVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="gamefile.GameStar"%>
<%@page import="gamefile.GameImg"%>
<%@page import="gamefile.GameName"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=deviece-width", initial-scale="1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="css/custom.css" />

	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<!-- Custom styles for this template -->
	<link href="css/owl.carousel.css" rel="stylesheet">
	<link href="css/owl.theme.default.min.css"  rel="stylesheet">
	<link href="css/animate.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="js/jquery-3.4.1.js" type="text/javascript"></script>
<style>

	@media (min-width: 600px){
		#feet{
			margin-top:20%;
		}
		.section-cta{
			margin-top:100px;
		}
	}
	@media (min-width:970px)
	{
		#feet{
			margin-top:10%;
		}
	}
	#feet{
		margin-top:150px;
	}

</style>
<%

GameName gn=new GameName();
GameImg gi=new GameImg();
GameStar gs=new GameStar();
gi.imgarr.clear();
gs.stararr.clear();
System.out.println(gi.imgarr.size());
System.out.println(gs.stararr.size());
String src="free";
String imgsrc="free_img";
String starsrc="free_star";

gn.create(src);
gi.create(imgsrc);
gs.create(starsrc);
System.out.println(gi.imgarr.size());
System.out.println(gs.stararr.size());
ArrayList<String> al=new ArrayList<String>();
ArrayList<GameVO> gl=new ArrayList<GameVO>();

%>

	<title>Insert title here</title>
</head>
<body>


<%--	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">gevolution</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
				<li><a href="rank.jsp">게임순위</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li>	<!-- active :현재 선택됨  -->
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>--%>
<nav class="navbar navbar-default navbar-fixed-top" style="height:80px">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
	<nav class="navbar navbar-default navbar-fixed-top"  style="background-color:#eaeaea;">
			<div class="container" >
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header page-scroll">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand page-scroll" href="start.jsp"><img src="images/MainL.png" height="80%" width="auto" alt="Sanza theme logo"></a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right" style="display:inline-block;">
						<li class="hidden">
							<a href="#page-top"></a>
						</li>

						<!-- <li>
							<a class="page-scroll" href="#contact">Contact</a>
						</li> -->
					
					<li><a class="page-scroll" href="#page-top">Home</a></li>
					<li><a class="page-scroll" href="#category">category</a></li>
					<li><a class="page-scroll" href="bbsAction.do">Comunity</a></li>
					<li><a href="reviewListAction.do?game_name='7개의 대죄'">GameRank()</a></li>
					<li><a class="page-scroll" href="login.jsp">Sign in</a></li>
					<li><a class="page-scroll" href="join.jsp">Sign up</a></li>
					</ul>
					</div></div></nav>
</div></nav>
	
	<!--로그인 화면  보내는 인자 userID, userPassword-->
	<div id="feet" class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form action="joinAction.do" method="post">
					<h3 style="text-align: center;">Sign In Page</h3>
					<div class="form-group">
						ID <input type="text" class="form-control" placeholder="User ID" name="id" maxlength="20" >
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="User PW" name="pw" maxlength="20" >
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Name" name="name" maxlength="20" >
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Nickname" name="nickname" maxlength="20" >
					</div>
					<div class="form-group" style="text-align:center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active" style="background-color: #FCBE03;border-color: #FCBE03">
								<input type="radio" name="gender" autocomplete="off" value="남자"checked>MAN
							</label>
							<label class="btn btn-primary" style="background-color: #FCBE03;border-color: #FCBE03">
								<input type="radio" name="gender" autocomplete="off" value="여자">WOMAN
							</label>
						</div>	
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Age" name="age" maxlength="20" >
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Phone" name="phone" maxlength="20" >
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="Email" name="email" maxlength="20" >
					</div>
					<input type="submit" class="btn btn-primary form-control" value="Sign Up" style="background-color: #FCBE03;border-color: #FCBE03">
				</form>
			</div>
		</div>
	</div>

<br><br><br><br><br><br>

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