package com.tarena.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tarena.entity.Book;
import com.tarena.entity.Option;
import com.tarena.util.ConnectionManagement;

public class SearchDao {
	private static String getSearchOption="select id,name from d_category where" +
			" parent_id=1";
	private static String SEARCH_BOOKS_FROM_CAT="select dp.*,db.*,(select avg(star) from comment where product_id=db.id) star," +
			"(select count(*) from comment where product_id=db.id) comments" +
			" from d_category_product dcp join d_product dp on dcp.product_id=dp.id join d_book db on dp.id=db.id" +
			" where dcp.cat_id=? and dp.product_name like ? limit ?,?";
	private static String SEARCH_BOOKS_FROM_ALL="select dp.*,db.*,(select avg(star) from comment where product_id=db.id) star," +
	"(select count(*) from comment where product_id=db.id) comments" +
	" from d_product dp join d_book db on dp.id=db.id" +
	" where dp.product_name like ? limit ?,?";
	private static String ALLRESULT_ID="select  dcp.product_id from d_product dp left join d_category_product dcp " +
			"on dcp.product_id=dp.id" +
			" where dp.product_name like ?";
	private static String GET_MAX_PAGES="select count(*) " +
			"from d_category_product dcp join d_product dp on dcp.product_id=dp.id " +
			"where dcp.cat_id=? and dp.product_name like ?"; 
	public static List<Option> getSearchOption() throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Option> opts=new ArrayList<Option>();
		try{
			con=ConnectionManagement.getConnection();
			ps=con.prepareStatement(getSearchOption);
			rs=ps.executeQuery();
			while(rs.next()){
				Option opt=new Option(rs.getString("name"), rs.getString("id"));
				opts.add(opt);
			}
			return opts;
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	public static List<Book> searchBooksByCatId(int id,String keyword,int page,int size) throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Book> list=new ArrayList<Book>();
		try{
			con=ConnectionManagement.getConnection();
			ps=con.prepareStatement(SEARCH_BOOKS_FROM_CAT);
			ps.setInt(1,id);
			ps.setString(2,keyword);
			ps.setInt(3, size*(page-1));
			ps.setInt(4, size);
			rs=ps.executeQuery();
			while(rs.next()){
				Book book=new Book();
				book.setId(rs.getInt(1));
				book.setProductName(rs.getString("product_name"));
				book.setDescription(rs.getString("description"));
				book.setAddTime(rs.getLong("add_time"));
				book.setFixedPrice(rs.getDouble("fixed_price"));
				book.setDangPrice(rs.getDouble("dang_price"));
				book.setKeyWords(rs.getString("keywords"));
				book.setHasDeleted(rs.getInt("has_deleted"));
				book.setProductPic(rs.getString("product_pic"));
				book.setAuthor(rs.getString("author"));
				book.setPublishing(rs.getString("publishing"));
				book.setPublishTime(rs.getLong("publish_time"));
				book.setWordNumber(rs.getString("word_number"));
				book.setWhichEdtion(rs.getString("which_edtion"));
				book.setTotalPage(rs.getString("total_page"));
				book.setPrintTime(rs.getInt("print_time"));
				book.setPrintNumber(rs.getString("print_number"));
				book.setIsbn(rs.getString("isbn"));
				book.setAuthorSummary(rs.getString("author_summary"));
				book.setCatalogue(rs.getString("catalogue"));
				book.setStar(rs.getDouble("star"));
				book.setComments(rs.getInt("comments"));
				list.add(book);
			}
			return list;
			
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	public static List<Book> searchBooksByAll(String keyword,int page,int size) throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Book> list=new ArrayList<Book>();
		try{
			con=ConnectionManagement.getConnection();
			ps=con.prepareStatement(SEARCH_BOOKS_FROM_ALL);
			ps.setString(1,keyword);
			ps.setInt(2, size*(page-1));
			ps.setInt(3, size);
			rs=ps.executeQuery();
			while(rs.next()){
				Book book=new Book();
				book.setId(rs.getInt(1));
				book.setProductName(rs.getString("product_name"));
				book.setDescription(rs.getString("description"));
				book.setAddTime(rs.getLong("add_time"));
				book.setFixedPrice(rs.getDouble("fixed_price"));
				book.setDangPrice(rs.getDouble("dang_price"));
				book.setKeyWords(rs.getString("keywords"));
				book.setHasDeleted(rs.getInt("has_deleted"));
				book.setProductPic(rs.getString("product_pic"));
				book.setAuthor(rs.getString("author"));
				book.setPublishing(rs.getString("publishing"));
				book.setPublishTime(rs.getLong("publish_time"));
				book.setWordNumber(rs.getString("word_number"));
				book.setWhichEdtion(rs.getString("which_edtion"));
				book.setTotalPage(rs.getString("total_page"));
				book.setPrintTime(rs.getInt("print_time"));
				book.setPrintNumber(rs.getString("print_number"));
				book.setIsbn(rs.getString("isbn"));
				book.setAuthorSummary(rs.getString("author_summary"));
				book.setCatalogue(rs.getString("catalogue"));
				book.setStar(rs.getDouble("star"));
				book.setComments(rs.getInt("comments"));
				list.add(book);
			}
			return list;
			
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	public static List<Integer> getAllResultId(String keyword)throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try{
			con=ConnectionManagement.getConnection();
			ps=con.prepareStatement(ALLRESULT_ID);
			ps.setString(1, keyword);
			List<Integer> ids=new ArrayList<Integer>();
			rs=ps.executeQuery();
			while(rs.next()){
				ids.add(rs.getInt(1));
			}
			return ids;
			
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	public static int getMaxPage(int id,String keyword,int size)throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try{
			con=ConnectionManagement.getConnection();
			ps=con.prepareStatement(GET_MAX_PAGES);
			ps.setInt(1, id);
			ps.setString(2, keyword);
			rs=ps.executeQuery();
			rs.next();
			int page=(int)Math.ceil(rs.getDouble(1)/size);
			return page;
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	
	public static void main(String[] args) throws Exception {
		int xx=getMaxPage(1,("%¿Î%"),5);
		System.out.println(xx);
	}
}