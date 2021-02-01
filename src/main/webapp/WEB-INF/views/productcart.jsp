<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<style>
div {
	margin-bottom: 10px;
}
</style>


<title>Insert title here</title>
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

		<h1 style="color: blue">Add to Cart</h1>
<div align="center">
        <!-- <form:form action="productcart/{id}" method="post" modelAttribute="prd" > -->
            <table border="0" cellpadding="5">
                <tr>
                    <td>Id: </td>
                    <td>${prd.id}
                        <form:hidden path="id"/>
                    </td>
                </tr>    
                <tr>
                    <td>Name: </td>
                    <td>${prd.name}
                        <form:hidden path="name"/>
                    </td>
                </tr>     
                <tr>
                    <td>Category: </td>
                    <td>${prd.category}
                        <form:hidden path="category"/>
                    </td>
                </tr>     
                <tr>
                    <td>Condition: </td>
                    <td>${prd.pcondition}
                        <form:hidden path="condition"/>
                    </td>
                </tr>    
                
                <tr>
                    <td>Image: </td>
                    <td><img src="https://media.musiciansfriend.com/is/image/MMGS7/2016-Songwriter-Progressive-Square-Shoulder-Cutaway-Dreadnought-Acoustic-Electric-Guitar-Autumn-Burst/J24255000001000-00-500x500.jpg" width="40" height="40">

                        <form:hidden path="imageLink"/>
                    </td>
                </tr>     
                
                <tr>
                    <td>Price: </td>
                    <td>${prd.price}
                        <form:hidden path="price"/>
                    </td>
                </tr>         
                <tr>
                	<td>Item added to your cart</td>
                    <!-- <td colspan="2"><input  type="submit" class="btn btn-danger" value="Add to the cart"></td> -->
                </tr>                    
            </table>
        <!-- </form:form> -->
    </div>

		
		
		</br>
		<div>
			<form action="/cart" id="linkId">
				<input type="submit" class="btn btn-danger" value="Cart" />
			</form>
		</div>
		<div>
			<form action="/productlist" id="linkId">
				<input type="submit" class="btn btn-danger" value="Products" />
			</form>
		</div><!-- 
		<div>
			<form action="/edittsk" id="linkId">
				<input type="submit" class="btn btn-danger" value="Edit a Task" />
			</form>
		</div>
		<div>
			<form action="/deletetsk" id="linkId">
				<input type="submit" class="btn btn-danger" value="Delete a Task" />
			</form>
		</div>
		<div>
			<form action="/home" id="linkId">
				<input type="submit" class="btn btn-danger" value="Log Out" />
			</form>
		</div> -->
	</div>
</body>
</html>