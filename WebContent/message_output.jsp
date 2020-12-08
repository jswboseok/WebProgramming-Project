<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<HTML>
<HEAD>
<TITLE> 게시판 </TITLE>

<META http-equiv="Content-Type" content="text/html; charset=euc-kr">
<style type='text/css'>
<!--
	a:link		{font-family:"";color:black;text-decoration:none;}
	a:visited	{font-family:"";color:black;text-decoration:none;}
	a:hover		{font-family:"";color:black;text-decoration:underline;}
-->
</style>
</HEAD>
<BODY>
<%
String msgnum = request.getParameter("msgnum"); 
String driverName = "com.mysql.jdbc.Driver";
String dbURL = "jdbc:mysql://localhost:3306/dgumarket?serverTimezone=UTC";
 Class.forName(driverName);
 Connection conn = DriverManager.getConnection(dbURL, "root", "0000");
 Statement stmt = conn.createStatement();
PreparedStatement pstmt = null;
ResultSet rs = null;
try {
String strSQL = "SELECT * FROM message_3 WHERE num = ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(msgnum));
rs = pstmt.executeQuery();
rs.next();
String msgid   = request.getParameter("msgid"); 
String msgsendid   = request.getParameter("msgsendid"); 
String msgtitle  = request.getParameter("msgtitle");
String msgcontents  = request.getParameter("msgcontents");
String msgdate = rs.getString("msgdate");
%>
<center><font size='3'><b> 쪽지 보관함</b></font>
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>
<TABLE border='0' width='600'>
	<TR>
    		<TD align='left'>
      		<font size='2'> 작성자 : <%=msgsendid %></font>
    		</TD>
    		
    	</TR>
</TABLE>
<TABLE border='0' cellspacing=5 cellpadding=10 width='600'>
	<TR bgcolor='ededed'>
		<TD><font size='2' color=''><%=msgcontents %></font>
		</TD>
	</TR>
</TABLE>
<TABLE border='0' width='600'>
	<TR>
    		<TD align='right'>
		<font size='2'><br><font size='2'></font>
    		</TD>
	</TR>
</TABLE>
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
  	<TR>
  		<TD><hr size='1' noshade>
  		</TD>
  	</TR>
</TABLE>
<%
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(msgnum));
pstmt.executeUpdate();
}catch(SQLException e){
   	out.print("SQL에러 " + e.toString());
}catch(Exception ex){
   	out.print("JSP에러 " + ex.toString());
}finally{  
	rs.close();
	pstmt.close();
	conn.close();
}
%>
</TABLE>
</BODY>
</HTML>