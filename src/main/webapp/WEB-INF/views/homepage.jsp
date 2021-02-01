<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
div{
   margin-top:10px;
   margin-bottom:10px;
}
</style>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
    crossorigin="anonymous">
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
  <div class="container" align="center">
   <img class="d-block img-fluid" src="https://3.imimg.com/data3/UK/JG/MY-9213341/square-gramophone-250x250.jpg">
      </div>


  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
    crossorigin="anonymous"></script>
<div align="center">
	<div>
	<form action="/registration">
    	<input type="submit" class="btn btn-danger" value="Register" />
	</form>
	</div>
	<div>
	<form action="/login">
    	<input type="submit" class="btn btn-danger" value="Login" />
	</form>
	</div>
	<div>
	<form action="/productlist">
    	<input type="submit" class="btn btn-danger" value="Products" />
	</form>
	</div>
</div>
</body>
</html>