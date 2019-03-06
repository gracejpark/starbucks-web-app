
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style>
  .bg-1 { 
    background-color: #1abc9c;
    color: #ffffff;
  }
  .bg-2 { 
    background-color: #474e5d;
    color: #ffffff;
  }
  .bg-3 { 
    background-color: #ffffff;
    color: #555555;
  }
  .container-fluid {
    padding-top: 70px;
    padding-bottom: 70px;
  }
  </style>
    
<jsp:include page="/top.jsp"></jsp:include>





<div class="container-fluid bg-1 text-center">
  <h3>${loginUser}님 반갑습니다</h3>
  <img src="${pageContext.request.contextPath}/images/img_avatar.jpg" class="img-circle" alt="Bird" width="290" height="290">
  <h3>3초후 자동으로 페이지가 넘어갑니다</h3>
</div>

<div class="container-fluid bg-2 text-center">
  <h3></h3>
  <p></p>
</div>

<div class="container-fluid bg-3 text-center">
  <h3></h3>
  <p></p>
</div>

</body>
</html>	
		<h2></h2>
		<h3></h3>
	

<script language="JavaScript">
 setTimeout("move()",3000);
 function move(){
 location.href="/ydao/index.jsp"}

</script>



<jsp:include page="/bottom.jsp"></jsp:include>