<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.form-group{
float:right;}
</style>
<jsp:include page="/top.jsp"></jsp:include>


<div class="container">
	<br>
	<h2>Starbucks Menu</h2>
	<c:url value="/" var="home" />
	<nav class="navbar navbar-light bg-light">
	<h4>Blended</h4>
	<h5>원하시는 메뉴를 입력하신 후 검색 버튼을 클릭하세요.</h5>
			<form class="form-inline" action="${home}menuSearch" method="get">
			<input class="form-control mr-sm-2" type="text" placeholder="예> 카푸치노"
				aria-label="Search" name="mySearch">
			<button type="submit" class="btn btn-success">
				<span class="glyphicon glyphicon-search"></span> Search
			</button> </form>
		<div class="form-group">
      <select class="form-control" onChange="location.href=this.value">
        <option>상세분류</option>
         <c:url value="/files/espresso" var="Espresso"/>
         <c:url value="/files/cold" var="Cold"/>
         <c:url value="/files/blended" var="Blended"/>
         <c:url value="/files/others" var="Others"/>
        <option value="${Espresso}">Espresso</option>
        <option value="${Cold}">Cold</option>
        <option value="${Blended}">Blended </option>
        <option value="${Others}">Others</option>
      </select>
          </div>
		<br><br>
	</nav>
	
	<c:forEach var="i" items="${list}">
	<c:if test="${i.CATECODE=='Blended'}">
	<div class="col-sm-3">
					<a href="${home}item?g=${i.GDSNUM}"> <img
				src="${pageContext.request.contextPath}/images/${i.GDSIMG}"
				style="width: 100%"></a>
		<div>
				<ul class="w3-ul w3-center">
					<li>${i.GDSNAME}</li>
				</ul>
			</div><br><br>
		</div>
		</c:if>
	</c:forEach>
</div>


<jsp:include page="/bottom.jsp"></jsp:include>