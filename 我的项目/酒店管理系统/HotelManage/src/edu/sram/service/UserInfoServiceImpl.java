package edu.sram.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.sram.dao.UserInfoDao;
import edu.sram.entity.NoteMessage;
import edu.sram.entity.User;

@Service
public class UserInfoServiceImpl implements UserInfoService{

	
	@Autowired
	private UserInfoDao userInfoDao;

	private NoteMessage noteMessage = new NoteMessage();
	
	public NoteMessage addUserInfo(String name, String sex, String phone,
			String type, String idcard) {
		
		User has = userInfoDao.findUserInfoByPID(idcard);
		if(has!=null){
			noteMessage.setState(0);
			noteMessage.setMessage("此用户已经是会员");
			return noteMessage;

		}else {
			
			User userInfo = new User();
			userInfo.setUser_name(name);
			userInfo.setUser_sex(sex);
			userInfo.setUser_phone(phone);
			userInfo.setUser_type_role(type);
			userInfo.setPersonID(idcard);
			userInfoDao.addUserInfo(userInfo);
			
			noteMessage.setState(1);
			noteMessage.setMessage("添加成功");
			return noteMessage;
		}
	}

	public NoteMessage updateUserInfoType(String name, String type,
			String idcard) {
		User has = userInfoDao.findUserInfoByPID(idcard);
		if(has==null){
			noteMessage.setState(0);
			noteMessage.setMessage("此用户还不是会员");
			return noteMessage;
		} else {
			User userInfo = new User();
			userInfo.setPersonID(idcard);
			userInfo.setUser_type_role(type);
			userInfoDao.updateUserInfoType(userInfo);
			
			noteMessage.setState(1);
			noteMessage.setMessage("用户升级成功");
			return noteMessage;
		}
		
	}

	public NoteMessage checkUserInfo(String idcard) {
		User has = userInfoDao.findUserInfoByPID(idcard);
		if(has==null){
			noteMessage.setState(0);
			noteMessage.setMessage("此用户还不是会员");
			return noteMessage;
		}else {
			noteMessage.setState(1);
			noteMessage.setMessage("用户已选定");
			noteMessage.setData(has);
			return noteMessage;
		}
		
	}

	public NoteMessage updateUserInfo(String name, String phone, String idcard) {
		User userInfo = new User();
		userInfo.setUser_name(name);
		userInfo.setUser_phone(phone);
		userInfo.setPersonID(idcard);
		userInfoDao.updateUserInfo(userInfo);
		noteMessage.setState(1);
		noteMessage.setMessage("信息修改成功");
		return noteMessage;
	}
	
	
	public NoteMessage userLiveInfo(String page) {
		int currentPage = (Integer.parseInt(page)-1)*5;
		List<User> list = userInfoDao.userLiveInfo(currentPage);
		noteMessage.setData(list);
		int i = userInfoDao.userTotalPage();
		noteMessage.setState((i-1)/5+1);
		noteMessage.setMessage(String.valueOf(i));
		return noteMessage;
	}

	public NoteMessage userInfo(String page) {
		int currentPage = (Integer.parseInt(page)-1)*5;
		List<User> list = userInfoDao.userInfo(currentPage);
		int size = userInfoDao.UserInfoSize();
		noteMessage.setState((size-1)/5+1);
		noteMessage.setMessage(String.valueOf(size));
		noteMessage.setData(list);
		return noteMessage;
	}
}
