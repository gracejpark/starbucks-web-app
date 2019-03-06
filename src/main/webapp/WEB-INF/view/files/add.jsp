<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<jsp:include page="/top.jsp"></jsp:include>


<%
	if (session.getAttribute("loginUser") != null) {
%>
	<div class="container">
	<br>
	<h2>Cart</h2>
	<br>
	<br>
	<h5 style="text-align: right">
		[ Id : ${loginUser}<p class="glyphicon glyphicon-user">]</p>
	</h5>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>선택</th>
				<th>사진</th>
				<th>메뉴</th>
				<th>수량</th>
				<th>금액</th>
				<th>결제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" items="${productlist}">
				<tr>
					<td><input type="checkbox"></td>
					<td><img
						src="${pageContext.request.contextPath}/images/${i.productImg}"
						style="width: 80px;"></td>
					<td>${i.productId}</td>
					<td>${i.amount}</td>
					<td><fmt:formatNumber value="${i.price * i.amount}" pattern="###,###,###"/>원</td>
					
					<td><button type="button" class="btn">주문</button>
						<button type="button" class="btn btn-default">삭제</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div style="text-align: right">
		<c:url value="/files/checkOut" var="checkout" />
		<form action="${checkout}" method="post">
			<button type="submit" class="btn btn-success">전체주문</button>
		</form>
		<c:url value="/files/dCheckOut" var="delete" />
		<form action="${delete}" method="get">
			<button type="submit" class="btn btn-danger">전체삭제</button>
		</form>
	</div>
	</div>
	<%
		} else {
	%>

	<script>
		alert("로그인 후 이용해주세요.");
		history.back();
	</script>
	
<%	}
	
	%>
	
	<jsp:include page="/bottom.jsp"></jsp:include>