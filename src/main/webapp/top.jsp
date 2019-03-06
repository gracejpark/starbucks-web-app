<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style>
#span{
  position: absolute right:0;
}
.navbar {
	padding-top: 50px;
	margin-bottom: 0;
	border-radius: 0;
	background-color: white;
}
.navbar-brand{
position:relative;
top:-25px;
}
.row.content {
	height: 450px
}
.sidenav {
	padding-top: 20px;
	background-color: #f1f1f1;
	height: 100%;
}

footer {
	background-color: white;
	color: black;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
#alert span{
text-align:center;
}
</style>
</head>


<body>
<c:choose>
 <c:when test="${empty loginUser}">
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">		
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<c:url value="/index.jsp" var="home" />
				<a class="navbar-brand" href="${home}">
				<img src="${pageContext.request.contextPath}/images/logo.jpg" alt="logo" style=width:100px;></a>
			</div>
			
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><c:url value="/daotest.do" var="intro" />
					<a href="${intro}">ABOUT</a></li> 
					
					<li><c:url value="/files/upproc2" var="menu" />
					<a href="${menu}">MENU</a></li>

					<li><c:url value="/files/faq" var="faq" />
					<a href="${faq}">FAQ</a></li> 
					
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><c:url value="/login.jsp" var="login" />
					<a href="${login}"><span class="glyphicon glyphicon-log-in"></span>
							Login</a></li>
				</ul>
			</div>
		</div>
	</nav>
 </c:when>
		
 <c:when test="${loginAdmin == '관리자'}">
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<c:url value="/index.jsp" var="home" />
				<a class="navbar-brand" href="${home}">
				<img src="${pageContext.request.contextPath}/images/logo.jpg" alt="logo" style=width:100px;></a>
			</div>
			
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><c:url value="/" var="intro" />
					<a href="${intro}">ABOUT</a></li> 
					
					<li><c:url value="/files/upproc" var="menu" />
					<a href="${menu}">MENU</a></li>
													
					<li><c:url value="/files/faqup" var="faq" />
					<a href="${faq}">ADD FAQ</a></li>
					 
					<li><c:url value="/files/daoup" var="file" />
					<a href="${file}">ADD MENU</a></li> 
				
					<li><c:url value="/daolist.do" var="list" />
					<a href="${list}">USER LIST</a></li>
					
					<li><c:url value="/adfinished" var="order" />
					<a href="${order}">ORDER LIST</a></li>  
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li>
					<c:if test="${loginAdmin == '관리자'}">
			<c:url value="/logout" var="logout" />
			<a href="${logout}">관리자 : ${loginUser}님
			<span class="glyphicon glyphicon-log-in"></span>
			Logout</a>
					</c:if>
					</li>
				</ul>
			</div>
		</div>
  	</nav> 
</c:when>
<c:when test="${loginUser != null}">
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<c:url value="/index.jsp" var="home" />
				<a class="navbar-brand" href="${home}">
				<img src="${pageContext.request.contextPath}/images/logo.jpg" alt="logo" style=width:100px;></a>
			</div>
			
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
				
				<li><c:url value="/" var="intro" />
					<a href="${intro}">ABOUT</a></li> 
					
					<li><c:url value="/files/upproc" var="menu" />
					<a href="${menu}">MENU</a></li>
													
					<li><c:url value="/files/faq" var="faq" />
					<a href="${faq}">FAQ</a></li>
					
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><c:if test="${loginUser != null}">
			<c:url value="/logout" var="logout" />
			<a href="${logout}">${loginUser}님 반갑습니다!　<span class="glyphicon glyphicon-log-in"></span>
							 Logout</a></c:if></li>
			<li><c:url value="/login" var="mypage" />
			<a href="${mypage}"><span class="glyphicon glyphicon-user"></span> My Starbucks</a></li>
        	<li><c:url value="/files/add" var="cart" />
        	<a href="${cart}"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
				</ul>
			</div>
		</div>
		</nav> 
		</c:when>
		  </c:choose>	
			 
	