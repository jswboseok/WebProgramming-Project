<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %> 
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.text.*" %>
<!-- 딱히 수정사항 x 1207 -->

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>동국마켓</title>
	<link href="css/main.css" rel="stylesheet" type="text/css">
	<link href="css/table.css" rel="stylesheet" type="text/css">
	 <!-- CJH, 제목 폰트 관련 추가 (11/23 && 11/28)  -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
	<!-- 1201 Naver Map API -->
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=db4sb1wr4q&callback=initMap"></script>
	<script type="text/javascript">
        var map = null;

        function initMap() {
            map = new naver.maps.Map('map', {
                center: new naver.maps.LatLng(37.55828, 127.00030),//동국대 위치로 수정하기.
                zoom: 16
            });
            var marker = new naver.maps.Marker({
                position: new naver.maps.LatLng(37.55828, 127.00030),
                map: map,
            }); 
            naver.maps.Event.addListener(map, 'click', function(e) {
            marker.setPosition(e.latlng);
        	});
        }
    </script>
	
</head>
<body>
<!--기본 틀 구성하기 11_18-->
	<!-- CJH, 마이홈페이지, 로그인 세션과 연동하기, -->
	<%
		//현재 세션 회원정보 
		
		String userID=null;
		userID=(String) session.getAttribute("userID");
		
		if(userID==null){
			 PrintWriter script = response.getWriter();
			 script.println("<script>");
			 script.println("alert('로그인을 먼저 해주세요')");
			 script.println("location.href = 'login.jsp'");
			 script.println("</script>"); 
		} 
		else{ //else 이페이지 맨끝까지 좀복잡한데.. http 500안뜸..
			UserDAO userDAO= new UserDAO();
			userDAO = userDAO.getUser(userID);
			
			// 세션의 ID로부터 DB 검색 통해 관련 정보가져옴
			
			String userPassword =userDAO.getUserPassword();
			String userName = userDAO.getUserName();
			String userDate = userDAO.getUserDate();
			String userGender = userDAO.getUserGender();
			
			// 마지막 로그인 정보(세션만들어진 시간) 1128
			long lastLog = (long)session.getAttribute("log");
			SimpleDateFormat fmat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			//로그인용 세션 ID
			String userforLogin=null;
		
	%>
        <!-- 로그인된  사람은 로그인 정보를 담을 수 있도록 만듬 11/27 -->
	<%
		/* String userID=null; */
		/* if(session.getAttribute("userID")!= null){
			userforLogin=(String) session.getAttribute("userID");
		} */
			userforLogin=(String) session.getAttribute("userID");
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
    				<li><a href="login.jsp">로그인</a></li>
    				<li><a href="Join.jsp">회원가입</a></li>
    			
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
    				<li><a href="#">환영합니다 <%=userforLogin%> 님</a></li>
    				<li><a href="logoutAction.jsp">로그아웃</a></li>
    			
    			</ul>
    		</nav>
    	</header>
    	<!--  -->
        <%
    		}//else end
    	%>
        <div id ="headerTop">
        <h1 id="headerFont"><a href="main.jsp" style="text-decoration:none; color:black;">동국마켓</a></h1>
        </div>
        
			<!-- CJH, navigation bar를 위해 버튼식 구성을 <a>태그와 <ul><li>식으로 변경 11/23 -->
            <nav id="topMenu">
                <ul>
                    <li><a class="link" onclick="location='sell.jsp'">팝니다</a> </li>
                    <li><a class="link" onclick="location='buy.jsp'">삽니다</a> </li>
                    <!-- 로그인하여 세션이 생겨야 이 jsp파일에 접근가능하므로, ㄱㅊ-->
                    <li><a class="link" onclick="location='message.jsp'">쪽지</a> </li>
                    <!-- 고객센터부분 _11/23 -->
                    <li><a class="link" onclick="location='service.jsp'">고객센터</a></li>
                    <li><a class="link" onclick="location='mypage.jsp'">마이페이지</a> </li>
                </ul>
        	</nav>
          
        <div id="left_sidebar">
			<!-- <span class="left_bar_text">CATEGORY</span>
			<hr> -->
			<!-- 카테고리 요소 -->
			<!-- <div id="category">
				<ul>
					<li><a class="cate_link" href="book.jsp">책</a></li>
					<li><a class="cate_link" href="clothes.jsp">옷</a></li>
					<li><a class="cate_link" href="giftcon.jsp">기프티콘</a></li>
					<li><a class="cate_link" href="extraItem.jsp">기타</a></li>
				</ul>
			</div> -->
			<div class="subPage_category">
				
				<input type="checkbox" id="menuicon2">
				<label for="menuicon2">
					<span> </span>
					<span> </span>
					<span> </span>
				</label>
				<div class="sidebar2">
					<div class="quick_category2">
					<span style="font-family: 'Noto Sans KR', sans-serif;font-size:28px;font-weight: 400;">CATEGORY</span> 
					<!-- <hr>  -->
					<!-- 카테고리 요소 --> 
						<div id="category">
							<ul>
								<li><a class="cate_link" href="book.jsp">책</a></li>
								<li><a class="cate_link" href="clothes.jsp">옷</a></li>
								<li><a class="cate_link" href="giftcon.jsp">기프티콘</a></li>
								<li><a class="cate_link" href="extraItem.jsp">기타</a></li><br>
								
							</ul>
						</div>
					</div>
				</div>
			</div><!-- subPage_end -->
			<!-- 네이버 지도 API -->
			<span id="user_location">LOCATION<hr></span>
			<div id="map" style="width:100%;height:350px;"></div>
        </div>
        <div id ="contents">
        <!-- myPages, 현재 로그인한 session으로부터 정보를 읽어옴. -->
			<span id="myPage_text">마이페이지</span>
			<hr>
			<span id="myPage_text">회원정보</span>
			<div id="myPage_account">
				<ul>
					<li>아이디 : <%=userID %></li>
					<li>비밀번호 : <%=userPassword %></li>
					<li>이름 : <%=userName %></li>
					<li>생일 :  <%=userDate %></li>			
					<li>성별 :  <%=userGender %></li>	
					<li>마지막 접속 시간 : <%=fmat.format(lastLog) %></li>		
				</ul>
			</div><br>
			<span id="myPage_text">최근 게시글 정보</span><hr>
			
			<!-- 최근 게시글 정보 테이블 -->
			<div class="table-wrapper">
			    <table class="fl-table">
			    <!-- head부분 -->
			        <thead>
			        <tr>
			        	<th>번호</th>
			            <th>목적</th>
			            <th>카테고리</th>
			            <th>글제목</th>
			            <th>글쓴이</th>
			            <!-- <th>글쓴이</th> -->
			            
			        </tr>
			        </thead>
			        <tbody>
					<!-- DB에서 해당 닉네임으로 게시한 글의 최근  정보를 가져옴  -->
					<% 
						 int id;
						 int latest=0; 
			 			 String category="", title="", name="", content="", isbuy="";
				         int rownum = 0;
				         Connection conn = null;
				         Statement stmt = null;
				         String sql = null;
				         ResultSet rs = null;
				         try { 
			                 Class.forName("com.mysql.jdbc.Driver");  
			                 String url = "jdbc:mysql://localhost:3306/dgumarket?serverTimezone=UTC";
			                 conn = DriverManager.getConnection(url, "root", "0000");
			                 stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			                 sql = "select * from board order by id desc";
			                 rs = stmt.executeQuery(sql);
			           } 
			           catch(Exception e) {
			                 out.println("DB : " + e.getMessage());
			           }
			        rs.last();
			        rownum = rs.getRow();
			        rs.beforeFirst(); 
			        
			        while(rs.next() && latest<10){
			        	
			        		id = Integer.parseInt(rs.getString("id")); //getString()메소드를 활용해 각 행의 정보값 출력;
				            name = rs.getString("name");
				            if(name.equals(userID)){
				           	title=rs.getString("title");
				           	isbuy=rs.getString("isbuy");
				           	category=rs.getString("category");
				           	latest++;
			        	
			            
					%>
			        <tr>
			            <td><%=rs.getString("id") %></td>
			            <td><%=rs.getString("isbuy") %></td>
			            <td><%=rs.getString("category") %></td>
			            <td><a class="detail_link" href="board_read.jsp?id=<%=id %>"><%=rs.getString("title") %></a></td>
			            <td><%=rs.getString("name") %></td>
			            
			        </tr>
			       
			        <%} } %> <!-- while end --> 
			        <tbody>
			    </table><!-- fl-table end -->
			</div>
        </div>
       
        <div id="footer">
			<span class="footer_text">About Us</span>
			<p>동국대학교의 열정적인 웹프로그래밍 수업 수강생<br>
			&nbsp;2016112109 컴퓨터공학전공 장석운, 
			   2015112113 컴퓨터공학전공 정용헌,
			   2017112095 컴퓨터공학전공 최준호 <br>
			   송양의 교수님 웹프로그래밍_02반 - 3조<br>
			</p>
        </div>

		<%
    		}//else end
    	%> 
    </div><!-- container end -->
    
</body>
</body>
</html>