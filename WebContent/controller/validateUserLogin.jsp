<%@page import="com.pharmacystore.daoimpl.UserDaoImpl"%>
<%@page import="com.pharmacystore.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="user" class="com.pharmacystore.pojo.User"></jsp:useBean>
<jsp:setProperty property="*" name="user"></jsp:setProperty>
			
<%
	UserDao daoImpl = new UserDaoImpl();
		if(daoImpl.checkUser(user)){
			session.setAttribute("USER", user.getUserid());
			response.sendRedirect("userhome.jsp");
		}
		else{
			response.sendRedirect("userlogin.jsp?msg=userLoginError");
		}	
%>