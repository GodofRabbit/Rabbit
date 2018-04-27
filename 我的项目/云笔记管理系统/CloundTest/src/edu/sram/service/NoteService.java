package edu.sram.service;

import org.springframework.transaction.annotation.Transactional;

import edu.sram.entity.LikeNote;
import edu.sram.entity.NoteMessage;
import edu.sram.entity.ShareNote;

public interface NoteService {

	public NoteMessage loadNote(String nbid);

	public NoteMessage addNote(String uid, String nbid, String noteName);

	public NoteMessage load(String nid);

	public NoteMessage saveNotes(String title, String noteBody, String nid,String nbid, String uid);

	public NoteMessage deleteNote(String nid);

	public NoteMessage addShareNote(String nid, String shareTitle,String shareBody);

	public ShareNote checkShareNote(String nid);

	public NoteMessage loadContacts(String uid);

	public NoteMessage searchNote(String searchNoteTitle, int page);

	public NoteMessage replayNote(String nbid, String nid);

	public NoteMessage moveNote(String nbid, String nid);

	@Transactional
	public void deleteNoteAndShare(String nid);

	public NoteMessage addLikeNote(String uid, String nid, String title,
			String body);

	public LikeNote checkLikeNote(String nid);

	public NoteMessage likeNoteList(String uid);

	public NoteMessage deleteLikeNote(String nid);

}
