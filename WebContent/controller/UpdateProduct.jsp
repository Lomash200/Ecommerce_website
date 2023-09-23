<%@page import="java.util.List"%>
<%@page import="com.pharmacystore.daoimpl.ProductDaoImpl"%>
<%@page import="com.pharmacystore.dao.ProductDao"%>
<%@page import="com.pharmacystore.pojo.Product"%>
<jsp:useBean class="com.pharmacystore.pojo.Product" id="p" scope="page" ></jsp:useBean>
<jsp:setProperty property="*" name="p"/>
<%	
   ProductDao daoImpl = new ProductDaoImpl();
   
   if(daoImpl.updateProduct(p))
   {
	List<Product> lst = daoImpl.getAllProducts();
	application.setAttribute("PROLIST", lst);   
   	out.print("success");
   }
   else
   {
   	out.print("failure");
   }
   %>