<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="ISO-8859-1">
      <title>Insert title here</title>
   </head>
   <body>
      <div class="container">
         <%
            if(!session.isNew() || session.getAttribute("ADMIN") != null){
            	session.setAttribute("ADMIN", null);
            	session.invalidate();
            	
            	response.sendRedirect("index.jsp?msg=logoutSuccess");
            }
            else {
            	response.sendRedirect("adminlogin.jsp?msg=loginFirst");
            }
            %>
      </div>
   </body>
</html>