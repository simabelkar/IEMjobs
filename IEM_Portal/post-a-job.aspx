<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="post-a-job.aspx.cs" Inherits="IEM_Portal.post_a_job" %>

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
                    <li class="active"><a href="post-a-job.aspx">פרסם משרה</a></li>
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

		<!-- ============ POST JOBS START ============ -->

		<section id="jobs">
			<div class="container">
				<div class="row text-center">
					<div class="col-sm-12">
						<h1>פרסם משרה</h1>
						<h4>מצא מועמד מתאים</h4>
                        <p>&nbsp;</p>
						<div class="jumbotron">
							<h3>רשום כבר?</h3>
							<p>אם אין לך חשבון אתה יכול להירשם בלחיצה על "הרשמה" בקלות ובחינם!
                            <br />
                            אם נרשמת כבר אנא התחבר על מנת לפרסם משרה</p>
							<p><a href="#" class="btn btn-primary link-register">הירשם</a></p>
						</div>
					</div>
				</div>

                <div class="error">
                    <div id="errorlable">
                        <label runat="server" name="errormessagelable" id="postjoberror"></label>
                    </div>
                </div>

				<form id="postjobform" runat="server">
					<div class="row">
                        <!------job details-------->
						<div class="col-sm-6">
							<h2>פרטי משרה</h2>

                            <!--job title (required), limit: 100 characters-->
                            <div class="form-group" id="job-title-group">
                                <label>כותרת המשרה <span style="color:red;">*</span></label>
                                <asp:TextBox ID="jobtitle" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="לדוגמה: מנתח/ת מערכות מידע" required="required" />
                                <asp:RegularExpressionValidator ID="valjobtitle" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postjobvalidation"
                                    ControlToValidate="jobtitle"
                                    ErrorMessage="לא ניתן להזין יותר מ100 תווים"
                                    ValidationExpression=".{,99}.*" />
                            </div>

                            <!--job description (required), limit: 255 characters-->
                            <div class="form-group" id="job-description-group">
                                <label>תיאור המשרה <span style="color:red;">*</span></label>
                                <asp:TextBox ID="jobdescription" runat="server" CssClass="textarea form-control" TextMode="MultiLine" required="required"/>
                                <asp:RegularExpressionValidator ID="valjobdescription" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postjobvalidation"
                                    ControlToValidate="jobdescription"
                                    ErrorMessage="לא ניתן להזין יותר מ255 תווים"
                                    ValidationExpression=".{,254}.*" />
                            </div>

                            <!--job requirements, limit: 255 characters-->
                            <div class="form-group" id="job-requirements-group">
                                <label>דרישות המשרה</label>
                                <asp:TextBox ID="jobrequirement" runat="server" CssClass="textarea form-control" TextMode="MultiLine"/>
                                <asp:RegularExpressionValidator ID="valjobrequirement" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postjobvalidation"
                                    ControlToValidate="jobrequirement"
                                    ErrorMessage="לא ניתן להזין יותר מ255 תווים"
                                    ValidationExpression=".{,254}.*" />
                            </div>

                            <!--job category (required), dropdown list-->
                            <div class="form-group" id="job-category-group">
                                <label for="job-category">תחום המשרה</label>
                                <select class="form-control" id="job-category">
                                    <option disabled>בחר תחום משרה</option>
                                    <option>מערכות מידע</option>
                                    <option>תפעול</option>
                                    <option>ניהול</option>
                                    <option>ייעוץ</option>
                                </select>
                            </div>

                            <!--job sub-category (required), dropdown list-->
                            <div class="form-group" id="job-sub-category-group">
                                <label for="job-sub-category">תת תחום</label>
                                <select class="form-control" id="job-sub-category">
                                    <option disabled>בחר תת תחום</option>
                                    <option>מנתח מערכות מידע</option>
                                    <option>מהנדס בדיקות תוכנה</option>
                                    <option>מיישם מערכות מידע</option>
                                    <option>מהנדס ארגון ושיטות</option>
                                    <option>מהנדס מוצר</option>
                                    <option>מהנדס אנוש</option>
                                    <option>מהנדס איכות</option>
                                    <option>קניין</option>
                                    <option>מנהל אגף</option>
                                    <option>מנהל סניף</option>
                                    <option>מנהל מחלקה</option>
                                    <option>יועץ</option>
                                </select>
                            </div>

                            <!--job location (required), dropdown list-->
                            <div class="form-group" id="job-location-group">
                                <label for="job-location">עיר <span style="color:red;">*</span></label>
                                <select class="form-control" id="job-location">
                                    <option disabled="disabled">בחר עיר</option>
                                    <option>ירושלים</option>
                                    <option>תל אביב</option>
                                    <option>חיפה</option>
                                    <option>אשדוד</option>
                                    <option>אילת</option>
                                </select>
                            </div>

                            <!--job scope (required), dropdown list-->
                            <div class="form-group" id="job-scope-group">
                                <label for="job-scope">היקף משרה</label>
                                <select class="form-control" id="job-scope">
                                    <option disabled="disabled">בחר היקף משרה</option>
                                    <option>משרה מלאה</option>
                                    <option>משרה חלקית</option>
                                    <option>משמרות</option>
                                    <option>לפי שעות</option>
                                </select>
                            </div>
						</div>

                        <!------company details-------->
						<div class="col-sm-6">
							<h2>פרטי חברה</h2>

                            <!--company name (required), limit: 50 characters-->
							<div class="form-group" id="company-name-group">
								<label>שם החברה</label>
								<asp:TextBox ID="companyname" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="הקלד את שם החברה" required="required"/>
							    <asp:RegularExpressionValidator ID="valcompanyname" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postjobvalidation"
                                    ControlToValidate="companyname"
                                    ErrorMessage="לא ניתן להזין יותר מ50 תווים"
                                    ValidationExpression=".{,49}.*" />
                            </div>

                            <!--company description, limit: 255 characters-->
							<div class="form-group" id="company-description-group">
								<label>תיאור</label>
								<asp:TextBox ID="companydescription" runat="server" CssClass="textarea form-control" TextMode="MultiLine" />
                                <asp:RegularExpressionValidator ID="valcompanydescription" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postjobvalidation"
                                    ControlToValidate="companydescription"
                                    ErrorMessage="לא ניתן להזין יותר מ255 תווים"
                                    ValidationExpression=".{,254}.*" />
							</div>

                            <!--company email (required), limit: 255 characters and email address format-->
                            <div class="form-group" id="company-email-group">
                                <label">אימייל למשלוח קורות חיים <span style="color:red;">*</span></label>
                                <asp:TextBox ID="companyemail" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="you@yourdomain.com" required="required"/>
                                <asp:RegularExpressionValidator ID="valcompanyemail" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postjobvalidation"
                                    ControlToValidate="companyemail"
                                    ErrorMessage="כתובת מייל לא חוקית"
                                    ValidationExpression="^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$" />
                            </div>

                            <!--company website, limit: 255 characters and website address format-->
							<div class="form-group" id="company-website-group">
								<label>אתר החברה</label>
								<asp:TextBox ID="companywebsite" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="http://"/>
							    <asp:RegularExpressionValidator ID="valcompanywebsite" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postjobvalidation"
                                    ControlToValidate="companywebsite"
                                    ErrorMessage="לא ניתן להזין יותר מ255 תווים"
                                    ValidationExpression="http://*" />
                            </div>

                            <!--company logo, image-->
							<div class="form-group" id="company-logo-group">
								<label for="company-logo">לוגו</label>
								<input type="file" id="company-logo">
							</div>
						</div>
					</div>

                    <!--submit button-->
                    <div class="row">
                        <p>&nbsp;</p>
                        <div class="col-sm-6 text-left">
                            <a href="#" class="btn btn-primary btn-lg" style="background-color:grey;">צפה במשרה <i class="fa fa-arrow-left"></i></a>
                        </div>
                        <div class="col-sm-6 text-right">
                            <asp:Button ID="postjobbutton" runat="server" OnClick="Post_A_Job"  Text="פרסם משרה" CssClass="btn btn-primary btn-lg" ValidationGroup="postjobvalidation" />
                        </div>
					</div>

				</form>
			</div>
		</section>

		<!-- ============ POST JOBS END ============ -->


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
