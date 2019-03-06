<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

* {
	box-sizing: border-box;
}
.img{
	float: left;
	position: relative;
	left: 300;
	top:100px;
}

.content {
	float: left;
	position: relative;
	left: 390; 
	top:100px;
}

/* Button used to open the contact form - fixed at the bottom of the page */
.open-button {
	background-color: 007041;
	color: white;
	padding: 16px 20px;
	border: none;
	cursor: pointer;
	opacity: 0.8;
	position: fixed;
	bottom: 250px;
	right: 500px;
	width: 280px;
}

/* The popup form - hidden by default */
.form-popup {
	display: none;
	position: fixed;
	bottom: 0;
	right: 15px;
	border: 3px solid #f1f1f1;
	z-index: 9;
}

/* Add styles to the form container */
.form-container {
	max-width: 300px;
	padding: 10px;
	background-color: white;
}

/* Full-width input fields */
.form-container input[type=text], .form-container input[type=password] {
	width: 100%;
	padding: 15px;
	margin: 5px 0 22px 0;
	border: none;
	background: #f1f1f1;
}

/* When the inputs get focus, do something */
.form-container input[type=text]:focus, .form-container input[type=password]:focus
	{
	background-color: #ddd;
	outline: none;
}

/* Set a style for the submit/login button */
.form-container .btn {
	background-color: #4CAF50;
	color: white;
	padding: 16px 20px;
	border: none;
	cursor: pointer;
	width: 100%;
	margin-bottom: 10px;
	opacity: 0.8;
}

/* Add a red background color to the cancel button */
.form-container .cancel {
	background-color: red;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
	opacity: 1;
}
</style>
<jsp:include page="/top.jsp"></jsp:include>
<div class="container">
	<br>
	<br>
	<div class="img">
	<img src="${pageContext.request.contextPath}/images/background.png"	style="width: 60%">	</div>
	
	<div class="content">
	<h1>Welcome to StarBucks</h1>
	<p>Welcome! 스타벅스커피 코리아에 오신 것을 환영합니다.</p>
	<p>회원가입하시려면 하단에 있는 버튼을 눌러주세요.</p>
	<c:url value="/daolist.do" var="iform" />
	<button class="open-button" onclick="openForm()">아직 회원이 아니세요?</button>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
	<div class="form-popup" id="myForm">
		<form action="${iform}" method="post" class="form-container">
			<h1>Sign Up</h1>
			<label for="id"><b>Id</b></label>
			<input type="text" name="s_id" placeholder="Enter Id" required="required"> 
			<label	for="psw"><b>Password</b></label>
			<input type="password" name="s_pw" placeholder="Enter Password" required="required"> 
			<label	for="name"><b>Name</b></label> <input type="text" name="s_name" placeholder="Enter Name">
			<label for="age"><b>Age</b></label> <input type="text" name="s_age" placeholder="Enter Age">
			<label for="email"><b>Email</b></label>
			<input type="text"	name="s_email" placeholder="Enter Email" required>				
			<button type="submit" class="btn">Join</button>
			<button type="button" class="btn cancel" onclick="closeForm()">Close</button>
		</form>
	</div>
	</div>
	
	<script>
		function openForm() {
			document.getElementById("myForm").style.display = "block";
		}
		function closeForm() {
			document.getElementById("myForm").style.display = "none";
		}
	</script>
</div>

<jsp:include page="/bottom.jsp"></jsp:include>