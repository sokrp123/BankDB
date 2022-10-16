<%@ page contentType="text/html; charset=utf-8"
   pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>


<!DOCTYPE html>
<html>
<head>
   <title>계좌개설</title>
</head>
<body>   
   
   
<%   

   request.setCharacterEncoding("utf-8");
   //날짜 객체 생성 및 String 타입으로 형 변환하여 변수에 할당
   LocalDate now = LocalDate.now();
   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
   String formatedNow = now.format(formatter);
   
   String name = request.getParameter("name");
   String phone = request.getParameter("phone");
   String email = request.getParameter("email");
   String secretNum = request.getParameter("secretNum");
   
   String type = request.getParameter("type");
   int money = Integer.parseInt(request.getParameter("money"));
   
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
      
      //ACCOUNT_ID.NEXTVAL이 시퀀스로 데이터베이스 내에 선언된 변수
      String sql = "UPDATE 예금계좌 SET 예금계좌ID= ACCOUNT_ID.NEXTVAL, 예금계좌종류=?, 예금잔고=?, 예금개설일자=? WHERE 예금계좌ID = '임시값'";

        pstmt = conn.prepareStatement(sql);
        
        pstmt.setString(1, type);
        pstmt.setInt(2, money);
        pstmt.setString(3, formatedNow);


        pstmt.executeUpdate();

      
%>
      <p>추가되었습니다.</p>
      
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
