﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="post-a-job.aspx.cs" Inherits="IEM_Portal.post_a_job" %>

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
        <script>
          (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
          (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
          m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
          })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

          ga('create', 'UA-79894881-1', 'auto');
          ga('send', 'pageview');

        </script>
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
                    <li><a href="edit-resume.aspx">עדכן קורות חיים</a></li>
                    <li><a href="resume.aspx">פרופיל משתמש</a></li>
                    <li><a href="register.aspx">הירשם</a></li>
					<li><a href="login.aspx">התחבר</a></li>
                </ul>	
			</div>
			<!-- end Menu -->
		</div>

		<!-- ============ NAVBAR END ============ -->

        <form runat="server">
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
                <!--login button\user name-->
                <div class="pull-right">
                    <label id="displayName" class="sr-only-focusable" style="color:white; font-size:1.5em;padding-left: 20px;">&nbsp&nbsp שלום <span id="loggedInUser" runat="server"></span></label>
                    <a id="loginBtn" runat="server" href="login.aspx" class="btn btn-lg btn-default">התחבר</a>
                    <asp:linkbutton ID="logoutBtn" runat="server" class ="btn btn-lg btn-default" Text="התנתק" onClick="logoutBtn_Click" Style="display:none;" />
                </div>
                <!--register button-->
                <div class="pull-left text-left" style="padding-left: 60px;">
                    <a id="registerBtn" runat="server" href="register.aspx" class="btn btn-lg btn-default">הרשם</a>
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
						<!--<div class="jumbotron">
							<h3>רשום כבר?</h3>
							<p>אם אין לך חשבון אתה יכול להירשם בלחיצה על "הרשמה" בקלות ובחינם!
                            <br />
                            אם נרשמת כבר אנא התחבר על מנת לפרסם משרה</p>
							<p><a href="#" class="btn btn-primary link-register">הירשם</a></p>
						</div>-->
					</div>
				</div>

                    <!--error message-->
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="alert alert-danger" id="postJobError" runat="server" style="display:none;">
                                
                            </div>
                        </div>
                    </div>

					<div class="row">
                        <!------job details-------->
						<div class="col-sm-6">
							<h2>פרטי משרה</h2>

                            <!--job title (required), limit: 100 characters-->
                            <div class="form-group" id="job-title-group">
                                <label>כותרת המשרה <span style="color:red;">*</span></label>
                                <asp:TextBox ID="jobTitle" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="לדוגמה: מנתח/ת מערכות מידע" required="required" />
                                <asp:RegularExpressionValidator ID="jobTitleValidator" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postJobValidation"
                                    ControlToValidate="jobTitle"
                                    ErrorMessage="לא ניתן להזין יותר מ100 תווים"
                                    ValidationExpression="^.{1,100}$" />
                            </div>

                            <!--job description (required), limit: 500 characters-->
                            <div class="form-group" id="job-description-group">
                                <label>תיאור המשרה <span style="color:red;">*</span></label>
                                <asp:TextBox ID="jobDescription" runat="server" CssClass="form-control" TextMode="MultiLine" required="required"/>
                                <asp:RegularExpressionValidator ID="jobDescriptionValidator" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postJobValidation"
                                    ControlToValidate="jobDescription"
                                    ErrorMessage="לא ניתן להזין יותר מ500 תווים"
                                    ValidationExpression="^.{1,500}$" />
                            </div>

                            <!--job requirements, limit: 500 characters-->
                            <div class="form-group" id="job-requirements-group">
                                <label>דרישות המשרה</label>
                                <asp:TextBox ID="jobRequirement" runat="server" CssClass="form-control" TextMode="MultiLine"/>
                                <asp:RegularExpressionValidator ID="jobRequirementValidator" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postJobValidation"
                                    ControlToValidate="jobRequirement"
                                    ErrorMessage="לא ניתן להזין יותר מ500 תווים"
                                    ValidationExpression="^.{1,500}$" />
                            </div>

                            <!--job category (required), dropdown list-->
                            <div class="form-group" id="job-category-group">
                                <label>תחום המשרה <span style="color:red;">*</span></label>
                                <asp:DropDownList ID="jobCategory" runat="server" CssClass="form-control"
                                    AutoPostBack="true" onSelectedIndexChanged="Populate_Job_Sub_Category_List">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="jobCategoryValidator" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postJobValidation"
                                    ControlToValidate="jobCategory" InitialValue="0" ErrorMessage="בחר ערך מהרשימה" />
                            </div>

                            <!--job sub-category (required), dropdown list-->
                            <div class="form-group" id="job-sub-category-group">
                                <label>תת תחום <span style="color:red;">*</span></label>
                                <asp:DropDownList ID="jobSubCategory" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="--בחר תת תחום--" Value="0" />
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="jobSubCategoryValidator" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postJobValidation"
                                    ControlToValidate="jobSubCategory" InitialValue="0" ErrorMessage="בחר ערך מהרשימה" />
                            </div>

                            <!--job location (required), dropdown list-->
                            <div class="form-group" id="job-location-group">
                                <label>עיר <span style="color:red;">*</span></label>
                                <asp:DropDownList ID="jobLocation" runat="server" CssClass="form-control">   
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="jobLocationValidator" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postJobValidation"
                                   ControlToValidate="jobLocation" InitialValue="0" ErrorMessage="בחר ערך מהרשימה" />
                            </div>

                            <!--job scope (required), dropdown list-->
                            <div class="form-group" id="job-scope-group">
                                <label>היקף משרה <span style="color:red;">*</span></label>
                                <asp:DropDownList ID="jobScope" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="jobScopeValidator" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postJobValidation"
                                    ControlToValidate="jobScope" InitialValue="0" ErrorMessage="בחר ערך מהרשימה" />
                            </div>
						</div>

                        <!------company details-------->
						<div class="col-sm-6">
							<h2>פרטי חברה</h2>

                            <!--company name (required), limit: 50 characters-->
							<div class="form-group" id="company-name-group">
								<label>שם החברה <span style="color:red;">*</span></label>
								<asp:TextBox ID="companyName" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="הקלד את שם החברה" required="required"/>
							    <asp:RegularExpressionValidator ID="companyNameValidator" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postJobValidation"
                                    ControlToValidate="companyName"
                                    ErrorMessage="לא ניתן להזין יותר מ50 תווים"
                                    ValidationExpression="^.{1,50}$" />
                            </div>

                            <!--company description, limit: 500 characters-->
							<div class="form-group" id="company-description-group">
								<label>תיאור</label>
								<asp:TextBox ID="companyDescription" runat="server" CssClass="form-control" TextMode="MultiLine" />
                                <asp:RegularExpressionValidator ID="companyDescriptionValidator" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postJobValidation"
                                    ControlToValidate="companyDescription"
                                    ErrorMessage="לא ניתן להזין יותר מ500 תווים"
                                    ValidationExpression="^.{1,500}$" />
							</div>

                            <!--company email (required), limit: email address format-->
                            <div class="form-group" id="company-email-group">
                                <label">אימייל למשלוח קורות חיים <span style="color:red;">*</span></label>
                                <asp:TextBox ID="companyEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="you@yourdomain.com" required="required"/>
                            </div>

                            <!--company website, limit: website address format-->
							<div class="form-group" id="company-website-group">
								<label>אתר החברה</label>
								<asp:TextBox ID="companyWebsite" runat="server" CssClass="form-control" TextMode="Url" placeholder="http://"/>
							</div>

                            <!--company logo (URL), limit: 255 characters-->
							<div class="form-group" id="company-logo-group">
								<label>לוגו</label>
                                <asp:TextBox ID="companyLogo" runat="server" CssClass="form-control" TextMode="Url" placeholder="image URL: 60X60" />
							</div>
						</div>
					</div>

                    <!--submit button-->
                    <div class="row">
                        <p>&nbsp;</p>
                        <!--<div class="col-sm-6 text-left">
                            <a href="#" class="btn btn-primary btn-lg" style="background-color:grey;">צפה במשרה <i class="fa fa-arrow-left"></i></a>
                        </div>-->
                        <div class="col-sm-6 text-left">
                            <asp:Button ID="postJobButton" runat="server" OnClick="Post_A_Job"  Text="פרסם משרה" CssClass="btn btn-primary btn-lg" ValidationGroup="postJobValidation" />
                        </div>
					</div>

				
			</div>
		</section>

		<!-- ============ POST JOBS END ============ -->
        
        </form>

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
		</footer>

		<!-- ============ FOOTER END ============ -->

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
