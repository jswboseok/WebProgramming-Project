<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>동국마켓</title>
	<link href="css/main.css" rel="stylesheet" type="text/css">
	<link href="css/table.css" rel="stylesheet" type="text/css">
	<!-- 글쓰기 창 -JSW  -->
	 <!-- CJH, 제목 폰트 관련 추가 (11/23 && 11/28)  -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
	<!-- 1201 Naver Map API -->
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=db4sb1wr4q&callback=initMap"></script>
	<script type="text/javascript">
	var map = null;

      function initMap(){
          map = new naver.maps.Map('map',{
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
                    <li><a class="link" href="#">고객센터</a></li>
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
        
        
        <!-- CONTENT 부분  -->
        <!-- ---------------------------------------------------------------------- -->
		    
				<form action="push_db.jsp" enctype="multipart/form-data" method="POST" >
				<div class="table-wrapper">
					<table class="fl-table" border="0">
						<thead style="background:#D27328;">
							<tr>
							<th style="text-align:center;">글쓰기</td>
							</tr>
	
						</thead>
						<tbody>
				        <tr> 
				        	<td>제목 : </td>
				         	<td style="text-align:left" ><input type="text" name="title" size="50">(10자 이내)</td>
				      	</tr>
				      		<td>목적 : </td>
				        	<td style="text-align:left" ><select name="isbuy">
				         		<option>팝니다</option>
				         		<option>삽니다</option>
				         	</select></td>
				       	</tr>
				       	<tr>
				        	<td>카테고리 : </td>
				          	<td style="text-align:left" ><select name="category">
				         		<option>책</option>
				         		<option>옷</option>
				         		<option>기프티콘</option>
				          		<option>기타</option>
				          	</select></td>
 				       	</tr>
 				       	<tr>
 				       		<td>파일 업로드 : </td>
 				       		<td style="text-align:left"><input type="file" name="filename1" size=40></td>
 				       	</tr>
 				       	<tr>
				        	<td>내용 : </td>
				          	<td style="text-align:left" ><textarea name="content" cols="60" rows="10"></textarea></td>
				       	</tr>
				       	</tbody>
				    </table><br><br>
				   	&nbsp; <input type="submit" class="write_button" value="등록하기">
			   		&nbsp;<input type="reset" class="write_button" value="다시쓰기">
			   		<br>
			   		</div>
				</form><br>
				<a class="detail_link" href="main.jsp">[ 메인 화면으로 ]</a>
				
				
			
		   	
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
			<p>동국대학교의 열정적인 웹프로그래밍 수업 수강생<br>
			&nbsp;2016112109 컴퓨터공학전공 장석운, 
			   2015112113 컴퓨터공학전공 정용헌,
			   2017112095 컴퓨터공학전공 최준호 <br>
			   송양의 교수님 웹프로그래밍_02반 - 3조<br>
        </div>

    </div>
    
</body>
</body>
</html>