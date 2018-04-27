package edu.sram.dao;

import java.util.List;
import edu.sram.entity.User;

public interface UserDao {

	public List<User> selectUser(String user_name, String user_id,
			String personID, String user_phone, int currentPage);

	public int selectAllUser(String user_name, String user_id, String personID,
			String user_phone);

	public User selectUserByPersonID(String personID);

	public void addUserInfo(String userName, String userSex, String phone,
			String personID, String userRole);

	public int allUserLiveDetail(String personID);

	public List<User> userLiveDetail(String personID, int currentPage);

	public User quitHomeSelect(String room_number);

	public String selectRoomId(String roomNum);

	public String selectUserId(String personID);

	public void addUserRecord(String room_id, String inTime, String dayNum,
			String outTime, String charge, String consume,
			String remark, String user_id);


}
