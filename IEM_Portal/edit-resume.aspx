<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edit-resume.aspx.cs" Inherits="IEM_Portal.edit_resume" %>

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
            <div class="menu">
                <!--close button-->
				<div class="button-close text-right">
					<a class="fm-button"><i class="fa fa-close fa-2x"></i></a>
				</div>
                <!--menu options-->
				<ul class="nav">
					<li><a href="#home">דף הבית</a></li>
					<li><a href="jobs.aspx">משרות</a></li>
					<li><a href="post-a-job.aspx">פרסם משרה</a></li>
					<li><a href="candidates.aspx">מועמדים</a></li>
					<li><a href="post-a-resume.aspx">פרסם קורות חיים</a></li>
                    <li class="active"><a href="edit-resume.aspx">עדכן קורות חיים</a></li>
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

        <!-- ============ TITLE START ============ -->

		<section id="titleSection">
			<div class="container">
				<div class="row text-center">
					<h1>עדכן קורות חיים</h1>
					<h4>הגדל את סיכוייך למציאת עבודה</h4>
                    <p>&nbsp;</p>
				</div>
			</div>
		</section>

		<!-- ============ TITLE END ============ -->

        <!-- ============ EDIT RESUME START ============ -->

        <section id="editResume">
            <div class="container">
                <!--error message-->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="alert alert-danger" id="editResumeError" runat="server" style="display:none;">
                        </div>
                    </div>
                </div>
                <!-- Resume Details Start -->
			    <div class="row">
				    <div class="col-sm-6">
					    <h2>פרטים אישיים</h2>
				    </div>
			    </div>
                <!------ User details ------>
                <!--(fName,lName,photo, birthday,phone,city,email,skills,currentPos,jobCategory,Summary)-->
			    <div id="personalDetails" runat="server">
                
                </div>
                <!--(4 highlight)-->
			    <div id="highlights" runat="server">

                </div>
                <!--(2 social networks)-->
			    <div id="socialNW" runat="server">

                </div>
                <!--(3 Experiences: employerName,startDate,endDate,jobTitle,resp.)-->
			    <div id="Experience" runat="server">

                </div>
                <!--(2 Educations: schoolName,startDate,endDate,qualification,notes)-->
                <div id="Educations" runat="server">

                </div>
                <!------ User Details End ------>
            </div>
            
        </section>

        <!-- ============ EDIT RESUME END ============ -->

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
		<script src="js/settings.js" charset="utf-8"></script>
    </body>
</html>
