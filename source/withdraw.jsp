<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>출금하기</title>
</head>
<body>
	<p>출금하실 계좌번호와 금액, 내용을 입력해주세요</p>
	<form name="form3" method="post" action="withdraw1.jsp">
		<p>출금할 계좌 : <input type="text" name="id1"></p>
		<p>금액 : <input type="text" name="money"></p>
		<p>출금내용 : <input type="text" name="text"></p>
		<p><input type="submit" name="Submit" value="보내기"></p>
	</form>
</body>
</html>