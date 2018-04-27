package edu.sram.service;

import java.security.NoSuchAlgorithmException;

import edu.sram.entity.NoteMessage;
import edu.sram.entity.User;

public interface UserService {
       public NoteMessage checkLogin(String name,String psw) throws Exception;
	   public NoteMessage saveUser(String username, String password,String nickname) throws Exception;
	   public User checkPassword(String uid);
	   public void changePassword(String uid, String newPassword) throws NoSuchAlgorithmException;
}
