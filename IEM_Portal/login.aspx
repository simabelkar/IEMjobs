<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="IEM_Portal.login" %>

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
    <div class="popup-form">
        <div class="popup-header">
            <a href="homepage.aspx" class="close"><i class="fa fa-remove fa-lg"></i></a>
            <h2>&nbsp התחברות</h2>
        </div>
	    <form runat="server">
		    <!--<ul class="social-login">
			    <li><a class="btn btn-facebook"><i class="fa fa-facebook"></i>Sign In with Facebook</a></li>
			    <li><a class="btn btn-google"><i class="fa fa-google-plus"></i>Sign In with Google</a></li>
			    <li><a class="btn btn-linkedin"><i class="fa fa-linkedin"></i>Sign In with LinkedIn</a></li>
		    </ul>-->
            <div class="form-group">
                <div class="col-sm-12">
                    <label>יש להתחבר למערכת</label>
                    <hr>
                </div>
            </div>
            <!--error message-->
            <div class="form-group">
                <div class="col-sm-12">
                    <div id="loginError" runat="server" class="alert alert-danger"></div>
                </div>
            </div>
		    <div class="form-group">
			    <label>אימייל</label>
                <asp:TextBox ID="loginUsername" runat="server" CssClass="form-control" TextMode="Email" required="required" />
		    </div>
		    <div class="form-group">
			    <label>סיסמא</label>
			    <asp:TextBox ID="loginPassword" runat="server" cssClass="form-control" TextMode="Password" required="required"/>
		    </div>
		    <asp:Button ID="loginSubmitBtn" runat="server" onClick="loginSubmitBtn_Click" Text="התחבר" class="btn btn-primary"/>
	    </form>
    </div>
</body>
</html>
