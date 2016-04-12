<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jobs.aspx.cs" Inherits="IEM_Portal.jobs" %>

<%@ Register TagPrefix="asp" Namespace="Saplin.Controls" Assembly="DropDownCheckBoxes" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="description" content="Jobseek - Job Board Responsive HTML Template">
		<meta name="author" content="Coffeecream Themes, info@coffeecream.eu">
        <title>IEM jobs</title>
		<link rel="shortcut icon" href="images/favicon.png">

		<!-- Main Stylesheet -->
		<link href="css/style.css" rel="stylesheet">

		<!-- HTML5 shiv and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		<script src="js/html5shiv.js"></script>
		<script src="js/respond.min.js"></script>
		<![endif]-->

	</head>
	<body>

		<!-- ============ PAGE LOADER START ============ -->

		<div id="loader">
			<i class="fa fa-cog fa-4x fa-spin"></i>
		</div>

		<!-- ============ PAGE LOADER END ============ -->

		<!-- ============ NAVBAR START ============ -->

		<div class="fm-container">
			<!-- Menu -->
			<div class="menu">
                <!--close button-->
				<div class="button-close text-right">
					<a class="fm-button"><i class="fa fa-close fa-2x"></i></a>
				</div>
                <!--menu options-->
				<ul class="nav">
					<li><a href="homepage.aspx">דף הבית</a></li>
					<li class="active"><a href="jobs.aspx">משרות</a></li>
					<li><a href="post-a-job.aspx">פרסם משרה</a></li>
					<li><a href="candidates.aspx">מועמדים</a></li>
					<li><a href="post-a-resume.aspx">פרסם קורות חיים</a></li>
                    <li><a href="resume.aspx">פרופיל משתמש</a></li>
					<li><a class="link-register">הירשם</a></li>
					<li><a class="link-login">התחבר</a></li>
				</ul>		
			</div>
			<!-- end Menu -->
		</div>

		<!-- ============ NAVBAR END ============ -->

		<!-- ============ HEADER START ============ -->

		<header>
			<div id="header-background"></div>
			<div class="container">
				<div class="pull-right">
					<div id="logo"><a href="homepage.aspx"><img src="images/logo.png" alt="Jobseek - Job Board Responsive HTML Template" /></a></div>
				</div>
				<div id="menu-open" class="pull-left">
					<a class="fm-button"><i class="fa fa-bars fa-lg"></i></a>
				</div>
				<div id="searchbox" class="pull-right">
					<form>
						<div class="form-group">
							<label class="sr-only" for="searchfield">Searchbox</label>
							<input type="text" class="form-control" id="searchfield" placeholder="Type keywords and press enter">
						</div>
					</form>
				</div>
				<div id="search" class="pull-right">
					<a><i class="fa fa-search fa-lg"></i></a>
				</div>
			</div>
		</header>

		<!-- ============ HEADER END ============ -->

		<!-- ============ TITLE START ============ -->

		<section id="title">
			<div class="container">
				<div class="row">
					<div class="col-sm-12 text-center">
						<h1>חיפוש משרה</h1>
						<h4>אין מקום טוב יותר להתחיל ממנו</h4>
					</div>
				</div>
			</div>
		</section>

		<!-- ============ TITLE END ============ -->

		<!-- ============ JOBS START ============ -->

		<section id="jobs">
			<div class="container">
				<div class="row">
                    <!-- Find a Job Start -->
                    <div class="col-sm-4" id="sidebar">
                        <div class="sidebar-widget" id="jobsearch">
                            <!--title-->
                            <h2>חיפוש משרה</h2>

                            <form runat="server">
                                <!-- Job Filter Starts -->
                                <!--<div class="row">
                                    <div class="col-xs-12">
                                        <div class="form-group" id="job-search-group">
                                            <label for="job-search" class="sr-only">חיפוש</label>
                                            <input type="text" class="form-control" id="job-search" placeholder="Type and press enter">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <hr>
                                    </div>
                                </div>-->
                                <!--error message-->
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="alert alert-danger" id="jobSearchError" runat="server" style="display:none;">
                               
                                        </div>
                                    </div>
                                </div>
                                <!--row1-->
                                <div class="row">
                                    <!--item1-->
                                    <div class="col-xs-6">
                                        <h5>תחום</h5>
                                        <div class="form-group">
                                            <asp:DropDownCheckBoxes id="jobSearchCategory" runat="server" class="form-control" UseButtons="True" UseSelectAllNode="True"
                                                 OnSelectedIndexChanged="jobSearchCategory_SelectedIndexChanged"> 
                                                <Style SelectBoxWidth="100%" DropDownBoxBoxWidth="100%" DropDownBoxBoxHeight="250" SelectBoxCssClass="checkbox"/>  
                                                <Texts SelectBoxCaption="--בחר תחום--" />
                                            </asp:DropDownCheckBoxes>
                                        </div>
                                    </div>
                                    <!--item2-->
                                    <div class="col-xs-6">
                                        <h5>תת תחום</h5>
                                        <div class="form-group">
                                            <asp:DropDownCheckBoxes  ID="jobSearchSubCategory" runat="server" class="form-control" UseSelectAllNode="True">
                                                <Style SelectBoxWidth="100%" DropDownBoxBoxWidth="100%" DropDownBoxBoxHeight="250" SelectBoxCssClass="checkbox testt" />  
                                                <Texts SelectBoxCaption="--בחר תת תחום--" />
                                            </asp:DropDownCheckBoxes>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <hr>
                                    </div>
                                </div>
                                <!--row2-->
                                <div class="row">
                                    <!--item1-->
                                    <div class="col-xs-6">
                                        <h5>מיקום</h5>
                                        <div class="form-group">
                                            <asp:DropDownCheckBoxes  ID="jobSearchLocation" runat="server" class="form-control" UseSelectAllNode="True">
                                                <Style SelectBoxWidth="100%" DropDownBoxBoxWidth="100%" DropDownBoxBoxHeight="250" SelectBoxCssClass="checkbox"/>  
                                                <Texts SelectBoxCaption="--בחר מיקום--" />
                                            </asp:DropDownCheckBoxes>
                                        </div>
                                    </div>
                                    <!--item2-->
                                    <div class="col-xs-6">
                                        <h5>היקף משרה</h5>
                                        <div class="form-group">
                                            <asp:DropDownCheckBoxes  ID="jobSearchScope" runat="server" class="form-control" UseSelectAllNode="True">
                                                <Style SelectBoxWidth="100%" DropDownBoxBoxWidth="100%" DropDownBoxBoxHeight="250" SelectBoxCssClass="checkbox"/>  
                                                <Texts SelectBoxCaption="--בחר היקף משרה--" />
                                            </asp:DropDownCheckBoxes>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <hr>
                                    </div>
                                </div>
                                <!--row3-->
                                <!--<div class="row">
                                    <div class="col-xs-12">
                                        <h5>ניסיון</h5>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-6">
                                        <p>יותר מ <b><span id="years-field"></span></b> שנים</p>
                                    </div>
                                    <div class="col-xs-6">
                                        <div class="form-slider" id="years"></div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <hr>
                                    </div>
                                </div>-->
                                <!--row4-->
                                <div class="row">
                                    <div class="col-xs-12">
                                        <asp:Button ID="searchJobsBotton" runat="server" OnClick="Search_Jobs" Text="חפש" CssClass="btn btn-primary" /> 
                                    </div>
                                </div>
                            </form>
                             <!-- Job Filter Ends -->
                        </div>
                    </div>
                    <!-- Find a Job end -->

                    <!--job list start-->
					<div class="col-sm-8">
                        <h2>רשימת המשרות</h2>
						<div id="jobsList" class="jobs" runat="server">

						</div>

						<nav>
							<ul class="pagination">
								<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&raquo;</span></a></li>
								<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#" aria-label="Next"><span aria-hidden="true">&laquo;</span></a></li>
							</ul>
						</nav>

					</div>
                    <!--job list end-->

				</div>
			</div>
		</section>

		<!-- ============ JOBS END ============ -->


		<!-- ============ FOOTER START ============ -->

		<footer>
			<div id="prefooter">
				<div class="container">
					<div class="row">
						<div class="col-sm-12" id="social-networks">
							<a href="#"><i class="fa fa-2x fa-facebook-square"></i></a>
							<a href="#"><i class="fa fa-2x fa-twitter-square"></i></a>
							<a href="#"><i class="fa fa-2x fa-google-plus-square"></i></a>
							<a href="#"><i class="fa fa-2x fa-youtube-square"></i></a>
							<a href="#"><i class="fa fa-2x fa-vimeo-square"></i></a>
							<a href="#"><i class="fa fa-2x fa-pinterest-square"></i></a>
							<a href="#"><i class="fa fa-2x fa-linkedin-square"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div id="credits">
				<div class="container text-center">
					<div class="row">
						<div class="col-sm-12">
							&copy; 2015 Jobseek - Responsive Job Board HTML Template<br>
							Designed &amp; Developed by <a href="http://themeforest.net/user/Coffeecream" target="_blank">Coffeecream Themes</a>
						</div>
					</div>
				</div>
			</div>
		</footer>

		<!-- ============ FOOTER END ============ -->

		<!-- ============ LOGIN START ============ -->

        <div class="popup" id="login">
            <div class="popup-form">
                <div class="popup-header">
                    <a class="close"><i class="fa fa-remove fa-lg"></i></a>
                    <h2>התחבר</h2>
                </div>
                <form>
                    <!--<ul class="social-login">
                    <li><a class="btn btn-facebook"><i class="fa fa-facebook"></i>Sign In with Facebook</a></li>
                    <li><a class="btn btn-google"><i class="fa fa-google-plus"></i>Sign In with Google</a></li>
                    <li><a class="btn btn-linkedin"><i class="fa fa-linkedin"></i>Sign In with LinkedIn</a></li>
                </ul>-->
                    <hr>
                    <div class="form-group">
                        <label for="login-username">שם משתמש</label>
                        <input type="text" class="form-control" id="login-username">
                    </div>
                    <div class="form-group">
                        <label for="login-password">סיסמא</label>
                        <input type="password" class="form-control" id="login-password">
                    </div>
                    <button type="submit" class="btn btn-primary">התחבר</button>
                </form>
            </div>
        </div>

		<!-- ============ LOGIN END ============ -->

		<!-- ============ REGISTER START ============ -->

        <div class="popup" id="register">
            <div class="popup-form">
                <div class="popup-header">
                    <a class="close"><i class="fa fa-remove fa-lg"></i></a>
                    <h2>הרשמה</h2>
                </div>
                <form>
                    <!---<ul class="social-login">
                    <li><a class="btn btn-facebook"><i class="fa fa-facebook"></i>Register with Facebook</a></li>
                    <li><a class="btn btn-google"><i class="fa fa-google-plus"></i>Register with Google</a></li>
                    <li><a class="btn btn-linkedin"><i class="fa fa-linkedin"></i>Register with LinkedIn</a></li>
                </ul>-->
                    <hr>
                    <div class="form-group">
                        <label for="register-name">שם פרטי</label>
                        <input type="text" class="form-control" id="register-name">
                    </div>
                    <div class="form-group">
                        <label for="register-surname">שם משפחה</label>
                        <input type="text" class="form-control" id="register-surname">
                    </div>
                    <div class="form-group">
                        <label for="register-email">אימייל</label>
                        <input type="email" class="form-control" id="register-email">
                    </div>
                    <hr>
                    <div class="form-group">
                        <label for="register-username">שם משתמש</label>
                        <input type="text" class="form-control" id="register-username">
                    </div>
                    <div class="form-group">
                        <label for="register-password1">סיסמא</label>
                        <input type="password" class="form-control" id="register-password1">
                    </div>
                    <div class="form-group">
                        <label for="register-password2">הקלד סיסמא שנית</label>
                        <input type="password" class="form-control" id="register-password2">
                    </div>
                    <button type="submit" class="btn btn-primary">הירשם</button>
                </form>
            </div>
        </div>

		<!-- ============ REGISTER END ============ -->

		<!-- Modernizr Plugin -->
		<script src="js/modernizr.custom.79639.js"></script>

		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="js/jquery-1.11.2.min.js"></script>

		<!-- Bootstrap Plugins -->
		<script src="js/bootstrap.min.js"></script>

		<!-- Retina Plugin -->
		<script src="js/retina.min.js"></script>

		<!-- ScrollReveal Plugin -->
		<script src="js/scrollReveal.min.js"></script>

		<!-- Flex Menu Plugin -->
		<script src="js/jquery.flexmenu.js"></script>

		<!-- Slider Plugin -->
		<script src="js/jquery.ba-cond.min.js"></script>
		<script src="js/jquery.slitslider.js"></script>

		<!-- Carousel Plugin -->
		<script src="js/owl.carousel.min.js"></script>

		<!-- Parallax Plugin -->
		<script src="js/parallax.js"></script>

		<!-- Counterup Plugin -->
		<script src="js/jquery.counterup.min.js"></script>
		<script src="js/waypoints.min.js"></script>

		<!-- No UI Slider Plugin -->
		<script src="js/jquery.nouislider.all.min.js"></script>

		<!-- Bootstrap Wysiwyg Plugin -->
		<script src="js/bootstrap3-wysihtml5.all.min.js"></script>

		<!-- Flickr Plugin -->
		<script src="js/jflickrfeed.min.js"></script>

		<!-- Fancybox Plugin -->
		<script src="js/fancybox.pack.js"></script>

		<!-- Magic Form Processing -->
		<script src="js/magic.js"></script>

		<!-- jQuery Settings -->
		<script src="js/settings.js"></script>


	</body>
</html>