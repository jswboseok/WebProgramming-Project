<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동국마켓</title>
<link href="main.css" rel="stylesheet" type="text/css"> 
<link rel="stylesheet" href="CSS/JoinCss.css">

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
          

     <div id="wrap">

<div id="container">

	
<div id="contents-join">

	<div class="titleArea">
	<h2>JOIN MEMBER</h2>
	</div>
	<br>
	<form class="join-frm" name = "join" action="Join_Action.jsp" method = "post">
	<div style="display:inline-block;vertical-align:top;margin:0 0;text-align:left;">
  <table class="table">  
    <tbody>
      <tr>
        <td class="joinc1">아이디</td>
        <td>     
		<input type="text" class="input" style="ime-mode:disabled;" placeholder="아이디를 입력하세요." 
		name="userID" title="아이디" maxlength="20">
		</td>
      </tr>
      
      <tr>
        <td class="joinc1">패스워드</td>
        <td>
        <input type="password" class="input" placeholder="패스워드를 입력하세요." name="userPassword" 
        title="비밀번호" maxlength="20">
        </td>
      </tr>
      <tr>
        <td class="joinc1">이름</td>
        <td>
        <input type="text" class="input" placeholder="이름" name="userName" title="이름" maxlength="20">
        </td>
      </tr>
      
      <tr>
        <td class="joinc1">생년월일</td>
        <td>
        <input type="date" class="input" placeholder="생년월일" name="userDate">
        </td>
      </tr>
      
       <tr>
        <td class="joinc1">성별</td>
        <td>     
		<input type="radio" name="userGender" value="M" title="성별"> 남자 
		<input type="radio" name="userGender" value="F" title="성별"> 여자

       
      <tr>
      <input type="submit" class="log_button" value="회원가입">
      </tr>
    </tbody>
  </table>
  </div>
 
  </form>
</div>
</div>
</div>
			</center>
        </div>
       
        <div id="footer">

        </div>


    </div>
    
</body>
</body>
</html>