<%@page import="com.pharmacystore.pojo.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.pharmacystore.dao.ProductDao"%>
<%@page import="com.pharmacystore.daoimpl.ProductDaoImpl"%>
<%
	int catid= Integer.parseInt(request.getParameter("categoryid"));
	int pg = Integer.parseInt(request.getParameter("page"));
	ProductDao daoImpl = new ProductDaoImpl();
	List<Product> lst = daoImpl.displayProductsCategoryWise(catid);
	application.setAttribute("CATWISE", lst);
	response.sendRedirect("displayproductcategorywise.jsp?categoryid="+catid+"&page="+pg);
%>