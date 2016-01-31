<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="post-a-resume.aspx.cs" Inherits="IEM_Portal.post_a_resume" %>

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
                    <li class="active"><a href="post-a-resume.aspx">פרסם קורות חיים</a></li>
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

		<!-- ============ RESUME START ============ -->

		<section id="resume">
			<div class="container">
				<div class="row text-center">
					<div class="col-sm-12">
						<h1>פרסם קורות חיים</h1>
						<h4>מצא את המשרה המושלמת בשבילך</h4>
                        <p>&nbsp;</p>
						<!--<div class="jumbotron">
							<h3>Have an account?</h3>
							<p>If you don’t have an account you can create one below by entering your email address/username.<br>
							A password will be automatically emailed to you.</p>
							<p><a href="#" class="btn btn-primary">Sign In</a></p>
						</div>-->
					</div>
				</div>

				<form>

					<!-- Resume Details Start -->
					<div class="row">
						<div class="col-sm-6">
							<h2>פרטים אישיים</h2>
						</div>
						<div class="col-sm-6 text-right">
							<a class="btn btn-primary"><i class="fa fa-linkedin-square"></i> LinkedIn Import</a>
						</div>
					</div>
                    <!--row1-->
					<div class="row">
						<div class="col-sm-3">
							<div class="form-group" id="resume-name-group">
								<label for="resume-name">שם פרטי</label>
								<input type="text" class="form-control" id="resume-name" placeholder="הקלד שם פרטי">
							</div>
						</div>
                        <div class="col-sm-3">
                            <div class="form-group" id="resume-name-group">
                                <label for="resume-name">שם משפחה</label>
                                <input type="text" class="form-control" id="resume-name" placeholder="הקלד שם פרטי">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group" id="resume-photo-group">
                                <label for="resume-photo">תמונה</label>
                                <input type="text" class="form-control" id="resume-photo" placeholder="Photo URL">
                            </div>
                        </div>
					</div>
                    <!--row2-->
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group" id="resume-title-group">
								<label for="resume-title">תפקיד</label>
								<input type="text" class="form-control" id="resume-title" placeholder="לדוגמה: מנתח מערכות">
							</div>
						</div>
                        <div class="col-sm-6">
                            <div class="form-group" id="resume-category-group">
                                <label for="resume-category">תחום תפקיד</label>
                                <select class="form-control" id="resume-category">
                                    <option>בחר תחום</option>
                                    <option>מערכות מידע</option>
                                    <option>תפעול</option>
                                    <option>ניהול</option>
                                    <option>ייעוץ</option>
                                </select>
                            </div>
                        </div>
					</div>
                    <!--row3-->
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group" id="resume-email-group">
								<label for="resume-email">אימייל</label>
								<input type="email" class="form-control" id="resume-email" placeholder="you@yourdomain.com">
							</div>
						</div>
                        <div class="col-sm-6">
                            <div class="form-group" id="resume-location-group">
                                <label for="resume-location">עיר מגורים</label>
                                <input type="text" class="form-control" id="resume-location" placeholder="לדוגמה: ירושלים">
                            </div>
                        </div>
					</div>
                    <!--row4-->
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group" id="resume-content-group">
                                <label for="resume-content">תוכן קורות חיים</label>
                                <div class="textarea form-control" id="resume-content"></div>
                            </div>
                        </div>
                    </div>
                    <!--row5-->
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group" id="resume-skills-group">
								<label for="resume-skills">מיומנויות</label>
								<input type="text" class="form-control" id="resume-skills" placeholder="לדוגמה: HTML, SQL, Oracle">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<hr class="dashed">
						</div>
					</div>
                    <!--row6-->
					<div class="row social-network">
						<div class="col-sm-6">
							<div class="form-group" id="resume-social-network-group">
								<label for="resume-social-network">לינקים לפרופיל שלך ברשתות חברתיות</label>
								<select  class="form-control" id="resume-social-network">
									<option>בחר רשת חברתית</option>
									<option>Facebook</option>
									<option>Twitter</option>
									<option>Google+</option>
									<option>LinkedIn</option>
									<option>Github</option>
								</select>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group" id="resume-social-network-url-group">
								<label for="resume-social-network-url">URL</label>
								<input type="text" class="form-control" id="resume-social-network-url" placeholder="http://">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<hr class="dashed">
						</div>
					</div>                    
                    <!--row7-->
					<div class="row">
						<div class="col-sm-12">
							<p><a id="add-social-network">+ הוסף רשת חברתית</a></p>
							<hr>
						</div>
					</div>
					<!-- Resume Details End -->

					<!-- Experience Start -->
					<div class="row">
						<div class="col-sm-12">
							<p>&nbsp;</p>
							<h2>ניסיון מעשי</h2>
						</div>
					</div>
                    <!--row1-->
					<div class="row experience">
						<div class="col-sm-6">
							<div class="form-group" id="resume-employer-group">
								<label for="resume-employer">מעסיק</label>
								<input type="text" class="form-control" id="resume-employer" placeholder="שם החברה">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group" id="resume-experience-dates-group">
								<label for="resume-experience-dates">תאריך התחלה/סיום</label>
								<input type="text" class="form-control" id="resume-experience-dates" placeholder="לדוגמה: אפריל 2010 - יוני 2013">
							</div>
						</div>
					</div>
                    <!--row2-->
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group" id="resume-job-title-group">
								<label for="resume-job-title">תפקיד</label>
                                <input type="text" class="form-control" id="resume-job-title" placeholder="לדוגמה: מפתח מערכות">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group" id="resume-responsibilities-group">
								<label for="resume-responsibilities">תחומי אחריות</label>
                                <input type="text" class="form-control" id="resume-responsibilities" placeholder="לדוגמה: פיתוח אתרי אינטרנט">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<hr class="dashed">
						</div>
					</div>
                    <!--row3-->
					<div class="row">
						<div class="col-sm-12">
							<p><a id="add-experience">+ הוסף ניסיון מעשי</a></p>
							<hr>
						</div>
					</div>
					<!-- Experience End -->

					<!-- Education Start -->
					<div class="row">
						<div class="col-sm-12">
							<p>&nbsp;</p>
							<h2>השכלה</h2>
						</div>
					</div>
                    <!--row1-->
					<div class="row education">
						<div class="col-sm-6">
							<div class="form-group" id="resume-school-group">
								<label for="resume-school">שם מוסד הלימודים</label>
								<input type="text" class="form-control" id="resume-school">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group" id="resume-education-dates-group">
								<label for="resume-education-dates">תאריך התחלה/סיום</label>
                                <input type="text" class="form-control" id="resume-education-dates" placeholder="לדוגמה: אפריל 2010 - יוני 2013">
							</div>
						</div>
					</div>
                    <!--row2-->
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group" id="resume-qualifications-group">
								<label for="resume-qualifications">סמכות</label>
								<input type="text" class="form-control" id="resume-qualifications" placeholder="לדוגמה: מהנדס">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group" id="resume-notes-group">
								<label for="resume-notes">הערות נוספות</label>
								<input type="text" class="form-control" id="resume-notes" placeholder="הישגים נוספים">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<hr class="dashed">
						</div>
					</div>
                    <!--row3-->
					<div class="row">
						<div class="col-sm-12">
							<p><a id="add-education">+ הוסף השכלה</a></p>
							<hr>
						</div>
					</div>
					<!-- Education End -->

					<!-- Resume File Start -->
					<div class="row">
						<div class="col-sm-12">
							<p>&nbsp;</p>
							<h2>קובץ קורות חיים</h2>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<div class="form-group" id="resume-file-group">
								<label for="resume-file">העלה קובץ קורות חיים</label>
								<input type="file" id="resume-file">
								<p class="help-block">העלה קובץ קורות חיים על מנת שמעסיקים יוכלו לצפות. גודל מקסימלי: 64 MB</p>
							</div>
						</div>
					</div>
					<!-- Resume File Start -->

					<div class="row">
                        <p>&nbsp;</p>
                        <div class="col-sm-6 text-left">
                            <a href="resume.aspx" class="btn btn-primary btn-lg" style="background-color:grey;">צפה בפרופיל <i class="fa fa-arrow-left"></i></a>
                        </div>
                        <div class="col-sm-6 text-right">
                            <a href="#" class="btn btn-primary btn-lg">פרסם קורות חיים </a>
                        </div>
					</div>

				</form>

			</div>
		</section>

		<!-- ============ RESUME END ============ -->


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
