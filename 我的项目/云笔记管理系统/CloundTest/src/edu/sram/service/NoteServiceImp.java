package edu.sram.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.sram.dao.NoteDao;
import edu.sram.entity.LikeNote;
import edu.sram.entity.Note;
import edu.sram.entity.NoteMessage;
import edu.sram.entity.ShareNote;
import edu.sram.util.NoteUtil;
@Service
public class NoteServiceImp implements NoteService{
	
	private NoteMessage noteMessage = new NoteMessage();

	@Autowired
	private NoteDao noteDao;
	public NoteMessage loadNote(String nbid) {
		List<Note> list = noteDao.loadNote(nbid);
		noteMessage.setState(2);
		noteMessage.setObj(list);
		return noteMessage;
	}
	public NoteMessage addNote(String uid, String nbid, String noteName) {
		Note note = new Note();
		note.setCn_note_title(noteName);
		note.setCn_user_id(uid);
		note.setCn_notebook_id(nbid);
		note.setCn_note_id(NoteUtil.UUID());
		note.setCn_note_create_time(new Timestamp(System.currentTimeMillis()).getTime());
		note.setCn_note_last_modify_time(new Timestamp(System.currentTimeMillis()).getTime());
		boolean b = noteDao.addNote(note);
		noteMessage.setObj(b);
		noteMessage.setMessage(noteName);
		noteMessage.setId(note.getCn_note_id());
		return noteMessage;
	}
	public NoteMessage load(String nid) {
		String load = noteDao.load(nid);
		noteMessage.setObj(load);
		return noteMessage;
	}
	
	@Transactional
	public NoteMessage saveNotes(String title, String noteBody, String nid,
			String nbid, String uid) {
		Note note = new Note();
		note.setCn_note_title(title);
		note.setCn_note_body(noteBody);
		note.setCn_note_id(nid);
		note.setCn_notebook_id(nbid);
		note.setCn_user_id(uid);
		boolean b = noteDao.saveNotes(note);              //
		noteDao.updateLikeNote(title,noteBody,nid);       //这两个方法都要执行
		noteMessage.setObj(b);
		noteMessage.setMessage(title);
		return noteMessage;
	}
	public NoteMessage deleteNote(String nid) {
		boolean b = noteDao.deleteNote(nid);
		noteMessage.setObj(b);
		return noteMessage;
	}
	public NoteMessage addShareNote(String nid, String shareTitle,
			String shareBody) {
		ShareNote shareNote = new ShareNote();
		shareNote.setCn_share_id(NoteUtil.UUID());
		shareNote.setCn_note_id(nid);
		shareNote.setCn_share_title(shareTitle);
		shareNote.setCn_share_body(shareBody);
		noteDao.addShareNote(shareNote);
		noteMessage.setObj("2");
		return noteMessage;
	}
	public ShareNote checkShareNote(String nid) {
		ShareNote shareNote = noteDao.checkShareNote(nid);
		return shareNote;
	}
	public NoteMessage loadContacts(String uid) {
		List<Note> list = noteDao.loadContacts(uid);
		noteMessage.setObj(list);
		return noteMessage;
	}
	
	public NoteMessage searchNote(String searchNoteTitle,int page) {
		int currentPage = (page-1)*2;
		List<Note> list = noteDao.searchNote(searchNoteTitle,currentPage);
		noteMessage.setObj(list);
		return noteMessage;
	}
	public NoteMessage replayNote(String nbid, String nid) {
		noteDao.replayNote(nbid,nid);
		noteMessage.setMessage("1");//1代表 恢复成功
		return noteMessage;
	}
	public NoteMessage moveNote(String nbid, String nid) {
		noteDao.moveNote(nbid,nid);
		noteMessage.setMessage("1");//1代表 移动成功
		return noteMessage;
	}
	
	public void deleteNoteAndShare(String nid) {
		noteDao.reallyDeleteNote(nid);
		noteDao.DeleteShareNote(nid);
	}
	
	public NoteMessage addLikeNote(String uid, String nid, String title,
			String body) {
		LikeNote likeNote = new LikeNote();
		likeNote.setCn_like_id(NoteUtil.UUID());
		likeNote.setCn_user_id(uid);
		likeNote.setCn_note_id(nid);
		likeNote.setCn_like_title(title);
		likeNote.setCn_like_body(body);
		noteDao.addLikeNote(likeNote);
		noteMessage.setMessage("1");
		return noteMessage;
	}
	public LikeNote checkLikeNote(String nid) {
		return noteDao.checkLikeNote(nid);
	}
	public NoteMessage likeNoteList(String uid) {
		List<LikeNote> list = noteDao.likeNoteList(uid);
		noteMessage.setObj(list);
		return noteMessage;
	}
	public NoteMessage deleteLikeNote(String nid) {
		noteDao.deleteLikeNote(nid);
		noteMessage.setMessage("1");  //1表示取消收藏成功
		return noteMessage;
	}

}
