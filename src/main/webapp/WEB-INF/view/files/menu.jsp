<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<jsp:include page="/top.jsp"></jsp:include>

<style>
.form-group{ float:right;}
</style>

<!-- 로그인 안했을때 메뉴화면 -->
<div class="container">
	<br>
	<h2>Starbucks Menu</h2>
	<c:url value="/" var="home" />
	<nav class="navbar navbar-light bg-light">
	<h4>All Drinks</h4>
	<h5>원하시는 메뉴를 입력하신 후 검색 버튼을 클릭하세요.</h5>
			<form class="form-inline" action="${home}menuSearch" method="get">
			<input class="form-control mr-sm-2" type="text" placeholder="예> 카푸치노"
				aria-label="Search" name="mySearch">
			<button type="submit" class="btn btn-success" style="background-color:017143; border-color:017143;">
				<span class="glyphicon glyphicon-search"></span> Search
			</button> </form>
		<div class="form-group">
      <select class="form-control" onChange="location.href=this.value">
        <option>상세분류</option>
         <c:url value="espresso" var="Espresso"/>
         <c:url value="cold" var="Cold"/>
         <c:url value="blended" var="Blended"/>
         <c:url value="others" var="Others"/>
        <option value="${Espresso}">Espresso</option>
        <option value="${Cold}">Cold</option>
        <option value="${Blended}">Blended </option>
        <option value="${Others}">Others</option>
      </select>
          </div>
		<br><br>
	</nav>

	<c:forEach var="i" items="${list}">
		<div class="col-sm-3">
		<c:if test="${i.CATECODE!='all'}">
			<a href="${home}item?g=${i.GDSNUM}"><img
				src="${pageContext.request.contextPath}/images/${i.GDSIMG}"
				style="width: 100%"></a>
			<div>
				<ul class="w3-ul w3-center">
					<li>${i.GDSNAME}</li>
				</ul>
			</div><br><br>
		</c:if>
		</div>
	</c:forEach>
	</div>

<jsp:include page="/bottom.jsp"></jsp:include>