<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.text.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
    <!-- 로그인된  사람은 로그인 정보를 담을 수 있도록 만듬 11/27 -->
	<%
		String userID=null;
		if(session.getAttribute("userID")!= null){
			userID=(String) session.getAttribute("userID");
		}
	%>
    <!--기본 틀 구성하기 11_18-->
    <div id ="container">
    	<!-- 로그인 되어있지 않다면,  -->
    	<%
    		if(userID == null){
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
    				<li><a href="#">환영합니다 <%=userID%> 님</a></li>
    				<li><a href="logoutAction.jsp">로그아웃</a></li>
    			
    			</ul>
    		</nav>
    	</header>
    	<%
    		}
    	%>
        <div id ="headerTop">
        <h1 id="headerFont"><a href="main.jsp" style="text-decoration:none; color:black;">동국마켓</a></h1>
        </div>
			<!-- CJH, navigation bar를 위해 버튼식 구성을 <a>태그와 <ul><li>식으로 변경 11/23 -->
            <nav id="topMenu">
                <ul>
                    <li><a class="link" onclick="location='sell.jsp'">팝니다</a> </li>
                    <li><a class="link" onclick="location='buy.jsp'">삽니다</a> </li>
                     <!-- 쪽지 : 로그인을 안해 세션이 없다면, 경고창 뜨게 함 -->
                    <%
                    	if(userID==null){ //로그인 되어있지 않다면,
                    %>
                     <li><a class="link" onclick="alert('로그인을 먼저 해주세요');">쪽지</a></li>
                    <%} else { %>
                    <li><a class="link" onclick="location='message.jsp'">쪽지</a> </li>
                    <% } %>
                    <!-- 고객센터부분 _11/23 -->
                    <li><a class="link" onclick="location='service.jsp'">고객센터</a></li>
                     <!-- 로그인을 안하여 세션이 없다면, 경고창 뜨게 하기. 1128 -->
                    <%
                    	if(userID==null){ //로그인 되어있지 않다면,

                    %>
                    <!-- 로그인 되어 있지 않은 경우 팝업 경고 -->
                    <li><a class="link" onclick="alert('로그인을 먼저 해주세요');">마이페이지</a></li>
                    <%} else { %>
                    <li><a class="link" onclick="location='mypage.jsp'">마이페이지</a> </li>
                    <% } %>
                </ul>
        	</nav>
          
        <div id="left_sidebar">
			<!-- <span class="left_bar_text">CATEGORY</span>
			<hr>
			카테고리 요소
			<div id="category">
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
			</div>
			<!-- 네이버 지도 API -->
			<span id="user_location">LOCATION<hr></span>
			<div id="map" style="width:100%;height:350px;"></div>
        </div>
        <div id ="contents">
        <!-- 테이블 디자인 -->
        <div class="table-wrapper">
			<table class="fl-table">
		      <thead>
			      <tr>
				     <!--  <td align="center" bgcolor="silver" width="7%">번호</td>
				      <td align="center" bgcolor="silver" width="14%">목적</td>
				      <td align="center" bgcolor="silver" width="14%">카테고리</td>
				      <td align="center" bgcolor="silver" width="54">글제목</td>
				      <td align="center" bgcolor="silver" width="12">글쓴이</td> -->
				      <th width="7%">번호</th>
				      <th width="14%">목적</th>
				      <th width="14%">카테고리</th>
				      <th width="54">글제목</th>
				      <th width="12">글쓴이</th>
			      </tr>
			 </thead>
      		<tbody>
      		<!--  DB에서 데이터 얻어와 화면에 보여주는 부분 -->
      		
      		<% // JSP Start
		         int id;
      			 String category, title, name, content, isbuy;
		         int rownum = 0;
		         Connection conn = null; //Connection 객체 생성하여 DB에 연결, 경로와 사용자계정, 패스워드 통해 접속,
		         Statement stmt = null; //Statement 객체 생성, SQL문을 실행하기 위함
		         String sql = null;
		         ResultSet rs = null;
		         
		         try { 
		                 Class.forName("com.mysql.jdbc.Driver");  //JDBC드라이버 로드 , MySQL의 JDBC드라이버를 로드함.
		                 String url = "jdbc:mysql://localhost:3306/dgumarket?serverTimezone=UTC"; //url JSP페이지내에서 사용할 DB이름을 포함하는 URL을 변수에 저장
		                 conn = DriverManager.getConnection(url, "root", "0000"); // id root, p 0000
		                 stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE); //Statement
		                 //sql = "select * from board order by ref desc, id asc";
		                 sql = "select * from board order by id desc";
		                 rs = stmt.executeQuery(sql);
		           } 
		           catch(Exception e) {
		                 out.println("DB : " + e.getMessage());
		           }
		        rs.last();
		        rownum = rs.getRow();
		        rs.beforeFirst(); 
		         
		         while(rs.next()){
		            id = Integer.parseInt(rs.getString("id")); //getString()메소드를 활용해 각 행의 정보값 출력;
		            name = rs.getString("name");
		           	title=rs.getString("title");
		           	isbuy=rs.getString("isbuy");
		           	category=rs.getString("category");
		         if(isbuy.equals("삽니다")){
		         %>
		            <tr>
		               <td><%=rs.getString("id") %></td>
		               <td><%=rs.getString("isbuy") %></td>
		               <td><%=rs.getString("category") %></td>
		               <%-- <td align="center"><a href="Board-read.jsp?id=<%=id%>"><%=rs.getString("title") %></a></td> --%>
		               <%-- <td align="center"><a href="board_read.jsp?id=<%=id%>""><%=rs.getString("title") %></a></td> --%>
		               <% if(userID == null){%>
		               <td><a class="detail_link" href="buy.jsp" onclick="alert('로그인을 먼저 해주세요.')"><%=rs.getString("title") %></a></td>
		               <%}else{%><td><a class="detail_link" href="board_read.jsp?id=<%=id%>""><%=rs.getString("title") %></a></td>
		               <%}%>
		               <td><%=rs.getString("name") %></td>
		            </tr>
		         <%}  }%>
			</tbody>
      		</table>
      		</div><br>
      		<% if(userID == null){%>
		     	<button class="write_button" type="button" onclick="alert('로그인을 먼저 해주세요.')">글쓰기</button>
		     <%}else{%>
		     	<button class="write_button" type="button" onclick=" location.href='write.jsp'">글쓰기</button>
		     <%}%>
		    
        </div>
        <!-- <div id="right_sidebar">
        CJH : 11/23,로그인창에 대하여 fieldset과 legend태그로 묶어주기, 
        	<hr>
        	<form>
        		<fieldset> 
	        		<legend align="center">로그인 </legend>
	        		&nbsp; ID<br><input type="text" name="id"><br>
	        		type password로 변경 11/23
        			&nbsp;비밀번호<br><input type="password" name="password"><br><br>
        			
        			<input type="submit" value="로그인">
        			
					<button onclick="location='make_auth.jsp'">회원가입</button>
        		
        		</fieldset>

        	</form>
        	
        	
		</div> -->
        <div id="footer">	
			<span class="footer_text">About Us</span>
			<p>동국대학교의 열정적인 웹프로그래밍 수업 수강생<br>
			&nbsp;2016112109 컴퓨터공학전공 장석운, 
			   2015112113 컴퓨터공학전공 정용헌,
			   2017112095 컴퓨터공학전공 최준호 <br>
			   송양의 교수님 웹프로그래밍_02반 - 3조<br>
        </div>

		
    </div>
    
</body>

</html>