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

<SCRIPT language="JavaScript">
function Check()
{
   
if (Write.msgid.value.length < 1){
   alert("보낼 ID를 입력하세요.");
   write.msgid.focus();
   return false;
      }
if (Write.msgtitle.value.length < 1) {
   alert("제목을 입력하세요.");
   Write.write_title.focus(); 
   return false;
        }
if (Write.msgcontents.value.length < 1) {
   alert("내용을 입력하세요.");
   Write.content.focus(); 
   return false;
        }
else {
	   alert("쪽지 전송이 완료되었습니다.\n (확인을 누르시면 쪽지함으로 이동합니다)");
	   location.href="main.jsp";
	   Write.content.focus(); 
	   return false;
	        }
Write.submit();
}
function Check_id() 
{
browsing_window = window.open("send_checkid.jsp?id="+Write.msgid.value, "_idcheck","height=200,width=300, menubar=no,directories=no,resizable=no,status=no,scrollbars=yes");
browsing_window.focus();
}
</SCRIPT>
</HEAD>

<BODY>
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
			</div>
			 -->
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
		<!-- 쪽지보내는 화면 -->
		<center>
		
		<% 
		String s_id = (String)session.getAttribute("userID");%>

		<!-- <center><font size='3'><b> 쪽지 보내기 </b></font></center>   -->                 
		
		<!-- <TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
		   <TR>
		      <TD><hr size='1' noshade>
		      </TD>
		    </TR>
		</TABLE> -->

		<FORM Name='Write' Action='message_input.jsp' Method='post' OnSubmit='return Check()'>
		<div class="table-wrapper">
			<TABLE class="fl-table" border='0' width='600' cellpadding='2' cellspacing='2'>
					<thead style="background:#D27328;">
							<tr>
							<th style="text-align:center;">쪽지 보내기</td>
							</tr>
	
					</thead>
					<TBODY>
				   <TR>
				      <TD width='100' ><!-- bgcolor='cccccc' -->
				         <font size='2'><center><b>작성자</b></center></font>
				      </TD>
				      <TD style="text-align:left">
				          <font size='2'><input type='text' size='12' name='msgsendid' value = <%= s_id %>></font>
				      </TD>
				   </TR>
				
				   <TR>
				      <TD width='100' >
				         <font size='2'><center><b>보낼 ID</b></center></font>
				      </TD>
				      <TD style="text-align:left">
				          <font size='2'><input type='text' size='12' maxlength='12' name='msgid'></font>
				          <input type='button' OnClick='Check_id()' value='받는 ID 확인하기'>
				      </TD>
				   </TR>
				
				   <!-- <TR>
				            <TD colspan='2'>
				               <hr size='1' noshade>
				            </TD>
				   </TR> -->
				
				   <TR>
				      <TD width='100' >
				         <font size='2'><center><b>제목</b></center></font>
				      </TD>
				      <TD style="text-align:left">
				         <font size='2'><input type='text' size='70' maxlength='50' name='msgtitle'></font>
				      </TD>
				   </TR>
				
				   <TR>
				      <TD >
				         <font size='2'><center><b>내용</b></center></font>
				      </TD>
				      <TD style="text-align:left">
				        <font size='2'>
				        <textarea cols='70' rows='15' wrap='virtual' name='msgcontents' ></textarea>
				        </font>
				      </TD>
				   </TR>
				
				   <!-- <TR>
				            <TD colspan='2'>
				               <hr size='1' noshade>
				            </TD>
				   </TR> -->
				
				   <!-- <TR>
				      <TD align='center' colspan='2' width='100%'>
				      <TABLE>
				         <TR>
				            <TD width='100' align='center'>
				               <input Type = 'Reset' Value = '다시 쓰기'>
				            </TD>
				            <TD width='200' align='center'>
				               <input Type = 'submit' Value = '전송하기' Name='Page'>
				            </TD>
				         </TR>
				      </TABLE>
				      </TD>
				   </TR> -->
				</TABLE>
				<input Type = 'Reset' class="write_button" Value = '다시 쓰기'>
				<input Type = 'submit' class="write_button" Value = '전송하기' Name='Page'>
			</div>
		</FORM>
		</div> <!-- contenst end -->
		
		<div id="footer">
			<span class="footer_text">About Us</span>
			<p>동국대학교의 열정적인 웹프로그래밍 수업 수강생<br>
			&nbsp;2016112109 컴퓨터공학전공 장석운, 
			   2015112113 컴퓨터공학전공 정용헌,
			   2017112095 컴퓨터공학전공 최준호 <br>
			   송양의 교수님 웹프로그래밍_02반 - 3조<br>
        </div>
    </div><!-- container ends -->
		

</BODY>
</HTML>
