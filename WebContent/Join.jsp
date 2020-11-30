<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동국마켓</title>
	<!-- <link href="main.css" rel="stylesheet" type="text/css">  -->
	<!-- 별도 css파일과 링크 -->
	<link href="css/JoinCss.css" rel="stylesheet" type="text/css">
	
	 <!-- CJH, 제목 폰트 관련 추가 (11/23 && 11/28)  -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
	<!-- join에서는 map x -->
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
        <!-- 회원가입 div블록 -->
		<div id="contents-join">
			<div class="join_container">
				<div class="titleArea">
					<h2>JOIN MEMBER</h2>
				</div>	
				<br>
				<form class="join-frm" name = "join" action="Join_Action.jsp" method = "post">
					<div id="contents-join" style="display:inline-block;vertical-align:top;margin:0 0;text-align:left;">
					  <table class="table">  
						    <tbody>
						      <!-- tr1 -->
						      <tr>
							        <td class="joinc1">아이디</td>
							        <!-- <td>     
									<input type="text" class="input" style="ime-mode:disabled;" placeholder="아이디를 입력하세요." 
									name="userID" title="아이디" maxlength="20">
									</td> -->
						      </tr>
						      <tr>
						      <td>     
									<input type="text" class="input" style="ime-mode:disabled;" placeholder="아이디를 입력하세요." 
									name="userID" title="아이디" maxlength="20">
									</td>
						      </tr>
						      <!-- tr2 -->
						      <tr>
						        	<td class="joinc1">패스워드</td>
							        <!-- <td>
							        <input type="password" class="input" placeholder="패스워드를 입력하세요." name="userPassword" 
							        title="비밀번호" maxlength="20">
							        </td> -->
						      </tr>
						      <tr>
						      		<td>
							        <input type="password" class="input" placeholder="패스워드를 입력하세요." name="userPassword" 
							        title="비밀번호" maxlength="20">
							        </td>
						      </tr>
						      <!-- tr3 -->
						      <tr>
							        <td class="joinc1">이름</td>
							        <!-- <td>
							        <input type="text" class="input" placeholder="이름" name="userName" title="이름" maxlength="20">
							        </td> -->
						      </tr>
						      <tr>
						       <td><input type="text" class="input" placeholder="이름" name="userName" title="이름" maxlength="20"></td>
						      </tr>
						      
						      <!-- tr4 -->
						      <tr>
						        <td class="joinc1">생년월일</td>
							        <!-- <td>
							        <input type="date" class="input" placeholder="YYYYDDMM" name="userDate" >
							        </td> -->
						      </tr>
						      <tr>
							      <td><input type="date" class="input" placeholder="YYYYDDMM" name="userDate" ></td>
							  </tr>
						      <!-- tr5 -->
						       <tr>
						        <td class="joinc1">성별</td>
							       <!--  <td>     
									<input type="radio" name="userGender" value="M" title="성별"> 남자 
									<input type="radio" name="userGender" value="F" title="성별"> 여자
									<td> -->
						       </tr>
						       <tr>
						       		<td>     
									<input type="radio" class="input2" name="userGender" value="M" title="성별"> 남자 
									<input type="radio" class="input2" name="userGender" value="F" title="성별"> 여자
									<!-- 사용자경고 -->
									<p id="warning">본 사이트는 웹프로그래밍 프로젝트를 위한 사이트로<br>아이디나 패스워드 등으로 민감한 정보를<br> 기재하지 마십시오.</p>
									<td>
						       </tr>
						      <!-- submit -->
						      <tr>
						      <td>
						      <input type="submit" class="log_button" value="회원가입"></td>
						      </tr>
						      <!-- </tr> -->
						    </tbody>
					  </table>
					  </div>
			  </form>
			</div> <!-- join container end -->
		</div>

        <div id="footer">
			<!-- join에선 nono -->
        </div>


    </div><!-- 전체컨테이너 div end -->
    
</body>
</body>
</html>