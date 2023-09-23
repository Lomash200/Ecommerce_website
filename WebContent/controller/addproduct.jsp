<%@page import="com.pharmacystore.dao.ProductDao"%>
<%@page import="com.pharmacystore.pojo.Product"%>
<%@page import="com.pharmacystore.daoimpl.ProductDaoImpl"%>
<%@page import="com.pharmacystore.dao.AdminDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<jsp:useBean class="com.pharmacystore.pojo.Product" id="p" scope="page" ></jsp:useBean>
<jsp:setProperty property="*" name="p"/>

<%
	if(!session.isNew() || session.getAttribute("ADMIN") != null)
	{	
		ProductDao daoImpl = new ProductDaoImpl();
	
		if(daoImpl.addProduct(p)){
			response.sendRedirect("adminhome.jsp?msg=productAddSuccess");
		}
		else
		{
			response.sendRedirect("additemtoproduct.jsp?msg=productAddFail");
		}
	}
%>

