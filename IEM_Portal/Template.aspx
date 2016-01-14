﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Template.aspx.cs" Inherits="IEM_Portal.Template" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Home | Corlate</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>

	<!-- core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/font-awesome.min.css" rel="stylesheet"/>
    <link href="css/animate.min.css" rel="stylesheet"/>
    <link href="css/prettyPhoto.css" rel="stylesheet"/>
    <link href="css/main.css" rel="stylesheet"/>
    <link href="css/responsive.css" rel="stylesheet"/>
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico"/>
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png"/>
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png"/>
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png"/>
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png"/>
</head><!--/head-->
<body>
    <form id="form1" runat="server">
        <div>
            <header id="header">
            <div class="top-bar">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6 col-xs-4">                     
                        </div>
                        <div class="col-sm-6 col-xs-8">
                           <div class="social">
                                <ul class="social-share">
                                    <li><a href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="https://www.twitter.com/"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="https://www.linkedin.com/"><i class="fa fa-linkedin"></i></a></li> 
                                    <li><a href="https://www.jce.com/"><i class="fa fa-dribbble"></i></a></li>
                                    <li><a href="https://www.skype.com/"><i class="fa fa-skype"></i></a></li>
                                </ul>
                                <div class="search">
                                        <input type="text" class="search-form" autocomplete="off" placeholder="Search"/>
                                        <i class="fa fa-search"></i>
                               </div>
                           </div>
                        </div>
                    </div>
                </div><!--/.container-->
            </div><!--/.top-bar-->

            <nav class="navbar navbar-inverse" role="banner">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="Homepage.aspx"><img src="images/logo.png" alt="logo"/></a>
                    </div>
				
                    <div class="collapse navbar-collapse navbar-right">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="Homepage.aspx">דף הבית</a></li>
                            <li><a href="#JobSearch">חיפוש משרה</a></li>
                            <li><a href="#">חיפוש עובדים</a></li>
                            <li><a href="#">פרופיל משתמש</a></li>
                            <li><a href="#">עלינו</a></li>
                            <%--<li><a href="#">Portfolio</a></li>--%>
                            <%--<li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Pages <i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="blog-item.html">Blog Single</a></li>
                                    <li><a href="pricing.html">Pricing</a></li>
                                    <li><a href="404.html">404</a></li>
                                    <li><a href="shortcodes.html">Shortcodes</a></li>
                                </ul>
                            </li>--%>
                            <%--<li><a href="blog.html">Blog</a></li> 
                            <li><a href="contact-us.html">Contact</a></li> --%>                       
                        </ul>
                    </div>
                </div><!--/.container-->
            </nav><!--/nav-->
		
        </header><!--/header-->

    

        <footer id="footer" class="midnight-blue">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                      
                    </div>
                    <div class="col-sm-6">
                        <ul class="pull-right">
                            <li><a href="Homepage.aspx">דף הבית</a></li>
                            <li><a href="#JobSearch">חיפוש משרה</a></li>
                            <li><a href="#">חיפוש עובדים</a></li>
                            <li><a href="#">פרופיל משתמש</a></li>
                            <li><a href="#">עלינו</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer><!--/#footer-->
        </div>
    </form>
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/wow.min.js"></script>
</body>
</html>
