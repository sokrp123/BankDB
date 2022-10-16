<%@ page contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>카드 만들기</title>
</head>
<body>
	<p>카드신청을 원하시는 ID를 입력해주세요.</p>
	<form name="form4" method="post" action="Card.jsp">
		<p>고객 이름 : <input type="text" name="name"></p>
		<p>예금계좌ID : <input type="text" name="id"></p>
		<p>고객 주민번호 : <input type="text" name="secretNum"></p>
		<p>카드 한도금액 : <input type="text" name="maxMoney"></p>
		<p>카드 종류 :<select name="items">
			<option value="신용카드">신용카드</option>
			<option value="체크카드">체크카드</option>	
		</select>
		</p>
		<p><input type="submit" name="Submit" value="신청하기"></p>
	</form>
</body>
</html>