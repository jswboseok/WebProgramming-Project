<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%@ page import = "java.sql.*" %>

<FORM>

	<TABLE border='1' width=250>
	   
	<%
	   String id = request.getParameter("id");
	   String driverName = "com.mysql.jdbc.Driver";
	   String dbURL = "jdbc:mysql://localhost:3306/dgumarket?serverTimezone=UTC";
	   Class.forName(driverName);
	   Connection conn = DriverManager.getConnection(dbURL,"root","0000");
	   Statement stmt = conn.createStatement();
	   
	   String strSQL = "SELECT userID FROM user where userID='" + id + "'";
	   ResultSet rs = stmt.executeQuery(strSQL);
	   if (rs.next()) {
	%>
		<TR>
		   <TD  align='center' bgcolor='cccccc'>
		   <font size='2'>ID : <%= id%> <BR> 보낼 수 있는 아이디입니다.</font>
		   </TD>
		</TR>
		<TR>
		   <TD align='center'>
		   <a style="color:#000;"href=javascript:close()>[닫 기]</a>
		   </TD>
		</TR>
	<%
	   } else {
	%>
	<TR>
	   <TD align='center' bgcolor='cccccc'>
	   <font size='2'>ID : <%= id%> <BR> 보낼 수 없는 아이디입니다.</font>
	   </TD>
	</TR>
	<TR>
	   <TD align='center'>
	   
	   <a href=javascript:close()>[닫 기]</a>
	   </TD>
	</TR>
	<%
	   }
	   rs.close();
	   stmt.close();
	   conn.close();
	%>
	</TABLE>
</FORM>


</body>
</html>
