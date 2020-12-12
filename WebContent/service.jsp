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
			</div> -->
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
        	<!-- 고객센터, 드롭다운 테이블 적용해서 Q&A형식 으로 구성,  -->
        	<span class="left_bar_text">Q&A</span>
			<hr>
			<div class="QA_list">
				<ul class="menu">
				  <!-- Q1 -->
				  <li id="Q"><span class="QA_font">&nbsp;Q. 이 사이트는 어떤 사이트 인가요?</span>
				    <ul><!-- A -->
					      <li>
						      <p> 저희 사이트는 동국대학교 웹프로그래밍 팀프로젝트로, 학생간의 중고거래 활성화를 위해 제작된 사이트입니다.<br>
						          고객들이 자유롭게  물건을 사고 팔수 있도록 중간 역할자를 합니다.</p>
					      </li>
				    </ul>
				  </li>
				  <!-- Q2 -->
				  <li id="Q">
				    <span class="QA_font">&nbsp;Q. 사이트를 설명해주세요</span>
				    <ul><!-- A -->
					      <li id="A">
						      <p> 저희 웹사이트는 크게 "팝니다" 와 "삽니다"로 판매자와 구매자를 연결시켜줍니다.<br>
						          또한 구매자나 판매자는 각 카테고리, 책, 옷, 기프티콘, 기타 등에 대해 글을 등록함으로써  좀 더 손쉽게 거래를 진행시킬 수 있습니다.
						          화면 구성 왼쪽에는 동국대학교 서울캠퍼스의 지도를 배치해 어디서 만날지 좀 더 명확하게 접근이 가능합니다.<br>
						          중고 물품의 상태가 어떤지 알아보고 연락해야겠죠?<br>
						          저희는 이미지 업로드를 지원하여 해당 물품이 외관상 결함은 없는지, 허위 매물은 아닌지 확인이 가능합니다.
						         
						           </p>
					      </li>
				    </ul>
				  </li>
				  <!-- Q3 -->
				  <li id="Q">
				    <!-- <a href="#">Q. 1</a>  -->
				    <span class="QA_font">&nbsp;Q. 회원가입은 어떻게 하나요?</span>
				    <ul><!-- A -->
					      <li>
						      <p>화면 상단의 로그인/회원가입 버튼을 클릭하셔서 회원가입을 진행하시면 됩니다.
						      <br>단, 주의하실 점은 이 웹사이트는 학생들이 프로젝트로 만든 웹사이트므로 개인정보 보안에 유의해주시기 바랍니다.</p>
					      </li>
				    </ul>
				  </li>
				  <!-- Q4 -->
				  <li id="Q">
				    <!-- <a href="#">Q. 1</a>  -->
				    <span class="QA_font">&nbsp;Q. 아이디와 비밀번호를 까먹었어요. 도와주세요</span>
				    <ul><!-- A -->
					      <li>
						      <p>페이지 하단의 관리자 이메일 주소로,<br>
						       아이디를 찾으시려는 경우, <b>이름</b>과 <b>생년월일</b>을<br>
						       비밀번호를 찾으시려는 경우 <b>아이디</b>와 <b>생년월일</b> 그리고 <b>이름</b>을 기재하여 보내주시기 바랍니다.
						     </p>
					      </li>
				    </ul>
				  </li>
				  <!-- Q5 -->
				  <li id="Q">
				    <!-- <a href="#">Q. 1</a>  -->
				    <span class="QA_font">&nbsp;Q. 에러를 발견했어요</span>
				    <ul><!-- A -->
					      <li>
						      <p> 우선 저희 웹사이트를 이용하심에 있어서 불편을 끼쳐드려 죄송합니다.<br>
						          에러에 대한 설명과 함께 하단의 관리자 이메일 주소로 연락을 주시면 빠른 시일안에 고치도록 하겠습니다.
						     </p>
					      </li>
				    </ul>
				  </li>
				   <!-- Q6 -->
				  <li id="Q">
				    <!-- <a href="#">Q. 1</a>  -->
				    <span class="QA_font">&nbsp;Q. 판매자나 구매자가 잠적했어요</span>
				    <ul><!-- A -->
					      <li>
						      <p> 하단 관리자 이메일 주소로 상대방의 아이디와 관련 게시글 번호를 알려주시면<br>
						                저희가 해당 회원을 영구정지 시키겠습니다.<br>
						          불편을 드려 진심으로 죄송합니다. 
						     </p>
					      </li>
				    </ul>
				  </li>
				  
				  
			</ul>
		</div>

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
			<p>동국대학교의 열정적인 웹프로그래밍 수업 수강생<br>
			&nbsp;2016112109 컴퓨터공학전공 장석운, 
			   2015112113 컴퓨터공학전공 정용헌,
			   2017112095 컴퓨터공학전공 최준호 <br>
			   송양의 교수님 웹프로그래밍_02반 - 3조<br>
        </div>
    </div>
</body>
</html>