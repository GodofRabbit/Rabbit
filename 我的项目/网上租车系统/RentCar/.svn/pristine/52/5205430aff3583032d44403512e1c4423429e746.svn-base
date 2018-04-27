package com.shop.serviceImp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.UserInformationDao;
import com.shop.entity.NoteResult;
import com.shop.entity.User;
import com.shop.service.UserInformationService;

@Service
public class UserInformationServiceImp implements UserInformationService{

	@Autowired
	private UserInformationDao userInformationDao;
	private NoteResult result = new NoteResult();
	
	public NoteResult getInformation(int uid) {
		User user = userInformationDao.findOneById(uid);
		System.out.println(user);
		result.setState(1);
		result.setData(user);
		return result;
	}

}
