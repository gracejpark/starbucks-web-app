<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<jsp:include page="/top.jsp"></jsp:include>
<%
       if (session.getAttribute("loginUser") != null) {
      %>　

<div class="container">
	<h2>User Info</h2>
	<p></p>
	<table class="table table-hover">
<c:url value="/" var="home" />

		<thead>
			<tr>
				<th>ID</th>
				<th>PASSWORD</th>
				<th>NAME</th>
				<th>AGE</th>
				<th>E-MAIL</th>
				<th>ORDER</th>
			</tr>
		</thead>
		<tbody><c:forEach var="i" items="${list}">
			
				<tr>
					<td>${i.S_ID}</td>
					<td>${i.S_PW}</td>
					<td>${i.S_NAME}</td>
					<td>${i.S_AGE}</td>
					<td>${i.S_EMAIL}</td>
					<td><a href="${home}mypage?m=${i.S_NUM}">주문내역</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<%}else {%>
<div> <h1>로그인 후 이용해주세요 </h1>
<script language="JavaScript">
 setTimeout("move()",3000);
 function move(){
 location.href="/ydao/index.jsp"}
</script>
</div>
<% }   %>


<jsp:include page="/bottom.jsp"></jsp:include>