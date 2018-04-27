package edu.sram.dao;

import java.util.List;

import edu.sram.entity.NoteBook;

public interface NoteBookDao {

	public List<NoteBook> loadNoteBook(String uid);

	public boolean addNoteBook(NoteBook noteBook);

}
