package edu.sram.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.sram.entity.LikeNote;
import edu.sram.entity.NoteMessage;
import edu.sram.service.NoteService;
import edu.sram.entity.ShareNote;

@Controller
public class NoteController {

	@Autowired
	private NoteService  noteService;
	
	@RequestMapping("loadNote.go")
	@ResponseBody
	public NoteMessage loadNote(String nbid){
		return noteService.loadNote(nbid);
	}
	
	@RequestMapping("addNote.go")
	@ResponseBody
	public NoteMessage addNote(String uid,String nbid,String noteName) throws Exception{
		return noteService.addNote(uid,nbid,noteName);
	}
	
	@RequestMapping("load.go")
	@ResponseBody
	public NoteMessage load(String nid) throws Exception{
		return noteService.load(nid);
	}
	
	@RequestMapping("saveNotes.go")
	@ResponseBody
	public NoteMessage saveNotes(String title,String noteBody,String nid,String nbid,String uid){
		return noteService.saveNotes(title,noteBody,nid,nbid,uid);
	}
	
	@RequestMapping("deleteNote.go")
	@ResponseBody
	public NoteMessage deleteNote(String nid) throws Exception{
		return noteService.deleteNote(nid);
	}
	
	@RequestMapping("addShareNote.go")
	@ResponseBody
	public NoteMessage addShareNote(String nid,String shareTitle,String shareBody) throws Exception{
		NoteMessage noteMessage = new NoteMessage();
		ShareNote shareNote = noteService.checkShareNote(nid);
		if(shareNote!=null){
			noteMessage.setObj("1");//1表示已存在
			return noteMessage;
		}else{
		    return noteService.addShareNote(nid,shareTitle,shareBody);
		}
	}
	
	@RequestMapping("loadContacts.go")
	@ResponseBody
	public NoteMessage loadContacts(String uid){
		return noteService.loadContacts(uid);
	}
	
	
	@RequestMapping("reallyDelete.go")
	@ResponseBody
	public NoteMessage reallyDelete(String nid) throws Exception{
		 noteService.deleteNoteAndShare(nid);
		 NoteMessage noteMessage = new NoteMessage();
		 noteMessage.setMessage("1");
		 return noteMessage;
	}
	
	
	@RequestMapping("searchNote.go")
	@ResponseBody
	public NoteMessage searchNote(String searchNoteTitle,int page){
		return noteService.searchNote(searchNoteTitle,page);
	}
	
	
	@RequestMapping("replayNote.go")
	@ResponseBody
	public NoteMessage replayNote(String nbid,String nid){
		return noteService.replayNote(nbid,nid);
	}
	
	
	@RequestMapping("moveNote.go")
	@ResponseBody
	public NoteMessage moveNote(String nbid,String nid){
		return noteService.moveNote(nbid,nid);
	}
	
	
	@RequestMapping("addLikeNote.go")
	@ResponseBody
	public NoteMessage addLikeNote(String uid,String nid,String title,String body){
		NoteMessage noteMessage = new NoteMessage();
		LikeNote likeNote = noteService.checkLikeNote(nid);
		if(likeNote!=null){
			noteMessage.setMessage("2");//2表示已收藏过
			return noteMessage;
		}else{
		    return noteService.addLikeNote(uid,nid,title,body);
		}
	}
	
	
	@RequestMapping("likeNoteList.go")
	@ResponseBody
	public NoteMessage likeNoteList(String uid){
		return noteService.likeNoteList(uid);
	}
	
	
	@RequestMapping("loadLikeNote.go")
	@ResponseBody
	public NoteMessage loadLikeNote(String nid){
		 NoteMessage noteMessage = new NoteMessage();
		 LikeNote likeNote = noteService.checkLikeNote(nid);
		 noteMessage.setObj(likeNote.getCn_like_body());
		 return noteMessage;
	}
	
	
	@RequestMapping("deleteLikeNote.go")
	@ResponseBody
	public NoteMessage deleteLikeNote(String nid){
		return noteService.deleteLikeNote(nid);
	}


}
