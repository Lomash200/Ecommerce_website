<%@page import="com.pharmacystore.daoimpl.CategoryDaoImpl"%>
<%@page import="com.pharmacystore.dao.CategoryDao"%>
<%@page import="com.pharmacystore.pojo.Category"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<jsp:useBean class="com.pharmacystore.pojo.Category" id="category" scope="page" ></jsp:useBean>
<jsp:setProperty property="categoryName" name="category"/>
<%	
   CategoryDao daoImpl = new CategoryDaoImpl();
   
   if(daoImpl.addCategory(category)){
   	out.print("success");
   }
   else
   {
   	out.print("failure");
   }
   %>