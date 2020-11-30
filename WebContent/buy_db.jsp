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
	<!-- 글쓰기 db 부분 - JSW  -->
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
    <!-- CJH, 로그인 회원가입 창을 우측 화면 상단으로 올리기,  -->
    	<header>
    		<!-- <div class="loginbar"> -->
    		<nav>
    			<ul class="login_menu">
    				<li><img src="images/netlog.svg" height="30" width="30"></li>
    				<li><a href="login.jsp">로그인</a></li>
    				<li><a href="Join.jsp">회원가입</a></li>
    			
    			</ul>
    		</nav>
    		<!-- </div> -->
    	</header>
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
                    <li><a class="link" onclick="location='letter.jsp'">쪽지</a> </li>
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
        
        
         	<!-- CONTENT 부분  -->
        	<!-- ---------------------------------------------------------------------- -->
		  	<!-- 메인 부분  -->
		
		
			<%
				int temp =0, cnt;
				int num=0, ref=0; //새로운 게시글 넘버, 답글의 게시글 넘버
				String name, title, content, category, isbuy; // 쿼리요소
				Connection conn=null;
				Statement stmt = null;
				ResultSet rs=null;
				String sql_update; //sql 업데이트 용도인듯
				
				try{
					//my answer //일단 DB에 접근해서, while로 읽게 하기, 
					Class.forName("com.mysql.jdbc.Driver");  //DB접속을 위해 JDBC드라이버 로드 , MySQL의 JDBC드라이버를 로드함.
		            String url = "jdbc:mysql://localhost:3306/dgumarket?serverTimezone=UTC"; //url JSP페이지내에서 사용할 DB이름을 포함하는 URL을 변수에 저장
		            conn = DriverManager.getConnection(url, "root", "0000"); // id root, p 0000
		            stmt = conn.createStatement(); //Statement
		            String sql= "select count(*) as cnt from board";
		            //sql_update = "select * from cjh order by ref desc, id asc"; //이니셜 board_tbl 이름 넣기
		            rs = stmt.executeQuery(sql);
		            
					
				}catch(Exception e){
					//out.println("A");
					out.println("DB 연동 오류입니다.:" +e.getMessage());
				}
				
				while(rs.next()){ //테이블 cjh 에서 다음 쿼리정보들이 존재할때,
					cnt=Integer.parseInt(rs.getString("cnt")); //cnt에 저장
					out.println(cnt);
					num = cnt;
				}
					num++;
					name = "temp";
					//name=request.getParameter("name");//name으로 요청받은 파마리터를 name에 저장
					title=request.getParameter("title");
					category=request.getParameter("category");
					content=request.getParameter("content");
					isbuy=request.getParameter("isbuy");
					//<!--my answer-->
					sql_update="insert into board values ('"
							+ num +"','" + isbuy + "','" + category + "','" + name + "','" + title + "','" + content + "')"; 
		
					try{
						//<!--my answer-->
						stmt.executeUpdate(sql_update);
					}catch(Exception e){
						out.println("2nd DB 연동 오류입니다 :"+e.getMessage());
					} 
				
			%>
			<center>
				<h2>작성한 글이 등록되었습니다.</h2>
				<img src="image/green_tree.gif">
				<a href="buy.jsp">게시글 목록 보기</a>
			</center>
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
			<p>동국대학교의 열정적인 웹프로그래밍 수업 수강생들입니다.</p>
        </div>


    </div>
    
</body>
</body>
</html>