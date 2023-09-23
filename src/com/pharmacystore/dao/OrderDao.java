package com.pharmacystore.dao;

import java.util.List;

import com.pharmacystore.pojo.Order;
import com.pharmacystore.pojo.User;

public interface OrderDao {

	boolean placeOrder(Order order);	
	List<Order> getAllOrders();
	List<Order> getAllUnConfirmedOrders();
	Order searchOrder(int orderId);	
	boolean changeOrderStatusToConfirmed(int orderId);
	boolean changeOrderStatusToRejected(int orderId);
	boolean changeOrderStatusToCancelled(int orderId);	
	List<Order> getAllOrdersForUser(String customerid);	
	boolean updateOrderAddress(int orderid, String address);	
	int[] getProductDetailsFromOrderId(Order order);	
	boolean getStatus(int orderId);
	List<Order> displayMyCancelledOrders(String userid);
	List<Order> displayMyConfirmedOrders(String userid);
}
