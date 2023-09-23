<%@page import="com.pharmacystore.pojo.User"%>
<%@page import="com.pharmacystore.pojo.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.pharmacystore.dao.OrderDao"%>
<%@page import="com.pharmacystore.daoimpl.OrderDAOImpl"%>
<%
	String uid = (String) session.getAttribute("USER");
	
	User u = new User();
	u.setUserid(uid);
	OrderDao odao = new OrderDAOImpl();
	
	List<Order> lst = odao.getAllOrdersForUser(uid);
	application.setAttribute("ALLYOURORDERLIST", lst);
	response.sendRedirect("viewyourorders.jsp");
%>