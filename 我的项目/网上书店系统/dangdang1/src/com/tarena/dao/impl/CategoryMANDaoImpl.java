package com.tarena.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tarena.dao.CategoryMANDao;
import com.tarena.entity.Category;
import com.tarena.entity.Guanliyuanleftm;
import com.tarena.util.ConnectionManagement;


public class CategoryMANDaoImpl implements CategoryMANDao {
	public List<Guanliyuanleftm> findmanage() throws Exception{
		String sql="select * from d_managergongneng";
	
		List<Guanliyuanleftm> gorya=new ArrayList<Guanliyuanleftm>();
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement pps=conn.prepareStatement(sql);
		
		ResultSet rs=pps.executeQuery();
		
		while(rs.next()){
			Guanliyuanleftm g=new Guanliyuanleftm();
			g.setId(rs.getInt(1));
			
			
			g.setName(rs.getString(2));
			
			g.setParent_id(rs.getInt(3));
			gorya.add(g);
			
		}
		
		return gorya;
		
	}
}
