<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.sql.*" %>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>동국마켓</title>
	<link href="css/main.css" rel="stylesheet" type="text/css">
	<!-- 글쓰기 창 -JSW  -->
	 <!-- CJH, 제목 폰트 관련 추가 (11/23 && 11/28)  -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet"> 
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
        </div>
        <div id ="contents">
        
        
        <!-- CONTENT 부분  -->
        
        <%
				int id = Integer.parseInt(request.getParameter("id"));
        		String name="", isbuy="", title="", category="", content="";
				
				Connection conn=null;
				Statement stmt = null;
				ResultSet rs=null;
				String sql_update, sql_delete; //sql 업데이트 용도인듯
				id=Integer.parseInt(request.getParameter("id"));
				
				try{
					//my answer //일단 DB에 접근해서, while로 읽게 하기, 
					Class.forName("com.mysql.jdbc.Driver");  //DB접속을 위해 JDBC드라이버 로드 , MySQL의 JDBC드라이버를 로드함.
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
			
			
        <!-- ---------------------------------------------------------------------- -->
		    <center><h2>글쓰기</h2></center>
		    <fieldset>
				<form action="modify_db.jsp?id=<%=request.getParameter("id") %>" enctype="multipart/form-data" method="POST" >
					<table border="0">
				        <tr> 
				        	<td>제목 : </td>
				         	<td><input type="text" name="title" size="50" value=<%=title %>>(10자 이내)</td>
				      	</tr>
				      		<td>목적 : </td>
				        	<td><select name="isbuy">
				        	<% if(isbuy.equals("팝니다")){ %>
				        		<option selected>팝니다</option>
				         		<option>삽니다</option>
				        	<% }else{ %>
				         		<option>팝니다</option>
				         		<option selected>삽니다</option>
				         	<% }%>
				         	</select></td>
				       	</tr>
				       	<tr>
				        	<td>카테고리 : </td>
				          	<td><select name="category">
				          	<% switch(category){
				          	case "책":
				          		%>  
								<option selected>책</option>
				         		<option>옷</option>
				         		<option>기프티콘</option>
				          		<option>기타</option> 
				          		<% 
				          		break;
							case "옷":
								%>  
								<option>책</option>
				         		<option selected>옷</option>
				         		<option>기프티콘</option>
				          		<option>기타</option> 
				          		<% 
				          		break;
							case "기프티콘":
								%>  
								<option>책</option>
				         		<option>옷</option>
				         		<option selected>기프티콘</option>
				          		<option>기타</option> 
				          		<% 
								break;
							default:
								%>  
								<option>책</option>
				         		<option>옷</option>
				         		<option>기프티콘</option>
				          		<option selected>기타</option> 
				          		<% 
								break;
				          	}
				          	%>
				          	</select></td>
 				       	</tr>
 				       	<tr>
 				       		<td>파일 업로드 : </td>
 				       		<td><input type="file" name="filename1" size=40></td>
 				       	</tr>
 				       	<tr>
				        	<td>내용 : </td>
				          	<td><textarea name="content" cols="60" rows="10"><%=content %></textarea></td>
				       	</tr>
				    </table><br><br>
				   	<input type="submit" value="등록하기">
			   		<input type="reset" value="다시쓰기">
				</form>
			</fieldset>
		   	<a href="main.jsp">메인 화면으로</a>
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