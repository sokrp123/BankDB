<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>거래내역</title>
</head>
<body>	
	<table width="700" border="1">
		<tr>
			<td width="100">거래번호</td>
			<td width="100">예금계좌ID</td>
			<td width="100">입출금날짜</td>
			<td width="100">예금잔고</td>
			<td width="100">예금구분</td>
			<td width="100">예금내용</td>
			<td width="100">거래금액</td>
		</tr>
<%	
	
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
		

		String sql = "SELECT * FROM 거래내역 ORDER BY 거래번호";
		
		pstmt = conn.prepareStatement(sql);

		rs = pstmt.executeQuery();
		while( rs.next() ) {
			int a = rs.getInt("거래번호");
			String b = rs.getString("예금계좌ID");
			String c = rs.getString("입출금날짜");
			int d = rs.getInt("예금잔고");
			String e = rs.getString("예금구분");
			String f = rs.getString("예금내용");
			int g = rs.getInt("거래금액");
			
%>
			
			<tr>	
				<td width="100"><%= a %></td>
				<td width="100"><%= b %></td>
				<td width="100"><%= c %></td>
				<td width="100"><%= d %></td>
				<td width="100"><%= e %></td>
				<td width="100"><%= f %></td>
				<td width="100"><%= g %></td>
			</tr>		

<%
		}
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