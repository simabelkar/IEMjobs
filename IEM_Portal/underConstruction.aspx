<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="underConstruction.aspx.cs" Inherits="IEM_Portal.underConstruction" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Ejobs</title>
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
                                    <li><a href="https://www.skype.com/"><i class="fa fa-skype"></i></a></li>
                                </ul>
                           </div>
                        </div>
                    </div>
                </div><!--/.container-->
            </div><!--/.top-bar-->
            </header><!--/header-->

             <!--section1 - main-slider-->
            <section id="main-slider" class="no-margin">
                <div class="carousel slide">
                    <ol class="carousel-indicators">
                        <li data-target="#main-slider" data-slide-to="0" class="active"></li>
                        <li data-target="#main-slider" data-slide-to="1"></li>
                        <li data-target="#main-slider" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="item active" style="background-image: url(images/slider/bg1.jpg)">
                            <div class="container">
                                <div class="row slide-margin">
                                    <div class="col-sm-6">
                                        <div class="carousel-content">

                                        </div>
                                    </div>
                                    <div class="col-sm-6 hidden-xs animation animated-item-4">
                                        <div class="slider-img">
                                            <img src="images/slider/img3.png" class="img-responsive" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/.item-->

                        <div class="item" style="background-image: url(images/slider/bg2.jpg)">
                            <div class="container">
                                <div class="row slide-margin">
                                    <div class="col-sm-6">
                                        <div class="carousel-content">

                                        </div>
                                    </div>
                                    <div class="col-sm-6 hidden-xs animation animated-item-4">
                                        <div class="slider-img">
                                            <img src="images/slider/img2.png" class="img-responsive" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/.item-->

                        <div class="item" style="background-image: url(images/slider/bg3.jpg)">
                            <div class="container">
                                <div class="row slide-margin">
                                    <div class="col-sm-6">
                                        <div class="carousel-content">

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/.item-->

                    </div>
                    <!--/.carousel-inner-->
                </div>
                <!--/.carousel slide-->
                <a class="prev hidden-xs" href="#main-slider" data-slide="prev">
                    <i class="fa fa-chevron-left"></i>
                </a>
                <a class="next hidden-xs" href="#main-slider" data-slide="next">
                    <i class="fa fa-chevron-right"></i>
                </a>
            </section>
            <!--/.main-slider-->

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
