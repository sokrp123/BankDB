<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<!DOCTYPE html>
<html>
<head>
	<title>입금하기</title>
</head>
<body>	
	<p>완료</p>
<%	
	String id1 = request.getParameter("id1");
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
		
		String sql = "UPDATE 거래내역 SET 예금잔고=(SELECT 예금잔고 FROM 예금계좌 WHERE 예금계좌ID = ?) WHERE 예금계좌ID = ? AND 입출금날짜 = ? AND 예금구분 =? AND 예금내용 =? AND 거래금액=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id1);
		pstmt.setString(2, id1);
		pstmt.setString(3, formatedNow);
		pstmt.setString(4, "입금");
		pstmt.setString(5, text);
		pstmt.setInt(6, money);

		rs = pstmt.executeQuery();
				
%>
			

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