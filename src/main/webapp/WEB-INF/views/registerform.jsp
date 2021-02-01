<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<style>
div{
   margin-bottom:10px;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
    <!--####################START HERE######################-->

    <nav class="navbar navbar-expand-sm navbar-dark bg-dark mb-3">
        <div class="container">
            <a class="navbar-brand" href="/home">Home</a>
           
            <ul class="navbar-nav">
                <!-- <li class="nav-item">
                    <a class="nav-link" href="#">Home</a>
                </li> -->
                
                <li class="nav-item">
                    <a class="nav-link" href="/registration">Register</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/login">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/productlistall">Products</a>
                </li>
            </ul>
        </div>
    </nav>
  </div>
 <header>
    <h1 class="display-3 text-center my-4">MUSIC STORE</h1>
    <div class="container">
     
    </div>
    <hr>
  </header>
<div align="center">
<h1> Register new User</h1>

	<form:form modelAttribute="reg">
		<form:errors path="" element="div"/>
		<div>
			<from:label path="name">Name</from:label>
			<form:input path="name"/>
			<form:errors path="name" />
		</div>
		
		<div>
			<from:label path="email">Email</from:label>
			<form:input path="email"/>
			<form:errors path="email" />
		</div>
		
		<div>
			<from:label path="phone">Phone</from:label>
			<form:input path="phone"/>
			<form:errors path="phone" />
		</div>
		
		<div>
			<from:label path="username">Username</from:label>
			<form:input path="username"/>
			<form:errors path="username" />
		</div>
		
		<div>
			<from:label path="password">Password</from:label>
			<form:input path="password" type="password"/>
			<form:errors path="password" />
		</div>
		<div>
			<from:label path="address">Address</from:label>
			<form:input path="address" />
			<form:errors path="address" />
		</div>
		<div>
			<input type="submit" class="btn btn-danger" value="Sign Up"/>
		</div>
		
		</form:form>
</div>
</body>
</html>