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
        <form id="form1" runat="server">
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
					    <li class="active"><a href="#home">דף הבית</a></li>
					    <li><a href="jobs.aspx">משרות</a></li>
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
				    <!--<div id="searchbox" class="pull-right">
						<div class="form-group">
							<label class="sr-only" for="searchfield">Searchbox</label>
							<input type="text" class="form-control" id="searchfield" placeholder="Type keywords and press enter">
						</div>
				    </div>
				    <div id="search" class="pull-right">
					    <a><i class="fa fa-search fa-lg"></i></a>
				    </div>-->
                    <div class="pull-right">
                        <label id="displayName" class="sr-only-focusable" style="color:white; font-size:1.5em;">&nbsp&nbsp שלום <span id="loggedInUser" runat="server"></span></label>
                        <a id="loginBtn" runat="server" href="login.aspx" class="btn btn-lg btn-default">התחבר</a>
                        <asp:linkbutton ID="logoutBtn" runat="server" class ="btn btn-lg btn-default" Text="התנתק" onClick="logoutBtn_Click" Style="display:none;" />
                    </div>
                    <div class="pull-left text-left">
                        <a id="registerBtn" runat="server" href="register.aspx" class="btn btn-lg btn-default">הרשם</a>
                    </div>
			    </div>
		    </header>
		    <!-- ============ HEADER END ============ -->


        </form>
    </body>
</html>
