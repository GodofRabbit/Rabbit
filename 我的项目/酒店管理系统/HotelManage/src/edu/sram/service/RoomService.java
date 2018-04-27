package edu.sram.service;

import edu.sram.entity.NoteMessage;

public interface RoomService {

	NoteMessage allEmptyRoomList(int page);

	NoteMessage normalSingleRoom(int page);

	NoteMessage deluxeSingleRoom(int page);

	NoteMessage normalDoubleRoom(int page);

	NoteMessage deluxeDoubleRoom(int page);

	NoteMessage vipSuite(int page);

	NoteMessage presideSuite(int page);

	NoteMessage updateUserRecord(String factDay, String clock, String consume,String room_number,String inTime);

	NoteMessage allRoomState();

	NoteMessage clickRoom(String room_id);

	NoteMessage selectHomeDetail(String room_id);

}
