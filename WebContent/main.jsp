<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.text.*" %>
<!-- 11/23 정적 main페이지 확장자 jsp로 바꿈 -->
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동국마켓</title>
    <!-- 외부 css 링크하기 -->
    <link href="css/main.css" rel="stylesheet" type="text/css">
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
    				<li><a href="#">환영합니다 <%=userID%> 님</a></li>
    				<li><a href="logoutAction.jsp">로그아웃</a></li>
    			
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
        	<span class="left_bar_text">CATEGORY</span>
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
			
			<!-- 네이버 지도 API -->
			<span id="user_location">LOCATION<hr></span>
			<div id="map" style="width:100%;height:350px;"></div>
			
			
			
        </div>
        <div id ="contents">
			<table border="1" align="center" width="100%">
		      <tr>
			      <td align="center" bgcolor="silver" width="7%">번호</td>
			      <td align="center" bgcolor="silver" width="14%">목적</td>
			      <td align="center" bgcolor="silver" width="14%">카테고리</td>
			      <td align="center" bgcolor="silver" width="54">글제목</td>
			      <td align="center" bgcolor="silver" width="12">글쓴이</td>
		      </tr>
      		
      		
      		
      		<!--  DB에서 데이터 얻어와 화면에 보여주는 부분 -->
      		
      		<% // JSP Start
		         int id;
      			 String category, title, name, content, isbuy;
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
		         
		         while(rs.next()){
		            id = Integer.parseInt(rs.getString("id")); //getString()메소드를 활용해 각 행의 정보값 출력;
		            name = rs.getString("name");
		           	title=rs.getString("title");
		           	isbuy=rs.getString("isbuy");
		           	category=rs.getString("category");
		         %>
		         
		         <!-- 로그인 먼저 하고 글쓰기 && 글 조회 가능하도록 -->
		            <tr>
		               <td align="center"><%=rs.getString("id") %></td>
		               <td align="center"><%=rs.getString("isbuy") %></td>
		               <td align="center"><%=rs.getString("category") %></td>
		               <%-- <td align="center"><a href="Board-read.jsp?id=<%=id%>"><%=rs.getString("title") %></a></td> --%>
		               <% if(userID == null){%>
		               <td align="center"><a href="main.jsp" onclick="alert('로그인을 먼저 해주세요.')"><%=rs.getString("title") %></a></td>
		               <%}else{%><td align="center"><a href="board_read.jsp?id=<%=id%>""><%=rs.getString("title") %></a></td>
		               <%}%>
		               <td align="center"><%=rs.getString("name") %></td>
		            </tr>
		         <%}%>

      		</table><br>
      		 <% if(userID == null){%>
		     	<button type="button" onclick="alert('로그인을 먼저 해주세요.')">글쓰기</button>
		     <%}else{%>
		     	<button type="button" onclick=" location.href='write.jsp'">글쓰기</button>
		     <%}%>
      		

        </div>
        <!-- <div id="right_sidebar">
        CJH : 11/23,로그인창에 대하여 fieldset과 legend태그로 묶어주기, 
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
			<span class="footer_text">About Us</span>
			<p>동국대학교의 열정적인 웹프로그래밍 수업 수강생들입니다.</p>
        </div>
    </div>
</body>
</html>