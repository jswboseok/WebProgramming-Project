<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<html>
<head><title>message_3 send</title>
</head>
<%
 response.setHeader("Cache-Control","no-store"); 
 response.setHeader("Pragma","no-cache"); 
%>

<%
try{
String msgid   = request.getParameter("msgid"); 
String msgsendid   = request.getParameter("msgsendid"); 
String msgtitle  = request.getParameter("msgtitle");
String msgcontents  = request.getParameter("msgcontents");
Calendar dateIn = Calendar.getInstance();
String msgdate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
msgdate = msgdate + Integer.toString(dateIn.get(Calendar.MONTH)+1) + "-"; // 1월은 0, 2월은 1 로 불러와져 +1
msgdate = msgdate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
msgdate = msgdate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
msgdate = msgdate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
msgdate = msgdate + Integer.toString(dateIn.get(Calendar.SECOND));
String driverName = "com.mysql.jdbc.Driver";
String dbURL = "jdbc:mysql://localhost:3306/dgumarket?serverTimezone=UTC";
Class.forName(driverName);
Connection conn = DriverManager.getConnection(dbURL, "root", "0000");
Statement stmt = conn.createStatement();
PreparedStatement pstmt1 = null, pstmt2 = null;
String strSQL = "SELECT Max(msgnum) FROM message_3";
pstmt1 = conn.prepareStatement(strSQL);
ResultSet rs = pstmt1.executeQuery();

int msgnum = 1;


	rs.next();
	msgnum = rs.getInt(1) + 1;	
rs.close();
strSQL ="INSERT INTO message_3(msgnum, msgid, msgsendid, msgtitle, msgcontents, msgdate)";
strSQL = strSQL + "VALUES (?, ?, ?, ?, ?, ?)";
pstmt2 = conn.prepareStatement(strSQL);
pstmt2.setInt(1, msgnum);
pstmt2.setString(2, msgid);
pstmt2.setString(3, msgsendid);
pstmt2.setString(4, msgtitle);
pstmt2.setString(5, msgcontents);
pstmt2.setString(6, msgdate);
pstmt2.executeUpdate();
response.sendRedirect("message.jsp"); 
%>
<body>
<%
pstmt1.close();
pstmt2.close();
conn.close();
}catch(SQLException e){
%>

게시판에 문제가 있습니다. 관리자에게 문의하세요.

<%
}
%>
</body>
</html>