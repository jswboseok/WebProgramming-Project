<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.text.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동국마켓</title>
    <!-- 외부 css 링크하기 -->
    <link href="main.css" rel="stylesheet" type="text/css">
    <!-- CJH, 제목 폰트 관련 추가 (11/23)  -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet"> 
</head>
<body>
    <div id ="container">
        <div id ="headerTop">
        <h1 id="headerFont"><a href="main.jsp" style="text-decoration:none; color:black;">동국대학교 중고거래장터</a></h1>
        </div>
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
			
			
			<!--  content 부분 -->
			<!--  ---------------------------------------------- -->

			
			<%
			   int id, ref=0;
			   String name="", title="", category="", content = "", isbuy="";
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
			   }
			%>
			<fieldset>
				<table border="0" width="500">
				   <tr>
				      <td width="100">목적 : </td>
				      <td><%=isbuy%></td>
				   </tr>
				      <tr>
				      <td width="100">카테고리 : </td>
				      <td><%=category %></td>
				   </tr>
				      <tr>
				      <td width="100">글쓴이 : </td>
				      <td><%=name %></td>
				   </tr>
				      <tr>
				      <td>글내용 : </td>
				      <td><%=content %></td>
				   </tr>
				</table><br><br>
			</fieldset>
			<hr>
			<a href="main.jsp">메인 화면으로</a>
        </div>
        <div id="right_sidebar">
        <!-- CJH : 11/23,로그인창에 대하여 fieldset과 legend태그로 묶어주기,  -->
        	<hr>
        	<form>
        		<fieldset> 
	        		<legend align="center">로그인 </legend>
	        		&nbsp; ID<br><input type="text" name="id"><br>
	        		<!-- type password로 변경 11/23 -->
        			&nbsp;비밀번호<br><input type="password" name="password"><br><br>
        			
        			<input type="submit" value="로그인">
        			
					<button onclick="location='make_auth.jsp'">회원가입</button>
        		
        		</fieldset>

        	</form>
        	
        	
		</div>
        <div id="footer">
			
        </div>
    </div>
</body>
</html>