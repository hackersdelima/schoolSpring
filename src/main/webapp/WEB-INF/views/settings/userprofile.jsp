<%@ taglib tagdir="/WEB-INF/tags" prefix="tag" %>
<tag:header title="USER DETAILS"/>
				<div class="col-md-3 col-sm-3 col-xs-12 profile_left">
					<div class="profile_img">
						<div id="crop-avatar">
							<!-- Current avatar -->
							<img class="img-responsive avatar-view"
								src="resources/images/user.jpg" alt="Avatar"
								title="Change the avatar">
						</div>
					</div>
					<h3>${sessionScope.userDetail.username }</h3>

					<ul class="list-unstyled user_data">
						<li><i class="fa fa-map-marker user-profile-icon"></i>
							Unknown</li>
					</ul>
					<a class="btn btn-success"><i class="fa fa-edit m-right-xs"></i>
						Edit Profile</a> <br />
				</div>
				<div class="col-md-9 col-sm-9 col-xs-12">
					<div class="" role="tabpanel" data-example-id="togglable-tabs">
						<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
							<li role="presentation" class="active"><a
								href="#tab_content1" id="home-tab" role="tab" data-toggle="tab"
								aria-expanded="true">Permissions</a></li>
							<li role="presentation" class=""><a href="#tab_content2"
								role="tab" id="profile-tab" data-toggle="tab"
								aria-expanded="false">Recent Activity</a></li>
						</ul>
						<div id="myTabContent" class="tab-content">
							<div role="tabpanel" class="tab-pane fade active in"
								id="tab_content1" aria-labelledby="home-tab">
								<table class="table jambo_table">
									<thead>
										<tr>
											<td>S.no</td>
											<td>Permission Name</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>Register Students</td>
										</tr>
										<tr>
											<td>2</td>
											<td>View Registered Students</td>
										</tr>
									</tbody>
								</table>


							</div>
							<div role="tabpanel" class="tab-pane fade" id="tab_content2"
								aria-labelledby="profile-tab">

								<!-- start recent activity -->
								<ul class="messages">
									<li>
										<div class="message_date">
											<h3 class="date text-info">24</h3>
											<p class="month">May</p>
											<p class="year">2017</p>
										</div>
										<div class="message_wrapper">
											<h4 class="heading">Student Registration</h4>
											<blockquote class="message">#Note: This is a
												SAMPLE.</blockquote>
											<br />
											<p class="url">
												<span class="fs1 text-info" aria-hidden="true"
													data-icon=""></span> <a href="#"><i
													class="fa fa-paperclip"></i> Registered Students. </a>
											</p>
										</div>
									</li>

								</ul>
								<!-- end recent activity -->

							</div>
						</div>
					</div>
				</div>
	<tag:footer/>