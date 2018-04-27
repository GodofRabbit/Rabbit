package com.tarena.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tarena.dao.CategroyDao;
import com.tarena.entity.Category;
import com.tarena.util.ConnectionManagement;


public class CategoryDaoImlp implements CategroyDao{

	public List<Category> findBook() throws Exception {
		String sql="select * from d_category order by turn";
		List<Category> gorya=new ArrayList<Category>();
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement pps=conn.prepareStatement(sql);
		ResultSet rs=pps.executeQuery();
		while(rs.next()){
			Category g=new Category();
			g.setId(rs.getInt(1));
			g.setTurn(rs.getInt(2));
			g.setEnName(rs.getString(3));//该 
			g.setName(rs.getString(4));
			g.setDescription(rs.getString(5));
			g.setParentId(rs.getInt(6));//该
			gorya.add(g);
			
		}
		return gorya;
	}

	public List<Category> findparent(int pid) throws Exception {
	
		String sql="select dc.*,count(dcp.product_id) me from d_category dc left  join d_category_product dcp on (dc.id=dcp.cat_id) where parent_id=? group by dc.id order by turn";
		List<Category> gorya=new ArrayList<Category>();
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement pps=conn.prepareStatement(sql);
		pps.setInt(1, pid);
		ResultSet rs=pps.executeQuery();
		while(rs.next()){
			Category g=new Category();
			g.setId(rs.getInt(1));
			g.setTurn(rs.getInt(2));
			g.setEnName(rs.getString(3));
			g.setName(rs.getString(4));
			g.setDescription(rs.getString(5));
			g.setParentId(rs.getInt(6));
			g.setNum(rs.getInt(7));
			gorya.add(g);
			
		}
		return gorya;
	}

	public String findStringBook(int pid) throws Exception {
		String sql="select name from d_category where id=?";
		String dangdang="";
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement pps=conn.prepareStatement(sql);
		pps.setInt(1, pid);
		ResultSet rs=pps.executeQuery();
		if(rs.next()){
			dangdang=rs.getString(1);
		}
		return dangdang;
	}

	public void insertIX(int id, int xuanze) throws Exception {
		// TODO Auto-generated method stub
		String sql="insert into d_category_product (product_id,cat_id) values(?,?)";
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement pps=conn.prepareStatement(sql);
		pps.setInt(1, id);
		pps.setInt(2, xuanze);
		int r=pps.executeUpdate();
		System.out.println("成功");
	}

}
