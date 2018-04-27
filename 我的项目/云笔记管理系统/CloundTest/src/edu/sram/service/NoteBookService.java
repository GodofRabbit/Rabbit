package edu.sram.service;

import edu.sram.entity.NoteMessage;

public interface NoteBookService {

	public NoteMessage loadNoteBooks(String uid);

	public NoteMessage addNoteBook(String uid, String noteBookName) throws Exception;

}
