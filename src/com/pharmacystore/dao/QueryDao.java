package com.pharmacystore.dao;

import com.pharmacystore.pojo.Query;

public interface QueryDao {
	boolean sendMessage(Query query);
}
