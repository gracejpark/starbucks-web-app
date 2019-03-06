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



<c:url value="/files/upproc" var="upproc"></c:url>


<div class="container">
	<!--  <h2>상품등록</h2>
	<form action="${upproc}" method="post" enctype="multipart/form-data">
			
			<div><label>한글이름 : <input type="text" name="i_title" required="required"
				placeholder="예>카페 아메리카노" class="form-control"></label></div>
			<div><label>영어이름 : <input type="text" name="gdsEname"
				required="required" placeholder="예>Cafe Americano" class="form-control"></label></div>
			<div><label>1차분류 : <select name="cateCode">
					<option value="drink">음료</option>
					<option value="food">푸드</option>

			</select></label></div>
			<div><label>설명 : <input type="textarea" name="gdsDes" required="required"
				class="form-control"></label></div>
			<div><label>칼로리 : <input type="text" name="gdskcal" required="required"
				class="form-control"></label></div>
			<div><label>당류 : <input type="text" name="gdssugar" required="required"
				class="form-control"></label></div>
			<div><label>지방 : <input type="text" name="gdsfat" required="required"
				class="form-control"></label></div>
			<div><label>카페인 : <input type="text" name="gdscaffein"
				required="required" class="form-control"></label></div>
			<div>파일 : <input type="file" name="i_pic" required="required" ><br>
			<label><button>전송</button></label></div>
			</form>
			-->
	<div id="signupbox" style="margin-top: 50px"
		class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
		<div class="panel panel-info">
			<div class="panel-heading">
				<div class="panel-title">상품 등록</div>
				<div
					style="float: right; font-size: 85%; position: relative; top: -10px">
				Admin
				</div>
			</div>
			<div class="panel-body">
				<c:url value="upproc" var="upproc" />
				<form action="${upproc}" method="post" enctype="multipart/form-data">
					<input type='hidden' name='csrfmiddlewaretoken'
						value='XFe2rTYl9WOpV8U6X5CfbIuOZOELJ97S' /> <input type='hidden'
						name='csrfmiddlewaretoken'
						value='XFe2rTYl9WOpV8U6X5CfbIuOZOELJ97S' />


					<div id="div_id_username" class="form-group required">
						<label for="id_username"
							class="control-label col-md-4  requiredField"> 한글이름 </label>
						<div class="controls col-md-8 ">
							<input class="input-md  textinput textInput form-control"
								id="id_username" maxlength="30" name="i_title"
								placeholder="카페 아메리카노" style="margin-bottom: 10px"
								type="text" />
						</div>
					</div>
					<div id="div_id_email" class="form-group required">
						<label for="id_email"
							class="control-label col-md-4  requiredField"> 영어이름 </label>
						<div class="controls col-md-8 ">
							<input class="input-md emailinput form-control" id="id_email"
								name="gdsEname" placeholder="Cafe Americano"
								style="margin-bottom: 10px" type="text" />
						</div>
					</div>


					<div id="div_id_name" class="form-group required">
						<label for="id_name" class="control-label col-md-4  requiredField">
							설명 </label>
						<div class="controls col-md-8 ">
							<input class="input-md textinput textInput form-control"
								id="id_name" name="gdsDes"
								style="margin-bottom: 10px" type="text" />
						</div>
					</div>

					<div id="div_id_company" class="form-group required">
						<label for="id_company"
							class="control-label col-md-4  requiredField"> 칼로리 </label>
						<div class="controls col-md-8 ">
							<input class="input-md textinput textInput form-control"
								id="id_company" name="gdskcal" 
								style="margin-bottom: 10px" type="text" />
						</div>
					</div>
					<div id="div_id_catagory" class="form-group required">
						<label for="id_catagory"
							class="control-label col-md-4  requiredField"> 카페인 </label>
						<div class="controls col-md-8 ">
							<input class="input-md textinput textInput form-control"
								id="id_catagory" name="gdscaffein" 
								style="margin-bottom: 10px" type="text" />
						</div>
					</div>
					<div id="div_id_number" class="form-group required">
						<label for="id_number"
							class="control-label col-md-4  requiredField"> 지방 </label>
						<div class="controls col-md-8 ">
							<input class="input-md textinput textInput form-control"
								id="id_number" name="gdsfat" 
								style="margin-bottom: 10px" type="text" />
						</div>
					</div>
					<div id="div_id_location" class="form-group required">
						<label for="id_location"
							class="control-label col-md-4  requiredField"> 당류 </label>
						<div class="controls col-md-8 ">
							<input class="input-md textinput textInput form-control"
								id="id_location" name="gdssugar"
								style="margin-bottom: 10px"
								type="text" />
						</div>
					</div>
					<div id="div_id_location" class="form-group required">
						<label for="id_location"
							class="control-label col-md-4  requiredField"> 단가 </label>
						<div class="controls col-md-8 ">
							<input class="input-md textinput textInput form-control"
								id="id_location" name="gdsprice"
								style="margin-bottom: 10px"
								type="text" />
						</div>
					</div>
					<div id="div_id_location" class="form-group required">
						<label for="id_location"
							class="control-label col-md-4  requiredField"> 분류코드 </label>
						<div class="controls col-md-8 ">
							<input name="cateCode" 
								style="margin-bottom: 10px"
								type="checkbox" value="Cold"/>Cold &nbsp;
							<input name="cateCode" 
								style="margin-bottom: 10px"
								type="checkbox" value="Espresso"/>Espresso &nbsp;
							<input name="cateCode" 
								style="margin-bottom: 10px"
								type="checkbox" value="Blended"/>Blended &nbsp;
							<input name="cateCode" 
								style="margin-bottom: 10px"
								type="checkbox" value="Others"/>Others
						</div>
					</div>
					<div id="div_id_location" class="form-group required">
						<label for="id_location"
							class="control-label col-md-4  requiredField"> 파일 </label>
						<div class="controls col-md-8 ">
							<input name="i_pic" 
								style="margin-bottom: 10px" type="file" />
						</div>
					</div>

					<div class="form-group">
						<div class="aab controls col-md-4 "></div>
						<div class="controls col-md-8 ">
							<input type="submit" value="Add a product"
								class="btn btn btn-primary" id="button-id-signup" />

						</div>
					</div>

				</form>


			</div>
		</div>
	</div>
</div>


<jsp:include page="/bottom.jsp"></jsp:include>