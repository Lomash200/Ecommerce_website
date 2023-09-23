package com.pharmacystore.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.pharmacystore.connection.DbConnection;
import com.pharmacystore.dao.QueryDao;
import com.pharmacystore.pojo.Query;

public class QueryDaoImpl implements QueryDao {
	
	@Override
	public boolean sendMessage(Query query) {
		try (Connection con = DbConnection.getDatabaseConnection()){
					
					PreparedStatement pst = con.prepareStatement("INSERT INTO query VALUES(?,?,?,?)");
					
					pst.setString(1, query.getName());
					pst.setString(2, query.getEmail());
					pst.setString(3, query.getMsg());
					pst.setString(4, query.getSubject());
					
					int count = pst.executeUpdate();
					
					if(count > 0)
						return true;
					else
						return false;
					
				} catch(SQLException | NullPointerException exc) {
					exc.printStackTrace();
					return false;
		}
	}
}
