package com.tarena.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tarena.entity.Option;
import com.tarena.entity.Order;
import com.tarena.entity.OrderItem;
import com.tarena.entity.RecieveInformation;
import com.tarena.util.ConnectionManagement;

public class OrderDao {
	private static String CREATE_NEW_RECEICE_ADDRESS="insert into d_receive_address (user_id,receive_name,full_address,postal_code,mobile,phone) " +
			"values(?,?,?,?,?,?)";
	private static String CREATE_NEW_ORDER="insert into d_order (user_id,status,order_time,order_desc,total_price,receive_name,full_address,postal_code," +
			"mobile,phone) values(?,?,?,?,?,?,?,?,?,?)";
	private static String CREATE_NEW_ORDERITEM="insert into d_item (order_id,product_id,product_name,dang_price,product_num,amount) " +
			"values (?,?,?,?,?,?)";
	private static String GET_ADDRESS_OPTION="select id,receive_name from d_receive_address where user_id=?";
	private static String GET_RECEIVE_ADDRESS="select * from d_receive_address where id=?";
	public static void createNewAddress(RecieveInformation inf)throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		try{
			con=ConnectionManagement.getConnection();
			ps=con.prepareStatement(CREATE_NEW_RECEICE_ADDRESS);
			ps.setInt(1,inf.getUserId());
			ps.setString(2,inf.getReceiveName());
			ps.setString(3, inf.getFullAddress());
			ps.setString(4, inf.getPostalCode());
			ps.setString(5, inf.getMobile());
			ps.setString(6, inf.getPhone());
			ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	public static void createNewOrder(Order order)throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try{
			con=ConnectionManagement.getConnection();
			ps=con.prepareStatement(CREATE_NEW_ORDER);
			ps.setInt(1,order.getUserId());
			ps.setInt(2, order.getStatus());
			ps.setLong(3, order.getOrderTime());
			ps.setString(4, order.getOrderDesc());
			ps.setDouble(5, order.getTotalPrice());
			ps.setString(6,order.getReceiveName());
			ps.setString(7, order.getFullAddress());
			ps.setString(8, order.getPostalCode());
			ps.setString(9, order.getMobile());
			ps.setString(10, order.getPhone());
			ps.executeUpdate();
			rs=ps.getGeneratedKeys();
			rs.next();
			order.setId(rs.getInt(1));
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	public static void createNewOrderItem(List<OrderItem> itemList)throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		try{
			con=ConnectionManagement.getConnection();
			for(OrderItem item:itemList){
				ps=con.prepareStatement(CREATE_NEW_ORDERITEM);
				ps.setInt(1,item.getOrderId());
				ps.setInt(2,item.getProductId());
				ps.setString(3,item.getProductName());
				ps.setDouble(4, item.getDangPrice());
				ps.setInt(5,item.getProductNum());
				ps.setDouble(6,item.getAmount());
				ps.executeUpdate();
			}
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	public static List<Option> getAddressOption(int userId) throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Option> optList=new ArrayList<Option>();
		try{
			con=ConnectionManagement.getConnection();
			ps=con.prepareStatement(GET_ADDRESS_OPTION);
			ps.setInt(1, userId);
			rs=ps.executeQuery();
			while(rs.next()){
			optList.add(new Option(rs.getString(2), rs.getString(1)));
			}
			return optList;
			
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	public static RecieveInformation getReceiveAddress(int id)throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try{
			con=ConnectionManagement.getConnection();
			ps=con.prepareStatement(GET_RECEIVE_ADDRESS);
			ps.setInt(1,id);
			rs=ps.executeQuery();
			rs.next();
			RecieveInformation inf=new RecieveInformation();
			inf.setId(rs.getInt(1));
			inf.setUserId(rs.getInt(2));
			inf.setReceiveName(rs.getString(3));
			inf.setFullAddress(rs.getString(4));
			inf.setPostalCode(rs.getString(5));
			inf.setMobile(rs.getString(6));
			inf.setPhone(rs.getString(7));
			return inf;
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	
}
