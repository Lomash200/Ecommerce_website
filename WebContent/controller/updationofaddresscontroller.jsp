<%@page import="com.pharmacystore.daoimpl.OrderDAOImpl"%>
<%@page import="com.pharmacystore.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

	<%
	int oid = Integer.parseInt(request.getParameter("orderid"));
	String address = request.getParameter("address");
	OrderDao daoImpl = new OrderDAOImpl();
	
	if(daoImpl.updateOrderAddress(oid, address))
	{
		out.print("success");
	}else{
		out.print("failure");
	}
	%>
