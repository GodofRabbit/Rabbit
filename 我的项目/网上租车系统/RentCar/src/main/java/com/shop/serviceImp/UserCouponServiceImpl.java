package com.shop.serviceImp;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.CouponDao;
import com.shop.dao.UserCouponDao;
import com.shop.entity.Coupon;
import com.shop.entity.MyCoupon;
import com.shop.entity.NoteResult;
import com.shop.entity.Order;
import com.shop.entity.UserCoupon;
import com.shop.service.UserCouponService;
@Service
public class UserCouponServiceImpl implements UserCouponService{

	@Autowired
	UserCouponDao userCouponDao;
	@Autowired
	CouponDao couponDao;

	NoteResult result = new NoteResult();
	public NoteResult addUserCoupon(int user_id, int coupon_id) {
		List<Integer> cids = userCouponDao.findCidsByUid(user_id);
		if(coupon_id==1){
			boolean flag = true;
			for (Integer cid : cids) {
				if(cid == coupon_id){
					result.setState(2);//�Ѿ���ȡ��ȯ,ÿ���û�ֻ����ȡһ��
					result.setMessage("���Ѿ���ȡ���ˣ������ٴ���ȡ��");
					flag = false;
					break;
				}
			}
			if(flag){
				List<Order> list = userCouponDao.findOrderByUid(user_id);
				if(list.size() == 0){
					Timestamp time = new Timestamp(System.currentTimeMillis());
					UserCoupon userCoupon = new UserCoupon(coupon_id,user_id,time,1);
					userCouponDao.addUserCoupon(userCoupon);
					result.setMessage("����ȡ�ɹ��ˣ�");//��ȡ�ɹ�Ĭ��״̬Ϊ0
				}else{
					result.setData(3);//�û��Ѳ������û���������ȡ����ȯ
					result.setMessage("���Ѿ��������û��ˣ�������ȡ��");
				}
			}		    	
		}else{
			boolean flag = true;
			for (Integer cid : cids) {
				if(cid == coupon_id){
					result.setData(2);//��ȡ����ȯ
					result.setMessage("���Ѿ���ȡ���ˣ������ٴ���ȡ��");
					flag = false;
					break;
				}
			}
			if(flag){
				Timestamp time = new Timestamp(System.currentTimeMillis());
				UserCoupon userCoupon = new UserCoupon(coupon_id,user_id,time,1);
				userCouponDao.addUserCoupon(userCoupon);
				result.setMessage("����ȡ�ɹ��ˣ�");//��ȡ�ɹ���Ĭ��״̬Ϊ0
			}

		}
		return result;	


	}

	public NoteResult findUserCouponByUid(int user_id) throws ParseException{
		//�����û����е��Ż�ȯ
		List<UserCoupon> list = userCouponDao.findUserCouponByUid(user_id);
		//�Ż�ȯû�й���
		List<MyCoupon> list1 = new ArrayList<MyCoupon>();
		//�Ż�ȯ�ѹ���
		List<MyCoupon> list2 = new ArrayList<MyCoupon>();
		for(UserCoupon userCoupon : list){
			Coupon coupon = couponDao.findCouponById(userCoupon.getCoupon_id());
			//��ȡ�Ż�ȯ����Чʱ��
			int day = coupon.getTime();
			//�Ż�ȯ������ʱ��
			Timestamp createtime = userCoupon.getCreatetime();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			//�Ż�ȯ��������Чʱ��
			long time = sdf.parse(sdf.format(createtime)).getTime()+1000*60*60*24*day;
			
			MyCoupon myCoupon = new MyCoupon(coupon.getId(),coupon.getName(),coupon.getPrice(),
					coupon.getTime(),coupon.getCoutype(),userCoupon.getCreatetime(),userCoupon.getState());
			//�Ż�ȯ��Ч
			if(System.currentTimeMillis()<=time){
				
				list1.add(myCoupon);
			}else{//�Ż�ȯ�ѹ���
				//�޸��û��Ż�ȯ��״̬
				userCouponDao.updateUserCouponState(userCoupon.getId());	
				list2.add(myCoupon);
			}
		}
		List list3 = new ArrayList();
		list3.add(list1);
		list3.add(list2);
		result.setData(list3);
		
		return result;
	}

}
