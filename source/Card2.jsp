<%@ page contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

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
	
	LocalDate now = LocalDate.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
    String formatedNow = now.format(formatter);
	
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
		
		String sql = "INSERT INTO 카드 VALUES(CARDID.NEXTVAL,? ,?, ?, ?, '내역없음', ?)";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, secretNum);
		pstmt.setString(2, id);
		pstmt.setString(3, formatedNow);
		pstmt.setInt(4, maxMoney);
		pstmt.setString(5, items);
		
	
		pstmt.executeUpdate();
				
%>
	<jsp:forward page="Card3.jsp"/>
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