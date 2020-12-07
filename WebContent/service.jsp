<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.text.*" %>
<!-- 11/23 정적 main페이지 확장자 jsp로 바꿈 -->
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동국마켓</title>
    <!-- 외부 css 링크하기 -->
    <link href="css/main.css" rel="stylesheet" type="text/css">
    <!-- CJH, 제목 폰트 관련 추가 (11/23 && 11/28)  -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
	<!-- jquery -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
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
    	<!-- 로그인 되어있지 않다면,  -->
    	<%
    		if(userID == null){
    	%>
    	<!-- CJH, 로그인 회원가입 창을 우측 화면 상단으로 올리기,  -->
    	<header>
    		<nav>
    			<ul class="login_menu">
    				<li><img src="images/netlog.svg" height="30" width="30"></li>
    				<li><a href="login.jsp">로그인</a></li>
    				<li><a href="Join.jsp">회원가입</a></li>
    			
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
			
			<!-- 네이버 지도 API -->
			<span id="user_location">LOCATION<hr></span>
			<div id="map" style="width:100%;height:350px;"></div>
			
			
			
        </div>
        <div id ="contents">
        	<!-- 고객센터, 드롭다운 테이블 적용해서 Q&A형식 으로 구성,  -->
        	<span class="left_bar_text">Q&A</span>
			<hr>
			<ul class="menu">
				  <!-- Q1 -->
				  <li id="Q"><span class="QA_font">Q. Lorem?</span>
				    <ul><!-- A -->
					      <li>
						      <p> A. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla, 
						      ligula sit amet ornare faucibus, elit elit gravida tortor, a faucibus ex ligula at velit. 
						      Duis venenatis mauris quis eleifend ornare. Ut fermentum nisi non sem mattis, ac auctor est malesuada.
						       Ut metus erat, dapibus sit amet nisi non, pharetra rutrum velit. Donec dapibus feugiat ipsum, 
						       in iaculis felis malesuada et. Suspendisse quis tortor sit amet quam maximus pulvinar et et metus.
						        Proin lacus enim, sagittis porta justo sit amet, luctus egestas diam. Curabitur at convallis nulla.
						         In gravida et ex sit amet volutpat. Donec at tincidunt nisl.</p>
					      </li>
				    </ul>
				  </li>
				  <!-- Q2 -->
				  <li id="Q">
				    <span class="QA_font">Q. Lorem?</span>
				    <ul><!-- A -->
					      <li id="A">
						      <p> A. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla, 
						      ligula sit amet ornare faucibus, elit elit gravida tortor, a faucibus ex ligula at velit. 
						      Duis venenatis mauris quis eleifend ornare. Ut fermentum nisi non sem mattis, ac auctor est malesuada.
						       Ut metus erat, dapibus sit amet nisi non, pharetra rutrum velit. Donec dapibus feugiat ipsum, 
						       in iaculis felis malesuada et. Suspendisse quis tortor sit amet quam maximus pulvinar et et metus.
						        Proin lacus enim, sagittis porta justo sit amet, luctus egestas diam. Curabitur at convallis nulla.
						         In gravida et ex sit amet volutpat. Donec at tincidunt nisl.</p>
					      </li>
				    </ul>
				  </li>
				  <!-- Q3 -->
				  <li id="Q">
				    <!-- <a href="#">Q. 1</a>  -->
				    <span class="QA_font">Q. Lorem?</span>
				    <ul><!-- A -->
					      <li>
						      <p> A. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla, 
						      ligula sit amet ornare faucibus, elit elit gravida tortor, a faucibus ex ligula at velit. 
						      Duis venenatis mauris quis eleifend ornare. Ut fermentum nisi non sem mattis, ac auctor est malesuada.
						       Ut metus erat, dapibus sit amet nisi non, pharetra rutrum velit. Donec dapibus feugiat ipsum, 
						       in iaculis felis malesuada et. Suspendisse quis tortor sit amet quam maximus pulvinar et et metus.
						        Proin lacus enim, sagittis porta justo sit amet, luctus egestas diam. Curabitur at convallis nulla.
						         In gravida et ex sit amet volutpat. Donec at tincidunt nisl.</p>
					      </li>
				    </ul>
				  </li>
			</ul>
			

        </div>
        <!-- <div id="right_sidebar">
        CJH : 11/23,로그인창에 대하여 fieldset과 legend태그로 묶어주기, 
        	<hr>
        	<form method="post" action="./login_Action.jsp">
        		<fieldset> 
	        		<legend align="center">로그인 </legend>
	        		&nbsp; ID<br><input type="text" class ="input" placeholder="아이디" name="userID" maxlength="20"><br>
	        		type password로 변경 11/23
        			&nbsp;비밀번호<br><input type="password" class="input" placeholder="비밀번호 "name="userPassword" maxlength="20"><br><br>
        		
        			<a href="login.jsp"><button type="button" class="btn btn-outline-dark">로그인</button>
        	</form>
        	</form>			
					<a href="Join.jsp"><button type="button" class="btn btn-outline-dark">회원가입</button>
        		
        		</fieldset>

        	</form>
        	
        	
		</div> -->
        <div id="footer">
			<span class="footer_text">About Us</span>
			<p>동국대학교의 열정적인 웹프로그래밍 수업 수강생들입니다.</p>
        </div>
    </div>
</body>
</html>