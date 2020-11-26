<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동국마켓</title>
<link href="main.css" rel="stylesheet" type="text/css"> 
<link rel="stylesheet" href="style_join.css">

<!-- CJH, 제목 폰트 관련 추가 (11/23)  -->
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
          

      <div class="join_container"> <h2> 회원 가입 </h2> <form method="post" action="./join_Action.jsp"> 
      <h3>아이디</h3> <div class="joinID">
       <input type="text" class="input" style="ime-mode:disabled;" placeholder="아이디" name="userID" title="아이디" maxlength="20">
        </div>
         <h3>비밀번호</h3> <div class="joinPassword"> 
         <input type="password" class="input" placeholder="비밀번호" name="userPassword" title="비밀번호" maxlength="20"> 
         </div> 
         <h3>이름</h3> <div class="joinName">
          <input type="text" class="input" placeholder="이름" name="userName" title="이름" maxlength="20">
           </div> 
           <h3>생년월일</h3> <div class="joinDate"> 
           <input type="date" class="input" placeholder="생년월일" name="userDate"> </div> 
           <h3>성별</h3> <div class="joinGender"> 
           <input type="radio" name="userGender" value="M" title="성별"> 남자 <input type="radio" name="userGender" value="F" title="성별"> 
           여자 </div> <input type="submit" class="bt_join" value="회원가입"> 
           </form> </div>

			
			</center>
        </div>
       
        <div id="footer">

        </div>


    </div>
    
</body>
</body>
</html>