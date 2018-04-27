<%@page contentType="text/html;charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="c" %>
<div class="book_l_border1" id="__FenLeiLiuLan">
	<div class="book_sort_tushu">
		<h2>
			分类浏览
		</h2>
		
		<!--1级分类开始-->
		<c:iterator value="cats" var="parent">
			<div class="bg_old" onmouseover="this.className = 'bg_white';"
				onmouseout="this.className = 'bg_old';">
				<h3>
					[<a href='bookList?pid=${parent.id}&cid=${parent.subCats[0].id}'>${parent.name}</a>]
				</h3>
				<ul class="ul_left_list">

						<!--2级分类开始-->
						<c:iterator value="#parent.subCats">
						<li>
							<a href='bookList?pid=${parentId}&cid=${id}'>${name}</a>
						</li>
						</c:iterator>
										</ul>
				<div class="empty_left">
				</div>
			</div>

			<div class="more2">
			</div>
			</c:iterator>
			


		<div class="bg_old">
			<h3>
				&nbsp;
			</h3>
		</div>
	</div>
</div>
