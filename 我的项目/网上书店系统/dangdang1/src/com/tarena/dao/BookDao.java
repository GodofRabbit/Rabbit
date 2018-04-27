package com.tarena.dao;

import java.util.List;

import com.tarena.entity.Book;
import com.tarena.entity.Book2;
import com.tarena.entity.BookListAll;


public interface BookDao {
	public Book2 findBookById(int id) throws Exception;
	public List<BookListAll> findBookAll(int page,int size) throws Exception;
	public int findBookAllTotal() throws Exception;
	public void deleteBookById(int id) throws Exception;
	public List<BookListAll> findBookByParam(long ttemp, String bookname,
			double momey, String author, String pushlish, String isbn,String xuanze) throws Exception;
	public void insertInfoB(BookListAll bla) throws Exception;
	public BookListAll findnewBook(int id) throws Exception;
	public void deletenewB(int id) throws Exception;
	public void upateAuAndPUAndPage(String author, String pushing,
			String pagenumber, int id)throws Exception;
}
