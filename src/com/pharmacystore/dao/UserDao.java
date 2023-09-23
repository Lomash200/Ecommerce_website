package com.pharmacystore.dao;

import com.pharmacystore.pojo.User;
import com.pharmacystore.pojo.Order;

import java.util.List;

public interface UserDao {
	boolean register(User user);
	boolean checkUser(User user);
}
