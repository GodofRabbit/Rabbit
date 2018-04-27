package edu.sram.dao;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.apache.commons.beanutils.BeanUtils;

import edu.sram.entity.Page;

public class BaseDao {
	public static String username;
	public static String password;
	public static String driver;
	public static String url;

	public Connection conn = null;
	public ResultSet rs = null;
	public PreparedStatement pstmt =null;
	
	//static 代码块。类被加载的时候执行
	static{
		loadConfig();
	}
	
	public static void loadConfig(){
		InputStream is = BaseDao.class.getResourceAsStream("jdbc.properties");
		Properties properties = new Properties();
		try {
			properties = new Properties();
			properties.load(is);
			username = properties.getProperty("jdbc.username").trim();
			password = properties.getProperty("jdbc.password").trim();
			driver = properties.getProperty("jdbc.driver").trim();
			url = properties.getProperty("jdbc.url").trim();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 获取数据库连接
	public Connection getConnection()  {
		try {
			Class.forName(driver);// 动态加载类
			conn = DriverManager.getConnection(BaseDao.url,BaseDao.username,BaseDao.password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	// 释放资源
	public void release() {
		try {
			// 5. 释放资源 先打开的最后关
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (pstmt != null) {
				pstmt.close();
				pstmt = null;
			}
			if (conn != null) {
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 查询通用方法
	public <T> List<T> query(String sql,Class<T> clazz,Object... paramsValue) throws Exception, InvocationTargetException {
		List<T> list = new ArrayList<T>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			for (int i = 0; i < paramsValue.length; i++) {
				pstmt.setObject(i+1, paramsValue[i]);
			}
			rs = pstmt.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData(); //结果集的元数据
			int columnCount = rsmd.getColumnCount();//获取列的数量
			while (rs.next()) {
				T newInstance = clazz.newInstance();
				 for (int i = 0; i < columnCount; i++) { //有多少列循环多少次
					String columnName = rsmd.getColumnName(i+1);//获取列名
					Object object = rs.getObject(columnName);
					//给哪个对象赋值  newInstance  赋什么值  object  给哪个属性赋值  columnName  调用这个对象的什么方法进行赋值  setXXX
					BeanUtils.copyProperty(newInstance, columnName, object);//哪个对象，的哪个字段，赋什么值
				 }
				 list.add(newInstance);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			release();
		}
		return list;
		
		
	}

	public boolean update(String sql,Object...parameters) {
		int executeUpdate=0;
		try {
			conn = getConnection();
			pstmt =conn.prepareStatement(sql);
			for (int i = 0; i < parameters.length; i++) {
				pstmt.setObject(i+1, parameters[i]);//给sql设置参数    
			}
			executeUpdate = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			release();
		}
		return  executeUpdate>0?true:false;
	}
	
	
	public <T> Page<T> findPage(String sql,String countSql,Class<T> clazz,int currentPage,int pageSize, List paramsValue) throws Exception, InvocationTargetException {
		int offset = (currentPage-1)*pageSize;
		Page<T> page = new Page<T>();
		int totalRecord =0;
		List<T> list = new ArrayList<T>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql+" limit ?,?");
			for (int i = 0; i < paramsValue.size(); i++) {
				pstmt.setObject(i+1, paramsValue.get(i));
			}
			pstmt.setInt(paramsValue.size()+1, offset);
			pstmt.setInt(paramsValue.size()+2, pageSize);
			rs = pstmt.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData(); //结果集的元数据
			int columnCount = rsmd.getColumnCount();//获取列的数量
			while (rs.next()) {
				T newInstance = clazz.newInstance();
				 for (int i = 0; i < columnCount; i++) { //有多少列循环多少次
					String columnName = rsmd.getColumnName(i+1);//获取列名
					Object object = rs.getObject(columnName);
					//给哪个对象赋值  newInstance  赋什么值  object  给哪个属性赋值  columnName  调用这个对象的什么方法进行赋值  setXXX
					BeanUtils.copyProperty(newInstance, columnName, object);//哪个对象，的哪个字段，赋什么值
				 }
				 list.add(newInstance);
			}
			//统计条数
			pstmt = conn.prepareStatement(countSql);
			for (int i = 0; i < paramsValue.size(); i++) {
				pstmt.setObject(i+1, paramsValue.get(i));
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				totalRecord=rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			release();
		}
		page.setDataList(list);
		page.setTotalRecord(totalRecord);
		page.setCurrentPage(currentPage);
		page.setPageSize(pageSize);
		page.setTotalPage((totalRecord-1)/pageSize+1);
		return page;
	}
}
