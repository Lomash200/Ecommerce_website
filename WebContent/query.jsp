<%@page import="com.pharmacystore.dao.QueryDao"%>
<%@page import="com.pharmacystore.pojo.Query"%>
<%@page import="com.pharmacystore.daoimpl.QueryDaoImpl"%>
<%@page import="com.pharmacystore.dao.AdminDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<jsp:useBean class="com.pharmacystore.pojo.Query" id="q" scope="page" ></jsp:useBean>
<jsp:setProperty property="*" name="q"/>

<%
	if(!session.isNew() || session.getAttribute("ADMIN") != null)
	{	
		QueryDao daoImpl = new QueryDaoImpl();
	
		if(daoImpl.sendMessage(q)){
			response.sendRedirect("userhome.jsp?msg=MsgSendSuccess");
		}
		else
		{
			response.sendRedirect("userhome.jsp?msg=MsgSendFail");
		}
	}
%>
