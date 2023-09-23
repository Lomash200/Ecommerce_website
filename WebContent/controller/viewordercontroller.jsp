<%@page import="com.pharmacystore.pojo.User"%>
<%@page import="com.pharmacystore.pojo.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.pharmacystore.dao.OrderDao"%>
<%@page import="com.pharmacystore.daoimpl.OrderDAOImpl"%>
<%
	OrderDao odao = new OrderDAOImpl();
	
	List<Order> lst = odao.getAllUnConfirmedOrders();
	application.setAttribute("UNCONFIRMEDORDERLIST",
			lst);
	response.sendRedirect("vieworders.jsp");
%>