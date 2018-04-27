package edu.sram.dao;

import java.util.ArrayList;
import java.util.List;

import edu.sram.entity.Admin;
import edu.sram.entity.Page;
import edu.sram.entity.User;

public class UserDaoImpl extends BaseDao implements UserDao{

	public boolean toAddUser(User user) throws Exception {
		String sql = "insert into t_user(username,password,realname,sex,birthday,phone,jointime) values(?,?,?,?,?,?,now())";
		return this.update(sql,user.getUsername(),user.getPassword(),user.getRealname(),user.getSex(),user.getBirthday(),user.getPhone());
	}

	public boolean deleteUser(int id) throws Exception {
		String sql = "delete from t_user where id=?";
		return this.update(sql,id);
	}

	public boolean editUser(User user) throws Exception {
		String sql = "update t_user set username=?,password=?,realname=?,sex=?,birthday=?,phone=? where id=?";
		return this.update(sql,user.getUsername(),user.getPassword(),user.getRealname(),user.getSex(),user.getBirthday(),user.getPhone(),user.getId());
	}

	public List<User> findAll() throws Exception {
		String sql = "select * from t_user";
		List<User> list = this.query(sql, User.class,new Object[0]);
		return list;
	}

	public Page<User> findPage(int currentPage, int pageSize,
			User searchModel) throws Exception {
		List list = new ArrayList();
		String sql ="select * from t_user where 1=1 ";
		String countSql ="select count(*) from t_user where 1=1 ";
		if (searchModel.getUsername()!=null) {
			sql+=" and username like ?";
			countSql+=" and username like ?";
			list.add("%"+searchModel.getUsername()+"%");
		}
		
		return this.findPage(sql, countSql, User.class, currentPage, pageSize, list);
	}

	public User findById(int id) throws Exception {
		String sql ="select * from t_user where id=?";
		List<User> list = this.query(sql, User.class,id);
		return list.size()>0?list.get(0):null;
	}

	
}
