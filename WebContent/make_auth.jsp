<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동국마켓</title>
<link href="main.css" rel="stylesheet" type="text/css"> 
</head>
<body>
<!--기본 틀 구성하기 11_18-->
    <div id ="container">
        <div id ="headerTop">
        <h1 id="headerFont"><a href="main.html" style="text-decoration:none; color:black;">동국대학교 중고거래장터</a></h1>
        </div>
			<nav>
            	<button class="link" onclick="location='sell.jsp'">팝니다</button>
            	<button class="link" onclick="location='buy.jsp'">삽니다</button>
            	<button class="link" onclick="location='letter.jsp'">쪽지</button>
            	<button class="link" onclick="location='mypage.jsp'">마이페이지</button>
        	</nav>
          
        <div id="left_sidebar">

        </div>
        <div id ="contents">
			회원가입 <hr>
			<br>
			<center>
				아이디 : <input type="text" name="id"><br><br>
				비밀번호 : <input type="text" name="password"><br><br>
				이름 : <input type="text" name="auth_name"><br><br>
				email : <input type="text" name="email"><br><br>
				<input type="submit" value="회원가입">
				<input type="reset" value="다시 작성"><br><br>
				<a href="main.html">뒤로가기</a>
			
			</center>
        </div>
        <div id="right_sidebar">
	</div>
        <div id="footer">

        </div>


    </div>
    
</body>
</body>
</html>