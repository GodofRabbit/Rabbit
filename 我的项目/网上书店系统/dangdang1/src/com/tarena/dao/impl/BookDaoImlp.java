package com.tarena.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tarena.dao.BookDao;
import com.tarena.entity.Book2;
import com.tarena.entity.BookListAll;
import com.tarena.util.ConnectionManagement;



public class BookDaoImlp implements BookDao{

	public Book2 findBookById(int id) throws Exception {
		String sql="select * from d_book where id=?";
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement pps=conn.prepareStatement(sql);
		pps.setInt(1, id);
		ResultSet rs=pps.executeQuery();
		Book2 b=new Book2();
		if(rs.next()){
			b.setId(rs.getInt(1));
			b.setAuthor(rs.getString(2));
			b.setPublishing(rs.getString(3));
			b.setPublishtime(rs.getLong(4));
			b.setWordnumber(rs.getString(5));
			b.setWhichediion(rs.getString(6));
			b.setTotalpage(rs.getString(7));
			b.setPirinttime(rs.getInt(8));
			b.setPrint_number(rs.getString(9));
			b.setIsbn(rs.getString(10));
			b.setAuthorsummary(rs.getString(11));
			b.setCatalogue(rs.getString(12));
		}
		return b;
	}

	public List<BookListAll> findBookAll(int page,int size) throws Exception {
		// TODO Auto-generated method stub
		String sql="select a.id,a.product_name,a.add_time,a.fixed_price,a.dang_price,a.product_pic,a.author,a.publishing,a.publish_time,a.word_number,a.which_edtion,a.total_page,a.isbn,a.cat_id,dc.name,dc.en_name from (select dp.id,dp.product_name,dp.has_deleted,dp.add_time,dp.fixed_price,dp.dang_price,dp.product_pic,db.author,db.publishing,db.publish_time,db.word_number,db.which_edtion,db.total_page,db.isbn,dcp.cat_id from d_product dp left join d_book db on dp.id=db.id left join d_category_product dcp on dp.id=dcp.product_id ) a left join d_category dc on a.cat_id=dc.id where a.has_deleted=0 order by a.id limit ?,?";
		//select a.id,a.product_name,a.add_time,a.fixed_price,a.dang_price,
		//a.product_pic,a.author,a.publishing,
		//a.publish_time,a.word_number,a.which_edtion,a.total_page,a.isbn,a.cat_id,dc.name,dc.en_name
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement pps=conn.prepareStatement(sql);
		pps.setInt(1, (page-1)*size);
		pps.setInt(2, size);
		ResultSet rs=pps.executeQuery();
		
		List<BookListAll> books=new ArrayList<BookListAll>();
		while (rs.next()){
			BookListAll bla=new BookListAll();
			bla.setId(rs.getInt(1));
			bla.setProductName(rs.getString(2));
			bla.setAddTime(rs.getLong(3));
			bla.setFixedPrice(rs.getDouble(4));
			bla.setDangPrice(rs.getDouble(5));
			bla.setProductPic(rs.getString(6));
			bla.setAuthor(rs.getString(7));
			bla.setPublishing(rs.getString(8));
			bla.setPublishtime(rs.getLong(9));
			bla.setWordnumber(rs.getString(10));
			bla.setWhichediion(rs.getString(11));
			bla.setTotalpage(rs.getString(12));
			bla.setIsbn(rs.getString(13));
			bla.setCatId(rs.getInt(14));
			bla.setName(rs.getString(15));
			bla.setEn_name(rs.getString(16));
			books.add(bla);
		}
		return books;
	}

	public int findBookAllTotal() throws Exception {
		// TODO Auto-generated method stub
		String sql="select count(*) from (select dp.id,dp.product_name,dp.has_deleted,dp.add_time,dp.fixed_price,dp.dang_price,dp.product_pic,db.author,db.publishing,db.publish_time,db.word_number,db.which_edtion,db.total_page,db.isbn,dcp.cat_id from d_product dp left join d_book db on dp.id=db.id left join d_category_product dcp on dp.id=dcp.product_id ) a left join d_category dc on a.cat_id=dc.id where a.has_deleted=0 order by a.id";
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement pps=conn.prepareStatement(sql);
		ResultSet rs=pps.executeQuery();
		int xb=0;
		while(rs.next()){
			xb=rs.getInt(1);
		}
		return xb;
	}

	public void deleteBookById(int id) throws Exception {
		// TODO Auto-generated method stub
		String sql="update d_product set has_deleted=1 where id=?";
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement pps=conn.prepareStatement(sql);
		pps.setInt(1, id);
		int x=pps.executeUpdate();
	}

	public List<BookListAll> findBookByParam(long ttemp, String bookname,
			double momey, String author, String pushlish, String isbn,String xuanze)
			throws Exception {
		// TODO Auto-generated method stub
		String sql="select a.id,a.product_name,a.add_time,a.fixed_price,a.dang_price,a.product_pic,a.author,a.publishing,a.publish_time,a.word_number,a.which_edtion,a.total_page,a.isbn,a.cat_id,dc.name,dc.en_name from (select dp.id,dp.product_name,dp.has_deleted,dp.add_time,dp.fixed_price,dp.dang_price,dp.product_pic,db.author,db.publishing,db.publish_time,db.word_number,db.which_edtion,db.total_page,db.isbn,dcp.cat_id from d_product dp left join d_book db on dp.id=db.id left join d_category_product dcp on dp.id=dcp.product_id ) a left join d_category dc on a.cat_id=dc.id where a.has_deleted=0 ";
		//select a.id,a.product_name,a.add_time,a.fixed_price,a.dang_price,
		//a.product_pic,a.author,a.publishing,
		//a.publish_time,a.word_number,a.which_edtion,a.total_page,a.isbn,a.cat_id,dc.name,dc.en_name
		StringBuilder sb=new StringBuilder(sql);
		if(ttemp !=0L){
			sb.append(" and a.add_time <=?");
		}
		if(!bookname.equals("")){
			sb.append(" and a.product_name like ?");
		}
		if(momey!=0.0){
			sb.append(" and a.dang_price =?");
		}
		if(!author.equals("")){
			sb.append(" and a.author like ?");
		}
		if(!pushlish.equals("")){
			sb.append(" and a.publishing like ?");
		}
		if(!isbn.equals("")){
			sb.append(" and a.isbn like ?");
		}
		int xuanze1=Integer.parseInt(xuanze);
		if(xuanze1!=0){
			sb.append(" and a.cat_id =?");
		}

		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement pps=conn.prepareStatement(sb.toString());
		int index=1;
		if(ttemp !=0L){
			
			pps.setLong(index++, ttemp);
		}
		if(!bookname.equals("")){
			pps.setString(index++,bookname);
		}
		if(momey!=0.0){
			pps.setDouble(index++,momey);
		}
		if(!author.equals("")){
			pps.setString(index++,author);
		}
		if(!pushlish.equals("")){
			pps.setString(index++,pushlish);
		}
		if(!isbn.equals("")){
			pps.setString(index++,isbn);
		}
		if(xuanze1!=0){
			pps.setInt(index++,xuanze1);
		}
		ResultSet rs=pps.executeQuery();
		
		List<BookListAll> books=new ArrayList<BookListAll>();
		while (rs.next()){
			BookListAll bla=new BookListAll();
			bla.setId(rs.getInt(1));
			bla.setProductName(rs.getString(2));
			bla.setAddTime(rs.getLong(3));
			bla.setFixedPrice(rs.getDouble(4));
			bla.setDangPrice(rs.getDouble(5));
			bla.setProductPic(rs.getString(6));
			bla.setAuthor(rs.getString(7));
			bla.setPublishing(rs.getString(8));
			bla.setPublishtime(rs.getLong(9));
			bla.setWordnumber(rs.getString(10));
			bla.setWhichediion(rs.getString(11));
			bla.setTotalpage(rs.getString(12));
			bla.setIsbn(rs.getString(13));
			bla.setCatId(rs.getInt(14));
			bla.setName(rs.getString(15));
			bla.setEn_name(rs.getString(16));
			books.add(bla);
		}
		return books;
	}

	public void insertInfoB(BookListAll bla) throws Exception {
		// TODO Auto-generated method stub
		String aup="作者是好人";
		long printt=1L;
		String cat="这真是一本好书啊";
		String sql="insert into d_book (id,author,publishing,publish_time,word_number,which_edtion,total_page,print_time,isbn,author_summary,catalogue) values(?,?,?,?,?,?,?,?,?,?,?)";
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement pps=conn.prepareStatement(sql);
		pps.setInt(1, bla.getId());
		pps.setString(2, bla.getAuthor());
		pps.setString(3, bla.getPublishing());
		pps.setLong(4, bla.getPublishtime());
		pps.setString(5, bla.getWordnumber());
		pps.setString(6, bla.getWhichediion());
		pps.setString(7, bla.getTotalpage());
		pps.setLong(8, printt);
		pps.setString(9,bla.getIsbn());
		pps.setString(10, aup);
		pps.setString(11, cat);
		int b=pps.executeUpdate();
		
	}

	public BookListAll findnewBook(int id) throws Exception {
		// TODO Auto-generated method stub
		String sql="select a.id,a.product_name,a.add_time,a.fixed_price,a.dang_price,a.product_pic,a.author,a.publishing,a.publish_time,a.word_number,a.which_edtion,a.total_page,a.isbn,a.cat_id,dc.name,dc.en_name from (select dp.id,dp.product_name,dp.has_deleted,dp.add_time,dp.fixed_price,dp.dang_price,dp.product_pic,db.author,db.publishing,db.publish_time,db.word_number,db.which_edtion,db.total_page,db.isbn,dcp.cat_id from d_product dp left join d_book db on dp.id=db.id left join d_category_product dcp on dp.id=dcp.product_id ) a left join d_category dc on a.cat_id=dc.id where a.id=?";
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement pps=conn.prepareStatement(sql);
		pps.setInt(1, id);
		BookListAll bla=new BookListAll();
		ResultSet rs=pps.executeQuery();
		while(rs.next()){
			bla.setId(rs.getInt(1));
			bla.setProductName(rs.getString(2));
			bla.setAddTime(rs.getLong(3));
			bla.setFixedPrice(rs.getDouble(4));
			bla.setDangPrice(rs.getDouble(5));
			bla.setProductPic(rs.getString(6));
			bla.setAuthor(rs.getString(7));
			bla.setPublishing(rs.getString(8));
			bla.setPublishtime(rs.getLong(9));
			bla.setWordnumber(rs.getString(10));
			bla.setWhichediion(rs.getString(11));
			bla.setTotalpage(rs.getString(12));
			bla.setIsbn(rs.getString(13));
			bla.setCatId(rs.getInt(14));
			bla.setName(rs.getString(15));
			bla.setEn_name(rs.getString(16));
			break;
		}
		return bla;
	}

	public void deletenewB(int id) throws Exception {
		// TODO Auto-generated method stub
		String sql="delete from d_book where id=?";
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement ppst=conn.prepareStatement(sql);
		ppst.setInt(1, id);
		int b=ppst.executeUpdate();
		
	}

	public void upateAuAndPUAndPage(String author, String pushing,
			String pagenumber, int id) throws Exception {
		// TODO Auto-generated method stub
		String sql="update d_book set author=?,publishing=?,total_page=? where id=? ";
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement ppst=conn.prepareStatement(sql);
		ppst.setString(1, author);
		ppst.setString(2, pushing);
		ppst.setString(3, pagenumber);
		ppst.setInt(4, id);
		int b=ppst.executeUpdate();
	}

}
