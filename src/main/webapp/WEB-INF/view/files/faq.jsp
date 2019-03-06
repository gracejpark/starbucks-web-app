<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'
	integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ'
	crossorigin='anonymous'>
 <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>



<jsp:include page="/top.jsp"></jsp:include>

<style>

ul{
float: right;
}

.pointer{
cursor: pointer;
color:017143;
font-family:"Nanum Gothic", sans-serif;
font-weight:bold;
}

.reply{
font-family:"Nanum Gothic", sans-serif;
color:#808080;
}

</style>

<div class="container">
	<br>
	<h2>Customer Service & Ideas</h2>
	<c:url value="/" var="home" />
	<nav class="navbar navbar-light bg-light">
		<h4>FAQ</h4>
		<h5>자주하는 질문을 모아놓았습니다. 궁금하신 내용을 검색해 주세요</h5>
		<form class="form-inline" action="${home}boardSearch" method="get">
			<input class="form-control mr-sm-2" type="text"
				placeholder="검색어를 입력하세요" aria-label="Search" name="mybSearch">
			<button type="submit" class="btn btn-success" style="background-color:017143; border-color:017143;">
				<span class="glyphicon glyphicon-search"></span> Search
			</button>
		</form>
		<br> <br>
	</nav>

<table class="table table-hover">
	<thead>
	<tr style="text-align: center;">
		<th>종류</th>
		<th>카테고리</th>
		<th style="width: 70%;">제목</th>
	</tr>
	</thead>
	<tbody>
		<c:forEach var="i" items="${faq}">
			<c:if test="${0==i.F_MARGIN}">
			<tr class="pointer">	
				<td>Q</td>
				<td>${i.F_CATE}</td>
				<td><div id="${i.F_GROUP}" onclick="btnClick(event)">${i.F_TITLE}</div></td>
				</tr>
			</c:if>
			<c:if test="${0!=i.F_MARGIN}">
			<tr id="myDiv_${i.F_GROUP}" style="display: none;" class="reply">
				<td>A</td>
				<td>${i.F_CATE}</td>
				<td><img src="${pageContext.request.contextPath}/images/next.png">&nbsp;${i.F_TITLE}</td>
			</tr>
			</c:if>
		</c:forEach>
		</tbody>
	</table>
	
	<!-- 페이지 -->
	     <fmt:parseNumber value="${page.endn}" var="endn" />
         <fmt:parseNumber value="${page.lstbnum}" var="lstbnum" />
      	<ul class="pagination justify-content-center" >
            <li class="page-item"><a class="page-link"
               href="faq?pg=1&bEa=${page.bEa}">처음</a></li>
            <c:if test="${(page.stn-1) <= 0}">
               <li class="page-item"><a class="page-link"
                  href="faq?pg=1&bEa=${page.bEa}">◀</a></li>
            </c:if>
            <c:if test="${(page.stn-1) > 0}">
               <li class="page-item"><a class="page-link"
                  href="faq?pg=${page.stn-1}&bEa=${page.bEa}">◀</a></li>
            </c:if>
            <c:if test="${ endn>=lstbnum }">
               <c:forEach var="i" begin="${page.stn}" end="${lstbnum}">
                  <li class="page-item"><a class="page-link"
                     href="faq?pg=${i}&bEa=${page.bEa}">${i}</a></li>
               </c:forEach>
            </c:if>
            <c:if test="${ endn<lstbnum }">
               <c:forEach var="i" begin="${page.stn}" end="${endn}">
                  <li class="page-item"><a class="page-link"
                     href="faq?pg=${i}&bEa=${page.bEa}">${i}</a></li>
               </c:forEach>
            </c:if>
            <c:if test="${ endn>=lstbnum }">
               <li class="page-item"><a class="page-link"
                  href="faq?pg=${lstbnum}&bEa=${page.bEa}">▶</a></li>
            </c:if>
            <c:if test="${endn<lstbnum}">
               <li class="page-item"><a class="page-link"
                  href="faq?pg=${endn+1}&bEa=${page.bEa}">▶</a></li>
            </c:if>
            <li class="page-item"><a class="page-link"
               href="faq?pg=${lstbnum}&bEa=${page.bEa}">맨끝</a></li>
         </ul>
</div>

<script type="text/javascript">
	function btnClick(ev) {
		var obj = document.getElementById("myDiv_" + ev.target.id);
		if (obj.style.display == "none") {
			obj.style = "";
		} else if (obj.style.display == "") {
			obj.style = "display:none;";
		}
	}
</script>







<jsp:include page="/bottom.jsp"></jsp:include>