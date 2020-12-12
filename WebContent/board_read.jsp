<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.text.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest,
				com.oreilly.servlet.*,
				com.oreilly.servlet.multipart.DefaultFileRenamePolicy,
				java.util.*,
				java.io.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동국마켓</title>
    <!-- 외부 css 링크하기 -->
    <link href="css/main.css" rel="stylesheet" type="text/css">
    <link href="css/table.css" rel="stylesheet" type="text/css">
    <!-- CJH, 제목 폰트 관련 추가 (11/23)  -->
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
	
	<!-- 이미지 파일 업로드를 위해 파일 경로를 찾아야 함. buy_db,jsp에서 전체 경로를 db에 저장하니 '\'가 날라가기 때문 -->
	<%
	
	 MultipartRequest multi = null;
	 request.setCharacterEncoding("UTF-8");
	 String realFolder = "";
	 String filename1 = "";
	 int maxSize = 1024*1024*100; //100mb
	 String encType = "utf-8";
	 String savefile = "img";
	 ServletContext scontext = getServletContext();
	 realFolder = scontext.getRealPath(savefile);
	 
	 /* try{
	     multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	  
	     Enumeration<?> files = multi.getFileNames();
	     String file1 = (String)files.nextElement();
	     filename1 = multi.getFilesystemName(file1);
	     
	 } catch(Exception e) {
	  e.printStackTrace();
	 } */
	 
	%>
</head>
<body>
    <!-- <div id ="container"> -->
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
			
			
			<!--  content 부분 -->
			<!--  ---------------------------------------------- -->

			
			<%
			   int id, ref=0;
			   String name="", title="", category="", content = "", isbuy="", imgfile="";
			   Connection conn=null;
			   Statement stmt = null;
			   ResultSet rs = null;
			   
			   id=Integer.parseInt(request.getParameter("id"));
			         
			   try { 
			       // my answer;
			       //db 열고 rs로 부터 db읽은다음, 
				   Class.forName("com.mysql.jdbc.Driver");  //JDBC드라이버 로드 , MySQL의 JDBC드라이버를 로드함.
			       String url = "jdbc:mysql://localhost:3306/dgumarket?serverTimezone=UTC"; //url JSP페이지내에서 사용할 DB이름을 포함하는 URL을 변수에 저장
			       conn = DriverManager.getConnection(url, "root", "0000"); // id root, p 0000
			       stmt = conn.createStatement(); //Statement
			       String sql = "select * from board where id = " + id; //이니셜 board_tbl 이름 넣기
			       rs = stmt.executeQuery(sql);
			    } 
			    catch(Exception e) {
			         out.println("DB 연동 오류입니다. : " + e.getMessage());
			    }
			   
			   //title=request.getParameter("title");
			   while(rs.next()){
			      //my answer
			      //조건문으로 id 번호랑 일치할때, 까지하고,밑에랑 name..content
			    	name=rs.getString("name");//name으로 요청받은 파마리터를 name에 저장
					title=rs.getString("title");
					category=rs.getString("category");
					content=rs.getString("content");
			 		isbuy = rs.getString("isbuy");
			 		imgfile = rs.getString("imgfile");
			   }
			%>
			
			<div class="table-wrapper">
				<table class="fl-table" border="0" width="500"><!-- <table border="0" width="500"> -->
					<thead style="background:#D27328;">
						<tr>
						<th style="text-align:center;">게시글</td>
						</tr>

					</thead>
					<tbody>
				   <tr>
				      <td width="100">목적 : </td>
				      <td style="text-align:left;"><%=isbuy%></td>
				   </tr>
				   <tr>
				      <td width="100">카테고리 : </td>
				      <td style="text-align:left;"><%=category %></td>
				   </tr>
				   <tr>
				      <td width="100">글쓴이 : </td>
				      <td style="text-align:left;"><%=name %></td>
				   </tr>
				   <tr>
				      <td height="200px">글내용</td>
				       <td style="text-align:left;">
				       <%=content %>
				      </td> 
				   </tr>
				   <% if(imgfile == null || !(imgfile.equals("null"))){%>
				   		<tr>
				      		<td>이미지 : </td>
				      		<td><img src="<%=realFolder + "\\" + imgfile%>" width=380 height=284></img></td>
				   		</tr>
				   	<%} %> 
					</tbody>
				</table>
			</div>
			<hr>
			<a class="detail_link" href="main.jsp">[메인 화면으로]</a>&nbsp;
			
			<%if(name.equals(userID)){ %>
				<a class="detail_link" href="delete.jsp?id=<%=id %>">[글삭제]</a>
				<a class="detail_link" href="modify.jsp?id=<%=id %>">[글수정]</a>
			<%} else{ %>
				<a class="detail_link" href="board_read.jsp?id=<%=id %>" onclick="alert('권한이 없습니다')">[글삭제]</a>
				<a class="detail_link" href="board_read.jsp?id=<%=id %>" onclick="alert('권한이 없습니다')">[글수정]</a>
			<%}%>
			
        </div>
       <!--  <div id="right_sidebar">
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
    </div><!-- container ends -->
</body>
</html>