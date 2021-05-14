<%@page import="model.Product"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     
  
	<!DOCTYPE html> 
	<html> 
	<head> <meta charset="ISO-8859-1">
	 <title>Products Management</title> 
	 <link rel="stylesheet" href="Views/bootstrap.min.css"> 
<script src="Components/jquery-3.2.1.min.js">
</script> <script src="/PAF_Product/WebContent/Components/product.js"></script>
	</head>
	<style>
* {
  box-sizing: border-box;
}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 10px 10px 10px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}
input[type=button] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=submit,]:hover {
  background-color: #45a049;
}
input[type=button,]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
  width:80%;
}

.col-25 {
  float: left;
  width: 20%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 40%;
  margin-top: 4px;
}

.row:after {
  content: "";
  display: table;
  clear: both;
}


@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
</style>
	 <body> 
	
 
 <h1 style="align:center">Products Management</h1> 
 <div class="container">
  <form id="formItem" name="formItem" method="post" action="products.jsp">
    <div class="row">
      <div class="col-25">
        <label for="fname">Products code:</label>
      </div>
      <div class="col-75">
       
         <input name="productCode" type="text"  placeholder="Write code.." class="form-control form-control-sm" >
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="lname">Products name:</label>
      </div>
      <div class="col-75">
         <input name="productName" type="text"  placeholder="Write product name.."  class="form-control form-control-sm"> 
      </div>
    </div>
     <div class="row">
      <div class="col-25">
        <label for="lname">Products price: </label>
      </div>
      <div class="col-75">
        <input name="productPrice" type="text"  placeholder="Write price.." class="form-control form-control-sm">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="lname">researcher Name: </label>
      </div>
      <div class="col-75">
         <input name ="researcherName" type="text"  placeholder="Write your name.." class="form-control form-control-sm">
      </div>
    </div>
    
    <div class="row">
      <div class="col-25">
        <label for="subject">Products description: </label>
      </div>
      <div class="col-75">
        <textarea id="subject" name="productDesc" placeholder="Write something.." style="height:100px" class="form-control form-control-sm"></textarea>
      </div>
    </div>
    <div class="row">
      
      <input id="btnSave" name="btnSave" type="button" value="Save"      class="btn btn-primary">   
  <input type="hidden" id="hidProductIDSave"         name="hidProductIDSave" value=""> 
      
      
     <!--   <input id="btnSave" name="btnSave" type="submit" value="Save"      class="btn btn-primary"> 
       <input type="hidden" id="hidProductIDSave" name="hidProductIDSave" value=""> -->
    </div>
  </form>
</div>
 
   <div id="alertSuccess" class="alert alert-success"></div>  
 
 <div id="alertError" class="alert alert-danger"></div> 
 
 <br> 
  <div id="divItemsGrid">  
 
  
   <%
   	Product productObj = new Product(); 
         
         out.print(productObj.readProduct());
  
         
   %> </div>
 
  </body> 
  </html>