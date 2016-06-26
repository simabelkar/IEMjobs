<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="candidates.aspx.cs" Inherits="IEM_Portal.candidates" %>

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
                    <li><a href="jobs.aspx">משרות</a></li>
                    <li><a href="post-a-job.aspx">פרסם משרה</a></li>
                    <li class="active"><a href="candidates.aspx">מועמדים</a></li>
                    <li><a href="post-a-resume.aspx">פרסם קורות חיים</a></li>
                    <li><a href="resume.aspx">פרופיל משתמש</a></li>
                    <li><a class="login.aspx">הירשם</a></li>
                    <li><a class="register.aspx">התחבר</a></li>
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

		<!-- ============ TITLE START ============ -->

		<section id="title">
			<div class="container">
				<div class="row">
					<div class="col-sm-12 text-center">
						<h1>מועמדים</h1>
						<h4>מצא התאמה מושלמת לתפקיד</h4>
					</div>
				</div>
			</div>
		</section>

		<!-- ============ TITLE END ============ -->

		<!-- ============ JOBS START ============ -->

		<section id="jobs">
			<div class="container">
				<div class="row">                    
                    <!-- Find a Candidate Start -->
                    <div class="col-sm-4" id="sidebar">
                        <div class="sidebar-widget" id="jobsearch">
                            <!--title-->
                            <h2>חיפוש מועמד</h2>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <hr>
                                    </div>
                                </div>
                                <!--error message-->
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="alert alert-danger" id="cadidateSearchError" runat="server" style="display:none;">
                               
                                        </div>
                                    </div>
                                </div>
                                <!--row1-->
                                <div class="row">
                                    <div class="col-xs-6">
                                        <h5>השכלה</h5>
                                        <div class="form-group">
                                            <asp:DropDownCheckBoxes ID="candidateSearchEducation" runat="server" class="form-control" UseSelectAllNode="True" >
                                                <Style SelectBoxWidth="100%" DropDownBoxBoxWidth="100%" DropDownBoxBoxHeight="250" SelectBoxCssClass="checkbox"/>
                                                <Texts SelectBoxCaption="--בחר השכלה--" />
                                            </asp:DropDownCheckBoxes>
                                        </div>
                                    </div>
                                    <div class="col-xs-6">
                                        <h5>מיומנויות</h5>
                                        <div class="form-group">
                                            <asp:DropDownCheckBoxes ID="candidateSearchSkills" runat="server" class="form-control" UseSelectAllNode="True" >
                                                <Style SelectBoxWidth="100%" DropDownBoxBoxWidth="100%" DropDownBoxBoxHeight="250" SelectBoxCssClass="checkbox"/>
                                                <Texts SelectBoxCaption="--בחר מיומנויות--" />
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
                                    <div class="col-xs-6">
                                        <h5>איזור</h5>
                                        <div class="form-group">
                                            <asp:DropDownCheckBoxes ID="candidateSearchLocation" runat="server" class="form-control" UseSelectAllNode="True" >
                                                <Style SelectBoxWidth="100%" DropDownBoxBoxWidth="100%" DropDownBoxBoxHeight="250" SelectBoxCssClass="checkbox"/>
                                                <Texts SelectBoxCaption="--בחר איזור--" />
                                            </asp:DropDownCheckBoxes>
                                        </div>
                                    </div>
                                </div>  
                                <div class="row">
                                    <div class="col-xs-12">
                                        <hr />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <asp:Button ID="searchCandidatesBotton" runat="server" OnClick="Search_Candidates" Text="חפש" CssClass="btn btn-primary" /> 
                                    </div>
                                </div>
                            
                        </div>
                        <!-- Find a Candidate End -->
                    </div>

                    <!--candidate list start-->
					<div class="col-sm-8">
						<h2>רשימת מועמדים</h2>
						<div id="candidatesList" class="jobs" runat="server">
						</div>

						<!--<nav>
							<ul class="pagination">
								<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&raquo;</span></a></li>
								<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#" aria-label="Next"><span aria-hidden="true">&laquo;</span></a></li>
							</ul>
						</nav>-->

					</div>
                    <!--candidate list end-->
				
				</div>
			</div>
		</section>

		<!-- ============ JOBS END ============ -->
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