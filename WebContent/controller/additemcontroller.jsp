<%@page import="com.pharmacystore.pojo.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.pharmacystore.dao.CategoryDao"%>
<%@page import="com.pharmacystore.daoimpl.CategoryDaoImpl"%>
<%
	CategoryDao daoImpl = new CategoryDaoImpl();
	List<Category> lst = daoImpl.getAllCategories();
	application.setAttribute("CATLIST", lst);
	response.sendRedirect("additemtoproduct.jsp");
%>