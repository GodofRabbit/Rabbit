package edu.sram.service;

import edu.sram.entity.NoteMessage;

public interface UserService {

	NoteMessage addUserRecord(String userName, String personID, String phone,
			String userSex, String roomNum, String inTime,
			String dayNum, String outTime, String userRole, String charge,
			String consume, String remark);

	NoteMessage selectUser(String user_name, String user_id, String personID,
			String user_phone, int page);

	NoteMessage userLiveDetail(String personID, int page);

	NoteMessage quitHomeSelect(String room_number);


}
