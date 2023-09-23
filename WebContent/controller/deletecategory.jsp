<%@page import="com.pharmacystore.dao.CategoryDao"%>
<%@page import="com.pharmacystore.pojo.Category"%>
<%@page import="com.pharmacystore.daoimpl.CategoryDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%
	if(!session.isNew() || session.getAttribute("ADMIN") != null)
	{
		int catid = Integer.parseInt(request.getParameter("categoryid"));
	
		CategoryDao daoImpl = new CategoryDaoImpl();
	
		if(daoImpl.deleteCategory(catid)){
			response.sendRedirect("adminhome.jsp?msg="+"deleteCatSuccess");
		}
		else
		{
			response.sendRedirect("deletecatcontroller?msg="+"deleteCatFail");
		}
	}
%>

