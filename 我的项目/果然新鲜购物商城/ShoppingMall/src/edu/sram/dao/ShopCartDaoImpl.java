package edu.sram.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import org.springframework.stereotype.Repository;

import edu.sram.dto.ShopCart;
import edu.sram.dto.UserCart;
import edu.sram.entity.Goods;
import edu.sram.entity.User;
@Repository
public class ShopCartDaoImpl extends BaseDao implements ShopCartDao{
	private BaseDao dao = new BaseDao();

	@Override
	public boolean toAdd(UserCart userCart) throws Exception {
		String sql = "insert into t_cart(user_id,goods_id,goods_num) values(?,?,?)";
		return this.update(sql,userCart.getUser_id(),userCart.getSid(),userCart.getNum());
	}

	public List<ShopCart> shopList(UserCart userCart) throws Exception{
        String sql = "select user_id,goods_id,goods_imageurl,goodsname,goodsprice,SUM(goods_num),goodsprice*SUM(goods_num) from t_goods,t_cart WHERE t_goods.id=t_cart.goods_id AND t_cart.user_id=? GROUP BY t_goods.id";
        return this.query(sql, ShopCart.class, userCart.getUser_id());
	}

	public boolean delShop(int gid) throws Exception{
		String sql = "delete from t_cart where goods_id=?";
		return this.update(sql, gid);
	}

	public boolean addOrder(int user_id) throws Exception{
		String sql = "insert into t_order(orderseq,address_id,ordertime,state,user_id) values(rand()*10000000,rand()*1000,now(),2,?)";
        return this.update(sql, user_id);
	}
      public static void main(String[] args) {
		ShopCartDao s = new ShopCartDaoImpl();
		UserCart u = new UserCart();
		u.setUser_id(2);
		try {
		List<ShopCart> shopList = s.shopList(u);
		for (ShopCart shopCart : shopList) {
			System.out.println(shopCart);
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public int addCar(ShopCart cart) {
		String sql = "INSERT INTO t_cart (t_cart.goods_id,t_cart.user_id,t_cart.goods_num) VALUES(?,?,?);";
        int a=0;
        try {
			PreparedStatement ps = dao.getConnection().prepareStatement(sql);
			Set<Goods> keySet = cart.getGoods().keySet();
			for (Goods goods : keySet) {
				ps.setInt(1,goods.getId());
			}
			ps.setInt(2,cart.getUser_id());
			Collection<Integer> values = cart.getGoods().values();
			for (Integer integer : values) {
				ps.setInt(3,integer);
			}
			a = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return a;
        
	}

	@Override
	public boolean delByIdCar(int userid, int goodsid) {
		String sql = "DELETE FROM t_cart where goods_id=? and user_id = ?";
		boolean may = false;
		try {
			PreparedStatement ps = dao.getConnection().prepareStatement(sql);
			ps.setInt(1,goodsid);
			ps.setInt(2,userid);
			int a = ps.executeUpdate();
			if(a>0){
				may = true;
			}else{
				may = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return may;
	}

	@Override
	public List<ShopCart> getAllCar(User user) {
		List<ShopCart> cars = new ArrayList<ShopCart>();
		String sql = "select * from t_cart,t_goods where t_cart.goods_id=t_goods.id and t_cart.user_id=?";
		try {
			PreparedStatement ps = dao.getConnection().prepareStatement(sql);
			ps.setInt(1,user.getId());
			ResultSet rs = ps.executeQuery();
			int num = 0;
			while (rs.next()) {
				User user2 = new User();
				Goods goods = new Goods();
				ShopCart car1 = new ShopCart();
				
				goods.setId(rs.getInt("id"));
				goods.setGoodsname(rs.getString("goodsname"));
				goods.setGoodsprice(rs.getDouble("goodsprice"));
				goods.setGoods_imageurl(rs.getString("goods_imageurl"));
				goods.setGoodstime(rs.getDate("goodstime"));
				goods.setNum(rs.getInt("num"));
				goods.setState(rs.getInt("state"));
				
//				user2.setUsername(rs.getString("username"));
//				user2.setPassword(rs.getString("password"));
//				user2.setRealname(rs.getString("realname"));
//				user2.setSex(rs.getString("sex"));
//				user2.setBirthday(rs.getDate("birthday"));
//				user2.setPhone(rs.getString("phone"));
//				user2.setJointime(rs.getDate("jointime"));
//				user2.setId(rs.getInt("id"));
				
				car1.setId(rs.getInt("cid"));
//				car1.setUser_id(rs.getInt("user_id"));
				num = rs.getInt("goods_num");
				
				car1.addGoods(goods, num);
				cars.add(car1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cars;
	}
}
