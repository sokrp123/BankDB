<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>거래</title>
</head>
<body>
	<p>입금자의 계좌번호와 입금하실 계좌번호, 입금하실 금액을 입력해주세요</p>
	<form name="form3" method="post" action="transaction.jsp">
		<p>입금자 : <input type="text" name="id1"></p>
		<p>입금대상 : <input type="text" name="id2"></p>
		<p>금액 : <input type="text" name="money"></p>
		<p>입금내용 : <input type="text" name="text"></p>
		<p><input type="submit" name="Submit" value="보내기"></p>
	</form>
</body>
</html>