<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
img {
float:left;
display:inline-block;
padding-right: 30px;
}

table,th, td {
   height: 62px;

}
#head{
border-bottom:3px solid black;
}
#rt{
float:right;}
#bb{
border-bottom:1px solid #ddd;}
#dot{
border-right:2px dotted #ddd;
padding:3px;}
</style>
<jsp:include page="/top.jsp"></jsp:include>


<div class="container">
<br>
<c:forEach var="v" items="${view}">
<div class="w3-container" >
<div class="w3-panel w3-leftbar">
<h1>${v.CATECODE}</h1>
</div><br><br>
	
	<span><img src="${pageContext.request.contextPath}/images/${v.GDSIMG}"></span>
	<c:url value="/" var="home" />
	<form action="${home}files/add" method="post" >
	<table style="width:60% table-layout: fixed word-break:break-all;">
	<colgroup>
	<col width="25%">
	<col width="25%">
	<col width="25%">
	<col width="25%">
	</colgroup>
		<tr id="head">
		<th colspan="2" align="left"><p style="font-size:18px">${v.GDSNAME}
		<br>${v.GDSENAME}</p></th>
		<td colspan="2">
		<div id="rt"><fmt:formatNumber value="${v.GDSPRICE}" pattern="###,###,###"/>원/
		<select name="amount">
		<c:forEach begin="1" end="10" var="i">
		<option value="${i}">${i}</option>
		</c:forEach>
		</select>개	</div>
		</td>
		</tr>
	<tr id="bb">
		<td colspan="4">${v.GDSDES}</td>
	</tr>
	<tr id="bb">
		<th colspan="2">제품 영양 정보</th>
		<td colspan="2" align="right">Tall(톨) / 355ml (12 fl oz)</td>
	</tr>
	<tr>
		<td>1회 제공량(kcal)</td>
		<td align="right" id="dot">${v.GDSKCAL}&nbsp;&nbsp;</td>
		<td>당류(g)</td>
		<td align="right">${v.GDSSUGAR}</td>
	</tr>
	<tr>
		<td>포화지방(g)</td>
		<td align="right" id="dot">${v.GDSFAT}&nbsp;&nbsp;</td>
		<td>카페인(mg)</td>
		<td align="right">${v.GDSCAFFEIN}</td>
	</tr>
	<tr>
	<td colspan="4" align="right"><input type="submit" value="장바구니" class="btn btn-success btn-md" style="background-color:017143; border-color:017143;">
	<button type="button" class="btn cancel" onclick="javascript:history.back (-1)">목록</button></td>
	</tr>
	</table>
	<input type="hidden" name="productImg" value="${v.GDSIMG}">
	<input type="hidden" name="price" value="${v.GDSPRICE}">
	<input type="hidden" name="state" value="">
	<input class="form-control" type="hidden" name="productId" value="${v.GDSNAME}">
	</form>
</div>
</c:forEach><br>
 <div class="jumbotron">
 <br>
 </div>
</div>

<jsp:include page="/bottom.jsp"></jsp:include>
