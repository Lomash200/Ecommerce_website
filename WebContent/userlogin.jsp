<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 
   prefix = "c" %>	
<!doctype html>
<html lang="en">
   <head>
      <!-- Favicons -->
      <link rel="icon" type="image/png" href="Homepage/assets/img/favicon.png">
      <!-- alert -->
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.29.2/sweetalert2.all.min.js"></script>    
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <title>Customer Login</title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet">
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
      <link rel="stylesheet" href="Homepage/css/style.css">
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.29.2/sweetalert2.all.min.js"></script>    
   </head>
   <style>
      #btn{
      background-color:#1997cc;
      }
      #btn2{
      background-color:#1997cc;
      }	
   </style>
   <body class="img js-fullheight" style="background-image: url(Homepage/assets/img/pharmaimg.jpg);">
      <section class="ftco-section" >
         <div class="container">
            <c:if test="${param.msg == 'loginFirst'}">
               <c:set var="message" value="You need to login first!!!"/>
            </c:if>
            <c:if test="${param.msg == 'userLoginError'}">
               <c:set var="message" value="Invalid username or password !!!"/>
            </c:if>
            <c:if test="${param.msg == 'userRegSuccess'}">
               <c:set var="message" value="Registration successful !!!"/>
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
            <div class="row justify-content-center" >
               <div class="col-md-6 text-center mb-5"></div>
            </div>
            <div class="row justify-content-center" >
               <div class="col-md-12 col-lg-10" id="new" >
                  <div class="wrap d-md-flex" >
                     <div class="text-wrap p-4 p-lg-5 text-center d-flex align-items-center order-md-last">
                        <div class="text w-100" >
                           <h2>Welcome to login</h2>
                           <p>Don't have an account?</p>
                           <a href="userregistration.jsp" class="btn btn-white btn-outline-white" id="btn2">Sign Up</a>
                        </div>
                     </div>
                     <div class="login-wrap p-4 p-lg-5">
                        <div class="d-flex">
                           <div class="w-100">
                              <h3 class="mb-4">Sign In</h3>
                           </div>
                           <div class="w-100">
                              <p class="social-media d-flex justify-content-end">
                                 <a href="#" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-facebook"></span></a>
                                 <a href="#" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-twitter"></span></a>
                              </p>
                           </div>
                        </div>
                        <form action="validateUserLogin" class="form" method="post">
                           <div class="form-group mb-3">
                              <label class="label" for="userid">Username</label>
                              <input type="text" class="form-control" placeholder="Username" id="userid" name="userid" required>
                           </div>
                           <div class="form-group mb-3">
                              <label class="label" for="password">Password</label>
                              <input type="password" class="form-control" placeholder="Password" name ="password" id="password" required>
                           </div>
                           <div class="form-group">
                              <button type="submit" class="form-control btn  submit px-3" id="btn">Sign In</button>
                           </div>
                           <div class="form-group d-md-flex">
                              <div class="w-50 text-left"></div>
                              <div class="w-50 text-md-right">
                                 <a href="#">Forgot Password</a>
                              </div>
                           </div>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <script src="js/jquery.min.js"></script>
      <script src="js/popper.js"></script>
      <script src="js/bootstrap.min.js"></script>
      <script src="js/main.js"></script>
   </body>
</html>