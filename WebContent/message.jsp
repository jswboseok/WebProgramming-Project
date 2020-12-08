<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.util.*" %>
<%@ page import ="java.text.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%@ page import="java.io.PrintWriter" %>

<HTML>
<HEAD>
<TITLE>쪽지</TITLE>

<META http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>동국마켓</title>
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
</HEAD>
<BODY>
 <!-- 로그인된  사람은 로그인 정보를 담을 수 있도록 만듬 11/27 -->
	<%
		String userID=null;
		if(session.getAttribute("userID")!= null){
			userID=(String) session.getAttribute("userID");
			String strSQL = "";
			   
		    String driverName = "com.mysql.jdbc.Driver";
		    String dbURL = "jdbc:mysql://localhost:3306/dgumarket?serverTimezone=UTC";
		    Class.forName(driverName);
		    Connection conn = DriverManager.getConnection(dbURL, "root", "0000");
		    Statement stmt = conn.createStatement();
		    ResultSet rs = null;
		}else{
			
				 PrintWriter script = response.getWriter();
				 script.println("<script>");
				 script.println("alert('로그인을 먼저 해주세요.')");
				 /* 로그인 화면을 띄우기*/
				 /* script.println("location.href = 'main.jsp'"); */
				 script.println("location.href='login.jsp' ");
				 script.println("</script>"); 
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
                    <li><a class="link" href="#">고객센터</a></li>
                    <!-- 마이페이지 : 로그인을 안하여 세션이 없다면, 경고창 뜨게 하기. 1128 -->
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
        	

<center>
  
      
      <%=userID %>의 쪽지함                            
<TABLE border='0' width='100%' cellpadding='0' cellspacing='0'>
   <TR>
      <TD><hr size='1' noshade>
      </TD>
    </TR>
</TABLE>              
                    
<TABLE border='0' cellspacing=1 cellpadding=2 width='100%'>      
   <TR bgcolor='cccccc'>           
      <TD><font size=2><center><b>보낸이</b></center></font></TD>      
      <TD><font size=2><center><b>제목</b></center></font></TD> 
      <TD><font size=2><center><b>내용</b></center></font></TD>
      <TD><font size=2><center><b>작성일</b></center></font></TD>
	       
   </TR>   
    
   <% 
String s_id = (String)session.getAttribute("userId");
String strSQL = "";
   
    String driverName = "com.mysql.jdbc.Driver";
    String dbURL = "jdbc:mysql://localhost:3306/dgumarket?serverTimezone=UTC";
   Class.forName(driverName);
    Connection conn = DriverManager.getConnection(dbURL, "root", "0000");
    Statement stmt = conn.createStatement();
    ResultSet rs = null;
%>
   
   
<%
      
      strSQL = "SELECT * FROM message_3 where msgid='" + userID + "'";
      rs = stmt.executeQuery(strSQL);
      for (int i = 1; i < 10; i++){
      while(rs.next()){
         String msgtitle = rs.getString("msgtitle");
         String msgcontents = rs.getString("msgcontents");
         String msgsendid = rs.getString("msgsendid");
         String msgdate = rs.getString("msgdate");
         
%>
   <TR bgcolor='ededed'>  
      <TD>  
         <font size=2 color="black"><%=msgsendid %></font>
      </TD>
      <TD align=center>    
         <font size=2 color="black"><%=msgtitle %></font>     
      </TD>
            <TD align=center>    
         <font size=2 color="black"><%=msgcontents %></font>     
      </TD>  
      </TD>
            <TD align=center>    
         <font size=2 color="black"><%=msgdate %></font>     
      </TD>         
   </TR>  
         
<% }%>
</TABLE>     
                                        
<%
      }%>
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
   <TR>
      <TD><hr size='1' noshade>
      </TD>
    </TR>
</TABLE>                    
      <TD align='left'> 
       <a href='main.jsp'>[메인화면]</a>    
      </TD>
 
      <TD align='right'>      
      <a href='message_send.jsp'>[쪽지 보내기]</a>            
      </TD>
   </TR>
</TABLE>
}           
</BODY>                     
</HTML>