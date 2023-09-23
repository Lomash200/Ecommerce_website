<%@page import="com.pharmacystore.daoimpl.OrderDAOImpl"%>
<%@page import="com.pharmacystore.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

	<%
	int oid = Integer.parseInt(request.getParameter("orderid"));
	OrderDao daoImpl = new OrderDAOImpl();
	
	if(daoImpl.changeOrderStatusToConfirmed(oid))
	{
		response.sendRedirect("adminhome.jsp?msg=confirmSuccess");
	}else{
		response.sendRedirect("vieworders.jsp?msg=confirmFail");
	}
	%>
