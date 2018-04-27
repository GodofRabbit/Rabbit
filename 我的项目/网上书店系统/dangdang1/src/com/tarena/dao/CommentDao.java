package com.tarena.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tarena.entity.Comment;
import com.tarena.util.ConnectionManagement;

public class CommentDao {
	private static String ADD_NEW_COMMENT="insert into comment (product_id,user_id,star,comment,comment_time)" +
			" values(?,?,?,?,?)";
	private static String GETCOMMENTS="select du.nickname,du.pic_address,c.* from d_user du join comment c on du.id=c.user_id" +
			" where product_id=? order by comment_time desc limit 0,10";
	private static String GET_MAX_NUM_OF_COMMENTS="select count(*) from comment where product_id=?";
	public static void addCommet(Comment com)throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		try{
			con=ConnectionManagement.getConnection();
			ps=con.prepareStatement(ADD_NEW_COMMENT);
			ps.setInt(1, com.getProductId());
			ps.setInt(2, com.getUserId());
			ps.setInt(3, com.getStar());
			ps.setString(4, com.getComment());
			ps.setLong(5, com.getCommentTime());
			ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	public static List<Comment> getComments(int producId)throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Comment> comList=new ArrayList<Comment>();
		try{
			con=ConnectionManagement.getConnection();
			ps=con.prepareStatement(GETCOMMENTS);
			ps.setInt(1, producId);
			rs=ps.executeQuery();
			while(rs.next()){
				Comment com=new Comment();
				com.setUserName(rs.getString(1));
				com.setPicAddress(rs.getString(2));
				com.setId(rs.getInt(3));
				com.setProductId(rs.getInt(4));
				com.setUserId(rs.getInt(5));
				com.setStar(rs.getInt(6));
				com.setComment(rs.getString(7));
				com.setCommentTime(rs.getLong(8));
				comList.add(com);
			}
			return comList;
			
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	public static int getMaxNumOfComments(int producId)throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try{
			con=ConnectionManagement.getConnection();
			ps=con.prepareStatement(GET_MAX_NUM_OF_COMMENTS);
			ps.setInt(1, producId);
			rs=ps.executeQuery();
			rs.next();
			int num=rs.getInt(1);
			return num;
			
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}

}
