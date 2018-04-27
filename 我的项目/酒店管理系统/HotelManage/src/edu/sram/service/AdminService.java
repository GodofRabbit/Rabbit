package edu.sram.service;

import edu.sram.entity.NoteMessage;

public interface AdminService {

	public NoteMessage checkAdmin(String adminName,String adminPassword) throws Exception;
	
	public NoteMessage changePassword(int aid, String old_psw,
			String new_psw) throws Exception;

	public NoteMessage checkOldPsw(int aid, String oldpassword) throws Exception;

	public NoteMessage dispalyMenu(String admin_id);

	public NoteMessage deblocking(int aid, String psw) throws Exception;

	public void updateImg(String fileName,String admin_id);

	public NoteMessage dispalyImg(String admin_id);

}
