
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
<title>Delete Customer</title>
</head>
<body>
    <div align="center">
        <h2>Delete Item from Cart</h2>
        <form:form action="delete" method="post" modelAttribute="dlttsk">
            <table border="0" cellpadding="5">
                <tr>
                    <td>Id: </td>
                    <td>${dlttsk.id}
                        <form:hidden path="id"/>
                    </td>
                </tr>    
                <tr>
                    <td>Name: </td>
                    <td>${dlttsk.name}
                        <form:hidden path="name"/>
                    </td>
                </tr>     
                <tr>
                    <td>Category: </td>
                    <td>${dlttsk.category}
                        <form:hidden path="category"/>
                    </td>
                </tr>     
                <tr>
                    <td>Condition: </td>
                    <td>${dlttsk.pcondition}
                        <form:hidden path="pcondition"/>
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
                    <td>${dlttsk.price}
                        <form:hidden path="price"/>
                    </td>
                </tr>     
                <tr>
                    <td>Quantity: </td>
                    <td>${dlttsk.quantity}
                        <form:hidden path="price"/>
                    </td>
                </tr>    
    
                
                <tr>
                    <td colspan="2"><input type="submit" class="btn btn-danger" value="Remove"></td>
                </tr>                    
            </table>
        </form:form>
    </div>
</body>
</html>