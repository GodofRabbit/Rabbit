package edu.sram.dao;

import java.util.List;

import edu.sram.entity.Room;
import edu.sram.entity.User;

public interface RoomDao {

	public List<Room> EmptyRoomList(int page);

	public int selectAllEmptyRoom();

	public List<Room> normalSingleRoom(int currentPage);

	public int AllNormalSingleRoom();

	public List<Room> deluxeSingleRoom(int currentPage);

	public int AllDeluxeSingleRoom();

	public List<Room> normalDoubleRoom(int currentPage);

	public int AllNormalDoubleRoom();

	public List<Room> deluxeDoubleRoom(int currentPage);

	public int AllDeluxeDoubleRoom();

	public List<Room> vipSuite(int currentPage);

	public int AllVipSuite();

	public List<Room> presideSuite(int currentPage);

	public int AllPresideSuite();

	public void changeRoomState(String room_id);

	public void updateUserRecord(String factDay, String clock, String consume,String inTime);

	public void updateRoomState(String room_number);

	public List<String> allRoomState();

	public Room clickRoom(String room_id);

	public User selectHomeDetail(String room_id);

}
