<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<jsp:include page="/top.jsp"></jsp:include>


<div class="container">
<c:url value="/files/faq" var="faq" />
	<div id="signupbox" style="margin-top: 50px"
		class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
		<div class="panel panel-info">
			<div class="panel-heading">
				<div class="panel-title">FAQ 등록</div>
				<div
					style="float: right; font-size: 85%; position: relative; top: -10px">
				Admin
				</div>
			</div>
			<div class="panel-body">
				
				<form action="${faq}" method="post" enctype="multipart/form-data">
					<input type='hidden' name='csrfmiddlewaretoken'
						value='XFe2rTYl9WOpV8U6X5CfbIuOZOELJ97S' /> <input type='hidden'
						name='csrfmiddlewaretoken'
						value='XFe2rTYl9WOpV8U6X5CfbIuOZOELJ97S' />

					<div class="form-group required">
						<label for="id"
							class="control-label col-md-4  requiredField"> 카테고리 </label>
						<div class="controls col-md-8 ">
							<input class="input-md emailinput form-control" 
								name="f_cate" placeholder="[사이렌 오더]"
								style="margin-bottom: 10px" type="text" />
						</div>
					</div>

					<div class="form-group required">
						<label for="id_name" class="control-label col-md-4  requiredField">
							제목 </label>
						<div class="controls col-md-8 ">
							<input class="input-md textinput textInput form-control"
								name="f_title" placeholder="내용"
								style="margin-bottom: 10px" type="text" />
						</div>
					</div>
					
			<div class="form-group required">
						<label for="id"
							class="control-label col-md-4  requiredField"> 댓글 카테고리 </label>
						<div class="controls col-md-8 ">
							<input class="input-md emailinput form-control" 
								name="f_cate1" 
								style="margin-bottom: 10px" type="text" />
						</div>
					</div>
						<div class="form-group required">
						<label for="id"
							class="control-label col-md-4  requiredField"> 댓글 내용 </label>
						<div class="controls col-md-8 ">
							<input class="input-md emailinput form-control" 
								name="f_title1" 
								style="margin-bottom: 10px" type="text" />
						</div>
					</div>
		

					<div class="form-group">
						<div class="aab controls col-md-4 "></div>
						<div class="controls col-md-8 ">
							<input type="submit" value="Add a FAQ"
								class="btn btn btn-primary" id="button-id-signup" />

						</div>
					</div>

				</form>


			</div>
		</div>
	</div>
</div>


<jsp:include page="/bottom.jsp"></jsp:include>