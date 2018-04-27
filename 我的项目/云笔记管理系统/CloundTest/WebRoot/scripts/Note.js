function loadNote(){
				  $("#pc_part_2").show();
				  $("#pc_part_3").show();
				  $("#pc_part_5").hide();
				  $("#pc_part_4").hide();
				  $("#pc_part_6").hide();
				  $("#pc_part_7").hide();
	              $("#notebook_list li a").removeClass("checked");
	              $(this).find("a").addClass("checked");
	              $("#notelist").empty();
	              var nbid = $(this).data("nbid");
	                  $.ajax({
                  type:"post",
                  url:"loadNote.go",
                  data:{nbid:nbid},
			      resultType:"json",
			      success:function(result){
			         var notes = result.obj;
	                 $.each(notes,function(i,note){
	                    var li = '<li class="online">'
							li+='<a >'
							li+='<i class="fa fa-file-text-o" title="online" rel="tooltip-bottom"></i> '+note.cn_note_title+'<button type="button" class="btn btn-default btn-xs btn_position btn_slide_down"><i class="fa fa-chevron-down"></i></button>'
							li+='</a>'
							li+='<div class="note_menu" tabindex="-1">'
							li+='<dl>'
							li+='<dt><button type="button" class="btn btn-default btn-xs btn_move" title="移动至..."><i class="fa fa-random"></i></button></dt>'
							li+='<dt><button type="button" class="btn btn-default btn-xs btn_share" title="分享"><i class="fa fa-sitemap"></i></button></dt>'
							li+='<dt><button type="button" class="btn btn-default btn-xs btn_delete" title="删除"><i class="fa fa-times"></i></button></dt>'
							li+='</dl>'
							li+='</div>'
							li+='</li>'
					  var $li=$(li);
					  $li.data("nid",note.cn_note_id);
					  $("#notelist").append($li);    
	                 })
	                 $("#notelist li:first").click();
			      }
			   })
	         }

function addNote(){
    $("#can").load("alert/alert_note.html");
    $(".opacity_bg").show();
   }

function creatNote(){
    var noteName = $.trim($("#can input").val());
    var nbid = $("#notebook_list li a.checked").parent("li").data("nbid");
  
    if($.trim(noteName)==""){
       alert("笔记名称不能为空");
       return;
    }else{
        $.ajax({
            url:"addNote.go",
			data:{noteName:noteName,uid:uid,nbid:nbid},
			type:"post",
			resultType:"json",
			success:function(result){
			   if(result.obj==true){
			    alert("创建成功");
			    var li = '<li class="online">'
					li+='<a >'
					li+='<i class="fa fa-file-text-o" title="online" rel="tooltip-bottom"></i> '+result.message+'<button type="button" class="btn btn-default btn-xs btn_position btn_slide_down"><i class="fa fa-chevron-down"></i></button>'
					li+='</a>'
					li+='<div class="note_menu" tabindex="-1">'
					li+='<dl>'
					li+='<dt><button type="button" class="btn btn-default btn-xs btn_move" title="移动至..."><i class="fa fa-random"></i></button></dt>'
					li+='<dt><button type="button" class="btn btn-default btn-xs btn_share" title="分享"><i class="fa fa-sitemap"></i></button></dt>'
					li+='<dt><button type="button" class="btn btn-default btn-xs btn_delete" title="删除"><i class="fa fa-times"></i></button></dt>'
					li+='</dl>'
					li+='</div>'
					li+='</li>'
			 var $li=$(li);
			 $li.data("nid",result.id);
				 $("#notelist").prepend($li);   
			   }
			}
    })
    }

}


function editNote(){
	$("#pc_part_5").hide();
	$("#pc_part_6").hide();
	$("#pc_part_7").hide();
	$("#pc_part_3").show();
	$("#notelist li a").removeClass("checked");
	$(this).find("a").addClass("checked");
	var title=$("#notelist li a.checked").text();
	var nid=$(this).data("nid");
	$.ajax({
		url:"load.go",
		data:{nid:nid},
		type:"post",
		resultType:"json",
		success:function(result){
			um.setContent(result.obj);
			$("#input_note_title").val(title);
		}
	})
}

function saveNotes(){
	var title = $("#input_note_title").val();
	var noteBody = um.getContent();
	var nid=$("#notelist li a.checked").parent("li").data("nid");
	var nbid = $("#notebook_list li a.checked").parent("li").data("nbid");
	if($.trim(title)==""){
		alert("标题不能为空");
		return;
	}else{
	$.ajax({
		type:"post",
		resultType:"json",
		url:"saveNotes.go",
		data:{title:title,noteBody:noteBody,nid:nid,nbid:nbid,uid:uid},
		success:function(result){
			if(result.obj==true){
				alert("笔记编辑成功");
				$("#notelist li a.checked").text(result.message);
			}
		}
	})   
	}
}

function showMenu(){
	//将当前笔记的菜单显示
	var $menu = $(this).parent().next();
	//先将其他笔记菜单隐藏
	$("#notelist li .note_menu").not($menu).hide();
	//判断$menu是否显示
	if($menu.is(":hidden")){
	  $menu.slideDown(1000);
	}else{
	  $menu.slideUp(1000);
	}
}

function alertDeleteNote(){
	 $("#can").load("alert/alert_delete_note.html");
	 $(".opacity_bg").show();
}

function deleteNote(){
    var nid = $("#notelist li a.checked").parent("li").data("nid");
     $.ajax({
         type:"post",
         resultType:"json",
         url:"deleteNote.go",
         data:{nid:nid},
         success:function(result){
           if(result.obj==true){
        	 $("#notelist li a.checked").parent("li").remove(); 
             alert("删除成功，已放入回收站");
             $("#notelist li:first").click();
             }
         }
     });
}


function shareNote(){
    var shareTitle=$("#notelist li a.checked").text();
    var nid=$("#notelist li a.checked").parent("li").data("nid");
    var shareBody=um.getContent();
	$.ajax({
         type:"post",
         resultType:"json",
         url:"addShareNote.go",
         data:{nid:nid,shareTitle:shareTitle,shareBody:shareBody},
         success:function(result){
           if(result.obj==1){
        	   alert("亲，该笔记已经分享过了");
           }
           if(result.obj==2){
              alert("分享成功");
               }
	       }
	     });
}


function loadContacts(){
	   $("#pc_part_2").hide();
	   $("#pc_part_6").hide();
	   $("#pc_part_7").hide();
	   $("#pc_part_3").hide();
	   $("#pc_part_4").show();
	   $("#pc_part_5").show();
       $("#contacts_list").empty();
           $.ajax({
       type:"post",
       url:"loadContacts.go",
       data:{uid:uid},
	      resultType:"json",
	      success:function(result){
	         var notes = result.obj;
          $.each(notes,function(i,note){
           var li='<li class="disable"><a ><i class="fa fa-file-text-o" title="online" rel="tooltip-bottom"></i> '+note.cn_note_title+'<button type="button" class="btn btn-default btn-xs btn_position btn_delete"><i class="fa fa-times"></i></button><button type="button" class="btn btn-default btn-xs btn_position_2 btn_replay"><i class="fa fa-reply"></i></button></a></li>'
           var $li=$(li);
           $li.data("nid",note.cn_note_id);
			  $("#contacts_list").append($li); 
          })
        $("#contacts_list li:first").click();
	      }
       })
}


function selectContactsNote(){
    $("#contacts_list li a").removeClass("checked");
    $(this).find("a").addClass("checked");
    var title=$("#contacts_list li a.checked").text();
	var nid=$("#contacts_list li a.checked").parent("li").data("nid");
	$.ajax({
		url:"load.go",
		data:{nid:nid},
		type:"post",
		resultType:"json",
		success:function(result){
			$("#noput_note_title").text(title);
			$("#ppp").html(result.obj);
		}
	})
}


function alertReallyDeleteNote(){
	$("#can").load("alert/alert_delete_rollback.html");
	$(".opacity_bg").show();
}


function alertReplayNote(){
	$("#can").load("alert/alert_replay.html",function(){
		  var list = $("#notebook_list li").length;
		  for(var i=0;i<list;i++){
		    var notebook = $('#notebook_list li:eq('+i+')').text();
		    var option='<option value="none">'+notebook+'</option>';
		    var $option=$(option);
		    var nbid = $('#notebook_list li:eq('+i+')').data("nbid");
		    $option.data("nbid",nbid);
		    $("#replaySelect").append($option);
		  }
		  });
	$(".opacity_bg").show();
}


function reallyDeleteNote(){
    var nid = $("#contacts_list li a.checked").parent("li").data("nid");
    $.ajax({
       type:"post",
       url:"reallyDelete.go",
		   data:{nid:nid},
	   resultType:"json",
	   success:function(result){
	       if(result.message==1){
	         alert("彻底删除成功");
	         $("#contacts_list li a.checked").parent("li").remove();
	       }
	      }
    });
}


function searchNoteList(){
    $("#pc_part_2").hide(); 
    $("#pc_part_4").hide();
    $("#pc_part_3").hide();
    $("#pc_part_7").hide();
    $("#pc_part_5").show();
    $("#pc_part_6").show();
    var searchNoteTitle = $.trim($("#search_note").val());
	var page = $("#page").val();
    $.ajax({
	      type:"post",
          url:"searchNote.go",
          data:{searchNoteTitle:searchNoteTitle,page:page},
	      resultType:"json",
	      success:function(result){
	        $.each(result.obj,function(i,n){
	           var li='<li class="disable"><a><i class="fa fa-file-text-o" title="online" rel="tooltip-bottom"></i> '+n.cn_note_title+'<button type="button" class="btn btn-default btn-xs btn_position btn_slide_down"><i class="fa fa-star"></i></button></a></li>'
               var $li=$(li);
	           $li.data("nid",n.cn_note_id);
               $("#searchNoteList").append($li); 
	        })
	        $("#searchNoteList li:first").click();
	       },
	      error:function(){
	    	  alert("搜索失败");
	    	  } 
    });
}


function ShowOrHide(){
	//获取要显示的页数,递增加1
	var page = parseInt($("#page").val())+1;
	//将其设置为要显示的页
	$("#page").val(page);
	//获取查询关键字和要显示的页数,发送ajax加载列表
	searchNoteList();
}


function searchNote(event){
	var code = event.keyCode;
	if(code==13){                     //如果是13就是回车
		$("#page").val("1");          //每次按回车,初始显示第一页
	    $("#searchNoteList").empty(); //清空以前查询列表内容
		searchNoteList();                 //获取查询关键字和要显示的页数,发送ajax加载列表
	}
}

function selectSearchNote(){
    $("#searchNoteList li a").removeClass("checked");
    $(this).find("a").addClass("checked");
    var title=$("#searchNoteList li a.checked").text();
	var nid=$("#searchNoteList li a.checked").parent("li").data("nid");
	$.ajax({
		url:"load.go",
		data:{nid:nid},
		type:"post",
		resultType:"json",
		success:function(result){
			$("#noput_note_title").text(title);
			$("#ppp").html(result.obj);
		}
	})
}


function replayNote(){
	   var nbid = $("#replaySelect option:selected").data("nbid");
	   var nid = $("#contacts_list li a.checked").parent("li").data("nid");
	    $.ajax({
	         type:"post",
	         resultType:"json",
	         url:"replayNote.go",
	         data:{nbid:nbid,nid:nid},
	         success:function(result){
	          if(result.message==1){
	            alert("已恢复到指定位置");
	            $("#contacts_list li a.checked").parent("li").remove();
	            }else{
	             alert("对不起，出错啦");
	            }
	         }
	    });
}


function alertMoveNote(){
	  $("#can").load("alert/alert_move.html",function(){
	  var list = $("#notebook_list li").length;
	  for(var i=0;i<list;i++){
	    var notebook = $('#notebook_list li:eq('+i+')').text();
	    var option='<option value="none">'+notebook+'</option>';
	    var $option=$(option);
	    var nbid = $('#notebook_list li:eq('+i+')').data("nbid");
	    $option.data("nbid",nbid);
	    $("#moveSelect").append($option);
	  }
	  });
	  $(".opacity_bg").show();
}


function moveNote(){
	var nbid = $("#moveSelect option:selected").data("nbid");
	   var nid = $("#notelist li a.checked").parent("li").data("nid");
	    $.ajax({
	         type:"post",
	         resultType:"json",
	         url:"moveNote.go",
	         data:{nbid:nbid,nid:nid},
	         success:function(result){
	          if(result.message==1){
	            alert("已移动到指定位置");
	            $("#notelist li a.checked").parent("li").remove();
	            }else{
	             alert("对不起，出错啦");
	            }
	         }
	    });
}


function showLikeNote(){
	$("#pc_part_2").hide();
	$("#pc_part_3").hide();
	$("#pc_part_4").hide();
	$("#pc_part_6").hide();
	$("#pc_part_5").show();
	$("#pc_part_7").show();
	$("#likeNoteList").empty();
     $.ajax({
         type:"post",
         url:"likeNoteList.go",
         data:{uid:uid},
         resultType:"json",
         success:function(result){
         var notes = result.obj;
         $.each(notes,function(i,note){
         var li='<li class="idle"><a ><i class="fa fa-file-text-o" title="online" rel="tooltip-bottom"></i> '+note.cn_like_title+'<button type="button" class="btn btn-default btn-xs btn_position btn_delete" id="btn_delete"><i class="fa fa-times"></i></button></a></li>'
         var $li=$(li);
         $li.data("nid",note.cn_note_id);
		 $("#likeNoteList").append($li); 
         })
         $("#likeNoteList li:first").click();
    }
         });
}


function addLikeNote(){
    var nid= $("#searchNoteList li a.checked").parent("li").data("nid");
    var title = $("#searchNoteList li a.checked").text();
    var body = $("#ppp").html();
    $.ajax({
        type:"post",
        resultType:"json",
        url:"addLikeNote.go",
        data:{uid:uid,nid:nid,title:title,body:body},
        success:function(result){
           if(result.message==1){
              alert("收藏成功");
           }
           if(result.message==2){
              alert("亲，已经收藏过了");
           }
        },
        error:function(){
           alert("收藏失败");
        }
    });
}

function selectLikeNote(){
	 $("#likeNoteList li a").removeClass("checked");
	    $(this).find("a").addClass("checked");
	    var title=$("#likeNoteList li a.checked").text();
		var nid=$("#likeNoteList li a.checked").parent("li").data("nid");
		$.ajax({
			url:"loadLikeNote.go",
			data:{nid:nid},
			type:"post",
			resultType:"json",
			success:function(result){
				$("#noput_note_title").text(title);
				$("#ppp").html(result.obj);
			}
		})
}


function alertDeleteLikeNote(){
    $(".opacity_bg").show();
    $("#can").load("alert/alert_delete_like.html");
}


function deleteLikeNote(){
	var nid = $("#likeNoteList li a.checked").parent("li").data("nid");
    $.ajax({
        type:"post",
        resultType:"json",
        url:"deleteLikeNote.go",
        data:{nid:nid},
        success:function(result){
            if(result.message==1){
                alert("已取消收藏");
                $("#likeNoteList li a.checked").parent("li").remove();
            }
        },
       error:function(){
          alert("取消收藏失败");
       }
    });
}
