package edu.sram.service;

import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.sram.dao.NoteBookDao;
import edu.sram.entity.NoteBook;
import edu.sram.entity.NoteMessage;
import edu.sram.util.NoteUtil;

@Service
public class NoteBookServiceImp implements NoteBookService{

	private NoteMessage note = new NoteMessage();
	
	@Autowired
	private NoteBookDao noteBookDao;
	
	public NoteMessage loadNoteBooks(String uid) {
		
		List<NoteBook> list = noteBookDao.loadNoteBook(uid);
		note.setState(2);
		note.setObj(list);
		return note;
	}
	public NoteMessage addNoteBook(String uid, String noteBookName) throws Exception {
		NoteBook noteBook = new NoteBook();
		noteBook.setCn_notebook_name(noteBookName);
		noteBook.setCn_user_id(uid);
		noteBook.setCn_notebook_id(NoteUtil.UUID());
		boolean b = noteBookDao.addNoteBook(noteBook);
		note.setObj(b);
		note.setMessage(noteBookName);
		note.setId(noteBook.getCn_notebook_id());
		return note;
	}

}
