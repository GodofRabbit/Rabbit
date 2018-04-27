package edu.sram.dao;

import java.util.List;

import edu.sram.entity.LikeNote;
import edu.sram.entity.Note;
import edu.sram.entity.ShareNote;

public interface NoteDao {

	public List<Note> loadNote(String nbid);

	public boolean addNote(Note note);

	public String load(String nid);

	public boolean saveNotes(Note note);

	public boolean deleteNote(String nid);

	public boolean addShareNote(ShareNote shareNote);

	public ShareNote checkShareNote(String nid);

	public List<Note> loadContacts(String uid);

	public List<Note> searchNote(String searchNoteTitle, int currentPage);

	public void replayNote(String nbid, String nid);

	public void moveNote(String nbid, String nid);

	public void reallyDeleteNote(String nid);

	public void DeleteShareNote(String nid);

	public void addLikeNote(LikeNote likeNote);

	public LikeNote checkLikeNote(String nid);

	public List<LikeNote> likeNoteList(String uid);

	public void updateLikeNote(String title, String noteBody,String nid);

	public void deleteLikeNote(String nid);
}
