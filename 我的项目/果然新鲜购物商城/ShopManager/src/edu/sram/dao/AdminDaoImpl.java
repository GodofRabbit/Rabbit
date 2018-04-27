package edu.sram.dao;

import java.util.ArrayList;
import java.util.List;

import edu.sram.entity.Admin;
import edu.sram.entity.Page;
import edu.sram.entity.User;

public class AdminDaoImpl extends BaseDao implements AdminDao{

	public boolean toAddAdmin(Admin admin) throws Exception {
		String sql = "insert into t_manager(managername,managerpassword,realname,sex,role,jointime) values(?,?,?,?,?,now())";
		return this.update(sql,admin.getManagername(),admin.getManagerpassword(),admin.getRealname(),admin.getSex(),admin.getRole());
	}

	public boolean deleteAdmin(int id) throws Exception {
		String sql = "delete from t_manager where id=?";
		return this.update(sql,id);
	}

	public boolean editAdmin(Admin admin) throws Exception {
		String sql = "update t_manager set managername=?,managerpassword=?,realname=?,sex=?,role=? where id=?";
		return this.update(sql,admin.getManagername(),admin.getManagerpassword(),admin.getRealname(),admin.getSex(),admin.getRole(),admin.getId());
	}

	public List<Admin> findAll() throws Exception {
		String sql = "select * from t_manager";
		List<Admin> list = this.query(sql, Admin.class,new Object[0]);
		return list;
	}
	
	public Admin findAdmin(Admin admin) throws Exception {
		String sql = "select * from t_manager where managername=? and managerpassword=?";
		List<Admin> list = this.query(sql, Admin.class,admin.getManagername(),admin.getManagerpassword());
		return list.size()!=0?list.get(0):null;
	}

	public Page<Admin> findPage(Integer currentPage, int pageSize,
			Admin searchModel) throws Exception {
		List list = new ArrayList();
		String sql ="select * from t_manager where 1=1 ";
		String countSql ="select count(*) from t_manager where 1=1 ";
		if (searchModel.getManagername()!=null) {
			sql+=" and managername like ?";
			countSql+=" and managername like ?";
			list.add("%"+searchModel.getManagername()+"%");
		}
		return this.findPage(sql, countSql, Admin.class, currentPage, pageSize, list);
	}

	public Admin findById(int id) throws Exception{
		String sql = "select * from t_manager where id=?";
		List<Admin> list = this.query(sql, Admin.class, id);
		return list.size()>0?list.get(0):null;
	}

}
