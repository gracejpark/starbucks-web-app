<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
	font-family: Arial;
	font-size: 17px;
}

#bb{
position:relative;
left:-190px;
bottom:100px;
}

#con{
position:absolute;
left: 100px;
top: 200px;

}
#con2{
position:relative;
right: -800px;
top: -105px;
}

* {
	box-sizing: border-box;
}

.row {
	display: -ms-flexbox; /* IE10 */
	display: flex;
	-ms-flex-wrap: wrap; /* IE10 */
	flex-wrap: wrap;
	margin: 0 -16px;
}

.col-25 {
	-ms-flex: 25%; /* IE10 */
	flex: 25%;
}

.col-50 {
	-ms-flex: 50%; /* IE10 */
	flex: 50%;
}

.col-75 {
	-ms-flex: 75%; /* IE10 */
	flex: 75%;
}

.col-25, .col-50, .col-75 {
	padding: 0 16px;
}

.container {
	background-color: #f2f2f2;
	border: 1px solid lightgrey;
	border-radius: 3px;
	display:inline-block;

}

input[type=text] {
	width: 100%;
	margin-bottom: 20px;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

label {
	margin-bottom: 10px;
	display: block;
}

.icon-container {
	margin-bottom: 20px;
	padding: 7px 0;
	font-size: 24px;
}

.btn {
	background-color: #4CAF50;
	color: white;
	padding: 12px;
	margin: 10px 0;
	border: none;
	width: 100%;
	border-radius: 3px;
	cursor: pointer;
	font-size: 17px;
}

.btn:hover {
	background-color: #45a049;
}

a {
	color: #2196F3;
}

hr {
	border: 1px solid lightgrey;
}

span.price {
	float: right;
	color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media ( max-width : 800px) {
	.row {
		flex-direction: column-reverse;
	}
	.col-25 {
		margin-bottom: 20px;
	}
}
</style>

<jsp:include page="/top.jsp"></jsp:include>


<%
	ArrayList<Map<String, String>> lists = (ArrayList<Map<String, String>>) session.getAttribute("productlist");
%>
<br>
<h2>Check Out</h2>
<br>
<br>
<div class="row">
<form action="/ydao/finished" method="post">
	<div class="col-75">
			<div class="container" style="width: 50%; height: 70%;" id="con" >
				<div class="row">
					<div class="col-50">
						<h3>Billing Address</h3>
						<label for="fname"><i class="fa fa-user"></i> Full Name</label> <input
							type="text" id="fname" name="f_name" placeholder="박예은"> <label
							for="email"><i class="fa fa-envelope"></i> Email</label> <input
							type="text" id="email" name="f_email"
							placeholder="john@example.com"> <label for="adr"><i
							class="fa fa-address-card-o"></i> Address</label> <input type="text"
							id="adr" name="f_address" placeholder="성정동"> <label
							for="city"><i class="fa fa-institution"></i> City</label> <input
							type="text" id="city" name="f_city" placeholder="천안">
					</div>

					<div class="col-50">
						<h3>Payment</h3>
						<label for="fname">Accepted Cards</label>
						<div class="icon-container">
							<i class="fa fa-cc-visa" style="color: navy;"></i> <i
								class="fa fa-cc-amex" style="color: blue;"></i> <i
								class="fa fa-cc-mastercard" style="color: red;"></i> <i
								class="fa fa-cc-discover" style="color: orange;"></i>
						</div>
						<label for="cname">Type on Card</label> <input type="text"
							id="cname" name="f_ctype" placeholder="Visa"> <label
							for="ccnum">Credit card number</label> <input type="text"
							id="ccnum" name="f_number" placeholder="1111-2222-3333-4444">
						<label for="expmonth">Exp Date</label> <input type="text"
							id="expmonth" name="f_exp" placeholder="11/25">
					</div>
				</div>
				<label> <input type="checkbox" checked="checked"
					name="sameadr"> Shipping address same as billing
				</label> <input type="submit" value="Continue to checkout" class="btn">
			</div>
		</div>

		<div class="col-25">
			<br>
			<br>
			<br>
			<br>
			<div class="container" style="width: 100%; height: 70%;" id="con2">
				<h4>
					Cart <span class="price" style="color: black"><i
						class="fa fa-shopping-cart"></i> <b></b></span>
				</h4>

				<c:forEach var="i" items="${productlist}">
					<p>${i.productId}
						x ${i.amount}<span class="price"><fmt:formatNumber
								value="${i.price * i.amount}" pattern="###,###,###" />원</span>
					</p>
				</c:forEach>
				<hr>
				<p>
					Shipping Fee(3만원이상 무료)&nbsp;<span class="price"><fmt:formatNumber
							value="${sum >30000 ? 0 :3000 }" pattern="###,###,###" />원</span>
				</p>
				<hr style="border: dashed 1px gray;">

				<p>
					Total <span class="price" style="color: black"><b> <c:set
								var="sum" value="${0}" /> <c:forEach var="i"
								items="${productlist}">
								<c:set var="sum" value="${sum + (i.price * i.amount)}" />
								<input type="hidden" name="f_menu" value="${i.productId}">
								<input type="hidden" name="f_quantity" value="${i.amount}">
								<input type="hidden" name="f_price" value="${i.price}">
								<input type="hidden" name="f_id" value="${loginUser}">
					</c:forEach> <fmt:formatNumber value="${sum > 30000 ?  sum: sum+3000 }"
								pattern="###,###,###" />원
					</b></span> <input type="hidden" name="f_total"
						value="${sum > 30000 ?  sum: sum+3000 }">
				</p>
			</div>
		</div>
	</form>
	</div>


<div align="right" id="bb">
<form action=/ydao/logout method=get>
		<button type="button" onClick="history.back()" value="뒤로가기"
			class="btn btn-success btn-md" 
			style="background-color: 017143; border-color: 017143; width:10%">뒤로가기</button>
		<button type="submit" class="btn cancel" style=width:10%>로그아웃</button>
</form>
</div>



<jsp:include page="/bottom.jsp"></jsp:include>