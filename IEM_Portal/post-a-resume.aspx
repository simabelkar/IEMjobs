<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="post-a-resume.aspx.cs" Inherits="IEM_Portal.post_a_resume" %>

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
        <script src="js/jquery-1.11.2.min.js"></script>

		<!-- Main Stylesheet -->
		<link href="css/style.css" rel="stylesheet">

		<!-- HTML5 shiv and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		<script src="js/html5shiv.js"></script>
		<script src="js/respond.min.js"></script>
		<![endif]-->
    <script>
        $(document).ready(function(){
            var HighlightCount = 2;
            $('.highlight').hide();

            $('#add-highlight').click(function () {
                $('#resume-highlight-group' + HighlightCount).show();
                HighlightCount = HighlightCount + 1;
                if (HighlightCount == 5) { $('#add-highlight').hide() }
            });
            $('#Del-highlight4').click(function () {
                $('#resume-highlight-group4').hide();
                HighlightCount = 4;
                $('#add-highlight').show() 
            });
            $('#Del-highlight3').click(function () {
                $('#resume-highlight-group3').hide();
                HighlightCount = 3;
                $('#add-highlight').show()
            });
            $('#Del-highlight2').click(function () {
                $('#resume-highlight-group2').hide();
                HighlightCount = 2;
                $('#add-highlight').show()
            });

            var SocialCount = 2;
            $('.social-network2').hide();
            $('#add-social-network1').click(function () {
                $('#social-network-div-' + SocialCount).show();
                SocialCount = SocialCount + 1;
                if (SocialCount == 3) { $('#add-social-network1').hide() }
            });
            $('#Del-Social2').click(function () {
                $('#social-network-div-2').hide();
                SocialCount = 2;
                $('#add-social-network1').show()
            });

            var ExperienceCount = 1;
            $('.experience-work-add').hide();
            $('#add-experience1').click(function () {
                $('#experience-work-add-' + ExperienceCount).show();
                ExperienceCount = ExperienceCount + 1;
                if (ExperienceCount == 3) { $('#add-experience1').hide() }
            });
            $('#Del-Expr1').click(function () {
                $('#experience-work-add-1').hide();
                ExperienceCount = 1;
                $('#add-experience1').show()
            });
            $('#Del-Expr2').click(function () {
                $('#experience-work-add-2').hide();
                ExperienceCount = 2;
                $('#add-experience1').show()
            });
            
        });
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
                    <li><a href="post-a-job.aspx">פרסם משרה</a></li>
                    <li><a href="candidates.aspx">מועמדים</a></li>
                    <li class="active"><a href="post-a-resume.aspx">פרסם קורות חיים</a></li>
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
                    <label id="displayName" class="sr-only-focusable" style="color:white; font-size:1.5em;">&nbsp&nbsp שלום <span id="loggedInUser" runat="server"></span></label>
                    <a id="loginBtn" runat="server" href="login.aspx" class="btn btn-lg btn-default">התחבר</a>
                    <asp:linkbutton ID="logoutBtn" runat="server" class ="btn btn-lg btn-default" Text="התנתק" onClick="logoutBtn_Click" Style="display:none;" />
                </div>
                <!--register button-->
                <div class="pull-left text-left">
                    <a id="registerBtn" runat="server" href="register.aspx" class="btn btn-lg btn-default">הרשם</a>
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
						<h4>הגדל את סיכוייך למציאת עבודה</h4>
                        <p>&nbsp;</p>
                        <!--<div id="registerLink" runat="server" class="jumbotron">
							<h3>רשום כבר?</h3>
                            <p>עלייך להתחבר למערכת על מנת לפרסם קורות חיים
                                <br />
                                אם אין לך חשבון אתה יכול להירשם בלחיצה על "הרשמה" בקלות ובחינם!
                            <br />
                             אם נרשמת כבר אנא התחבר</p>
							<p><a href="login.aspx" class="btn btn-primary">התחבר</a></p>
						</div>-->
					</div>
				</div>

                <!--error message-->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="alert alert-danger" id="postResumeError" runat="server" style="display:none;">
                               
                        </div>
                    </div>
                </div>

				<!-- Resume Details Start -->
				<div class="row">
					<div class="col-sm-6">
						<h2>פרטים אישיים</h2>
					</div>
					<!--<div class="col-sm-6 text-right">
						<a class="btn btn-primary"><i class="fa fa-linkedin-square"></i> LinkedIn Import</a>
					</div>-->
				</div>

                <!------User details------>
				<div class="row">

                    <!--first name (required), limit: 50 characters-->
					<div class="col-sm-3">
						<div class="form-group" id="resume-first-name-group">
							<label>שם פרטי</label>
                            <asp:TextBox ID="resumeFirstName" runat="server" CssClass="form-control" TextMode="SingleLine" disabled="disabled"/>
                        </div>
					</div>

                    <!--last name (required), limit: 50 characters-->
                    <div class="col-sm-3">
                        <div class="form-group" id="resume-last-name-group">
                            <label>שם משפחה</label>
                            <asp:TextBox ID="resumeLastName" runat="server" CssClass="form-control" TextMode="SingleLine" disabled="disabled" />
                        </div>
                    </div>

                    <!--photo (URL), limit: 255 characters-->
                    <div class="col-sm-6">
                        <div class="form-group" id="resume-photo-group">
                            <label>תמונה</label>
                            <asp:TextBox ID="resumePhoto" runat="server" CssClass="form-control" TextMode="Url" placeholder="URL"/>
                        </div>
                    </div>
				</div>

                <div class="row">
                    <!--birthday, limit: date format-->
                    <div class="col-sm-3">
                        <div class="form-group" id="resume-birthday-group">
                            <label>תאריך לידה</label>
                            <asp:TextBox ID="resumeBirthday" runat="server" CssClass="form-control" TextMode="Date" placeholder="DD/MM/YYYY"/>
                        </div>
                    </div>
                    <!--phone, limit: phone format-->
                    <div class="col-sm-3">
                        <div class="form-group" id="resume-phone-group">
                            <label>טלפון</label>
                            <asp:TextBox ID="resumePhone" runat="server" CssClass="form-control" TextMode="Phone" placeholder="1234567899"/>
                        </div>
                    </div>

                    <!--city (required), dropdown list-->
                    <div class="col-sm-6">
                        <div class="form-group" id="resume-location-group">
                            <label>עיר מגורים <span style="color:red;">*</span></label>
                            <asp:DropDownList ID="resumeLocation" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="resumeLocationValidator" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postResumeValidation"
                                ControlToValidate="resumeLocation" InitialValue="0" ErrorMessage="בחר ערך מהרשימה" />
                        </div>
                    </div>
                </div>

                <div class="row">
                    <!--email (required), limit: email address format-->
					<div class="col-sm-6">
						<div class="form-group" id="resume-email-group">
							<label>אימייל</label>
							<asp:TextBox ID="resumeEmail" runat="server" CssClass="form-control" TextMode="Email" disabled="disabled"/>
                        </div>
					</div>

                    <!--skills, check box list-->
                    <div class="col-sm-6">
                        <div class="form-group" id="resume-skills-group" style="text-align:right !important; direction:rtl !important;">
                            <label>מיומנויות</label>
                            <asp:DropDownCheckBoxes id="resumeSkills" runat="server" class="form-control">
                                <Style SelectBoxWidth="100%" DropDownBoxBoxWidth="100%" DropDownBoxBoxHeight="250" SelectBoxCssClass="DDcheckbox"/>  
                                <Texts SelectBoxCaption="--בחר מיומנויות--" /> 
                            </asp:DropDownCheckBoxes>
                        </div>
                    </div>
                        
				</div>
                    
				<div class="row">
                    <!--current position (required), limit: 100 characters-->
					<div class="col-sm-6">
						<div class="form-group" id="resume-title-group">
							<label>תפקיד <span style="color:red;">*</span></label>
							<asp:TextBox ID="resumeTitle" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="לדוגמה: מנתח מערכות" required="required"/>
                            <asp:RegularExpressionValidator ID="resumeTitleValidator" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postResumeValidation"
                                ControlToValidate="resumeTitle"
                                ErrorMessage="לא ניתן להזין יותר מ100 תווים"
                                ValidationExpression="^.{1,100}$" />
                        </div>
					</div>

				</div>

                <!--summary, limit: 500 characters-->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group" id="resume-content-group">
                            <label>קצת על עצמי</label>
                            <asp:TextBox ID="resumeSummary" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="קצת על עצמי" />
                            <asp:RegularExpressionValidator ID="resumeSummaryValidator" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postResumeValidation"
                                ControlToValidate="resumeSummary"
                                ErrorMessage="לא ניתן להזין יותר מ500 תווים"
                                ValidationExpression="^.{1,500}$" />
                        </div>
                    </div>
                </div>
                    
                <!--highlight, limit: 150 characters-->
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group" id="resume-highlight-group1">
							<label>דגשים עיקריים</label>
                            <asp:TextBox ID ="resumeHighlight1" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="לדוגמה: 3 שנות ניסון בפיתוח אתרים"/>
                            <asp:RegularExpressionValidator ID="resumeHighlightValidator" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postResumeValidation"
                                ControlToValidate="resumeHighlight1"
                                ErrorMessage="לא ניתן להזין יותר 100 תווים"
                                ValidationExpression="^.{1,100}$" />
						</div>
					</div>
				</div>

                <!--add highlight number 2-->
                <div class="row">
					<div class="col-sm-6">
						<div class="form-group highlight" id="resume-highlight-group2">
                            <table style="width:100%;"><tr><td><asp:TextBox ID ="resumeHighlight2" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="דגש נוסף"/></td><td style="width:7%;"><a id="Del-highlight2">- מחק דגש</a></td></tr></table>
                            <asp:RegularExpressionValidator ID="resumeHighlightValidator2" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postResumeValidation"
                                ControlToValidate="resumeHighlight2"
                                ErrorMessage="לא ניתן להזין יותר 100 תווים"
                                ValidationExpression="^.{1,100}$" />
						</div>
					</div>
				</div>

                <!--add highlight number 3-->
                <div class="row">
					<div class="col-sm-6">
						<div class="form-group highlight" id="resume-highlight-group3">
                            <table style="width:100%;"><tr><td><asp:TextBox ID ="resumeHighlight3" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="דגש נוסף"/></td><td style="width:7%;"><a id="Del-highlight3">- מחק דגש</a></td></tr></table>
                            <asp:RegularExpressionValidator ID="resumeHighlightValidator3" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postResumeValidation"
                                ControlToValidate="resumeHighlight3"
                                ErrorMessage="לא ניתן להזין יותר 100 תווים"
                                ValidationExpression="^.{1,100}$" />
						</div>
					</div>
				</div>

                <!--add highlight number 4-->
                <div class="row">
					<div class="col-sm-6">
						<div class="form-group highlight" id="resume-highlight-group4">
                            <table style="width:100%;"><tr><td><asp:TextBox ID ="resumeHighlight4" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="דגש נוסף"/></td><td style="width:7%;"><a id="Del-highlight4">- מחק דגש</a></td></tr></table>
                            <asp:RegularExpressionValidator ID="resumeHighlightValidator4" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postResumeValidation"
                                ControlToValidate="resumeHighlight4"
                                ErrorMessage="לא ניתן להזין יותר 100 תווים"
                                ValidationExpression="^.{1,100}$" />
						</div>
					</div>
				</div>

                <!--add another highlight-->
				<div class="row">
					<div class="col-sm-12">
						<p><a id="add-highlight">+ הוסף דגש</a></p>
						<hr>
					</div>
				</div>

				<div class="row social-network">
                    <!--social NW name, dropdown list-->
					<div class="col-sm-4">
						<div class="form-group" id="resume-social-network-group">
							<label>לינקים לפרופיל שלך ברשתות חברתיות</label>
                            <asp:DropDownList ID="resumeSocialNetwork" runat="server" CssClass="form-control">
                            </asp:DropDownList>
						</div>
					</div>

                    <!--social NW link, limit: 255 characters-->
					<div class="col-sm-6">
						<div class="form-group" id="resume-social-network-url-group">
							<label>URL</label>
							<asp:TextBox ID="resumeSocialNetworkURL" runat="server" CssClass="form-control" TextMode="Url" placeholder="URL" />

                        </div>
					</div>
				</div>

                <div class="row social-network social-network2" id="social-network-div-2">
                    <!--social NW name, dropdown list-->
					<div class="col-sm-4">
						<div class="form-group" id="resume-social-network-group2">
                            <asp:DropDownList ID="resumeSocialNetwork2" runat="server" CssClass="form-control">
                            </asp:DropDownList>
						</div>
					</div>

                    <!--social NW link, limit: 255 characters-->
					<div class="col-sm-6">
						<div class="form-group" id="resume-social-network-url-group2">
							<table style="width:100%;"><tr><td><asp:TextBox ID="resumeSocialNetworkURL2" runat="server" CssClass="form-control" TextMode="Url" placeholder="URL" /></td><td style="width:12%;"><a id="Del-Social2">- מחק רשת</a></td></tr></table>
                        </div>
					</div>
				</div>

                <!--	<div class="row">
					<div class="col-sm-12">
						<hr class="dashed">
					</div>
				</div>-->

                <!--add another social NW-->
				<div class="row">
					<div class="col-sm-12">
						<p><a id="add-social-network1">+ הוסף רשת חברתית</a></p>
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
                <!------experience details------>
				<div class="experience-work">
                    <div class="row experience">
                        <!--employer name, limit: 50 characters-->
						<div class="col-sm-6">
							<div class="form-group" id="resume-employer-group">
								<label>מעסיק</label>
							    <asp:TextBox ID="resumeEmployer" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="שם החברה" />
                                <asp:RegularExpressionValidator ID="resumeEmployerValidator" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postResumeValidation"
                                    ControlToValidate="resumeEmployer"
                                    ErrorMessage="לא ניתן להזין יותר מ50 תווים"
                                    ValidationExpression="^.{1,50}$" />
                            </div>
						</div>

                        <!--start date, limit: date format-->
						<div class="col-sm-3">
							<div class="form-group" id="resume-experience-start-date-group">
								<label>תאריך התחלה</label>
                                <asp:TextBox ID="resumeExperienceStartDate" runat="server" class="form-control" TextMode="Date" placeholder="לדוגמה: אפריל 2010"/>
                            </div>
						</div>

                        <!--end date, limit: date format-->
						<div class="col-sm-3">
							<div class="form-group" id="resume-experience-end-date-group">
								<label>תאריך סיום</label>
                                <asp:TextBox ID="resumeExperienceEndDate" runat="server" CssClass="form-control" TextMode="Date" placeholder="לדוגמה: יוני 2013"/>
                            </div>
						</div>
					</div>
                    
					<div class="row">
                        <!--job title, limit: 100 characters-->
						<div class="col-sm-6">
							<div class="form-group" id="resume-job-title-group">
								<label>תפקיד</label>
                                <asp:TextBox ID="resumeJobTitle" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="לדוגמה: מפתח מערכות" />
                                <asp:RegularExpressionValidator ID="resumeJobTitleValidator" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postResumeValidation"
                                    ControlToValidate="resumeJobTitle"
                                    ErrorMessage="לא ניתן להזין יותר מ100 תווים"
                                    ValidationExpression="^.{1,100}$" />
							</div>
						</div>
                    </div>
                    <div class="row">
                        <!--responsibilities, limit: 500 characters-->
						<div class="col-sm-12">
							<div class="form-group" id="resume-responsibilities-group">
								<label>תיאור התפקיד</label>
                                <asp:TextBox ID="resumeResponsibilities" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="לדוגמה: פיתוח אתרי אינטרנט" />
                                <asp:RegularExpressionValidator ID="resumeResponsibilitiesValidator" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postResumeValidation"
                                    ControlToValidate="resumeResponsibilities"
                                    ErrorMessage="לא ניתן להזין יותר מ500 תווים"
                                    ValidationExpression="^.{1,500}$" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<hr class="dashed">
						</div>
					</div>
                </div>
                <!------experience details more------>
                <div class="experience-work experience-work-add" id="experience-work-add-1">
                    <div class="row experience">
                        <!--employer name, limit: 50 characters-->
						<div class="col-sm-6">
							<div class="form-group" id="resume-employer-group1">
								<label>מעסיק</label>
							    <asp:TextBox ID="resumeEmployer1" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="שם החברה" />
                                <asp:RegularExpressionValidator ID="resumeEmployerValidator1" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postResumeValidation"
                                    ControlToValidate="resumeEmployer1"
                                    ErrorMessage="לא ניתן להזין יותר מ50 תווים"
                                    ValidationExpression="^.{1,50}$" />
                            </div>
						</div>

                        <!--start date, limit: date format-->
						<div class="col-sm-3">
							<div class="form-group" id="resume-experience-start-date-group1">
								<label>תאריך התחלה</label>
                                <asp:TextBox ID="resumeExperienceStartDate1" runat="server" class="form-control" TextMode="Date" placeholder="לדוגמה: אפריל 2010"/>
                            </div>
						</div>

                        <!--end date, limit: date format-->
						<div class="col-sm-3">
							<div class="form-group" id="resume-experience-end-date-group1">
								<label>תאריך סיום</label>
                                <asp:TextBox ID="resumeExperienceEndDate1" runat="server" CssClass="form-control" TextMode="Date" placeholder="לדוגמה: יוני 2013"/>
                            </div>
						</div>
					</div>
                    
					<div class="row">
                        <!--job title, limit: 100 characters-->
						<div class="col-sm-6">
							<div class="form-group" id="resume-job-title-group1">
								<label>תפקיד</label>
                                <asp:TextBox ID="resumeJobTitle1" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="לדוגמה: מפתח מערכות" />
                                <asp:RegularExpressionValidator ID="resumeJobTitleValidator1" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postResumeValidation"
                                    ControlToValidate="resumeJobTitle1"
                                    ErrorMessage="לא ניתן להזין יותר מ100 תווים"
                                    ValidationExpression="^.{1,100}$" />
							</div>
						</div>
                    </div>
                    <div class="row">
                        <!--responsibilities, limit: 500 characters-->
						<div class="col-sm-12">
							<div class="form-group" id="resume-responsibilities-group1">
								<label>תיאור התפקיד</label>
                                <asp:TextBox ID="resumeResponsibilities1" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="לדוגמה: פיתוח אתרי אינטרנט" />
                                <asp:RegularExpressionValidator ID="resumeResponsibilitiesValidator1" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postResumeValidation"
                                    ControlToValidate="resumeResponsibilities1"
                                    ErrorMessage="לא ניתן להזין יותר מ500 תווים"
                                    ValidationExpression="^.{1,500}$" />
							</div>
						</div>
					</div>
                    <a id="Del-Expr1">- מחק נסיון מעשי</a>
					<div class="row">
						<div class="col-sm-12">
							<hr class="dashed">
						</div>
					</div>
                </div>
                <!------experience details more------>
                <div class="experience-work experience-work-add" id="experience-work-add-2">
                    <div class="row experience">
                        <!--employer name, limit: 50 characters-->
						<div class="col-sm-6">
							<div class="form-group" id="resume-employer-group2">
								<label>מעסיק</label>
							    <asp:TextBox ID="resumeEmployer2" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="שם החברה" />
                                <asp:RegularExpressionValidator ID="resumeEmployerValidator2" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postResumeValidation"
                                    ControlToValidate="resumeEmployer2"
                                    ErrorMessage="לא ניתן להזין יותר מ50 תווים"
                                    ValidationExpression="^.{1,50}$" />
                            </div>
						</div>

                        <!--start date, limit: date format-->
						<div class="col-sm-3">
							<div class="form-group" id="resume-experience-start-date-group2">
								<label>תאריך התחלה</label>
                                <asp:TextBox ID="resumeExperienceStartDate2" runat="server" class="form-control" TextMode="Date" placeholder="לדוגמה: אפריל 2010"/>
                            </div>
						</div>

                        <!--end date, limit: date format-->
						<div class="col-sm-3">
							<div class="form-group" id="resume-experience-end-date-group2">
								<label>תאריך סיום</label>
                                <asp:TextBox ID="resumeExperienceEndDate2" runat="server" CssClass="form-control" TextMode="Date" placeholder="לדוגמה: יוני 2013"/>
                            </div>
						</div>
					</div>
                    
					<div class="row">
                        <!--job title, limit: 100 characters-->
						<div class="col-sm-6">
							<div class="form-group" id="resume-job-title-group2">
								<label>תפקיד</label>
                                <asp:TextBox ID="resumeJobTitle2" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="לדוגמה: מפתח מערכות" />
                                <asp:RegularExpressionValidator ID="resumeJobTitleValidator2" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postResumeValidation"
                                    ControlToValidate="resumeJobTitle2"
                                    ErrorMessage="לא ניתן להזין יותר מ100 תווים"
                                    ValidationExpression="^.{1,100}$" />
							</div>
						</div>
                    </div>
                    <div class="row">
                        <!--responsibilities, limit: 500 characters-->
						<div class="col-sm-12">
							<div class="form-group" id="resume-responsibilities-group2">
								<label>תיאור התפקיד</label>
                                <asp:TextBox ID="resumeResponsibilities2" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="לדוגמה: פיתוח אתרי אינטרנט" />
                                <asp:RegularExpressionValidator ID="resumeResponsibilitiesValidator2" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postResumeValidation"
                                    ControlToValidate="resumeResponsibilities2"
                                    ErrorMessage="לא ניתן להזין יותר מ500 תווים"
                                    ValidationExpression="^.{1,500}$" />
							</div>
						</div>
					</div>
                    <a id="Del-Expr2">- מחק נסיון מעשי</a>
					<div class="row">
						<div class="col-sm-12">
							<hr class="dashed">
						</div>
					</div>
                </div>
                <!--add experience-->
				<div class="row">
					<div class="col-sm-12">
						<p><a id="add-experience1">+ הוסף ניסיון מעשי</a></p>
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
                <!------education details------>
				<div class="row education">
                    <!--school name (required), limit: 50 characters-->
					<div class="col-sm-6">
						<div class="form-group" id="resume-school-group">
							<label>שם מוסד הלימודים<span style="color:red;">*</span></label>
                            <asp:TextBox ID="resumeSchool" runat="server" CssClass="form-control" TextMode="SingleLine" required="required"/>
                            <asp:RegularExpressionValidator ID="resumeSchoolValidator" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postResumeValidation"
                                ControlToValidate="resumeSchool"
                                ErrorMessage="לא ניתן להזין יותר מ50 תווים"
                                ValidationExpression="^.{1,50}$" />
						</div>
					</div>

                    <!--start date (required), date format-->
					<div class="col-sm-3">
						<div class="form-group" id="resume-education-strat-date-group">
							<label>תאריך התחלה<span style="color:red;">*</span></label>
                            <asp:TextBox ID="resumeEducationStratDate" runat="server" CssClass="form-control" TextMode="Date" placeholder="לדוגמה: אפריל 2010" resuired="required"/>
                        </div>
					</div>

                    <!--end date, date format-->
					<div class="col-sm-3">
						<div class="form-group" id="resume-education-end-date-group">
							<label>תאריך סיום</label>
                            <asp:TextBox ID="resumeEducationEndDate" runat="server" CssClass="form-control" TextMode="Date" placeholder="לדוגמה: יוני 2013"/>
                        </div>
					</div>

				</div>
                    
				<div class="row">
                    <!--qualification, limit: 20 characters-->
					<div class="col-sm-6">
						<div class="form-group" id="resume-qualifications-group">
							<label>סוג תעודה</label>
                            <asp:DropDownList ID="resumeEducation" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="resumeEducationValidator" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postResumeValidation"
                                ControlToValidate="resumeEducation" InitialValue="0" ErrorMessage="בחר ערך מהרשימה" />
                        </div>
					</div>
                       
                </div>

                <div class="row">
                    <!--notes, limit: 255 characters-->
					<div class="col-sm-12">
						<div class="form-group" id="resume-notes-group">
							<label>הערות נוספות</label>
							<asp:TextBox ID="resumeNotes" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="הישגים נוספים" />
                            <asp:RegularExpressionValidator ID="resumeNotesValidator" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="postResumeValidation"
                                ControlToValidate="resumeNotes"
                                ErrorMessage="לא ניתן להזין יותר מ255 תווים"
                                ValidationExpression="^.{1,255}$" />
                        </div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<hr class="dashed">
					</div>
				</div>
                    
                <!--add education-->
				<div class="row">
					<div class="col-sm-12">
						<p><a id="add-education">+ הוסף השכלה</a></p>
						<hr>
					</div>
				</div>
				<!-- Education End -->

				<div class="row">
                    <p>&nbsp;</p>
                    <div class="col-sm-6 text-left">
                        <asp:Button ID="postResumeButton" runat="server" OnClick="Post_Resume" Text="פרסם קורות חיים" CssClass="btn btn-primary btn-lg" ValidationGroup="postResumeValidation" />
                    </div>
				</div>

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
		</footer>

		<!-- ============ FOOTER END ============ -->
        </form>

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
