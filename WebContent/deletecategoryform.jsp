<%@page import="com.pharmacystore.pojo.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.pharmacystore.daoimpl.CategoryDaoImpl"%>
<%@page import="com.pharmacystore.dao.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" 
   uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
   <head>
      <!-- Favicons -->
      <link rel="icon" type="image/png" href="Homepage/assets/img/favicon.png">
      <meta charset="ISO-8859-1">
      <title>Delete Category</title>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.29.2/sweetalert2.all.min.js"></script>    
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
         <c:if test="${param.msg == 'deleteCatFail'}">
            <c:set var="message" value="Category Deletion Failure !!!"/>
         </c:if>
         <c:if test="${not empty message}">
            <script>
               if ("${message}" !== "") {
                  	swal({
                  	    title: 'Message From Server',
                          text: '${message.trim()}',
                          icon: 'error'
                   });
               }
            </script>
         </c:if>
         <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-6">
               <form action="deletecategory" method="post" id="fileForm" role="form" style="padding-top:20%; padding-left:30%;">
                  <fieldset>
                     <legend class="text-center">All Fields</legend>
                     <div class="form-group">
                        <label for="categoryid"><span class="req">* </span> Select Category </label>
                        <select class="form-control" id="categoryName" name="categoryid">
                           <c:forEach items="${applicationScope.CATLIST}"
                              var="category">
                              <option value='<c:out value="${category.categoryId}"></c:out>'>
                                 <c:out value="${category.categoryName}"></c:out>
                              </option>
                           </c:forEach>
                        </select>
                     </div>
                     <div class="form-group">
                        <input class="btn btn-success" type="submit" name="submit_reg" value="Delete Category">
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