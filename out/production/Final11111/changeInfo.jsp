
<%@page import="gamefile.GameStar"%>
<%@page import="gamefile.GameImg"%>
<%@page import="gamefile.GameName"%>
<%@page import="gamevo.GameVO"%>
<%@page import="member.MemberVO"%>
<%@page import="member.MemberDAO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardVO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="css/custom.css" />
<title>게시판 메인</title>

<style type="text/css">
	a, a:hover {
		color: #000000;
		text-decoration: none;
	}
	ul{
	list-style:none;
}
.jumbotron {
  padding: 30px 15px;
  margin-bottom: 30px;
  color: inherit;
  background-color: white;
}
.form-control::-moz-placeholder {
  color: black;
  opacity: 1;
}
.form-control:-ms-input-placeholder {
  color: black;
}
.form-control::-webkit-input-placeholder {
  color: black;
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
</head>
<body>

	<%
	int count=0;
	PrintWriter script = response.getWriter();
	
	String id = null;
	//로그인을 이미 한 상태면 변수 id에 session으로 값을 받아온 id값을 넣어준다.
	if(session.getAttribute("id") != null){
		id = (String)session.getAttribute("id");
	}

	int pageNumber = 1;	//기본 페이지 번호 
	//다음 페이지 번호가 존재하면 페이지 번호를 적용해준다.
	
	//파라미터에 값이 넘어왔다면 페이지 넘버를 바꾼다.
	if(request.getParameter("pageNumber") != null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber")); 
	}

	
	MemberDAO mdao = new MemberDAO();
	MemberVO meminfo = new MemberVO();
	meminfo = mdao.getlist(id);
	String id2= meminfo.getId();
	String pw= meminfo.getPw();
	String gen=meminfo.getGender();
	String name= meminfo.getName();
	String nick= meminfo.getNickname();
	String age= Integer.toString(meminfo.getAge());
	String phone= meminfo.getPhone();
	String email= meminfo.getEmail();
	String btnPressMa="btn btn-primary";
	String btnPressFe="btn btn-primary";
	if(gen.equals("여"))
	{
		btnPressFe="btn btn-primary active";
	}
	else
	{
		btnPressMa="btn btn-primary active";
	}

	
	 
	%>


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
						<li class="hidden">
							<a href="#page-top"></a>
						</li>

						<!-- <li>
							<a class="page-scroll" href="#contact">Contact</a>
						</li> -->
						<%
						if(id !=  null){  /*로그인 O 네비게이션바  */
					%>
					<li><a class="page-scroll" href="#page-top"><%=nick%>님</a></li>
					<li><a class="page-scroll" href="start.jsp">Home</a></li>
					<li><a class="page-scroll" href="bbsAction.do">Comunity</a></li>
					<li><a href="reviewListAction.do?game_name='7개의 대죄'">GameRank()</a></li>
					<li><a class="page-scroll" href="logoutAction.do">Log out</a></li>
					<li><a class="page-scroll" href="mypage.jsp">My Page</a></li>
					<%
						}
						else if(id ==  null){ /*로그인 X 네비게이션바  */
					%>
					<li><a class="page-scroll" href="#page-top">Home</a></li>
					<li><a class="page-scroll" href="#category">category</a></li>
					<li><a class="page-scroll" href="bbsAction.do">Comunity</a></li>
					<li><a href="reviewListAction.do?game_name='7개의 대죄'">GameRank()</a></li>
					<li><a class="page-scroll" href="login.jsp">Sign in</a></li>
					<li><a class="page-scroll" href="join.jsp">Sign up</a></li>
					<%
						}
					%></ul>
					</div></div>

				
				<!-- /.navbar-collapse -->
			
			<!-- /.container-fluid -->
		</nav>

	<div class="container" style="margin-top:10%;">
	<div class="container sidebar">
	<h2>마이페이지</h2>	
	<hr class="hrclass">	
	<br>
	<ul class="firstMenu">
	<li>
		<a href="mypage.jsp" class="sidefont"><strong>작성글 보기  </strong><span><img src="img/file.png"></span></a>
		<br>
		<hr>	
	</li>
	</ul>
    
	<ul class="secondMenu">
	<li>
		<strong>개인정보 변경  </strong><span><img src="img/pencil.png" width="16px;"></span>
		<br>
		<hr>	
	</li>
	</ul>
    <ul class="lastMenu">
	<li>
		<a href="changePW.jsp" class="sidefont"><strong>비밀번호 변경  <strong><span><img src="img/pencil.png" width="16px;"></span></strong></a>
	</li>

	</ul>
	
	
	
	<div class="container">
	
		<div class="container">
			<div class="jumbotron" style="padding-top: 20px;">
				<form action="infoChange.do" method="post">
					<h2 style="text-align: center;"><strong>회원정보 수정<strong></h2>
					<hr class="hrclass">
					<div class="form-group">
						아이디&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=id2 %>
						<br>		<hr>
						닉네임&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=nick %>
				<hr>
					</div>
					<div class="form-group">
						현재 비밀번호 입력 <input type="password" class="form-control" name="pw" maxlength="20" >
					</div>
					<div class="form-group">
						이름<input type="text" class="form-control" placeholder=<%=name %> name="name" maxlength="20" >
					</div>
					<div class="form-group" style="text-align:center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="<%=btnPressMa %>">
								<input type="radio" name="gender" autocomplete="off" value="남"checked>남자
							</label>
							<label class="<%=btnPressFe %>">
								<input type="radio" name="gender" autocomplete="off" value="여">여자
							</label>
						</div>	
					</div>
					<div class="form-group">
						나이<input type="number" class="form-control" placeholder=<%=age %> name="age2" maxlength="20" >
					</div>
					<div class="form-group">
						전화번호<input type="text" class="form-control" placeholder=<%=phone %> name="phone" maxlength="20" >
					</div>
					<div class="form-group">
						이메일<input type="email" class="form-control" placeholder=<%=email %> name="email" maxlength="20" >
					</div>
					<input type="submit" class="btn btn-primary form-control" value="정보수정 완료">
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