function loadNoteBook(){
    $.ajax({
        type:"post",
        url:"loadNoteBook.go",
        data:{uid:uid},
        resultType:"json",
        success:function(result){
              var notebooks = result.obj;
	           $.each(notebooks,function(i,notebook){
	                var li='<li class="online">'
					    li+='<a>'
					    li+='<i class="fa fa-book" title="online" rel="tooltip-bottom">'
					    li+='</i>'+notebook.cn_notebook_name+'</a></li>'
					var $li=$(li);
					$li.data("nbid",notebook.cn_notebook_id);
					$("#notebook_list").append($li);    
	           })
        }
    })
}

function addNoteBook(){
    $("#can").load("alert/alert_notebook.html");
    $(".opacity_bg").show();
   }

function closeWindow(){
    $("#can").empty();
    $(".opacity_bg").hide();
}

function creatNoteBook(){
    var noteBookName = $.trim($("#can input").val());
    if($.trim(noteBookName)==""){
       alert("笔记本名称不能为空");
    }else{
        $.ajax({
          url:"addNoteBook.go",
			data:{noteBookName:noteBookName,uid:uid},
			type:"post",
			resultType:"json",
			success:function(result){
			   if(result.obj==true){
			    alert("创建成功");
			var li='<li class="online">'
			    li+='<a>'
			    li+='<i class="fa fa-book" title="online" rel="tooltip-bottom">'
			    li+='</i>'+result.message+'</a></li>'
		    var $li=$(li);
			$li.data("nbid",result.id);
				 $("#notebook_list").prepend($li);   
			   }
			}
    })
    }

}


