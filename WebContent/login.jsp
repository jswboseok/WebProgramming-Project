<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동국마켓</title>
	<!-- <link href="main.css" rel="stylesheet" type="text/css">  -->
	<link href="css/LoginCss.css" rel="stylesheet" type="text/css" >
	
	 <!-- CJH, 제목 폰트 관련 추가 (11/23 && 11/28)  -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">

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
                    <!-- Join.jsp는 비로그인시만 보이기 때문에, 경고창만 띄움 --> 
                    <!-- 쪽지 :  경고창 뜨게 함 -->  
                    <li><a class="link" onclick="alert('로그인을 먼저 해주세요');">쪽지</a></li>
                    <!-- 고객센터부분 _11/23 -->
                    <li><a class="link" href="#">고객센터</a></li>
                     <!-- Join.jsp는 비로그인시만 보이기 때문에, 경고창만 띄움 -->     
                    <li><a class="link" onclick="alert('로그인을 먼저 해주세요');">마이페이지</a></li>
                    <!-- <li><a class="link" onclick="location='mypage.jsp'">마이페이지</a> </li> -->
                </ul>
        	</nav>

	<div id="contents-join">
		<div class="titleArea">
			<!-- login container -->
			<div class="login_container">
			
				<div class="titleArea">
				<h2>Log In</h2>
				</div>
				<br>
				<form action="login_Action.jsp" method = "post">
					<div class="main">
						<p>ID
						<br>
						 <input type="text" class="input" name="userID" maxlength="20"></p> 
						<br>
						<p>PASSWORD 
						<br>
						<input type="password" class="input" name="userPassword" maxlength="20"></p>		
					</div>
					<br><br>
					<input type="submit" class="log_button" value="로그인"> 
			  </form>
			</div>
		</div>
	</div>
			</center>
        
       
        <div id="footer">

        </div>
</div>
</body>
</body>
</html>