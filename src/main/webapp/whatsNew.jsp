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
	<h2>WHAT'S NEW</h2>
	<p></p>
	<table class="table table-hover">


		<thead>
			<tr>
				<th>NO</th>
				<th>이미지</th>
				<th>구분</th>
				<th>내용</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td>Mark</td>
				<td>Otto</td>
				<th>사이렌오더 비회원 서비스 출시</th>
				<td>2019-01-10</td>
			</tr>
		</tbody>
	</table>
</div>

<jsp:include page="/bottom.jsp"></jsp:include>