<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<!DOCTYPE html>
<html>
<head>
	<title>거래</title>
</head>
<body>	
	<p>완료</p>
<%	
	String id1 = request.getParameter("id1");
	String id2 = request.getParameter("id2");
	int money = Integer.parseInt(request.getParameter("money"));
	String text = request.getParameter("text");
	
	LocalDate now = LocalDate.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
    String formatedNow = now.format(formatter);
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
	}catch(ClassNotFoundException cnfe){
		cnfe.printStackTrace();
		System.out.println("드라이버 로딩 실패");
	}
	try{
		String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
		String userId = "class_a";
		String userPass = "practice";

		conn = DriverManager.getConnection(jdbcUrl, userId, userPass);
		
		String sql = "INSERT INTO 거래내역 VALUES(TRANSACTIONID.NEXTVAL, ?, ?, 0, '입금', ?, ?)";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id2);
		pstmt.setString(2, formatedNow);
		pstmt.setString(3, text);
		pstmt.setInt(4, money);
		
	
		rs = pstmt.executeQuery();
				
%>
			
		<jsp:forward page="transaction3.jsp"/>

<%
	}catch(SQLException e){
		e.printStackTrace();

		if(rs != null) {
			try {
				rs.close();
			}catch(SQLException sqle) {} 
		}
		if(pstmt != null) {
			try {
				pstmt.close();
			}catch(SQLException sqle) {}
		}
		if(conn != null) {
			try {
				conn.close();
			}catch(SQLException sqle) {}
		}
	}
%>

	</table>

</body>
</html>