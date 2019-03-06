
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<jsp:include page="/top.jsp"></jsp:include>

<div class="container">
	<br>
	<h2>Order List</h2>
	<br><br><br><br>
<form action="/ydao/end" method="post">
<table class="table table-hover">
<c:url value="/" var="home" />
		<thead>
			<tr>
			<th>ORDER#</th>
			<th>NAME</th>
			<th>E-MAIL</th>
			<th>ADR</th>
			<th>CITY</th>
			<th>TYPE</th>
			<th>CARD#</th>
			<th>EXP</th>
			<th>MENU</th>
			<th>Q</th>
			<th>TOTAL</th>
			<th>STATE</th>
			</tr>
		</thead>
		<c:forEach var="i" items="${list}">
		<tbody>
				<tr>
					<td>${i.F_PRONUM}</td>
					<td>${i.F_NAME}</td>
					<td>${i.F_EMAIL}</td>
					<td>${i.F_ADDRESS}</td>
					<td>${i.F_CITY}</td>
					<td>${i.F_CTYPE}</td>
					<td>${i.F_NUMBER}</td>
					<td>${i.F_EXP}</td>	
					<td>${i.F_MENU}</td>
					<td>${i.F_QUANTITY}</td>
					<td><fmt:formatNumber value="${i.F_TOTAL}" pattern="###,###,###"/>원</td>
					<td>${i.F_STATE}</td>
			     </tr>  
		</tbody>
		</c:forEach>
	</table>
	<div align="right"><button type="submit" class="btn btn-success btn-md" style="background-color:017143; border-color:017143;">메인으로</button>
	<button type="button" class="btn cancel" onclick="javascript:history.back (-1)">뒤로가기</button>
</div></form>
</div>


    <jsp:include page="/bottom.jsp"></jsp:include>