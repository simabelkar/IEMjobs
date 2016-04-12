<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="resume.aspx.cs" Inherits="IEM_Portal.resume" %>

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
                    <li><a href="jobs.aspx">משרות</a></li>
                    <li><a href="post-a-job.aspx">פרסם משרה</a></li>
                    <li><a href="candidates.aspx">מועמדים</a></li>
                    <li><a href="post-a-resume.aspx">פרסם קורות חיים</a></li>
                    <li class="active"><a href="resume.aspx">פרופיל משתמש</a></li>
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

		<section id="titleSection">
			<div class="container">
				<div class="row">
					<div class="col-sm-12 text-center">
                        <div id="title" runat="server"></div>
					</div>
				</div>
			</div>
		</section>

		<!-- ============ TITLE END ============ -->

		<!-- ============ CONTENT START ============ -->

		<section id="jobsSection">
			<div class="container">
				<div class="row">
					<div class="col-sm-8">
						<article>
							<h2>פרופיל משתמש</h2>
                            <div id="userProfile" runat="server" style="display:table-row">
                            </div>
							
                            <div id="userSkills" runat="server" style="display:table-row">
                            </div>
							
                            <div id="workExperience" runat="server" style="display:table-row">
                            </div>
							
                            <div id="education" runat="server" style="display:table-row">
                            </div>

							<!--<p>&nbsp;</p>
							<p><a href="#" class="btn btn-primary btn-lg"><i class="fa fa-arrow-down"></i> הורד קורות חיים</a></p>-->
						</article>
					</div>
					<div class="col-sm-4" id="sidebar">
						<div class="sidebar-widget" id="share">
                            <div id="socialNW" runat="server"></div>
						</div>
						<hr>
						<div class="sidebar-widget" id="widget-contact">
                            <h2>יצירת קשר</h2>
                            <div id="contactDetails" runat="server"></div>
						</div>
						<hr>
						<div id="skills" class="sidebar-widget" runat="server">
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- ============ CONTENT END ============ -->


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
		<script src="js/settings.js" charset="utf-8"></script>


	</body>
</html>
