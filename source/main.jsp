<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>메인화면</title>
	<h1>명지은행</h1>
	<h2>사용하실 작업을 선택하세요</h2>
</head>
<body>
	<button onclick="location='client.jsp'">은행가입 후 계좌만들기</button>
	<button onclick="location='transactionForm.jsp'">상대방에게 송금하기</button>
	<button onclick="location='CardForm.jsp'">카드개설하기</button>
	<button onclick="location='deposit.jsp'">계좌에 입금하기</button>
	<button onclick="location='withdraw.jsp'">계좌에서 출금하기</button>
	<button onclick="location='cardSlash.jsp'">카드결제하기</button>
	<button onclick="location='select.jsp'">개발자 전용</button>
</body>
</html>