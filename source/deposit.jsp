<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>입금하기</title>
</head>
<body>
	<p>입금하실 계좌번호와 금액, 내용을 입력해주세요</p>
	<form name="form3" method="post" action="deposit1.jsp">
		<p>입금할 계좌 : <input type="text" name="id1"></p>
		<p>금액 : <input type="text" name="money"></p>
		<p>입금내용 : <input type="text" name="text"></p>
		<p><input type="submit" name="Submit" value="보내기"></p>
	</form>
</body>
</html>