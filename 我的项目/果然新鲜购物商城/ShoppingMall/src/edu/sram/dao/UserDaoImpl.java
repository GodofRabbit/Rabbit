package edu.sram.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import edu.sram.entity.Page;
import edu.sram.entity.User;
@Repository
public class UserDaoImpl extends BaseDao implements UserDao{

	public boolean toAddUser(User user) throws Exception {
		String sql = "insert into t_user(username,password,realname,sex,birthday,phone,jointime) values(?,?,?,?,?,?,now())";
		return this.update(sql,user.getUsername(),user.getPassword(),user.getRealname(),user.getSex(),user.getBirthday(),user.getPhone());
	}

	public boolean editUser(User user) throws Exception {
		String sql = "update t_user set username=?,password=?,realname=?,sex=?,birthday=?,phone=? where id=?";
		return this.update(sql,user.getUsername(),user.getPassword(),user.getRealname(),user.getSex(),user.getBirthday(),user.getPhone(),user.getId());
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

	public User findUser(User user) throws Exception {
		String  sql = "select * from t_user where username=? and password=?";
		List<User> list = this.query(sql, User.class,user.getUsername(),user.getPassword());
		return list.size()>0?list.get(0):null;
	}

	@Override
	public boolean findByName(User user) throws Exception {
		String sql = "select * from t_user where username=?";
		List<User> list = this.query(sql, User.class,user.getUsername());
		return list.size()>0?true:false;
	}

}
