package edu.sram.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.sram.entity.NoteMessage;
import edu.sram.service.NoteBookService;

@Controller
public class NoteBookController {

	@Autowired
	private NoteBookService  noteBookService;
	
	@RequestMapping("loadNoteBook.go")
	@ResponseBody
	public NoteMessage loadNoteBook(String uid){
		return noteBookService.loadNoteBooks(uid);
	}
	
	@RequestMapping("addNoteBook.go")
	@ResponseBody
	public NoteMessage addNoteBook(String uid,String noteBookName) throws Exception{
		return noteBookService.addNoteBook(uid,noteBookName);
	}
}
