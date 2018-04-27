package com.tarena.dao;

import java.sql.SQLException;
import java.util.List;

import com.tarena.entity.D_Receive_Address;
import com.tarena.entity.GeOrder;
import com.tarena.entity.Item;
import com.tarena.entity.Order;




	public interface OreDao {

		public void saveAddr(D_Receive_Address addr) throws Exception;
		
		public void updateAddr(D_Receive_Address addr)throws Exception;
		
		public int createOrder(D_Receive_Address addr, double total) throws Exception;

		public void createItem(Item item) throws Exception;

		public List<D_Receive_Address> zhaodizhiByUserId(int userId) throws Exception;
		
		public D_Receive_Address zhaoByUserIdandName(String sb,int userId)throws Exception;
		
		public List<GeOrder> searchGePeoOrder(int userID,int page,int size)throws Exception;
		
		public List<GeOrder> searchAllOrder(int page,int size) throws Exception;
		
		public int totalgePeopleOrder(int userID) throws Exception;
		
		public int totalAllOrder() throws Exception;
		
		public List<GeOrder> searchOnlyOrder(long time,String pcode,String name,String ibsn) throws Exception;

		public void deleteorder(int id) throws Exception;

		public Order searchSpecialOrder(int orderId) throws Exception;

		public void updateOrder(Order od1) throws Exception;
	}


