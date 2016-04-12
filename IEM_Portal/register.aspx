<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="IEM_Portal.register" %>

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
			<h2>&nbsp הרשמה</h2>
		</div>
		<form runat="server">
			<!---<ul class="social-login">
				<li><a class="btn btn-facebook"><i class="fa fa-facebook"></i>Register with Facebook</a></li>
				<li><a class="btn btn-google"><i class="fa fa-google-plus"></i>Register with Google</a></li>
				<li><a class="btn btn-linkedin"><i class="fa fa-linkedin"></i>Register with LinkedIn</a></li>
			</ul>-->

            <!--error message-->
            <div class="form-group">
                <div class="col-sm-12">
                    <div id="registerError" runat="server" class="alert alert-danger"></div>
                </div>
            </div>

			<hr>
			<div class="form-group">
				<label>שם פרטי</label>
                <asp:TextBox ID="registerFname" runat="server" CssClass="form-control" TextMode="SingleLine" required="required"/>
				<asp:RegularExpressionValidator ID="registerFnameVal" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="registerValidation"
                        ControlToValidate="registerFname"
                        ErrorMessage="לא ניתן להזין יותר מ50 תווים"
                        ValidationExpression="^.{1,50}$" />
            </div>
			<div class="form-group">
				<label>שם משפחה</label>
                <asp:TextBox ID="registerLname" runat="server" CssClass="form-control" TextMode="SingleLine" required="required"/>
				<asp:RegularExpressionValidator ID="registerLnameVal" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="registerValidation"
                        ControlToValidate="registerLname"
                        ErrorMessage="לא ניתן להזין יותר מ50 תווים"
                        ValidationExpression="^.{1,50}$" />
            </div>
			<div class="form-group">
				<label>אימייל</label>
				<asp:TextBox ID="registerUsername" runat="server" CssClass="form-control" TextMode="Email" required="required" />
                <asp:RegularExpressionValidator ID="registerUsernameVal" runat="server" Font-Size="Small" ForeColor="Red" ValidationGroup="registerValidation"
                        ControlToValidate="registerUsername"
                        ErrorMessage="כתובת מייל לא חוקית"
                        ValidationExpression="^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$" />
			</div>
			<div class="form-group">
				<label>סיסמא</label>
				<asp:TextBox ID="registerPassword" runat="server" CssClass="form-control" TextMode="Password" required="required" />
				<asp:RegularExpressionValidator ID="registerPasswordVal" runat="server"  Font-Size="Small" ForeColor="Red" ValidationGroup="registerValidation"
                        ControlToValidate="registerPassword"
                        ErrorMessage="הסיסמא חייבת להכיל בין 6 ל10 תווים"
                        ValidationExpression="^[a-zA-Z0-9'@&#.\s]{6,10}$" />
            </div>
            <asp:Button ID="registerSubmitBtn" runat="server" OnClick="registerSubmitBtn_Click" Text="הרשם" CssClass="btn btn-primary" ValidationGroup="registerValidation" />
		</form>
	</div>
</body>
</html>
