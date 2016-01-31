<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="IEM_Portal.Homepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Home | IEMjobs</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <!-- core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <link href="css/animate.min.css" rel="stylesheet" />
    <link href="css/prettyPhoto.css" rel="stylesheet" />
    <link href="css/main.css" rel="stylesheet" />
    <link href="css/responsive.css" rel="stylesheet" />
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <link rel="shortcut icon" href="images/ico/favicon.ico" />
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png" />
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png" />
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png" />
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png" />
</head>
<!--/head-->

<body>
    <form id="form1" runat="server">
        <div>
            <header id="header">
                <!--top-bar (shortcut)-->
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
                                        <input type="text" class="search-form" autocomplete="off" placeholder="Search" />
                                        <i class="fa fa-search"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--/.container-->
                </div>
                <!--/.top-bar-->

                <!--navigation menu-->
                <nav class="navbar navbar-inverse" role="banner">
                    <div class="container">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <!--logo-->
                            <!--<a class="navbar-brand" href="Homepage.aspx">
                                <img src="images/logo.png" alt="logo" /></a>-->
                        </div>

                        <div class="collapse navbar-collapse navbar-right">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="Homepage.aspx">דף הבית</a></li>
                                <li><a href="#JobSearch">חיפוש משרה</a></li>
                                <li><a href="#PostJob">פרסום משרה</a></li>
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
                    </div>
                    <!--/.container-->
                </nav>
                <!--/.navigation menu-->
            </header>
            <!--/.header-->


            <!--section1 - main-slider (carousel picture)-->
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
                                            <h1 class="animation animated-item-1">חיפוש משרה</h1>
                                            
                                            <table>
                                                <tr>
                                                    <td>
                                                        <h2 class="animation animated-item-2"><asp:Label ID="Label1" runat="server" Text="בחר תחום"></asp:Label></h2>
                                                    </td>
                                                    <td>
                                                        <select size="1" name="Availability" id="Select1" runat="server" style="width:100%;">
                                                            <option selected="selected" disabled="disabled">בחר תחום</option>
                                                            <option value="01">מערכות מידע</option>
                                                            <option value="02">ייצור ותעשיה</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <h2 class="animation animated-item-2"><asp:Label ID="Label2" runat="server" Text="בחר מיקום"></asp:Label></h2>
                                                    </td>
                                                    <td>
                                                        <select size="1" name="Availability" id="Select2" runat="server" style="width:100%;">
                                                            <option value="01" selected="selected">כל האיזורים</option>
                                                            <option value="02" style="color: red;">צפון</option>
                                                            <option value="03">חיפה והסביבה</option>
                                                            <option value="04">קריות והסביבה</option>
                                                            <option value="05">עכו-נהריה והסביבה</option>
                                                            <option value="06">גליל עליון</option>
                                                            <option value="07">הכנרת והסביבה</option>
                                                            <option value="08">כרמיאל והסביבה</option>
                                                            <option value="09">נצרת-שפרעם והסביבה</option>
                                                            <option value="10">גליל תחתון</option>
                                                            <option value="11">הגולן</option>
                                                            <option value="12" style="color: red;">חדרה זכרון והעמקים</option>
                                                            <option value="13">זכרון וחוף הכרמל</option>
                                                            <option value="14">חדרה והסביבה</option>
                                                            <option value="15">קיסריה והסביבה</option>
                                                            <option value="16">יקנעם טבעון והסביבה</option>
                                                            <option value="17">עמק בית שאן</option>
                                                            <option value="18">עפולה והעמקים</option>
                                                            <option value="19">רמת מנשה</option>
                                                            <option value="20" style="color: red;">השרון</option>
                                                            <option value="21">נתניה והסביבה</option>
                                                            <option value="22">רמת השרון - הרצליה</option>
                                                            <option value="23">רעננה - כפר סבא</option>
                                                            <option value="24">הוד השרון והסביבה</option>
                                                            <option value="25" style="color: red;">מרכז</option>
                                                            <option value="26">תל אביב</option>
                                                            <option value="27">ראשון לציון והסביבה</option>
                                                            <option value="28">חולון - בת ים</option>
                                                            <option value="29">רמת גן - גבעתיים</option>
                                                            <option value="30">פתח תקווה והסביבה</option>
                                                            <option value="31">ראש העין והסביבה</option>
                                                            <option value="32">בקעת אונו</option>
                                                            <option value="33">רמלה - לוד</option>
                                                            <option value="34">בני ברק - גבעת שמואל</option>
                                                            <option value="35">עמק איילון</option>
                                                            <option value="36">שוהם והסביבה</option>
                                                            <option value="37">מודיעין והסביבה</option>
                                                            <option value="38" style="color: red;">אזור ירושלים</option>
                                                            <option value="39">ירושלים</option>
                                                            <option value="40">בית שמש והסביבה</option>
                                                            <option value="41">מבשרת והסביבה</option>
                                                            <option value="42">מעלה אדומים והסביבה</option>
                                                            <option value="43" style="color: red;">יהודה שומרון ובקעת הירדן</option>
                                                            <option value="44">ישובי שומרון</option>
                                                            <option value="45">גוש עציון</option>
                                                            <option value="46">בקעת הירדן וצפון ים המלח</option>
                                                            <option value="47">אריאל והסביבה</option>
                                                            <option value="48" style="color: red;">שפלה והסביבה</option>
                                                            <option value="49">נס ציונה - רחובות</option>
                                                            <option value="50">אשדוד - אשקלון</option>
                                                            <option value="51">גדרה - יבנה</option>
                                                            <option value="52">קרית גת והסביבה</option>
                                                            <option value="53" style="color: red;">דרום</option>
                                                            <option value="54">באר שבע והסביבה</option>
                                                            <option value="55">אילת וערבה</option>
                                                            <option value="56">ישובי הנגב</option>
                                                            <option value="57" style="color: red;">חו"ל</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <h2 class="animation animated-item-2"><asp:Label ID="Label3" runat="server" Text="בחר היקף משרה"></asp:Label>&nbsp&nbsp</h2>
                                                    </td>
                                                    <td>
                                                        <select size="1" name="Availability" id="Select3" runat="server" style="width:100%;">
                                                            <option selected="selected" disabled="disabled">בחר היקף משרה</option>
                                                            <option value="01">משרה מלאה</option>
                                                            <option value="02">משרה חלקית</option>
                                                            <option value="03">משמרות</option>
                                                            <option value="04">לפי שעות</option>
                                                            <option value="05">פרילנס</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <a class="btn-slide animation animated-item-3" href="#JobSearch">חפש משרה</a>
                                                    </td>
                                                </tr>
                                            </table>
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
                                            <h1 class="animation animated-item-1">חיפוש עובדים</h1>
                                            <h2 class="animation animated-item-2">Accusantium doloremque laudantium totam rem aperiam, eaque ipsa...</h2>
                                            <a class="btn-slide animation animated-item-3" href="#">חפש</a>
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
                                            <h1 class="animation animated-item-1">פרופיל משתמש</h1>
                                            <h2 class="animation animated-item-2">Accusantium doloremque laudantium totam rem aperiam, eaque ipsa...</h2>
                                            <a class="btn-slide animation animated-item-3" href="#">Read More</a>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 hidden-xs animation animated-item-4">
                                        <div class="slider-img">
                                            <img src="images/slider/img1.png" class="img-responsive" />
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
        
            <!--status (numbers)-->
            <div class="row" id="counter" style="text-align:center;">
                <div class="counter">
                    <div class="number">4,325</div>
                    <div class="description">משתמשים</div>
                </div>
                <div class="counter">
                    <div class="number">894</div>
                    <div class="description">משרות</div>
                </div>
                <div class="counter">
                    <div class="number">1482</div>
                    <div class="description">קורות חיים</div>
                </div>
                <div class="counter">
                    <div class="number">83</div>
                    <div class="description">חברות</div>
                </div>
            </div>
            
                
            <!--section2 - JobSearch-->
            <section id="JobSearch">
                <div class="container">
                    <div class="center wow fadeInDown">
                        <h2>חיפוש משרה</h2>
                        <p class="lead">שנה קריטריונים לחיפוש</p>
                    </div>
                    <div class="row">
                        <div class="features" dir="rtl">
                            <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                                <div class="feature-wrap">
                                    <asp:Label ID="TypeLabel" runat="server" Text="שנה תחום"></asp:Label>
                                    <select size="1" name="jobTitle" id="jobTitle" runat="server">
                                        <option selected="selected" disabled="disabled">שנה תחום</option>
                                        <option value="01">מערכות מידע</option>
                                        <option value="02">ייצור ותעשייה</option>
                                    </select>
                                    <!--<i class="fa fa-bullhorn"></i>
                                    <h2>Fresh and Clean</h2>
                                    <h3>Lorem ipsum dolor sit amet, consectetur adipisicing elit</h3>-->
                                </div>
                            </div>
                            <!--/.col-md-4-->

                            <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                                <div class="feature-wrap">
                                    <asp:Label ID="cityLable" runat="server" Text="שנה איזור"></asp:Label>
                                    <select size="1" name="City" id="City" runat="server">
                                        <option selected="selected" disabled="disabled">שנה איזור</option>
                                        <option value="01">תל אביב</option>
                                        <option value="02">ירושלים</option>
                                        <option value="03">חיפה</option>
                                    </select>
                                    <!--<i class="fa fa-comments"></i>
                                    <h2>Retina ready</h2>
                                    <h3>Lorem ipsum dolor sit amet, consectetur adipisicing elit</h3>-->
                                </div>
                            </div>
                            <!--/.col-md-4-->

                            <div class="col-md-4 col-sm-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
                                <div class="feature-wrap">
                                    <asp:Label ID="avaiLable" runat="server" Text="שנה היקף משרה"></asp:Label>
                                    <select size="1" name="Availability" id="Availability" runat="server">
                                        <option selected="selected" disabled="disabled">שנה היקף משרה</option>
                                        <option value="01">משרה מלאה</option>
                                        <option value="02">משרה חלקית</option>
                                        <option value="03">משמרות</option>
                                    </select>
                                    <!--<i class="fa fa-cloud-download"></i>
                                    <h2>Easy to customize</h2>
                                    <h3>Lorem ipsum dolor sit amet, consectetur adipisicing elit</h3>-->
                                </div>
                            </div>
                            <!--/.col-md-4-->
                        </div>
                        <!--/.services-->
                    </div>
                    <!--/.row-->
                </div>
                <!--/.container-->
            
                <!--result list-->
                <div class="container" style="width: 100%;">
                    <div class="col-sm-6 wow fadeInDown" style="width: 100%;">
                        <div class="accordion">
                            <h2>משרות שנמצאו</h2>
                            <div class="panel-group" id="accordion1">
                                <!--Table Header-->
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">
                                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1">
                                                <asp:Table Width="100%" runat="server" >
                                                    <asp:TableRow Font-Bold="true" ForeColor="#14b1bb">
                                                        <asp:TableCell Width="50%">תיאור המשרה</asp:TableCell>
                                                        <asp:TableCell Width="20%">מיקום המשרה</asp:TableCell>
                                                        <asp:TableCell Width="20%">היקף המשרה</asp:TableCell>
                                                        <asp:TableCell></asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </a>
                                        </h3>
                                    </div>
                                </div>
                                <!--/.Table Header-->

                                <!--Table Row1-->
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">
                                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseOne1">
                                            <asp:Table Width="100%" runat="server" >
                                                <asp:TableRow>
                                                    <asp:TableCell Width="50%">איש/אשת תפ"י</asp:TableCell>
                                                    <asp:TableCell Width="20%">קרית שמונה</asp:TableCell>
                                                    <asp:TableCell Width="20%">משרה מלאה</asp:TableCell>
                                                    <asp:TableCell><i class="fa fa-angle-left pull-left"></i></asp:TableCell>
                                                </asp:TableRow>
                                            </asp:Table>
                                            </a>
                                        </h3>
                                    </div>
                                    <div id="collapseOne1" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <div class="media accordion-inner">
                                                <!--<div class="pull-left">
                                                    <img class="img-responsive" src="images/accordion1.png" />
                                                </div>-->
                                                <div class="media-body">
                                                    <h4>איש/אשת תפ"י</h4>
                                                    <p>לחברה ביוטכנולוגיה יוקרתית שעוסקת בפיתוח תרופות, באזור הצפון, דרוש /ה איש /אשת תפ"י.
התפקיד כולל - בניית אוטומציה של בקרות ודיווחים, יכולת ניתוח נתונים והסקת מסקנות, ניהול מלאים, תכנון תוכניות עבודה, תזמון חומרים, פיקוח על הייצור, סגירת ופתיחת פק"עות ועוד.</p>
                                                    <p>דרישות:<br />      
                                                    מהנדס /ת תעשייה וניהול - חובה.<br />
                                                    ניסיון של שנתיים - שלוש בתחום התפ"י - חובה. <br />
                                                    ניסיון מתחום הפרמצבטיקה - יתרון משמעותי. המשרה מיועדת לנשים וגברים כאחד.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--/.Table Row1-->
                                <!--Table Row2-->
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">
                                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseTwo1">
                                                <asp:Table Width="100%" runat="server" >
                                                    <asp:TableRow>
                                                        <asp:TableCell Width="50%">מנהל /ת מפעל למפעל מתכת מוביל בתחומו</asp:TableCell>
                                                        <asp:TableCell Width="20%">באר שבע</asp:TableCell>
                                                        <asp:TableCell Width="20%">משרה מלאה</asp:TableCell>
                                                        <asp:TableCell><i class="fa fa-angle-left pull-left"></i></asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </a>
                                        </h3>
                                    </div>
                                    <div id="collapseTwo1" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <p>למפעל מתכת מוביל דרוש /ה מנהל /ת מפעל.<br /> 
                                            התפקיד כולל: <br />
                                            אחראי /ת לתפעול שוטף ותקין של המפעל.<br />
                                            בניה של תהליכי עבודה.<br />
                                            ניהול מערך מערך כוח אדם.<br />
                                            קביעה ויישום כללי הבטיחות המפעל.<br />
                                            ניהול מערך הייצור, לוגיסטיקה, אחזקה, הנדסה תוכניות עבודה ועוד.</p>
                                            <p>דרישות: <br />
                                            בעל /ת ניסיון בניהול מפעל בתחום המתכת /מסגריה גדולה.<br />
                                            בעל /ת יכולת ניהולית מובהקת של צוותי עבודה.<br />
                                            בעל /ת יכולת לתעדף עבודות / משימות.    <br />
                                            ממשק צמוד להנדסת החברה ועם מנהלי התחומים בחברה. <br />
                                            יתרון - מהנדס /ת תעשיה וניהול. המשרה מיועדת לנשים וגברים כאחד. <br />
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <!--/.Table Row2-->
                                <!--Table Row3-->
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">
                                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseThree1">
                                                <asp:Table Width="100%" runat="server" >
                                                    <asp:TableRow>
                                                        <asp:TableCell Width="50%">מהנדס /ת תעשיה וניהול לחברה בתחום הלוגיסטיקה</asp:TableCell>
                                                        <asp:TableCell Width="20%">לוד</asp:TableCell>
                                                        <asp:TableCell Width="20%">משרה חלקית</asp:TableCell>
                                                        <asp:TableCell><i class="fa fa-angle-left pull-left"></i></asp:TableCell>
                                                    </asp:TableRow>
                                                </asp:Table>
                                            </a>
                                        </h3>
                                    </div>
                                    <div id="collapseThree1" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <p>דרוש /ה מהנדס /ת תעשיה וניהול לחברה בתחום הלוגיסטיקה.<br />
                                                ניהול מערך ארגון ושיטות בחברה.<br />
                                                ניהול מעקב ובקרה על תהליכי עבודה בחברה.<br />
                                                זיהוי, הובלה ויישום שיונוי תהליכי עבודה בחברה.<br />
                                            </p>
                                            <p>דרישות:<br />
                                                בוגר /ת הנדסת תעשייה וניהול - חובה.<br />
                                                ניסיון קודם של 3-4 שנים בארגון ושיטות - חובה.<br />
                                                ניסיון קודם בחברה בתחום הלוגיסטיקה - יתרון.<br />
                                                אסרטיביות בקידום פרוייקטים ותהליכים<br />
                                                מוכנות לשעות נוספות ועבודה תחת לחץ.<br />
                                                יכולת עבודה עצמאית. המשרה מיועדת לנשים וגברים כאחד.<br />
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <!--/.Table Row3-->
                                <!--Table Row4-->
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">
                                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseFour1">
                                                <asp:Table Width="100%" runat="server" >
                                                    <asp:TableRow>
                                                        <asp:TableCell Width="50%">אחראי/ת ייצור</asp:TableCell>
                                                        <asp:TableCell Width="20%">אלישמע</asp:TableCell>
                                                        <asp:TableCell Width="20%">משמרות</asp:TableCell>
                                                        <asp:TableCell><i class="fa fa-angle-left pull-left"></i></asp:TableCell>
                                                    </asp:TableRow>
                                                 </asp:Table>
                                            </a>
                                        </h3>
                                    </div>
                                    <div id="collapseFour1" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <p>לחברת סטארט אפ צעירה ודינאמית בתחום הבנייה הירוקה דרוש /ה אחראי /ת ייצור.
התפקיד כולל ליווי פיתוח קו מוצרים לרבות התאמות טכנולוגיות יעודיות. התפקיד דורש עבודה פיזית, דייקנות, משימתיות וריכוז. העבודה מתנהלת בכפוף למנהל מחקר - דוקטור בתחום ההנדסה. העבודה במשרה חלקית בין 2-3 ימים מלאים בשבוע המתאימה במיוחד גם לסטודנטים /ות.</p>
                                            <p>תנאים טובים למתאים /ה.</p>
                                            <p>דרישות:<br />
                                                בעל /ת רכב - חובה.<br />
                                                סטודנט /ית להנדסת תעשייה וניהול - יתרון.<br />
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <!--/.Table Row4-->
                            </div>
                            <!--/#accordion1-->
                        </div>
                    </div>
                </div>
            </section>
            <!--/.JobSearch-->

            <section id="PostJob">
                <div class="container">
                    <div class="center wow fadeInDown">
                        <h2>פרסום משרה</h2>
                        <p class="lead">הוספת משרה חדשה</p>
                    </div>
                    <!--JobTitle-->
                    <div class="row">
                        כותרת המשרה
                        <span style="color:red">*</span>
                    </div>
                    <div class="row">
                        <input id="txtJobTitle" runat="server" placeholder="הזן כותרת משרה" style="width:80%;" required="required"/>
                    </div>
                    <div id="txtJobTitleErrorMsg" style="width:80%; color:red;" hidden="hidden">
                           לא הוזן כותרת משרה
                    </div>
                    <br />
                    <!--JobDesc-->
                    <div class="row">
                        תיאור התפקיד
                        <span style="color:red">*</span>
                    </div>
                    <div class="row">
                        <textarea id="txtJobDesc" runat="server" placeholder="הזן תיאור תפקיד" style="width:80%;" required="required"></textarea>
                    </div>
                    <div id="txtJobDescErrorMsg" style="width:80%; color:red;" hidden="hidden">
                           לא הוזן תיאור התפקיד
                    </div>
                    <br />
                    <!--JobRequirement-->
                    <div class="row">
                         דרישות התפקיד
                    </div>
                    <div class="row">
                        <textarea id="txtJobReq" runat="server" placeholder="הזן דרישות תפקיד" style="width:80%;"></textarea>
                    </div>
                    <br />
                    <table style="width=100%;">
                        <tr>
                            <td>
                                <div class="row">
                                     היקף משרה
                                    <span style="color:red">*</span>
                                </div>
                            </td>
                            <td>
                                <div class="row">
                                     תחום משרה
                                    <span style="color:red">*</span>
                                </div>
                            </td>
                            <td>
                                <div class="row">
                                     מיקום משרה
                                    <span style="color:red">*</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <!--JobSizeType-->
                                <select size="1" name="jobSizeType" runat="server" required="required" style="width:100%;">
                                    <option selected="selected" disabled="disabled">בחר</option>
                                    <option value="01">משרה מלאה</option>
                                    <option value="02">משרה חלקית</option>
                                    <option value="03">משמרות</option>
                                </select>
                            </td>
                            <td>
                                <!--JobType-->
                                <select size="1" name="jobType" runat="server" required="required" style="width:100%;">
                                    <option selected="selected" disabled="disabled">בחר</option>
                                    <option value="01">ייצור ותעשייה</option>
                                    <option value="02">מערכות מידע</option>
                                    <option value="03">אחר</option>
                                </select>
                            </td>
                            <td>
                                <!--JobLocation-->
                                <select size="1" name="jobType" runat="server" required="required" style="width:100%;">
                                    <option selected="selected" disabled="disabled">בחר</option>
                                    <option value="01">תל אביב</option>
                                    <option value="02">רעננה</option>
                                    <option value="03">רחובות</option>
                                    <option value="04">ירושלים</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="row">
                    
                </div>
            </section>

            <br />
            <br />
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
            </footer>
            <!--/#footer-->
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
