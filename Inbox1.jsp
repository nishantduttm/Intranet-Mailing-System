<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.example.model.DB" %>


<jsp:useBean id="user" class="com.example.model.User" scope="session" />
<%pageContext.setAttribute("inbox",((DB) getServletContext().getAttribute("Database")).getInbox(user.getUserName()),PageContext.PAGE_SCOPE);%>
<jsp:useBean id="inbox" class="com.example.model.Inbox" scope="page" />



              <div class="inbox-head container-fluid">
                    <h3 class="col-xs-3">Inbox</h3>
                    <form class="pull-right position " action="#">
                        <div class="input-append">
                            <input type="text" placeholder="Search Mail" class="sr-input col-xs-7">
                            <button type="button" class="btn sr-btn col-xs-1" data-original-title="" title=""><i class="fa fa-search"></i></button>
                        </div>
                    </form>
                </div>
                <div class="inbox-body">
					<div class="mail-option col-xs-12" >
						<div class="chk-all col-xs-1">
							<input type="checkbox" class="mail-checkbox mail-group-checkbox">
							<div class="btn-group">
								<a class="btn mini all" href="#" data-toggle="dropdown" data-original-title="" title="">
									All
									<i class="fa fa-angle-down "></i>
								</a>
								<ul class="dropdown-menu">
									<li><a href="#"> None</a></li>
									<li><a href="#"> Read</a></li>
									<li><a href="#"> Unread</a></li>
								</ul>
							</div>
						</div>
						<div class="btn-group col-xs-1">
							<a class="btn mini tooltips" href="#" data-toggle="dropdown" data-placement="top" data-original-title="Refresh">
								<i class=" fa fa-refresh"></i>
							</a>
						</div>
						<div class="btn-group hidden-phone col-xs-2">
							<a class="btn mini blue" href="#" data-toggle="dropdown" data-original-title="" title="">
								More
								<i class="fa fa-angle-down "></i>
							</a>
							<ul class="dropdown-menu">
								<li><a href="#"><i class="fa fa-pencil"></i> Mark as Read</a></li>
								<li><a href="#"><i class="fa fa-ban"></i> Spam</a></li>
								<li class="divider"></li>
								<li><a href="#"><i class="fa fa-trash-o"></i> Delete</a></li>
							</ul>
						</div>
						<div class="btn-group col-xs-2">
							<a class="btn mini blue" href="#" data-toggle="dropdown" data-original-title="" title="">
								Move to
								<i class="fa fa-angle-down "></i>
							</a>
							<ul class="dropdown-menu">
								<li><a href="#"><i class="fa fa-pencil"></i> Mark as Read</a></li>
								<li><a href="#"><i class="fa fa-ban"></i> Spam</a></li>
								<li class="divider"></li>
								<li><a href="#"><i class="fa fa-trash-o"></i> Delete</a></li>
							</ul>
						</div>
						<ul class="unstyled inbox-pagination">
							<li><span>1-50 of 234</span></li>
							<li>
								<a href="#" class="np-btn"><i class="fa fa-angle-left  pagination-left"></i></a>
							</li>
							<li>
								<a href="#" class="np-btn"><i class="fa fa-angle-right pagination-right"></i></a>
							</li>
						</ul>
					</div>
					 <table class="table table-inbox table-hover">
						 <tbody>
						 
							<c:forEach var="mail" items="${inbox.unreadMail}"  varStatus="mailLoopCount">
								 
								 <tr class="unread container" onclick="readMail(${mailLoopCount.count-1})">				 
									<td class="inbox-small-cells col-xs-1">
										<input type="checkbox" class="mail-checkbox">
									</td>
									<td class="inbox-small-cells col-xs-1"><i class="fa fa-star"></i></td>
									<td class="view-message  dont-show col-xs-3">${mail.senderUserName}</td>
									<td class="view-message col-xs-3">${mail.subject}</td>
									<td class="view-message  inbox-small-cells col-xs-1"><i class="fa fa-paperclip"></i></td>
									<td class="view-message  text-right col-xs-4">${mail.time}</td>
								</tr>
								
							</c:forEach>	
						</tbody>
					</table>
                </div>
				