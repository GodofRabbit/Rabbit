package edu.sram.dao;

import java.util.List;

import edu.sram.entity.User;

public interface UserInfoDao {

	public void addUserInfo(User userInfo);

	public User findUserInfoByPID(String idcard);

	public void updateUserInfoType(User userInfo);

	public void updateUserInfo(User userInfo);

	public int userTotalPage();

	public List<User> userInfo(int currentPage);

	public int UserInfoSize();

	public List<User> userLiveInfo(int currentPage);

}
