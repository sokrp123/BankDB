<%@ page contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>카드 만들기</title>
</head>
<body>
	<p>완료</p>
	<%	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String secretNum= request.getParameter("secretNum");
	int maxMoney = Integer.parseInt(request.getParameter("maxMoney"));
	String items= request.getParameter("items");
	
	Connection conn = null;
	PreparedStatement pstmt = null;

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
		
		String sql = "UPDATE 예금계좌 SET 카드신청여부 = 'YES' WHERE 예금계좌ID=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
	
		pstmt.executeUpdate();
				
%>
	<jsp:forward page="Card2.jsp"/>
<%
	}catch(SQLException e){
		e.printStackTrace();
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
</body>
</html>