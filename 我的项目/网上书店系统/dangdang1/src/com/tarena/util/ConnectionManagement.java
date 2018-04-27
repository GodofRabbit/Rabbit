package com.tarena.util;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSourceFactory;

public class ConnectionManagement {
	private static DataSource dataSource;
	private static ThreadLocal<Connection> conLocal=
		new ThreadLocal<Connection>();//这是线程保护
	static{
		Properties pro=new Properties();
		try {
			pro.load(ConnectionManagement.class.getClassLoader().getResourceAsStream("sql.properties"));
			dataSource=BasicDataSourceFactory.createDataSource(pro);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public static Connection getConnection() throws SQLException{
		Connection con=conLocal.get();
		if(con==null||con.isClosed()){
			con=dataSource.getConnection();
			conLocal.set(con);
			return con;
		}
		return con;
		
	}
	public static void close(){
		Connection con=conLocal.get();
		conLocal.set(null);
		if(con!=null){
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public static void main(String[] args) throws SQLException {
		Connection con=getConnection();
		System.out.println(con.hashCode());
		Connection xwj=getConnection();
		System.out.println(xwj.hashCode());
		close();
		System.out.println(getConnection().hashCode());
		close();
	}
}
