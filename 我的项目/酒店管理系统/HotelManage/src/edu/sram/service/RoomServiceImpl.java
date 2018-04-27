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
		//���Ƿ�ҳ��ѯ��һ��ֻ�ܲ�����������Ҫ�����������ò�ѯȫ��
		List<Room> list = roomDao.EmptyRoomList(currentPage);
		note.setData(list);
		//���ǲ�ѯȫ��
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
		//�˷����¹˿ͼ�¼
		roomDao.updateUserRecord(factDay,clock,consume,inTime);
		//�˷����·���״̬
		roomDao.updateRoomState(room_number);
		note.setMessage("�˷��ɹ�");
		return note;
	}

	public NoteMessage allRoomState() {
		List<String> list = roomDao.allRoomState();
		//list�в�ѯ������36�����ݣ������ǽ�36�������ٷ�Ϊ6��list,��ÿ��list�ﰴ˳���6��
		//Ȼ������map���6�Σ�����map(0,list1),map(1,list2)......
		int listSize=list.size();
		int index=6;
		Map map = new HashMap();
		int keyToken = 0;
		for(int i = 0;i<list.size();i+=6){
            if(i+6>listSize){        //����Ϊindex���û��6��������ʣ�༸��newList�о�װ����
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
