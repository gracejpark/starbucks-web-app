<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<style>

#login .container #login-row #login-column #login-box {
  margin-top: 80px;
  max-width: 600px;
  height: 320px;
  border: 1px solid #9C9C9C;
  background-color: #EAEAEA;
  float: left; 
  position: relative;
  left: 300;
}
#login .container #login-row #login-column #login-box #login-form {
  padding: 20px;
}
#login .container #login-row #login-column #login-box #login-form #register-link {
  margin-top: -85px;
}
    </style>
    
<jsp:include page="/top.jsp"></jsp:include>


    <div id="login">
    <br><br><br>
        <h3 class="text-center pt-5" style="color:017143;">Sign in or create an account</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="admin/login" method="post" name="frm">
                            <h3 class="text-center" style="color:017143;">Login</h3>
                            <div class="form-group">
                                <label for="username" class="text-success">Username:</label><br>
                                <input type="text" name="s_id" id="username" class="form-control" placeholder="Enter Username">
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-success">Password:</label><br>
                                <input type="password" name="s_pw" id="password" class="form-control" placeholder="Enter Password">
                            </div>
                            <div class="form-group">
                                <label for="remember-me" class="text-success"><span>Remember me</span> <span><input id="remember-me" name="remember-me" type="checkbox"></span></label><br>
                                <input type="submit" name="submit" id="btnSend" class="btn btn-success btn-md" value="submit">
                            </div>
                            <div id="register-link" class="text-right">
                                <a href="daotest.do" class="text-success">Register here</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div><br>
    <br>
    <br>

	
<jsp:include page="/bottom.jsp"></jsp:include>