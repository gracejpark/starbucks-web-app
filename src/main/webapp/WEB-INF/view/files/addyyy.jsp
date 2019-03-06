<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

#mySidenav a {
  position: absolute;
  left: -80px;
  transition: 0.3s;
  padding: 15px;
  width: 100px;
  text-decoration: none;
  font-size: 20px;
  color: white;
  border-radius: 0 5px 5px 0;
}

#mySidenav a:hover {
  left: 0;
}

#about {
  top: 320px;
  background-color: #4CAF50;
}

#blog {
  top: 380px;
  background-color: #2196F3;
}

#projects {
  top: 440px;
  background-color: #f44336;
}

#contact {
  top: 500px;
  background-color: #555
}
</style>
<jsp:include page="/top.jsp"></jsp:include>


<div class="container">
	<c:url value="/" var="home" />
	<nav class="navbar navbar-light bg-light">
	<h2>Starbucks Menu</h2>
	<h5>원하시는 메뉴를 입력하신 후 검색 버튼을 클릭하세요.</h5>
		<form class="form-inline" action="${home}boardSearch" method="get">
			<input class="form-control mr-sm-2" type="text" placeholder="예>카푸치노"
				aria-label="Search" name="mySearch">
			<button type="submit" class="btn btn-success">
				<span class="glyphicon glyphicon-search"></span> Search
			</button>
		</form>
		<br> <br>
	</nav>

<div class="w3-bar w3-light-grey">
	 <div class="w3-bar-item"> All Items </div> </div>

	<c:forEach var="i" items="${list}">
		<div class="col-sm-3">
		<c:if test="${i.CATECODE!='food'}">
			<a href="${home}item?g=${i.GDSNUM}"><img
				src="${pageContext.request.contextPath}/images/${i.GDSIMG}"
				style="width: 100%"></a>
			<div>
				<ul class= "w3-ul w3-tiny w3-center">
					<b><li>${i.GDSNAME}</li></b>
					<li>${i.GDSENAME}</li>
					<li>${i.GDSDES}</li>
					<li>카테고리:${i.CATECODE}</li>
					<li>칼로리:${i.GDSKCAL}</li>
					<li>카페인:${i.GDSCAFFEIN}</li>
					<li>지방:${i.GDSFAT}</li>
					<li>당류:${i.GDSSUGAR}</li>
				</ul>
			</div>
		</c:if>
		</div>
	</c:forEach>
	</div>
	

<jsp:include page="/bottom.jsp"></jsp:include>