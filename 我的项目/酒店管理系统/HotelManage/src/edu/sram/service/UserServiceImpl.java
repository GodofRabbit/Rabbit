package edu.sram.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.sram.dao.RoomDao;
import edu.sram.dao.UserDao;
import edu.sram.entity.NoteMessage;
import edu.sram.entity.User;
@Service
public class UserServiceImpl implements UserService{

	private NoteMessage note = new NoteMessage();
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private RoomDao roomDao;
	
	@Transactional
	public NoteMessage addUserRecord(String userName, String personID,
			String phone, String userSex, String roomNum,
			String inTime, String dayNum, String outTime, String userRole,
			String charge, String consume, String remark) {
		//首先先查，如果是老顾客，顾客信息表不做更改；如果是新顾客，顾客信息表增加一条
		User userInfo = userDao.selectUserByPersonID(personID);
		if(userInfo==null){
			userDao.addUserInfo(userName,userSex,phone,personID,userRole);
		}
		//首先根据房间号查询对应房间的id
		String room_id = userDao.selectRoomId(roomNum);
		//根据顾客身份证号查询顾客id
		String user_id = userDao.selectUserId(personID);
		//加一条顾客入住信息
		userDao.addUserRecord(room_id,inTime,dayNum,outTime,charge,consume,remark,user_id);
		//顾客入住房间，将房间状态改为已入住
		roomDao.changeRoomState(room_id);
		note.setMessage("登记成功");
		return note;
	}

	public NoteMessage selectUser(String user_name, String user_id,
			String personID, String user_phone, int page) {
		int currentPage = (page-1)*5;
		//分页查询，最多一次查五条
		List<User> list = userDao.selectUser(user_name,user_id,personID,user_phone,currentPage);
		note.setData(list);
		//查询所有，用来记录总条数
		int i = userDao.selectAllUser(user_name,user_id,personID,user_phone);
		note.setState((i-1)/5+1);
		note.setMessage(String.valueOf(i));
		return note;
	}

	public NoteMessage userLiveDetail(String personID, int page) {
		int currentPage = (page-1)*2;
		List<User> list = userDao.userLiveDetail(personID,currentPage);
		note.setData(list);
		int i = userDao.allUserLiveDetail(personID);
		note.setState((i-1)/2+1);
		note.setMessage(String.valueOf(i));
		return note;
	}

	public NoteMessage quitHomeSelect(String room_number) {
		User userQuitDetail = userDao.quitHomeSelect(room_number);
		note.setData(userQuitDetail);
		return note;
	}

	

}
