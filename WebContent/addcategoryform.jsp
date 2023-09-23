<%@page import="com.pharmacystore.pojo.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.pharmacystore.daoimpl.CategoryDaoImpl"%>
<%@page import="com.pharmacystore.dao.CategoryDao"%>
<%@ page import="java.util.concurrent.TimeUnit" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 
   prefix = "c" %>	
<!DOCTYPE html>
<html>
   <head>
      <meta charset="ISO-8859-1">
      <title>ADD CATEGORY</title>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.29.2/sweetalert2.all.min.js"></script>    
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.29.2/sweetalert2.all.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
      <!-- AJAX -->
      <script type="text/javascript">
         var request;
         
         function senddata(){
         	var catName = document.getElementById("categoryName").value;
         	var pageurl = "checkCat.jsp?categoryName="+catName;
         	
         	if(window.XMLHttpRequest){
         		request=new XMLHttpRequest();
         	}
         	else if(window.ActiveXObject){
         		request=new ActiveXObject("MicrosoftXMLTTP");
         	}
         	
         	try{
         		request.onreadystatechange = recievedata;
         		request.open("GET",  pageurl, true);
         		request.send();
         	}catch(e){
         		alert("Unable to connect to Server");
         	}
         }
         
         function recievedata() {
             
             if (request.readyState == 4) {
             	if (request.readyState == 4) {
         			var val = request.responseText;
         			if (val.trim() == "success") {
         				alert("Category added successfully!!");
         				//window.location.reload(true);
         			} else {
         				alert("Failed to add category!!");
         			}
         		}
             }
         }	
      </script>   
      <!-- AJAX end -->
   </head>
   <style>
      .container {
      color:black;
      }
      #nav{
      background-color:#1977cc;
      color:white;
      }
   </style>
   <body>
      <%
         if(!session.isNew() || session.getAttribute("ADMIN") != null){
         %>
      <nav class="navbar navbar-default" id="nav">
         <div class="container-fluid">
            <div class="navbar-header">
               <a href="adminhome.jsp" class="navbar-brand" id="nav"> PharmaSage </a>
            </div>
            <ul class="nav navbar-nav navbar-right">
               <li><a href="logoutadmin.jsp" id="nav"><span class="glyphicon glyphicon-log-out" id="nav"></span> Logout</a></li>
            </ul>
         </div>
      </nav>
      <div class="container">
         <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-6">
               <form action="" method="post" id="fileForm" role="form" style="padding-top:20%; padding-left:30%;">
                  <fieldset>
                     <legend class="text-center">All Fields <span class="req"></span></legend>
                     <div class="form-group">
                        <label for="categoryName"><span class="req">* </span> Category Name </label>
                        <input required name="categoryName" type="text" class="form-control inputpass" 
                           minlength="4" maxlength="30"  id="categoryName"/>
                        <input style="margin-top:10px;" class="btn btn-success" type="submit" name="submit_reg" value="Submit Category" onclick ="senddata()">
                     </div>
                  </fieldset>
               </form>
            </div>
         </div>
      </div>
      <% 
         }else
         {
         %>
      <p style="color:red">You need to login first to add category</p>
      <jsp:include page="adminlogin.jsp"></jsp:include>
      <% 
         }
         %>
   </body>
</html>