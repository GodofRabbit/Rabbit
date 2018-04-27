package com.tarena.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tarena.entity.Book;
import com.tarena.entity.Product;
import com.tarena.entity.Product1;
import com.tarena.util.ConnectionManagement;

public class ProductDao {
	private static String[] types=new String[]{"dp.add_time","dp.dang_price","buys","star"};
	private static String[] orders=new String[]{"desc",""};
	private static String FIND_NEW_PRODUCT="select * from d_product where has_deleted=0 " +
			"order by add_time desc limit 0,8";
	private static String GET_HOT_PROUDUCT="select * ,(select sum(product_num) from d_item where product_id=dp.id) max from" +
			" d_product dp order by max desc limit 8";
	private static String GET_BOOKS_BY_CATEGORY_ID="select dp.*,db.*,(select avg(star) from comment where product_id=db.id) star," +
			"(select count(*) from comment where product_id=db.id) comments,(select sum(product_num) from d_item where product_id=db.id) buys " +
			"from d_category_product dcp join " +
			"d_product dp on dcp.product_id=dp.id join d_book db " +
			"on dp.id=db.id where dcp.cat_id=? ";
	private static String GET_MAX_AMOUNT_BOOK="select count(*) from d_category_product where cat_id=?";
	private static String GET_RECOMMEND_PRODUCT="select dp.*,db.* from d_product dp  join d_book" +
			" db on dp.id=db.id order by rand() limit 2";
	private static String GET_PRODUCT_BY_ID="select * from d_product where id=?";
	private static String GET_BOOK_BY_ID="select dp.*,db.*,(select avg(star) from comment where product_id=db.id) star," +
			"(select count(*) from comment where product_id=db.id) comments"+" from d_book db join d_product dp on " +
			"dp.id=db.id where dp.id=? ";
	private static String GET_BOOKS_RANK="select * ,(select sum(product_num) from d_item where product_id=dp.id) max from" +
	" d_product dp order by max desc limit 10";
	
	public static List<Product> findNewProduct() throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Product> list=new ArrayList<Product>();
		try{
			con=ConnectionManagement.getConnection();
			ps=con.prepareStatement(FIND_NEW_PRODUCT);
			rs=ps.executeQuery();
			while(rs.next()){
				Product product=new Product(rs.getInt(1),rs.getString(2),
						rs.getString(3),rs.getLong(4),rs.getDouble(5),rs.getDouble(6),
						rs.getString(7),rs.getInt(8),rs.getString(9));
				list.add(product);		
			}
			return list;
			
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	public static boolean findIsbn(String isbn) throws Exception {
		// TODO Auto-generated method stub
		String sql="select * from d_book where isbn=?";
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement ppst=conn.prepareStatement(sql);
		ppst.setString(1, isbn);
		ResultSet rs=ppst.executeQuery();
		if(rs.next()){
			
			return true;
		}else{
		return false;
		}
	}
	public static int findMaxProductId() throws Exception {
		// TODO Auto-generated method stub
		int id=0;
		String sql="select id from d_product order by id desc limit 0,1";
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement pps=conn.prepareStatement(sql);
		ResultSet rs=pps.executeQuery();
		while(rs.next()){
			id=rs.getInt(1);
		}
		return id;
	}
	public static void updateHasDeleted(int id) throws Exception {
		// TODO Auto-generated method stub
		String sql="update d_product set has_deleted=0 where id=?";
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement ppst=conn.prepareStatement(sql);
		ppst.setInt(1, id);
		int b=ppst.executeUpdate();
		
	}
	public static void deletenewP(int id) throws Exception {
		// TODO Auto-generated method stub
		String sql="delete from d_product where id=?";
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement ppst=conn.prepareStatement(sql);
		ppst.setInt(1, id);
		int b=ppst.executeUpdate();
	
	}

	public static int insertInFoP(Product1 pduct) throws Exception {
		// TODO Auto-generated method stub
		int idtemp=0;
		if(pduct.getId()!=0){
			idtemp=pduct.getId()+1;
		}
		System.out.println(idtemp+"sadfdfdsfdsfdsfdsfdsd");
		String sql="insert into d_product (id,product_name,description,add_time,fixed_price,dang_price,keywords,has_deleted,product_pic) values(?,?,?,?,?,?,?,?,?)";
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement pps=conn.prepareStatement(sql);
		pps.setInt(1, idtemp);
		pps.setString(2, pduct.getProductName());
		pps.setString(3, pduct.getDescription());
		pps.setLong(4, pduct.getAddTime());
		pps.setDouble(5, pduct.getFixedPrice());
		pps.setDouble(6, pduct.getDangPrice());
		pps.setString(7, pduct.getKeyswords());
		pps.setInt(8, pduct.getHasDelete());
		pps.setString(9, pduct.getProductPic());
	
		int t=pps.executeUpdate();
		
		return idtemp;
		
	}
	public static Product1 findbyid(int id) throws Exception {
		String sql="select * from d_product where id=?";
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement pps=conn.prepareStatement(sql);
		pps.setInt(1, id);
		Product1 p=new Product1();
		ResultSet rs=pps.executeQuery();
		if(rs.next()){
			p.setId(rs.getInt(1));
			p.setProductName(rs.getString(2));
			p.setDescription(rs.getString(3));
			p.setAddTime(rs.getLong(4));
			p.setFixedPrice(rs.getDouble(5));
			p.setDangPrice(rs.getDouble(6));
			p.setKeyswords(rs.getString(7));
			p.setHasDelete(rs.getInt(8));
			p.setProductPic(rs.getString(9));
			
		}
		return p;
	}
	public static void updateImgName(String tempOtherPicName1,int id) throws Exception {
		// TODO Auto-generated method stub
		String sql="update d_product set product_pic=? where id=?";
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement ppst=conn.prepareStatement(sql);
		ppst.setString(1, tempOtherPicName1);
		ppst.setInt(2, id);
		int b=ppst.executeUpdate();
	}
	public static void updateBNANDmomey(String productname, double newjiage,int id)
	throws Exception {
		// TODO Auto-generated method stub
		String sql="update d_product set product_name=?, dang_price=? where id=?";
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement ppst=conn.prepareStatement(sql);
		ppst.setString(1, productname);
		ppst.setDouble(2, newjiage);
		ppst.setInt(3, id);
		int b=ppst.executeUpdate();
}

	public static List<Product> findHotProduct() throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Product> list=new ArrayList<Product>();
		try{
			con=ConnectionManagement.getConnection();
			ps=con.prepareStatement(GET_HOT_PROUDUCT);
			rs=ps.executeQuery();
			while(rs.next()){
				Product product=new Product(rs.getInt(1),rs.getString(2),
						rs.getString(3),rs.getLong(4),rs.getDouble(5),rs.getDouble(6),
						rs.getString(7),rs.getInt(8),rs.getString(9));
				list.add(product);		
			}
			return list;
			
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	public static List<Product> getRank() throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Product> list=new ArrayList<Product>();
		try{
			con=ConnectionManagement.getConnection();
			ps=con.prepareStatement(GET_BOOKS_RANK);
			rs=ps.executeQuery();
			while(rs.next()){
				Product product=new Product(rs.getInt(1),rs.getString(2),
						rs.getString(3),rs.getLong(4),rs.getDouble(5),rs.getDouble(6),
						rs.getString(7),rs.getInt(8),rs.getString(9));
				list.add(product);		
			}
			return list;
			
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	public static List<Book> findBooksByCatId(int id,int page,int size,int orderType,int order) throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Book> list=new ArrayList<Book>();
		try{
			con=ConnectionManagement.getConnection();
			String x=GET_BOOKS_BY_CATEGORY_ID+"order by "+types[orderType-1]+" "+orders[order-1]+" limit ?,?";
			ps=con.prepareStatement(x);
			ps.setInt(1,id);
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
	public static int getMaxAmount(int id) throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try{
			con=ConnectionManagement.getConnection();
			ps=con.prepareStatement(GET_MAX_AMOUNT_BOOK);
			ps.setInt(1, id);
			rs=ps.executeQuery();
			rs.next();
			return rs.getInt(1);
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	public static List<Book> getRecommendedBooks() throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<Book> list=new ArrayList<Book>();
		try{
			con=ConnectionManagement.getConnection();
			ps=con.prepareStatement(GET_RECOMMEND_PRODUCT);
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
				list.add(book);
			}
			return list;
			
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	public static Product findProductById(int id) throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try{
			con=ConnectionManagement.getConnection();
			ps=con.prepareStatement(GET_PRODUCT_BY_ID);
			ps.setInt(1,id);
			rs=ps.executeQuery();
			rs.next();
				Product product=new Product(rs.getInt(1),rs.getString(2),
						rs.getString(3),rs.getLong(4),rs.getDouble(5),rs.getDouble(6),
						rs.getString(7),rs.getInt(8),rs.getString(9));
			return product;
			
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	
	}
	public static Book findBooksById(int id) throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try{
			con=ConnectionManagement.getConnection();
			ps=con.prepareStatement(GET_BOOK_BY_ID);
			ps.setInt(1,id);
			rs=ps.executeQuery();
			rs.next();
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
			return book;
			
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	
}
