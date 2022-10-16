<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>결제하기</title>
</head>
<body>
	<p>사용자의 카드번호와 결제할 금액, 내용을 입력해주세요</p>
	<form name="form3" method="post" action="cardSlash1.jsp">
		<p>결제할 카드ID : <input type="text" name="cardid"></p>
		<p>결제할 금액 : <input type="text" name="money"></p>
		<p>결제내용 : <input type="text" name="text"></p>
		<p><input type="submit" name="Submit" value="보내기"></p>
	</form>
</body>
</html>