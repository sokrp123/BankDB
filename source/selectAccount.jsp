<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
   <title>예금계좌</title>
</head>
<body>   
   <table width="900" border="1">
      <tr>
         <td width="100">예금계좌id</td>
         <td width="100">예금자이름</td>
         <td width="100">전화번호</td>
         <td width="100">이메일</td>
         <td width="100">고객주민번호</td>
         <td width="100">예금계좌종류</td>
         <td width="100">예금잔고</td>
         <td width="100">카드신청여부</td>
         <td width="100">예금개설일자</td>
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
      

      String sql = "SELECT * FROM 예금계좌";
      
      pstmt = conn.prepareStatement(sql);

      rs = pstmt.executeQuery();
      while( rs.next() ) {
         String a = rs.getString("예금계좌ID");
         String b = rs.getString("예금자이름");
         String c = rs.getString("전화번호");
         String d = rs.getString("이메일");
         String e = rs.getString("고객주민번호");
         String f = rs.getString("예금계좌종류");
         int g = rs.getInt("예금잔고");
         String h = rs.getString("카드신청여부");
         String i = rs.getString("예금개설일자");

         
%>
         
         <tr>   
            <td width="100"><%= a %></td>
            <td width="100"><%= b %></td>
            <td width="100"><%= c %></td>
            <td width="100"><%= d %></td>
            <td width="100"><%= e %></td>
            <td width="100"><%= f %></td>
            <td width="100"><%= g %></td>
            <td width="100"><%= h %></td>
            <td width="100"><%= i %></td>

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


</body>
</html>