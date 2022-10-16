<%@ page contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>계좌개설</title>
</head>
<body>

	<p>은행에 가입할 때 사용했던 고객의 정보를 입력해주세요.</p>
	<form name="form1" method="post" action="client1.jsp">
		<p>고객이름 : <input type="text" name="name"></p>
		<p>고객주민번호 : <input type="text" name="secretNum"></p>
		<p>고객전화번호 : <input type="text" name="phoneNum"></p>
		<p>고객이메일 : <input type="text" name="email"></p>
		<p>고객생일 : <input type="text" name="birthday"></p>
		<p>고객주소 : <input type="text" name="address"></p>
		<p>고객직업 : <input type="text" name="job"></p>
		<p><input type="submit" name="submit" value="확인"></p>
		
	</form>
		

</body>
</html>