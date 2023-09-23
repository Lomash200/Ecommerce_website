<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.pharmacystore.pojo.Product"%>
<%@page import="com.pharmacystore.daoimpl.OrderDAOImpl"%>
<%@page import="com.pharmacystore.dao.OrderDao"%>
<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import = "java.util.logging.Logger" %>
<%@page import="com.pharmacystore.pojo.Order"%>
<%@page import="com.pharmacystore.daoimpl.ProductDaoImpl"%>
<%@page import="com.pharmacystore.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%		
   int productid = Integer.parseInt(request.getParameter("productid"));
   
     	ProductDao pdaoImpl = new ProductDaoImpl();
     	Product pr = pdaoImpl.searchProduct(productid);
     	
     	String customerid = (String) session.getAttribute("USER");
     	int orderedunits = Integer.parseInt(request.getParameter("quantity"));
     	String address = request.getParameter("address");
     	Date ordereddate = Date.valueOf(LocalDate.now());
      //setting delivery date as  5 days after the ordered date
    	Date requesteddate = Date.valueOf(LocalDate.now().plusDays(5));
    	
     	int price = pr.getPrice();   	
     	int totalquantity = pr.getQuantity();   	
     	int updatedq = totalquantity-orderedunits;	
   int billamount = (orderedunits)*(price);
   
   OrderDao odaoImpl = new OrderDAOImpl();
   //inserting in orderdestails
   
   %>
<jsp:useBean class="com.pharmacystore.pojo.Order" id="o" scope="page" ></jsp:useBean>
<jsp:setProperty property="customerid" value="<%= customerid %>" name="o" />
<jsp:setProperty property="productid" value="<%= productid %>" name="o" />
<jsp:setProperty property="orderedunits" value="<%= orderedunits %>" name="o" />
<jsp:setProperty property="address" value="<%= address %>" name="o" />
<jsp:setProperty property="ordereddate" value="<%= ordereddate %>" name="o" />
<jsp:setProperty property="requesteddate" value="<%= requesteddate %>" name="o" />
<jsp:setProperty property="accepted" value="true" name="o" />
<jsp:setProperty property="cancelled" value="false" name="o" />
<jsp:setProperty property="confirmed" value="true" name="o" />
<jsp:setProperty property="billamount" value="<%= billamount %>" name="o" />
<%
   if(orderedunits<totalquantity){
   	if(odaoImpl.placeOrder(o)){		
   		pdaoImpl.updateQuantityAfterOrder(productid,updatedq);
   		out.print("success");
   	}
   	else
   	{
   		out.print("failure");	
   	}
   }
   else{
   	out.print("lessquantity");
   }
   
   %>