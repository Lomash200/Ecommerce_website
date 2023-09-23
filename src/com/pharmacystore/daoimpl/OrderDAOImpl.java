package com.pharmacystore.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.pharmacystore.connection.DbConnection;
import com.pharmacystore.dao.OrderDao;
import com.pharmacystore.pojo.Order;
import com.pharmacystore.pojo.User;

public class OrderDAOImpl implements OrderDao {

	@Override
	public boolean placeOrder(Order order) {
		try(Connection con = DbConnection.getDatabaseConnection()){
			
			PreparedStatement pst = con.prepareStatement("insert into productorder"
							+ "(orderdunits,address,ordereddate,requesteddate,accepted,cancelled,"
							+ "confirmed,billamount,customerid,productid) "
							+ "values(?,?,?,?,?,?,?,?,?,?)");
			
			pst.setInt(1, order.getOrderedunits());
			pst.setString(2, order.getAddress());
			pst.setDate(3, order.getOrdereddate());
			pst.setDate(4, order.getRequesteddate());
			pst.setBoolean(5, true);
			pst.setBoolean(6, false);
			pst.setBoolean(7, false);
			pst.setInt(8, order.getBillamount());
			pst.setString(9, order.getCustomerid());
			pst.setInt(10, order.getProductid());
			
			int count = pst.executeUpdate();
			
			if(count > 0)
				return true;
			else
				return false;
		}
		catch(SQLException | NullPointerException ex)
		{
			ex.printStackTrace();
			return false;
		}
	}

	@Override
	public List<Order> getAllOrders() {
		List<Order> orderList = new ArrayList<>();
		
		try(Connection con = DbConnection.getDatabaseConnection()){
			
			PreparedStatement pst = con.prepareStatement("select * from productorder");
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.isBeforeFirst())
			{
				while(rs.next())
				{
					Order order = new Order();
					order.setOrderid(rs.getInt("orderid"));
					order.setOrderedunits(rs.getInt("orderdunits"));
					order.setAddress(rs.getString("address"));
					order.setOrdereddate(rs.getDate("ordereddate"));
					order.setRequesteddate(rs.getDate("requesteddate"));
					order.setAccepted(rs.getBoolean("accepted"));
					order.setCancelled(rs.getBoolean("cancelled"));
					order.setConfirmed(rs.getBoolean("confirmed"));
					order.setBillamount(rs.getInt("billamount"));
					order.setCustomerid(rs.getString("customerid"));
					order.setProductid(rs.getInt("productid"));
					
					orderList.add(order);
				}
			}
		}
		catch(SQLException | NullPointerException ex)
		{
			ex.printStackTrace();
			orderList.clear();
			return orderList;
		}
		
		return orderList;
	}

	@Override
	public List<Order> getAllUnConfirmedOrders() {
		List<Order> orderList = new ArrayList<>();
		
		try(Connection con = DbConnection.getDatabaseConnection()){
			
			PreparedStatement pst = 
			con.prepareStatement("select * from "
					+ "productorder where accepted ="
					+ "true and cancelled=false"
					+ " and confirmed=false");
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.isBeforeFirst())
			{
				while(rs.next())
				{
					Order order = new Order();
					order.setOrderid(rs.getInt("orderid"));
					order.setOrderedunits(rs.getInt("orderdunits"));
					order.setAddress(rs.getString("address"));
					order.setOrdereddate(rs.getDate("ordereddate"));
					order.setRequesteddate(rs.getDate("requesteddate"));
					order.setAccepted(rs.getBoolean("accepted"));
					order.setCancelled(rs.getBoolean("cancelled"));
					order.setConfirmed(rs.getBoolean("confirmed"));
					order.setBillamount(rs.getInt("billamount"));
					order.setCustomerid(rs.getString("customerid"));
					order.setProductid(rs.getInt("productid"));
					
					orderList.add(order);
				}
			}
		}
		catch(SQLException | NullPointerException ex)
		{
			ex.printStackTrace();
			orderList.clear();
			return orderList;
		}
		
		return orderList;
	}
	@Override
	public Order searchOrder(int orderId) {
		Order order = null;
		
		try(Connection con = DbConnection.getDatabaseConnection()){
			
			PreparedStatement pst = con.prepareStatement("select * from productorder where orderid = ?");
			pst.setInt(1, orderId);
			ResultSet rs = pst.executeQuery();
			
			if(rs.isBeforeFirst())
			{
				rs.next();
					order = new Order();
					order.setOrderid(rs.getInt("orderid"));
					order.setOrderedunits(rs.getInt("orderdunits"));
					order.setAddress(rs.getString("address"));
					order.setOrdereddate(rs.getDate("ordereddate"));
					order.setRequesteddate(rs.getDate("requesteddate"));
					order.setAccepted(rs.getBoolean("accepted"));
					order.setCancelled(rs.getBoolean("cancelled"));
					order.setConfirmed(rs.getBoolean("confirmed"));
					order.setBillamount(rs.getInt("billamount"));
					order.setCustomerid(rs.getString("customerid"));
					order.setProductid(rs.getInt("productid"));
			}
		}
		catch(SQLException | NullPointerException ex)
		{
			ex.printStackTrace();
			return null;
		}
		
		return order;
	}

	@Override
	public boolean changeOrderStatusToConfirmed(int orderId) {
		boolean status = false;
		
		try(Connection con = DbConnection.getDatabaseConnection()){
			
			PreparedStatement pst = con.prepareStatement("update productorder set confirmed = true where orderid = ?");
			
			pst.setInt(1, orderId);
			
			int count = pst.executeUpdate();
			
			if(count > 0)
				status = true;
		}
		catch(SQLException ex)
		{
			ex.printStackTrace();
			return false;
		}
		
		return status;
	}
	
	@Override
	public boolean changeOrderStatusToRejected(int orderId) {
		boolean status = false;
		
		try(Connection con = DbConnection.getDatabaseConnection()){
			
			PreparedStatement pst = 
			con.prepareStatement("update productorder"
			+ " set accepted = false where "
			+ "orderid = ?");
			
			pst.setInt(1, orderId);
			
			int count = pst.executeUpdate();
			
			if(count > 0)
				status = true;
		}
		catch(SQLException ex)
		{
			ex.printStackTrace();
			return false;
		}
		
		return status;
	}

	@Override
	public boolean changeOrderStatusToCancelled(int orderId) {
		boolean status = false;
		
		try(Connection con = DbConnection.getDatabaseConnection()){
			
			PreparedStatement pst = 
		   con.prepareStatement("UPDATE productorder"
			+ " SET cancelled = true WHERE "
			+ "orderid = ?");
			
			pst.setInt(1, orderId);
			
			int count = pst.executeUpdate();
			
			if(count > 0) {
				status = true;
			}
		}
		catch(SQLException ex)
		{
			ex.printStackTrace();
			return false;
		}
		
		return status;
	}	
	
	
	@Override
	public List<Order> getAllOrdersForUser(String customerid) {
		List<Order> orderList = new ArrayList<>();
		
		try(Connection con = DbConnection.getDatabaseConnection()){
			
			PreparedStatement pst = con.prepareStatement("select * from productorder where customerid = ?");
			
			pst.setString(1, customerid);
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.isBeforeFirst())
			{
				while(rs.next())
				{
					Order order = new Order();
					order.setOrderid(rs.getInt("orderid"));
					order.setOrderedunits(rs.getInt("orderdunits"));
					order.setAddress(rs.getString("address"));
					order.setOrdereddate(rs.getDate("ordereddate"));
					order.setRequesteddate(
							rs.getDate("requesteddate"));
					order.setAccepted(rs.getBoolean("accepted"));
					order.setCancelled(rs.getBoolean("cancelled"));
					order.setConfirmed(rs.getBoolean("confirmed"));
					order.setBillamount(rs.getInt("billamount"));
					order.setCustomerid(rs.getString("customerid"));
					order.setProductid(rs.getInt("productid"));
					
					orderList.add(order);
				}
			}
		}
		catch(SQLException ex)
		{
			ex.printStackTrace();
			orderList.clear();
			return orderList;
		}
		
		return orderList;
	}

	@Override
	public boolean updateOrderAddress(int orderid,
			String address) {
		boolean status = false;
		
		try (Connection con = DbConnection.getDatabaseConnection())
		{
			PreparedStatement pst = con.prepareStatement("UPDATE productorder SET address = ? WHERE orderid = ?");
			
			pst.setString(1, address);
			pst.setInt(2, orderid);
			
			int count = pst.executeUpdate();
			
			if(count > 0)
				status = true;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return status;
	}
	
	@Override
	public int[] getProductDetailsFromOrderId(Order order) {
		int[] product = new int[2];
		
		try(Connection con = DbConnection.getDatabaseConnection()){
			
			PreparedStatement pst = con.prepareStatement("select * from product where productid = ?");
			
			pst.setInt(1, order.getProductid());
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.isBeforeFirst())
			{
				while(rs.next())
				{
					product[0] = rs.getInt("productid");
					product[1] = rs.getInt("quantity");
					
				}
			}
		}
		catch(SQLException ex)
		{
			ex.printStackTrace();
		}
		
		return product;
	}
	
	@Override
	public boolean getStatus(int orderId) {
		boolean status = false;
		
		try(Connection con = DbConnection.getDatabaseConnection()){
			
			PreparedStatement pst = con.prepareStatement("SELECT cancelled FROM productorder where orderid = ?");
			
			pst.setInt(1, orderId);
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.isBeforeFirst())
			{
				while(rs.next())
				{
					status= rs.getBoolean("cancelled");					
				}
			}
		
		}
		catch(SQLException ex)
		{
			ex.printStackTrace();
		}
		
		return status;
	}
	
	@Override
	public List<Order> displayMyCancelledOrders(
			String userid){
		List<Order> orderList = new ArrayList<>();
		
		try(Connection con = 
				DbConnection.getDatabaseConnection())
		{
			
			PreparedStatement pst = con.prepareStatement(
			"SELECT * FROM productorder "
			+ "WHERE customerId = ? and "
			+ "cancelled = true and confirmed = true and"
			+ " accepted = true");
			
			pst.setString(1, userid);
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.isBeforeFirst())
			{
				while(rs.next())
				{
					Order order = new Order();
					
					order.setOrderid(rs.getInt("orderid"));
					order.setCustomerid(rs.getString("customerid"));
					order.setProductid(rs.getInt("productid"));
					order.setOrderedunits(rs.getInt("orderdunits"));
					order.setAddress(rs.getString("address"));
					order.setOrdereddate(rs.getDate("ordereddate"));
					order.setRequesteddate(rs.getDate("requesteddate"));
					order.setAccepted(rs.getBoolean("accepted"));
					order.setCancelled(rs.getBoolean("cancelled"));
					order.setConfirmed(rs.getBoolean("confirmed"));
					order.setBillamount(rs.getInt("billamount"));
					
					orderList.add(order);
				}
			}
			
			return orderList;
		}
		catch(NullPointerException | SQLException
				 exc) {
			exc.printStackTrace();
			orderList.clear();
			return orderList;
		}
	}
	
	@Override
	public List<Order> displayMyConfirmedOrders(String userid){
		List<Order> orderList = new ArrayList<>();
		
		try(Connection con = 
				DbConnection.getDatabaseConnection())
		{
			
			PreparedStatement pst = con.prepareStatement(
			"SELECT * FROM productorder WHERE "
			+ "customerId = ? and cancelled=false"
		+ " and confirmed=true and accepted=true");
			
			pst.setString(1, userid);
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.isBeforeFirst())
			{
				while(rs.next())
				{
					Order order = new Order();
					
					order.setOrderid(rs.getInt("orderid"));
					order.setCustomerid(rs.getString("customerid"));
					order.setProductid(rs.getInt("productid"));
					order.setOrderedunits(rs.getInt("orderdunits"));
					order.setAddress(rs.getString("address"));
					order.setOrdereddate(rs.getDate("ordereddate"));
					order.setRequesteddate(rs.getDate("requesteddate"));
					order.setAccepted(rs.getBoolean("accepted"));
					order.setCancelled(rs.getBoolean("cancelled"));
					order.setConfirmed(rs.getBoolean("confirmed"));
					order.setBillamount(rs.getInt("billamount"));
					
					orderList.add(order);
				}
			}
			
			return orderList;
		}
		catch(NullPointerException | SQLException
				 exc) {
			exc.printStackTrace();
			orderList.clear();
			return orderList;
		}
	}
}
