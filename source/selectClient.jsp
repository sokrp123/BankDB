<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>고객</title>
</head>
<body>	
	<table width="700" border="1">
		<tr>
			<td width="100">고객주민번호</td>
			<td width="100">고객명</td>
			<td width="100">고객전화번호</td>
			<td width="100">고객이메일</td>
			<td width="100">고객생년월일</td>
			<td width="100">고객주소</td>
			<td width="100">고객직업</td>
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
		

		String sql = "SELECT * FROM 고객";
		
		pstmt = conn.prepareStatement(sql);

		rs = pstmt.executeQuery();
		while( rs.next() ) {
			String a = rs.getString("고객주민번호");
			String b = rs.getString("고객명");
			String c = rs.getString("고객전화번호");
			String d = rs.getString("고객이메일");
			String e = rs.getString("고객생년월일");
			String f = rs.getString("고객주소");
			String g = rs.getString("고객직업");
			
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