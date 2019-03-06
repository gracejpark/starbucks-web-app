
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<jsp:include page="/top.jsp"></jsp:include>

<div class="container">
	<br>
	<h2>Admin Order List</h2>
	<br><br><br><br>
<c:url value="/" var="home" />
<form action="${home}update.do" method="post">
<table class="table table-hover">

		<thead>
			<tr>
			<th>ID</th>
			<th>NAME</th>
			<th>ORDER#</th>
			<th>CITY</th>
			<th>ADR</th>
			<th>CARD</th>
			<th>CARD#</th>
			<th>EXP</th>
			<th>MENU</th>
			<th>Q</th>
			<th>TOTAL</th>
			<th>STATE</th>
			<th>MODIFY</th>
			</tr>
		</thead>
		<c:forEach var="i" items="${list}">
		<tbody>
				<tr>
				<td>${i.F_ID}</td>
				<td>${i.F_NAME}</td>
					<td>${i.F_NO}</td>
					<td>${i.F_CITY}</td>
					<td>${i.F_ADDRESS}</td>
					<td>${i.F_CTYPE}</td>
					<td>${i.F_NUMBER}</td>
					<td>${i.F_EXP}</td>					
					<td>${i.F_MENU}</td>
					<td>${i.F_QUANTITY}</td>
					<td>${i.F_TOTAL}</td>
					<td>${i.F_STATE}</td>
					<td>
					<input type="hidden" name="f_no" value="${i.F_NO}">
					<select onchange="d_change" id="ch" name="f_state">
					<option value="결제완료"
					<c:if test="${i.F_STATE eq '결제완료'}"> 
					selected="selected"</c:if>>결제완료</option>
					<option value="배송준비"
					<c:if test="${i.F_STATE eq '배송준비'}"> 
					selected="selected"</c:if>>배송준비</option>
					<option value="배송중"
					<c:if test="${i.F_STATE eq '배송중'}"> 
					selected="selected"</c:if>>배송중</option>
					<option value="배송완료"
					<c:if test="${i.F_STATE eq '배송완료'}"> 
					selected="selected"</c:if>>배송완료</option>
					</select>
			     </tr>  
		</tbody>
		</c:forEach>
	</table>
	<div align="right">
	<button type="submit" id="btnUpdate" class="btn btn-success btn-md" style="background-color:017143; border-color:017143;">수정</button>
	<button type="button" id="btnList">상품목록</button> </div>
</form>
</div>

    <jsp:include page="/bottom.jsp"></jsp:include>