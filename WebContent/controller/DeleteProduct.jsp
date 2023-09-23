<%@page import="com.pharmacystore.dao.ProductDao"%>
<%@page import="com.pharmacystore.daoimpl.ProductDaoImpl"%>

<%
	int pid = Integer.parseInt(request.getParameter("productid"));

	ProductDao daoImpl = new ProductDaoImpl();
	
	if(daoImpl.deleteProduct(pid))
	{
		response.sendRedirect("viewallproadmincontroller?msg=delProSuccess");
	}
	else
	{
		response.sendRedirect("viewallproadmincontroller?msg=delProFail");
	}
%>