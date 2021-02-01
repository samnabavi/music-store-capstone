<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Customer</title>
</head>
<body>
<div class="container">
    <!--####################START HERE######################-->

    <nav class="navbar navbar-expand-sm navbar-dark bg-dark mb-3">
        <div class="container">
            <a class="navbar-brand" href="/productlist">Products</a>
           
            <ul class="navbar-nav">
                <!-- <li class="nav-item">
                    <a class="nav-link" href="#">Home</a>
                </li> -->
				<li class="nav-item">
                    <a class="nav-link" href="/cart">Cart</a>
                </li>
				
                <li class="nav-item">
                    <a class="nav-link" href="/logout">Logout</a>
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
        <h2>Edit Customer</h2>
        <form:form action="checkingout" method="post" modelAttribute="edittsk">
            <table border="0" cellpadding="5">
                <tr>
                    <td>ID: </td>
                    <td>${edittsk.id}
                        <form:hidden path="id"/>
                    </td>
                </tr>       
                <tr>
                    <td>Name: </td>
                    <td><form:input path="name" /></td>
                </tr>
     
                
                <tr>
                    <td>Email: </td>
                    <td><form:input type="email" path="email" /></td>
                </tr>
                <tr>
                    <td>Phone: </td>
                    <td><form:input path="phone" /></td>
                </tr>
                
                <tr>
                    <td>Username: </td>
                    <td><form:input path="username" /></td>
                </tr>
                <tr>
                    <td>Address: </td>
                    <td><form:input path="address" /></td>
                </tr>
                
                <tr>
                    <td colspan="2"><input type="submit" class="btn btn-danger" value="Update"></td>
                </tr>                   
            </table>
        </form:form>
    </div>
</body>
</html>