package com.tarena.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tarena.dao.OreDao;
import com.tarena.entity.D_Receive_Address;
import com.tarena.entity.GeOrder;
import com.tarena.entity.Item;
import com.tarena.entity.Order;
import com.tarena.util.ConnectionManagement;
import com.tarena.util.Constant;

public class OreDaoImlp implements OreDao {

	public void createItem(Item item) throws Exception {
		String sql = 
			"insert into d_item(order_id,product_id," +
			"product_name,dang_price,product_num," +
			"amount) values(?,?,?,?,?,?)";
		PreparedStatement pst = ConnectionManagement.getConnection(
		).prepareStatement(sql);
		pst.setInt(1, item.getOrderId());
		pst.setInt(2, item.getProductId());
		pst.setString(3, item.getProductName());
		pst.setDouble(4, item.getDangPrice());
		pst.setInt(5, item.getProductNum());
		pst.setDouble(6, item.getAmount());
		pst.executeUpdate();

	}

	public int createOrder(D_Receive_Address addr, double total)
			throws Exception {
		String sql = 
			"insert into d_order(user_id,status," +
			"order_time,order_desc,total_price," +
			"receive_name,full_address,postal_code," +
			"mobile,phone) values(?,?,?,?,?,?,?,?,?,?)";
		int orderId = 0;
		PreparedStatement pst = ConnectionManagement.getConnection(
				).prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
		pst.setInt(1, addr.getUser_id());
		pst.setInt(2, Constant.fukuai);
		pst.setLong(3, System.currentTimeMillis());
		pst.setString(4, null);
		pst.setDouble(5, total);
		pst.setString(6, addr.getReceive_address());
		pst.setString(7, addr.getFull_address());
		pst.setString(8, addr.getPostal_code());
		pst.setString(9, addr.getMobile());
		pst.setString(10, addr.getPhone());
		pst.executeUpdate();
		ResultSet rs = pst.getGeneratedKeys();
		if(rs.next()){
			orderId = rs.getInt(1);
		}
		
		return orderId;

		
	}

	public void saveAddr(D_Receive_Address addr) throws Exception {
		String sql = 
			"insert into d_receive_address(user_id," +
			"receive_name,full_address,postal_code," +
			"mobile,phone) values(?,?,?,?,?,?)";
		PreparedStatement pst = ConnectionManagement.getConnection(
		).prepareStatement(sql);
		pst.setInt(1, addr.getUser_id());
		pst.setString(2, addr.getReceive_address());
		pst.setString(3, addr.getFull_address());
		pst.setString(4, addr.getPostal_code());
		pst.setString(5, addr.getMobile());
		pst.setString(6, addr.getPhone());
		pst.executeUpdate();
	}

	public List<D_Receive_Address> zhaodizhiByUserId(int userId)
			throws Exception {
		String sql="select * from d_receive_address " +
		"where user_id=?";
		List<D_Receive_Address> addrs = new ArrayList<D_Receive_Address>();
		PreparedStatement pst = ConnectionManagement.getConnection(
				).prepareStatement(sql);
		pst.setInt(1, userId);
		ResultSet rs = pst.executeQuery();
		while(rs.next()){
			D_Receive_Address r = new D_Receive_Address();
			r.setId(rs.getInt("id"));
			r.setUser_id(rs.getInt("user_id"));
			r.setReceive_address(rs.getString("receive_name"));
			r.setFull_address(rs.getString("full_address"));
			r.setPostal_code(rs.getString("postal_code"));
			r.setMobile(rs.getString("mobile"));
			r.setPhone(rs.getString("phone"));
			addrs.add(r);
		}
		//ConnectionManagements.closeConnection();
		return addrs;

		
	}

	public D_Receive_Address zhaoByUserIdandName(String sb, int userId)
			throws Exception {
		String sql="select * from d_receive_address " +
		"where user_id=? and full_address=?";
	
		PreparedStatement pst = ConnectionManagement.getConnection(
				).prepareStatement(sql);
		pst.setInt(1, userId);
		pst.setString(2, sb);
		ResultSet rs = pst.executeQuery();
		D_Receive_Address r = new D_Receive_Address();
		if(rs.next()){
			
			r.setId(rs.getInt("id"));
			r.setUser_id(rs.getInt("user_id"));
			r.setReceive_address(rs.getString("receive_name"));
			r.setFull_address(rs.getString("full_address"));
			r.setPostal_code(rs.getString("postal_code"));
			r.setMobile(rs.getString("mobile"));
			r.setPhone(rs.getString("phone"));
			
		}
		//ConnectionManagements.closeConnection();
		return r;

	}

	public void updateAddr(D_Receive_Address addr) throws Exception {
		String sql = "update d_receive_address set receive_name=?,full_address=?,postal_code=?,mobile=?,phone=? where user_id=? and full_address=?";
		PreparedStatement pst = ConnectionManagement.getConnection(
		).prepareStatement(sql);
		
		pst.setString(1, addr.getReceive_address());
		pst.setString(2, addr.getFull_address());
		pst.setString(3, addr.getPostal_code());
		pst.setString(4, addr.getMobile());
		pst.setString(5, addr.getPhone());
		pst.setInt(6, addr.getUser_id());
		pst.setString(7, addr.getFull_address());
		pst.executeUpdate();
	
		
	}

	public List<GeOrder> searchGePeoOrder(int userID, int page, int size)
			throws Exception {
		String sql="select du.nickname,do.order_time,do.status,do.receive_name,do.full_address,do.postal_code,do.mobile,do.total_price,di.product_num,dp.product_name,dp.dang_price,dp.fixed_price,dp.product_pic,db.author,db.publishing,db.isbn from d_order do left join d_item di on do.id = di.order_id left join d_product dp on di.product_id=dp.id left join d_user du on do.user_id=du.id left join d_book db on dp.id=db.id where do.user_id=? order by do.order_time limit ?,?";
		List<GeOrder> georders=new ArrayList<GeOrder>();
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement pps=conn.prepareStatement(sql);
		pps.setInt(1, userID);
		pps.setInt(2, (page-1)*size);
		pps.setInt(3, size);
		ResultSet rs=pps.executeQuery();
		while(rs.next()){
			GeOrder ge=new GeOrder();
			ge.setNickname(rs.getString(1));
			ge.setOrderTime(rs.getLong(2));
			ge.setStatus(rs.getInt(3));
			ge.setReceiveName(rs.getString(4));
			ge.setFullAddress(rs.getString(5));
			ge.setPostalCode(rs.getString(6));
			ge.setMobile(rs.getString(7));
			ge.setTotalPrice(rs.getDouble(8));
			ge.setProductNum(rs.getInt(9));
			ge.setProductName(rs.getString(10));
			ge.setDangPrice(rs.getDouble(11));
			ge.setFixedPrice(rs.getDouble(12));
			ge.setProductPic(rs.getString(13));
			ge.setAuthor(rs.getString(14));
			ge.setPublishing(rs.getString(15));
			ge.setIsbn(rs.getString(16));
			georders.add(ge);
		}
		return georders;
	}

	public int totalgePeopleOrder(int userID) throws Exception {
		// TODO Auto-generated method stub
		String sql="select count(*) from d_order do left join d_item di on do.id = di.order_id left join d_product dp on di.product_id=dp.id left join d_user du on do.user_id=du.id left join d_book db on dp.id=db.id where do.user_id=?";
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement pps=conn.prepareStatement(sql);
		pps.setInt(1, userID);
		ResultSet rs=pps.executeQuery();
		int xb=0;
		while(rs.next()){
			xb=rs.getInt(1);
		}
		return xb;
	}

	public List<GeOrder> searchAllOrder(int page, int size) throws Exception {
		// TODO Auto-generated method stub
		String sql="select di.id,du.nickname,do.order_time,do.status,do.receive_name,do.full_address,do.postal_code,do.mobile,do.total_price,di.product_num,dp.product_name,dp.dang_price,dp.fixed_price,dp.product_pic,db.author,db.publishing,db.isbn,do.id from d_order do left join d_item di on do.id = di.order_id left join d_product dp on di.product_id=dp.id left join d_user du on do.user_id=du.id left join d_book db on dp.id=db.id  order by do.order_time limit ?,?";
		List<GeOrder> georders=new ArrayList<GeOrder>();
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement pps=conn.prepareStatement(sql);
		
		pps.setInt(1, (page-1)*size);
		pps.setInt(2, size);
		ResultSet rs=pps.executeQuery();
		while(rs.next()){
			GeOrder ge=new GeOrder();
			ge.setId(rs.getInt(1));
			ge.setNickname(rs.getString(2));
			ge.setOrderTime(rs.getLong(3));
			ge.setStatus(rs.getInt(4));
			ge.setReceiveName(rs.getString(5));
			ge.setFullAddress(rs.getString(6));
			ge.setPostalCode(rs.getString(7));
			ge.setMobile(rs.getString(8));
			ge.setTotalPrice(rs.getDouble(9));
			ge.setProductNum(rs.getInt(10));
			ge.setProductName(rs.getString(11));
			ge.setDangPrice(rs.getDouble(12));
			ge.setFixedPrice(rs.getDouble(13));
			ge.setProductPic(rs.getString(14));
			ge.setAuthor(rs.getString(15));
			ge.setPublishing(rs.getString(16));
			ge.setIsbn(rs.getString(17));
			ge.setOrderId(rs.getInt(18));
			georders.add(ge);
		}
		return georders;
	}

	public int totalAllOrder() throws Exception {
		// TODO Auto-generated method stub
		String sql="select count(*) from d_order do left join d_item di on do.id = di.order_id left join d_product dp on di.product_id=dp.id left join d_user du on do.user_id=du.id left join d_book db on dp.id=db.id";
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement pps=conn.prepareStatement(sql);
		
		ResultSet rs=pps.executeQuery();
		int xb=0;
		while(rs.next()){
			xb=rs.getInt(1);
		}
		return xb;
	}

	public List<GeOrder> searchOnlyOrder(long time, String pcode, String name,
			String ibsn) throws Exception {
		// TODO Auto-generated method stub
		StringBuilder sb=new StringBuilder();
		//select du.nickname,do.order_time,do.status,do.receive_name,do.full_address,do.postal_code,do.mobile,do.total_price,di.product_num,dp.product_name,dp.dang_price,dp.fixed_price,dp.product_pic,db.author,db.publishing,db.isbn
		// from d_order do left join d_item di on do.id = di.order_id left join d_product dp on di.product_id=dp.id left join d_user du on do.user_id=du.id left join d_book db on dp.id=db.id  
		// where 1=1 and do.order_time <= 1387084222932 and du.nickname like '%123456%' and do.postal_code like '%215300%' and db.isbn like '54645682'
		// order by do.order_time
		sb.append("select di.id,du.nickname,do.order_time,do.status,do.receive_name,do.full_address,do.postal_code,do.mobile,do.total_price,di.product_num,dp.product_name,dp.dang_price,dp.fixed_price,dp.product_pic,db.author,db.publishing,db.isbn,do.id ");
		sb.append("from d_order do left join d_item di on do.id = di.order_id left join d_product dp on di.product_id=dp.id left join d_user du on do.user_id=du.id left join d_book db on dp.id=db.id  ");
		sb.append("where 1=1 ");
		if(time !=0L){
			sb.append("and do.order_time <= ? ");
		}
		if(!pcode.equals("")){
			sb.append("and do.postal_code like ? ");
		}
		if(!name.equals("")){
			sb.append("and du.nickname like ? ");
		}
		if(!ibsn.equals("")){
			sb.append("and db.isbn like ? ");
		}
		 sb.append("order by do.order_time");
		
		 List<GeOrder> georders=new ArrayList<GeOrder>();
		 String sql=sb.toString();
		 Connection conn=ConnectionManagement.getConnection();
			PreparedStatement pps=conn.prepareStatement(sql);
			int index=1;
			
			if(time !=0L){
				pps.setLong(index++, time);
			}
			if(!pcode.equals("")){
			   pps.setString(index++, pcode);
	     	}
			if(!name.equals("")){
				pps.setString(index++, name);
			}
			

			if(!ibsn.equals("")){
				pps.setString(index++, ibsn);
		}
			
			ResultSet rs=pps.executeQuery();
			while(rs.next()){
				GeOrder ge=new GeOrder();
				ge.setId(rs.getInt(1));
				ge.setNickname(rs.getString(2));
				ge.setOrderTime(rs.getLong(3));
				ge.setStatus(rs.getInt(4));
				ge.setReceiveName(rs.getString(5));
				ge.setFullAddress(rs.getString(6));
				ge.setPostalCode(rs.getString(7));
				ge.setMobile(rs.getString(8));
				ge.setTotalPrice(rs.getDouble(9));
				ge.setProductNum(rs.getInt(10));
				ge.setProductName(rs.getString(11));
				ge.setDangPrice(rs.getDouble(12));
				ge.setFixedPrice(rs.getDouble(13));
				ge.setProductPic(rs.getString(14));
				ge.setAuthor(rs.getString(15));
				ge.setPublishing(rs.getString(16));
				ge.setIsbn(rs.getString(17));
				ge.setOrderId(rs.getInt(18));
				georders.add(ge);
			}
			return georders;
		
	}

	public void deleteorder(int id) throws Exception {
		// TODO Auto-generated method stub
		String sql="delete from d_item where id=?";
		 Connection conn=ConnectionManagement.getConnection();
			PreparedStatement pps=conn.prepareStatement(sql);
			pps.setInt(1, id);
			int b=pps.executeUpdate();
			
	}

	public Order searchSpecialOrder(int orderId) throws Exception {
		// TODO Auto-generated method stub
		String sql="select * from d_order where id=?";
		 Connection conn=ConnectionManagement.getConnection();
			PreparedStatement pps=conn.prepareStatement(sql);
			pps.setInt(1, orderId);
			ResultSet rs=pps.executeQuery();
			Order od=new Order();
			while (rs.next()){
				od.setId(rs.getInt(1));
				od.setUserId(rs.getInt(2));
				od.setStatus(rs.getInt(3));
				od.setOrderTime(rs.getLong(4));
				od.setOrderDesc(rs.getString(5));
				od.setTotalPrice(rs.getDouble(6));
				od.setReceiveName(rs.getString(7));
				od.setFullAddress(rs.getString(8));
				od.setPostalCode(rs.getString(9));
				od.setMobile(rs.getString(10));
				od.setPhone(rs.getString(11));
			}
		return od;
	}

	public void updateOrder(Order od1) throws Exception {
		// TODO Auto-generated method stub
		String sql="update d_order set total_price=?,receive_name=?,full_address=?,postal_code=?,mobile=?,phone=? where id=?";
		 Connection conn=ConnectionManagement.getConnection();
			PreparedStatement pps=conn.prepareStatement(sql);
			pps.setDouble(1,od1.getTotalPrice());
			pps.setString(2, od1.getReceiveName());
			pps.setString(3, od1.getFullAddress());
			pps.setString(4, od1.getPostalCode());
			pps.setString(5, od1.getMobile());
			pps.setString(6, od1.getPhone());
			pps.setInt(7, od1.getId());
			
			int i=pps.executeUpdate();
			System.out.println("ok:"+i);
	}

	

}
