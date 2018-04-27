package edu.sram.service;

import edu.sram.entity.NoteMessage;

public interface UserInfoService {

	public NoteMessage addUserInfo(String name, String sex, String phone, String type,
			String idcard);

	public NoteMessage updateUserInfoType(String name, String type, String idcard);

	public NoteMessage checkUserInfo(String idcard);

	public NoteMessage updateUserInfo(String name, String phone, String idcard);

	public NoteMessage userLiveInfo(String page);

	public NoteMessage userInfo(String page);

}
