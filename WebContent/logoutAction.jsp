<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		session.invalidate(); //세션 종료
			
	%>
	<script>
	/* alert('로그아웃 성공');  소리 거슬리면 제외*/
	location.href='main.jsp';
	</script>

</body>
</html>