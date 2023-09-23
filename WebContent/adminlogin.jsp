<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 
   prefix = "c" %>
<!doctype html>
<html lang="en">
   <!-- alert -->
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.29.2/sweetalert2.all.min.js"></script>    
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <head>
      <!-- Favicons -->
      <link rel="icon" type="image/png" href="Homepage/assets/img/favicon.png">
      <title>Admin Login</title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
      <link rel="stylesheet" href="Homepage/AdminLoginRegister/css/style.css">
   </head>
   <style>
      #btnsub{
      background-color:#1997cc;
      }
   </style>
   <body class="img js-fullheight" style="background-image: url(Homepage/assets/img/pharmaimg.jpg);">
      <section class="ftco-section">
         <div class="container">
            <c:if test="${param.msg == 'loginFirst'}">
               <c:set var="message" value="You need to login first!!!"/>
            </c:if>
            <c:if test="${param.msg == 'adminLoginError'}">
               <c:set var="message" value="Invalid username or password !!!"/>
            </c:if>
            <c:if test="${param.msg == 'adminRegSuccess'}">
               <c:set var="message" value="Registration Successful !!!"/>
            </c:if>
            <c:if test="${not empty message}">
               <script>
                  if ("${message}" !== "") {
                    $(document).ready(function() {
                      if ("${message.trim()}" === "Registration Successful !!!") {
                        swal({
                          title: 'Success!',
                          text: '${message.trim()}',
                          icon: 'success'
                        });
                      } else {
                        swal({
                          title: 'Message From Server',
                          text: '${message.trim()}',
                          icon: 'error'
                        });
                      }
                    });
                  }
               </script>
            </c:if>
            <div class="row justify-content-center">
               <div class="col-md-6 text-center mb-5">
                  <h3 class="heading-section">ADMIN  LOGIN</h3>
               </div>
            </div>
            <div class="row justify-content-center">
               <div class="col-md-6 col-lg-4">
                  <div class="login-wrap p-0">
                     <form action="validateAdminLogin" class="signin-form">
                        <div class="form-group">
                           <input type="text" class="form-control" placeholder="Admin ID" 
                              id="userid" name="userid" required>
                        </div>
                        <div class="form-group">
                           <input id="password" name="password" type="password" 
                              class="form-control" placeholder="Admin Password" required>
                           <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                        </div>
                        <div class="form-group" >
                           <button id="btnsub" type="submit" class="form-control btn  submit px-3" >LOGIN</button>
                        </div>
                     </form>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <script src="Homepage/AdminLoginRegister/js/jquery.min.js"></script>
      <script src="Homepage/AdminLoginRegister/js/popper.js"></script>
      <script src="Homepage/AdminLoginRegister/js/bootstrap.min.js"></script>
      <script src="Homepage/AdminLoginRegister/js/main.js"></script>
   </body>
</html>