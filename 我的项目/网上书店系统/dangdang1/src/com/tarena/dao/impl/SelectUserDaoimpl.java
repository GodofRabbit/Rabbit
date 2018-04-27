package com.tarena.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tarena.dao.SelectUserDao;
import com.tarena.entity.D_User;
import com.tarena.util.ConnectionManagement;
import com.tarena.util.Constant;


public class SelectUserDaoimpl implements SelectUserDao{

	public List<D_User> SelectUser(int page, int size) throws Exception {
		String sql="select * from d_user where user_integral<10 limit ?,?";
		List<D_User> users=new ArrayList<D_User>();
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement pps=conn.prepareStatement(sql);
		pps.setInt(1, (page-1)*size);
		pps.setInt(2, size);
		ResultSet rs=pps.executeQuery();
		while(rs.next()){
			D_User user=new D_User();
			user.setId(rs.getInt(1));
			user.setEmail(rs.getString(2));
			user.setNickname(rs.getString(3));
			user.setPassword(rs.getString(4));
			user.setUser_integral(rs.getInt(5));
			user.setIs_email_verify(rs.getString(6));
			user.setEmail_verify_code(rs.getString(7));
			user.setLast_login_time(rs.getLong(8));
			user.setLast_login_ip(rs.getString(9));
			users.add(user);
		}
		return users;
	}

	public int SelectUsers() throws Exception {
		String sql="select count(*) from d_user";
		
		Connection conn=ConnectionManagement.getConnection();
		
		PreparedStatement pps=conn.prepareStatement(sql);
		ResultSet rs=pps.executeQuery();
		int size;
		rs.next();
		size=rs.getInt(1);
	
		int b=(size/Constant.SIZE==0?size/Constant.SIZE:size/Constant.SIZE+1);
		return b;
	}

	public List<D_User> SelectFindUser(String email, String alise)
			throws Exception {
	if(email.equals("")&&alise.equals("")){
		return new ArrayList<D_User>();
	}
		StringBuilder sb=new StringBuilder();
		sb.append("select * from d_user ");
		if(!email.equals("")){
			sb.append("where email=? ");
		}
		if(!email.equals("")){
			if(!alise.equals("")){
				sb.append("and nickname=?");
			}
		}else{
			if(!alise.equals("")){
				sb.append("where nickname=?");
			}
		}
		
		String sql=sb.toString();
		List<D_User> users=new ArrayList<D_User>();
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement pps=conn.prepareStatement(sql);
		if(!email.equals("")){
			pps.setString(1,email );
			if(!alise.equals("")){
				pps.setString(2, alise);
			}
		}else{
			pps.setString(1, alise);
		}
	
		
		ResultSet rs=pps.executeQuery();
		while(rs.next()){
			D_User user=new D_User();
			user.setId(rs.getInt(1));
			user.setEmail(rs.getString(2));
			user.setNickname(rs.getString(3));
			user.setPassword(rs.getString(4));
			user.setUser_integral(rs.getInt(5));
			user.setIs_email_verify(rs.getString(6));
			user.setEmail_verify_code(rs.getString(7));
			user.setLast_login_time(rs.getLong(8));
			user.setLast_login_ip(rs.getString(9));
			users.add(user);
		}
		return users;
	}

}
