<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="widtd=device-widtd, initial-scale=1">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<style>

.find_mem_wrap {
	margin: 0 auto;
	padding: 70px 0 50px;
	width: 310px;
}

table {
	border: 3px solid #f1f1f1;
}

tr,td{border: 1px solid #f1f1f1;
}
</style>
<jsp:include page="/top.jsp"></jsp:include>

<div class="container">


	<div class="find_mem_wrap" align="center">
		<div class="find_mem_inner">
			<strong class="find_mem_ttl">My Starbucks</strong>
			<div class="find_mem_form">
				<figure class="find_mem_sally">
					<img
						src="//image.istarbucks.co.kr/common/img/util/mem/icon_find_sally.png"
						alt="">
				</figure>
				<div class="find_mem_result">
					<p class="mem_result_txt">
						<span class="result_txt_sub"><br>개인정보와 주문내역을 확인 하실 수 있습니다.
						</span>
					</p>

				</div>

				<table class="table table-hover" style="widtd: 60%" >
		
						<tr>
							<td><b>ID</b></td>
							<td>${loginUser}</td>
						</tr>
						<tr>
							<td><b>PASSWORD</b></td>
							<td>${loginPW}</td>
						</tr>
						<tr>
							<td><b>NAME</b></td>
							<td>${loginName}</td>
						</tr>
						<tr>
							<td><b>AGE</b></td>
							<td>${loginAge}</td>
						</tr>
						<tr>
							<td><b>MAIL</b></td>
							<td>${loginEmail}</td>
						</tr>
						<tr>
							<td><b>ORDER</b></td>
							<td>
							<c:url value="/finished" var="finished" />
							<a href="${finished}">Click</a></td>
						</tr>
				
				</table>
			</div>




		</div>
	</div>
</div>







<jsp:include page="/bottom.jsp"></jsp:include>