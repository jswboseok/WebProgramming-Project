<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동국마켓</title>
<link href="main.css" rel="stylesheet" type="text/css">
<!-- 글쓰기 창 -JSW  -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet"> 
</head>
<body>
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
        
        
        <!-- CONTENT 부분  -->
        <!-- ---------------------------------------------------------------------- -->
		    <center><h2>글쓰기</h2></center>
		    <fieldset>
				<form action="buy_db.jsp" method="POST" >
					<table border="0">
				        <tr> 
				        	<td>제목 : </td>
				         	<td><input type="text" name="title" size="50">(10자 이내)</td>
				      	</tr>
				      		<td>목적 : </td>
				        	<td><select name="isbuy">
				         		<option>팝니다</option>
				         		<option>삽니다</option>
				         	</select></td>
				       	</tr>
				       	<tr>
				        	<td>카테고리 : </td>
				          	<td><select name="category">
				         		<option>책</option>
				         		<option>옷</option>
				         		<option>기프티콘</option>
				          		<option>기타</option>
				          	</select></td>
 				       	</tr>
 				       	<tr>
				        	<td>내용 : </td>
				          	<td><textarea name="content" cols="60" rows="10"></textarea></td>
				       	</tr>
				    </table><br><br>
				   	<input type="submit" value="등록하기">
			   		<input type="reset" value="다시쓰기">
				</form>
			</fieldset>
		   	<a href="buy.jsp">뒤로</a>
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
</body>
</html>