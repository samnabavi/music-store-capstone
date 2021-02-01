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
.hidden {
	display: none;
}
</style>
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
            <a class="navbar-brand" href="/home">Home</a>
           
            <ul class="navbar-nav">
                <!-- <li class="nav-item">
                    <a class="nav-link" href="#">Home</a>
                </li> -->
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Menu</a>
                    <div class="dropdown-menu">
                        <a href="about.html" class="dropdown-item">Pizza</a>
                        <a href="about.html" class="dropdown-item">Desserts</a>
                    </div>
                </li>
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

		<h1 style="color: blue">Products</h1>

		<div class="container">
		<div>
		<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">
		</div>
			<table id="myTable" class="table table-striped">
				
				  <thead>
					<tr class="header">
						<th>ID</th>
						<th>NAME</th>
						<th>Category</th>
						<th>Condition</th>
						<th>IMAGE</th>
						<th>PRICE</th>
					</tr>
				</thead>
				 <tbody>
					<c:forEach items="${tasks}" var="tsks">
						<tr>
							<td>${tsks.id}</td>
							<td>${tsks.name}</td>
							<td>${tsks.category}</td>
							<td>${tsks.pcondition}</td>
							<td><img src="${tsks.imageLink}.jpg" width="40" height="40"></td>
							<td>${tsks.price}</td>
							<td><a type="button" class="btn btn-success" href="/productlistall/${tsks.id}">View</a></td>
							

							<!--<td><a type="button" class="btn btn-success" href="/deletingtsk/${tsks.id}">Delete</a></td>-->
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		
		</div>
		
	<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}		
    </script>
    <script>
    
    $('#sel1').on('change', function() {
  $("#myTable tbody tr").removeClass('hidden');
  $("#myTable tbody tr:gt("+(this.value-1)+")").addClass('hidden');
});
    
    
    </script>	
		</br>
		<!-- 
		<div>
			<form action="/cart" id="linkId">
				<input type="submit" class="btn btn-danger" value="Cart" />
			</form>
		</div>
		
		<div>
			<form action="/addtsk" id="linkId">
				<input type="submit" class="btn btn-danger" value="Add a New Task" />
			</form>
		</div>
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
		</div>
		 -->
	</div>
</body>
</html>