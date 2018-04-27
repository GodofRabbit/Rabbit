package edu.sram.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.sram.dao.RoomDao;
import edu.sram.entity.NoteMessage;
import edu.sram.entity.Room;
import edu.sram.entity.User;
@Service
public class RoomServiceImpl implements RoomService{
	private NoteMessage note = new NoteMessage();
	@Autowired
	private RoomDao roomDao;

	public NoteMessage allEmptyRoomList(int page) {
		int currentPage = (page-1)*5;
		//这是分页查询，一次只能查五条出来，要想获得总条数得查询全部
		List<Room> list = roomDao.EmptyRoomList(currentPage);
		note.setData(list);
		//这是查询全部
		int i = roomDao.selectAllEmptyRoom();
		note.setState((i-1)/5+1);
		note.setMessage(String.valueOf(i));
		return note;
	}

	public NoteMessage normalSingleRoom(int page) {
		int currentPage = (page-1)*5;
		List<Room> list = roomDao.normalSingleRoom(currentPage);
		note.setData(list);
		int i = roomDao.AllNormalSingleRoom();
		note.setState((i-1)/5+1);
		note.setMessage(String.valueOf(i));
		return note;
	}

	public NoteMessage deluxeSingleRoom(int page) {
		int currentPage = (page-1)*5;
		List<Room> list = roomDao.deluxeSingleRoom(currentPage);
		note.setData(list);
		int i = roomDao.AllDeluxeSingleRoom();
		note.setState((i-1)/5+1);
		note.setMessage(String.valueOf(i));
		return note;
	}

	public NoteMessage normalDoubleRoom(int page) {
		int currentPage = (page-1)*5;
		List<Room> list = roomDao.normalDoubleRoom(currentPage);
		note.setData(list);
		int i = roomDao.AllNormalDoubleRoom();
		note.setState((i-1)/5+1);
		note.setMessage(String.valueOf(i));
		return note;
	}

	public NoteMessage deluxeDoubleRoom(int page) {
		int currentPage = (page-1)*5;
		List<Room> list = roomDao.deluxeDoubleRoom(currentPage);
		note.setData(list);
		int i = roomDao.AllDeluxeDoubleRoom();
		note.setState((i-1)/5+1);
		note.setMessage(String.valueOf(i));
		return note;
	}

	public NoteMessage vipSuite(int page) {
		int currentPage = (page-1)*5;
		List<Room> list = roomDao.vipSuite(currentPage);
		note.setData(list);
		int i = roomDao.AllVipSuite();
		note.setState((i-1)/5+1);
		note.setMessage(String.valueOf(i));
		return note;
	}

	public NoteMessage presideSuite(int page) {
		int currentPage = (page-1)*5;
		List<Room> list = roomDao.presideSuite(currentPage);
		note.setData(list);
		int i = roomDao.AllPresideSuite();
		note.setState((i-1)/5+1);
		note.setMessage(String.valueOf(i));
		return note;
	}

	@Transactional
	public NoteMessage updateUserRecord(String factDay, String clock,
			String consume,String room_number,String inTime) {
		//退房更新顾客记录
		roomDao.updateUserRecord(factDay,clock,consume,inTime);
		//退房更新房间状态
		roomDao.updateRoomState(room_number);
		note.setMessage("退房成功");
		return note;
	}

	public NoteMessage allRoomState() {
		List<String> list = roomDao.allRoomState();
		//list中查询出来有36条数据，下面是将36条数据再分为6个list,在每个list里按顺序放6条
		//然后再在map里放6次，形如map(0,list1),map(1,list2)......
		int listSize=list.size();
		int index=6;
		Map map = new HashMap();
		int keyToken = 0;
		for(int i = 0;i<list.size();i+=6){
            if(i+6>listSize){        //作用为index最后没有6条数据则剩余几条newList中就装几条
                index=listSize-i;
            }
        List newList = list.subList(i,i+index);
        map.put(keyToken, newList);
        keyToken++;
		}
		note.setData(map);
		return note;
	}

	public NoteMessage clickRoom(String room_id) {
		Room room = roomDao.clickRoom(room_id);
		note.setData(room);
		return note;
	}

	public NoteMessage selectHomeDetail(String room_id) {
		User user = roomDao.selectHomeDetail(room_id);
		note.setData(user);
		return note;
	}


}
