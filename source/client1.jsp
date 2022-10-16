<%@ page contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>계좌개설</title>
</head>
<body>
<% 
	String name = request.getParameter("name");
	String phoneNum = request.getParameter("phoneNum");
	String email = request.getParameter("email");
	String secretNum = request.getParameter("secretNum");
	String birthday = request.getParameter("birthday");
	String address = request.getParameter("address");
	String job = request.getParameter("job");
	
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
		

		String sql = "INSERT INTO 고객 VALUES(?, ?, ?, ?, ?, ?, ?)";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, secretNum);
		pstmt.setString(2, name);
		pstmt.setString(3, phoneNum);
		pstmt.setString(4, email);
		pstmt.setString(5, birthday);
		pstmt.setString(6, address);
		pstmt.setString(7, job);	


		rs = pstmt.executeQuery();
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

	<jsp:forward page="account.jsp"/>

</body>
</html>