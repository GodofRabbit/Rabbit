package com.tarena.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import com.tarena.entity.D_User;

import com.tarena.entity.User;
import com.tarena.entity.UserInfo;
import com.tarena.util.ConnectionManagement;

public class UserDao {
	private static String ADD_USER="insert into d_user(email,nickname," +
			"password,user_integral,is_email_verify,email_verify_code," +
			"last_login_time,last_login_ip) values(?,?,?,?,?,?,?,?)";
	private static String CHECK_EMAIL="select count(*) from d_user where email=?";
	private static String GET_VERYEMAILCODE="select email_verify_code " +
			"from d_user where id=?";
	private static String LOGIN_USER="select password from d_user where email=?";
	private static String UPDATE_ISVERYEMAILCODE="update d_user set is_email_verify='Y' where id=? ";
	private static String GET_LOGINED_USER="select id,email,nickname from d_user where id=?";
	private static String GET_LOGINED_USER_BY_EMAIL="select id,email,nickname from d_user where email=?";
	private static String ISVERYEMAILCODE="select is_email_verify from d_user where email=?";
	public static  void updateUser(D_User user) throws Exception {
		// TODO Auto-generated method stub
		String sql="update d_user set password=?,nickname=? where id=?";
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement ppst=conn.prepareStatement(sql);
		ppst.setString(1, user.getPassword());
		ppst.setString(2, user.getNickname());
		ppst.setInt(3, user.getId());
		ppst.executeUpdate();
	}
	public static boolean findByEmail(String Email) throws Exception {
		String sql="select * from d_user where email=?";
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement ppst=conn.prepareStatement(sql);
		ppst.setString(1, Email);
		ResultSet rs=ppst.executeQuery();
		if(rs.next()){
			
			return true;
		}else{
		return false;
		}
	}
	public static void addUser(D_User b) throws Exception {
		String addsql="insert into d_user(email,nickname,password,user_integral,is_email_verify,email_verify_code,last_login_time,last_login_ip) values(?,?,?,?,?,?,?,?)";
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement pps=conn.prepareStatement(addsql,Statement.RETURN_GENERATED_KEYS);
		pps.setString(1, b.getEmail());
		pps.setString(2, b.getNickname());
		pps.setString(3,b.getPassword());
		pps.setInt(4,b.getUser_integral());
		pps.setString(5,b.getIs_email_verify());
		pps.setString(6,b.getEmail_verify_code());
		pps.setLong(7, b.getLast_login_time());
		pps.setString(8, b.getLast_login_ip());
		pps.executeUpdate();
		//获取自动增长工具值
		java.sql.ResultSet rs=pps.getGeneratedKeys();
		rs.next();
		int id=rs.getInt(1);
		b.setId(id);
		//不写关闭了进入拦截器同一操作
		
	}
	public static void XiuGaiQuanXian(int id) throws Exception {
		String sql="update d_user set user_integral=10 where id=?";
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement ppst=conn.prepareStatement(sql);
		ppst.setInt(1, id);
		ppst.executeUpdate();
	}
	public static void addUser(User user) throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try{
			con=ConnectionManagement.getConnection();
			ps=con.prepareStatement(ADD_USER);
			ps.setString(1, user.getEmail());
			ps.setString(2, user.getNickName());
			ps.setString(3, user.getPassword());
			ps.setInt(4, user.getUserIntegral());
			ps.setString(5, user.getIsEmailVerify());
			ps.setString(6, user.getEmailVeryCode());
			ps.setLong(7, user.getLastLoginTime());
			ps.setString(8, user.getLastLoginIp());
			ps.executeUpdate();
			rs=ps.getGeneratedKeys();
			rs.next();
			user.setId(rs.getInt(1));
			
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	public static D_User findById(int id) throws Exception {
		String sql="select * from d_user where id=?";
		D_User user=new D_User();
		Connection conn=ConnectionManagement.getConnection();
		PreparedStatement ppst=conn.prepareStatement(sql);
		ppst.setInt(1, id);
		ResultSet rs=ppst.executeQuery();
		while(rs.next()){
			user.setId(rs.getInt(1));
			user.setEmail(rs.getString(2));
			user.setNickname(rs.getString(3));
			user.setPassword(rs.getString(4));
			user.setUser_integral(rs.getInt(5));
			user.setIs_email_verify(rs.getString(6));
			user.setEmail_verify_code(rs.getString(7));
			user.setLast_login_time(rs.getLong(8));
			user.setLast_login_ip(rs.getString(9));
		}
		return user;
	}
	public static int checkEmail(String email) throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try{
			con=ConnectionManagement.getConnection();
			ps=con.prepareStatement(CHECK_EMAIL);
			ps.setString(1,email);
			rs=ps.executeQuery();
			rs.next();
			return rs.getInt(1);
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	public static String getEmailVeryCode(int id) throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try{
			con=ConnectionManagement.getConnection();
			ps=con.prepareStatement(GET_VERYEMAILCODE);
			ps.setInt(1,id);
			rs=ps.executeQuery();
			rs.next();
			return rs.getString(1);
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	public static boolean userLogin(String email,String password) throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try{
			con=ConnectionManagement.getConnection();
			ps=con.prepareStatement(LOGIN_USER);
			ps.setString(1,email);
			rs=ps.executeQuery();
			if(!rs.next()){
				return false;
			}
			String sqlPassword=rs.getString(1);
			if(password.equals(sqlPassword)){
				return true;
			}else{
				return false;
			}
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
		
	}
	public static void deleteUser(int id) throws Exception {
		// TODO Auto-generated method stub
		String sql="delete from d_user where id=?";
			Connection conn=ConnectionManagement.getConnection();
		PreparedStatement ppst=conn.prepareStatement(sql);
		ppst.setInt(1, id);
		ppst.executeUpdate();
	}
	public static Boolean isGuan(String id)throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try{
			con=ConnectionManagement.getConnection();
			ps=con.prepareStatement("select user_integral from d_user where email=? ");
			ps.setString(1,id);
			rs=ps.executeQuery();
			rs.next();
			int option=rs.getInt(1);
			if(option==10){
				return true;
			}else{
				return false;
			}
			
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	public static void updateIsVerifyCode(int id) throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		try{
			con=ConnectionManagement.getConnection();
			ps=con.prepareStatement(UPDATE_ISVERYEMAILCODE);
			ps.setInt(1,id);
			ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	public static UserInfo getLoginedUser(int id) throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try{
			con=ConnectionManagement.getConnection();
			ps=con.prepareStatement(GET_LOGINED_USER);
			ps.setInt(1,id);
			rs=ps.executeQuery();
			rs.next();
			return new UserInfo(rs.getInt(1), rs.getString(2), rs.getString(3));
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	public static UserInfo getLoginedUserByEmail(String email) throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try{
			con=ConnectionManagement.getConnection();
			ps=con.prepareStatement(GET_LOGINED_USER_BY_EMAIL);
			ps.setString(1,email);
			rs=ps.executeQuery();
			rs.next();
			return new UserInfo(rs.getInt(1), rs.getString(2), rs.getString(3));
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	public static boolean isUnlock(String email) throws Exception{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try{
			con=ConnectionManagement.getConnection();
			ps=con.prepareStatement(ISVERYEMAILCODE);
			ps.setString(1,email);
			rs=ps.executeQuery();
			rs.next();
			String option=rs.getString(1);
			if("Y".equalsIgnoreCase(option)){
				return true;
			}else{
				return false;
			}
			
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}

}
