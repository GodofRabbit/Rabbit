<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@taglib uri="/struts-tags" prefix="c"%>
<div id="top_bar">用户点评：${num}条</div>
					<c:if test="comlist.size()==0">
						该商品暂未评论
					</c:if>
					<c:else>
							<ul>
							<c:iterator value="comlist">
								<li style="overflow:auto; zoom:1;">
									<c:if test="picAddress==null">
									<img class="headImage" src="../headImage/defaultImage.gif"/>
									</c:if>
									<c:else>
										<img class="headImage" src="../headImage/${picAddress}"/>
									</c:else>
									<div class="content">
									<div class="userInfo">${userName}</div>
									<div style="width:100%;height:15px;">
									<span class="star${star}"></span>
									<div class="point">${star}分</div>
									</div>
									<div class="comment-entry">
									${comment}
									</div>
									<div  class="date">
									${time} 
									</div>
									
									
									</div>
								</li>
								</c:iterator>
							</ul>
							</c:else>
							<div style="overflow:auto; zoom:1;"><span style="float:right;"><a href="#" style="color:blue;">显示全部(${num}条)</a>&nbsp;&nbsp;&nbsp;</span>
							</div>