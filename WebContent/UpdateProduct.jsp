<%@page import="com.pharmacystore.daoimpl.ProductDaoImpl"%>
<%@page import="com.pharmacystore.dao.ProductDao"%>
<%@page import="com.pharmacystore.pojo.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<jsp:useBean class="com.pharmacystore.pojo.Product" id="p" scope="page" ></jsp:useBean>
<jsp:setProperty property="*" name="p"/>
<%	
   ProductDao daoImpl = new ProductDaoImpl();
   
   if(daoImpl.updateProduct(p))
   {
   	out.print("success");
   }
   else
   {
   	out.print("failure");
   }
   %>