package edu.sram.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.sram.entity.NoteMessage;
import edu.sram.service.RoomService;

@Controller
public class RoomController {
	@Autowired
	private RoomService roomService;

	@RequestMapping("allEmptyRoomList.do")
	@ResponseBody
	public NoteMessage allEmptyRoomList(int page) throws Exception{
		    NoteMessage message = roomService.allEmptyRoomList(page);
			return message;
		 }

	@RequestMapping("normalSingleRoom.do")
	@ResponseBody
	public NoteMessage normalSingleRoom(int page) throws Exception{
		    NoteMessage message = roomService.normalSingleRoom(page);
			return message;
		 }
	
	@RequestMapping("deluxeSingleRoom.do")
	@ResponseBody
	public NoteMessage deluxeSingleRoom(int page) throws Exception{
		    NoteMessage message = roomService.deluxeSingleRoom(page);
			return message;
		 }
	
	@RequestMapping("normalDoubleRoom.do")
	@ResponseBody
	public NoteMessage normalDoubleRoom(int page) throws Exception{
		    NoteMessage message = roomService.normalDoubleRoom(page);
			return message;
		 }
	
	@RequestMapping("deluxeDoubleRoom.do")
	@ResponseBody
	public NoteMessage deluxeDoubleRoom(int page) throws Exception{
		    NoteMessage message = roomService.deluxeDoubleRoom(page);
			return message;
		 }
	
	@RequestMapping("vipSuite.do")
	@ResponseBody
	public NoteMessage vipSuite(int page) throws Exception{
		    NoteMessage message = roomService.vipSuite(page);
			return message;
		 }
	
	@RequestMapping("presideSuite.do")
	@ResponseBody
	public NoteMessage presideSuite(int page) throws Exception{
		    NoteMessage message = roomService.presideSuite(page);
			return message;
		 }
	
	@RequestMapping("updateUserRecord.do")
	@ResponseBody
	public NoteMessage updateUserRecord(String factDay,String clock,String consume,String room_number,String inTime) throws Exception{
		    NoteMessage message = roomService.updateUserRecord(factDay,clock,consume,room_number,inTime);
			return message;
		 }
	
	@RequestMapping("allRoomState.do")
	@ResponseBody
	public NoteMessage allRoomState() throws Exception{
		    NoteMessage message = roomService.allRoomState();
			return message;
		 }
	
	@RequestMapping("clickRoom.do")
	@ResponseBody
	public NoteMessage clickRoom(String room_id) throws Exception{
		    NoteMessage message = roomService.clickRoom(room_id);
			return message;
		 }

	@RequestMapping("selectHomeDetail.do")
	@ResponseBody
	public NoteMessage selectHomeDetail(String room_id) throws Exception{
		    NoteMessage message = roomService.selectHomeDetail(room_id);
			return message;
		 }
}
