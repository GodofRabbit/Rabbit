package com.tarena.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tarena.entity.Category;
import com.tarena.util.ConnectionManagement;

public class CategoryDao {
	private static String GET_ALL_CATEGORY="select * from d_category order by turn";
	private static String GET_CATEGORYS_BY_PID="select dc.*,(select name from d_category where id=dc.parent_id) parentName,count(dcp.product_id) num " +
			"from d_category dc left join d_category_product dcp " +
			"on dc.id=dcp.cat_id where dc.parent_id=? " +
			"group by dc.id order by turn";
	
	public static List<Category> findAll() throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Category> list=new ArrayList<Category>();
		try{
			con=ConnectionManagement.getConnection();
			ps=con.prepareStatement(GET_ALL_CATEGORY);
			rs=ps.executeQuery();
			while(rs.next()){
				Category cat=new Category();
				cat.setId(rs.getInt("id"));
				cat.setTurn(rs.getInt("turn"));
				cat.setEnName(rs.getString("en_name"));
				cat.setName(rs.getString("name"));
				cat.setDescription(rs.getString("description"));
				cat.setParentId(rs.getInt("parent_id"));
				list.add(cat);
			}
			return list;
			
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
		
	}
	public static List<Category> getCategoryByParenetId(int pid) throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Category> list=new ArrayList<Category>();
		try{
			con=ConnectionManagement.getConnection();
			ps=con.prepareStatement(GET_CATEGORYS_BY_PID);
			ps.setInt(1,pid);
			rs=ps.executeQuery();
			while(rs.next()){
				Category cat=new Category();
				cat.setId(rs.getInt("id"));
				cat.setTurn(rs.getInt("turn"));
				cat.setEnName(rs.getString("en_name"));
				cat.setName(rs.getString("name"));
				cat.setDescription(rs.getString("description"));
				cat.setParentId(rs.getInt("parent_id"));
				cat.setParentName(rs.getString("parentName"));
				cat.setNum(rs.getInt("num"));
				list.add(cat);
			}
			return list;
			
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
		
	}
	
	
}
