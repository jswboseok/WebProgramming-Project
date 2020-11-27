<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %> 
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동국마켓</title>
<link href="main.css" rel="stylesheet" type="text/css">
<!-- CJH, 제목 폰트 관련 추가 (11/23)  -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet"> 
</head>
<body>
<!--기본 틀 구성하기 11_18-->
	<!-- CJH, 마이홈페이지, 로그인 세션과 연동하기, -->
	<%
		//현재 세션 회원정보 
		
		String userID=null;
		userID=(String) session.getAttribute("userID");
		
		UserDAO userDAO= new UserDAO();
		userDAO = userDAO.getUser(userID);
		
		// 세션의 ID로부터 DB 검색 통해 관련 정보가져옴
		String userPassword =userDAO.getUserPassword();
		String userName = userDAO.getUserName();
		String userDate = userDAO.getUserDate();
		String userGender = userDAO.getUserGender();
		
		//로그인용 세션 ID
		String userforLogin=null;
		
	%>
        <!-- 로그인된  사람은 로그인 정보를 담을 수 있도록 만듬 11/27 -->
	<%
		/* String userID=null; */
		if(session.getAttribute("userID")!= null){
			userforLogin=(String) session.getAttribute("userID");
		}
	%>
    <!--기본 틀 구성하기 11_18-->
    <div id ="container">
    	<!-- 로그인 되어있지 않다면,  -->
    	<%
    		if(userforLogin == null){
    	%>
    	<!-- CJH, 로그인 회원가입 창을 우측 화면 상단으로 올리기,  -->
    	<header>
    		<nav>
    			<ul class="login_menu">
    				<li><img src="images/netlog.svg" height="30" width="30"></li>
    				<li><a href="login.jsp">로그인</a>
    				<li><a href="Join.jsp">회원가입</a>
    			
    			</ul>
    		</nav>
    	</header>
    	<%
    		} else{
    	%>
    	<!-- 로그인 되어 있다면, -->
    	<header>
    		<nav>
    			<ul class="login_menu">
    				<li><img src="images/netlog.svg" height="30" width="30"></li>
    				<li><a href="#">환영합니다 <%=userforLogin%> 님</a>
    				<li><a href="logoutAction.jsp">로그아웃</a>
    			
    			</ul>
    		</nav>
    	</header>
    	<%
    		}
    	%>
        
        <div id ="headerTop">
        <h1 id="headerFont"><a href="main.jsp" style="text-decoration:none; color:black;">동국대학교 중고거래장터</a></h1>
        </div>
        
			<!-- CJH, navigation bar를 위해 버튼식 구성을 <a>태그와 <ul><li>식으로 변경 11/23 -->
            <nav id="topMenu">
                <ul>
                    <li><a class="link" onclick="location='sell.jsp'">팝니다</a> </li>
                    <li><a class="link" onclick="location='buy.jsp'">삽니다</a> </li>
                    <li><a class="link" onclick="location='letter.jsp'">쪽지</a> </li>
                    <!-- 고객센터부분 _11/23 -->
                    <li><a class="link" href="#">고객센터</a></li>
                    <li><a class="link" onclick="location='mypage.jsp'">마이페이지</a> </li>
                </ul>
        	</nav>
          
        <div id="left_sidebar">
			카테고리
			<hr>
			<!-- 카테고리 요소 -->
			<div id="category">
				<ul>
					<li><a class="cate_link" href="book.jsp">책</a></li>
					<li><a class="cate_link" href="clothes.jsp">옷</a></li>
					<li><a class="cate_link" href="giftcon.jsp">기프티콘</a></li>
					<li><a class="cate_link" href="extraItem.jsp">기타</a></li>
				</ul>
			</div>
        </div>
        <div id ="contents">
        <!-- myPages, 현재 로그인한 session으로부터 정보를 읽어옴. -->
			마이페이지<hr>
			회원정보
			<div id="account">
				<ul>
					<li>아이디 : <%=userID %></li>
					<li>비밀번호 : <%=userPassword %></li>
					<li>이름 : <%=userName %></li>
					<li>성별 :  <%=userDate %></li>			
					<li>생일 :  <%=userGender %></li>			
				</ul>
			</div><br>
			게시글 정보<hr>
			<!-- DB에서 해당 닉네임으로 게시한 글의 정보를 가져옴  -->
        </div>
        <!-- <div id="right_sidebar">
        <hr>
        	<form method="post" action="./login_Action.jsp">
        		<fieldset> 
	        		<legend align="center">로그인 </legend>
	        		&nbsp; ID<br><input type="text" class ="input" placeholder="아이디" name="userID" maxlength="20"><br>
	        		type password로 변경 11/23
        			&nbsp;비밀번호<br><input type="password" class="input" placeholder="비밀번호 "name="userPassword" maxlength="20"><br><br>
        		
        			<a href="login.jsp"><button type="button" class="btn btn-outline-dark">로그인</button>
        </form>
        </form>			
					<a href="Join.jsp"><button type="button" class="btn btn-outline-dark">회원가입</button>
        		
        		</fieldset>

        	</form>
        	
		</div> -->
        <div id="footer">

        </div>


    </div>
    
</body>
</body>
</html>