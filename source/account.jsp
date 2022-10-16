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
	
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String phone = request.getParameter("phoneNum");
	String email = request.getParameter("email");
	String secretNum = request.getParameter("secretNum");
	String birthday = request.getParameter("birthday");
	String address = request.getParameter("address");
	String job = request.getParameter("job");

	


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
		

		String sql = "INSERT INTO 예금계좌 values('임시값', ?, ?, ?, ?, '0', 0, 'NO', '0')";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, phone);
		pstmt.setString(3, email);
		pstmt.setString(4, secretNum);
		
		pstmt.executeUpdate();

%>
	<p>계좌개설에 필요한 정보들을 입력해주세요.</p>
	

	<form name="form2" method="post" action="account1.jsp">
		<p>예금계좌종류 : <input type="text" name="type"></p>
		<p>예금잔고 : <input type="text" name="money"></p>
		<p><input type="submit" name="submit" value="확인"></p>
	</form>
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