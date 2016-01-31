﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jobs.aspx.cs" Inherits="IEM_Portal.jobs" %>

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
					<li class="active"><a href="jobs.aspx">משרות</a></li>
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
				<div id="searchbox" class="pull-right">
					<form>
						<div class="form-group">
							<label class="sr-only" for="searchfield">Searchbox</label>
							<input type="text" class="form-control" id="searchfield" placeholder="Type keywords and press enter">
						</div>
					</form>
				</div>
				<div id="search" class="pull-right">
					<a><i class="fa fa-search fa-lg"></i></a>
				</div>
			</div>
		</header>

		<!-- ============ HEADER END ============ -->

		<!-- ============ TITLE START ============ -->

		<section id="title">
			<div class="container">
				<div class="row">
					<div class="col-sm-12 text-center">
						<h1>חיפוש משרה</h1>
						<h4>אין מקום טוב יותר להתחיל ממנו</h4>
					</div>
				</div>
			</div>
		</section>

		<!-- ============ TITLE END ============ -->

		<!-- ============ JOBS START ============ -->

		<section id="jobs">
			<div class="container">
				<div class="row">
                    <!-- Find a Job Start -->
                    <div class="col-sm-4" id="sidebar">
                        <div class="sidebar-widget" id="jobsearch">
                            <!--title-->
                            <h2>חיפוש משרה</h2>
                            <form>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="form-group" id="job-search-group">
                                            <label for="job-search" class="sr-only">חיפוש</label>
                                            <input type="text" class="form-control" id="job-search" placeholder="Type and press enter">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <hr>
                                    </div>
                                </div>
                                <!--row1-->
                                <div class="row">
                                    <!--item1-->
                                    <div class="col-xs-6">
                                        <h5>תחום</h5>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> כל התחומים
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> מערכות מידע
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> תפעול
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> ניהול
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> ייעוץ
                                            </label>
                                        </div>
                                    </div>
                                    <!--item2-->
                                    <div class="col-xs-6">
                                        <h5>תת תחום</h5>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> כל האפשרויות
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> מנתח מערכות מידע
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> מהנדס בדיקות תוכנה
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> מתכנת
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> מיישם מערכות מידע
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> מהנדס ארגון ושיטות
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> מהנדס מוצר
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> מהנדס אנוש
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> מהנדס איכות
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> קניין
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> מנהל אגף
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> מנהל סניף
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> מנהל מחלקה
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> יועץ
                                            </label>
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
                                    <!--item1-->
                                    <div class="col-xs-6">
                                        <h5>מיקום</h5>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> כל המיקומים
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> איזור המרכז
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox">איזור ירושלים
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> איזור חיפה
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> השפלה
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> צפון
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> דרום
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> חו"ל
                                            </label>
                                        </div>
                                    </div>
                                    <!--item2-->
                                    <div class="col-xs-6">
                                        <h5>היקף משרה</h5>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> כל ההיקפים
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> משרה מלאה
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> משרה חלקית
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> משמרות
                                            </label>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox"> לפי שעות
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <hr>
                                    </div>
                                </div>
                                <!--row3-->
                                <div class="row">
                                    <div class="col-xs-12">
                                        <h5>ניסיון</h5>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-6">
                                        <p>יותר מ <b><span id="years-field"></span></b> שנים</p>
                                    </div>
                                    <div class="col-xs-6">
                                        <div class="form-slider" id="years"></div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <hr>
                                    </div>
                                </div>
                                <!--row4-->
                                <div class="row">
                                    <div class="col-xs-12">
                                        <a class="btn btn-primary">אפס סינון</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- Find a Job end -->

                    <!--job list start-->
					<div class="col-sm-8">
                        <h2>רשימת המשרות</h2>
						<div class="jobs">
							<!-- Job offer 1 -->
                            <a href="job-details.aspx" class="applied">
                                <div class="row">
                                    <div class="col-md-1 hidden-sm hidden-xs">
                                        <img src="https://media.licdn.com/mpr/mpr/shrink_60_60/p/3/000/01f/19a/2c01d7b.png" alt="" class="img-responsive" />
                                    </div>
                                    <div class="col-lg-5 col-md-5 col-sm-7 col-xs-12 job-title">
                                        <h5>מנתח/ת מערכות</h5>
                                        <p>מלם תים</p>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-5 col-xs-12 job-location">
                                        <p><strong>ירושלים</strong></p>
                                    </div>
                                    <div class="col-lg-2 col-md-2 hidden-sm hidden-xs job-type text-center">
                                        <p class="badge full-time">משרה מלאה</p>
                                    </div>
                                </div>
                            </a>
							
							<!-- Job offer 2 -->
                            <a href="#" class="applied">
                                <div class="row">
                                    <div class="col-md-1 hidden-sm hidden-xs">
                                        <img src="data:image/jpeg;base64,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" alt="" class="img-responsive" />
                                    </div>
                                    <div class="col-lg-5 col-md-5 col-sm-7 col-xs-12 job-title">
                                        <h5>מיישם/ת Oracle applications לוגיסטי </h5>
                                        <p>HP</p>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-5 col-xs-12 job-location">
                                        <p><strong>רמת השרון</strong></p>
                                    </div>
                                    <div class="col-lg-2 col-md-2 hidden-sm hidden-xs job-type text-center">
                                        <p class="badge full-time">משרה מלאה</p>
                                    </div>
                                </div>
                            </a>
							
							<!-- Job offer 3 -->
							<a href="#" class="applied">
								<div class="row">
									<div class="col-md-1 hidden-sm hidden-xs">
										<img src="http://placehold.it/60x60.jpg" alt="" class="img-responsive" />
									</div>
									<div class="col-lg-5 col-md-5 col-sm-7 col-xs-12 job-title">
										<h5> תוכניתן/ית CRM</h5>
										<p>דיסקל</p>
									</div>
									<div class="col-lg-4 col-md-4 col-sm-5 col-xs-12 job-location">
										<p><strong>פתח תקווה</strong></p>
									</div>
									<div class="col-lg-2 col-md-2 hidden-sm hidden-xs job-type text-center">
										<p class="badge internship">משמרות</p>
									</div>
								</div>
							</a>
							
							<!-- Job offer 4 -->
							<a href="#" class="applied">
								<div class="row">
									<div class="col-md-1 hidden-sm hidden-xs">
                                        <img src="http://www.coursim.co.il/ui/site/pages/picturehandler.ashx?picid=659&pic=" alt="" class="img-responsive" />
									</div>
									<div class="col-lg-5 col-md-5 col-sm-7 col-xs-12 job-title">
										<h5>מטמיע/ה מערכות מידע</h5>
										<p>אומגה</p>
									</div>
									<div class="col-lg-4 col-md-4 col-sm-5 col-xs-12 job-location">
										<p><strong>כפר סבא</strong></p>
									</div>
									<div class="col-lg-2 col-md-2 hidden-sm hidden-xs job-type text-center">
										<p class="badge part-time">משרה חלקית</p>
									</div>
								</div>
							</a>
							
							<!-- Job offer 5 -->
							<a href="#">
								<div class="row">
									<div class="col-md-1 hidden-sm hidden-xs">
                                        <img src="https://lh3.googleusercontent.com/-r-c76gbdAPQ/AAAAAAAAAAI/AAAAAAAAAAA/Pw182XdgX4k/s46-c-k-no/photo.jpg" alt="" class="img-responsive" />
									</div>
									<div class="col-lg-5 col-md-5 col-sm-7 col-xs-12 job-title">
										<h5>מנתח נתונים</h5>
										<p>ש.כ. מאגרי אנוש בע"מ</p>
									</div>
									<div class="col-lg-4 col-md-4 col-sm-5 col-xs-12 job-location">
										<p><strong>חולון</strong></p>
									</div>
									<div class="col-lg-2 col-md-2 hidden-sm hidden-xs job-type text-center">
										<p class="badge temporary">לפי שעות</p>
									</div>
								</div>
							</a>
							
							<!-- Job offer 6 -->
							<a href="#">
								<div class="row">
									<div class="col-md-1 hidden-sm hidden-xs">
										<img src="http://placehold.it/60x60.jpg" alt="" class="img-responsive" />
									</div>
									<div class="col-lg-5 col-md-5 col-sm-7 col-xs-12 job-title">
										<h5>מיישמים/ות תומכים/ות לתוכנת SAP Business One</h5>
										<p>RELS Advanced Technologies</p>
									</div>
									<div class="col-lg-4 col-md-4 col-sm-5 col-xs-12 job-location">
										<p><strong>רמת גן</strong></p>
									</div>
									<div class="col-lg-2 col-md-2 hidden-sm hidden-xs job-type text-center">
										<p class="badge full-time">משרה מלאה</p>
									</div>
								</div>
							</a>
							
							<!-- Job offer 7 -->
							<a href="#">
								<div class="row">
									<div class="col-md-1 hidden-sm hidden-xs">
                                        <img src="https://i.vimeocdn.com/portrait/9194295_60x60.jpg" alt="" class="img-responsive" />
									</div>
									<div class="col-lg-5 col-md-5 col-sm-7 col-xs-12 job-title">
										<h5>מנתח/ת בסיס נתונים</h5>
										<p>Ebay Inc.</p>
									</div>
									<div class="col-lg-4 col-md-4 col-sm-5 col-xs-12 job-location">
										<p><strong>נתניה</strong></p>
									</div>
									<div class="col-lg-2 col-md-2 hidden-sm hidden-xs job-type text-center">
										<p class="badge part-time">משרה חלקית</p>
									</div>
								</div>
							</a>
							
							<!-- Job offer 8 -->
							<a href="#">
								<div class="row">
									<div class="col-md-1 hidden-sm hidden-xs">
                                        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAMAAAANIilAAAAA21BMVEX////qQzU0qFNChfT7vAV9q/hlnPb///7rRjj//Pyv3bv/+OX8/vz72db4/PnsVEdCrl/92G780VXuZFmOz6D94pLrSjz8yz38z0/8whz8yDLweG5uoffxhXxdlvbzl4/60c74v7ry9v6qyPqi2LB8x5BwrjxkvXxYuHI7lqf96+rI6NFLi/Xc7O7J3fz81GDs7ctXrEbp9ezT7NqOtvi74sY4noRBiOe81Ps2o2s/jNQ9kbxwtrDtWS7vcGb3tK/95Mj1p6DwZyf0iRnLtxhOq0mmtCb3oBDuXStGrXxfAAABn0lEQVRIie2Wa1eCMBiA2aK4ZEBBlhqmhkHaTcuyixLd//8vCmHgdBubnjp94fm48fhed46SVFLyf2iaso7Wixq2WQWgatqNqLdSwJarAgzVbWnC7hQQTAXt0CRdAMy2SNhjmjoj4rsNlqvucGVmXLXFrxf73Hajdjty7aTxJj+uNu+VnQ+3ZwvljM0oxEajhQI5Sy+TbC5LgURW7Ep+TWWBQMtsy7L8JjZRkv1Ylr8moLrSQ0Acygnf4RquVE9lGWv0JkGH7iq11D3AzjYILhkyCrxXKI/pcgXJu4XyyR/IYmmzZKGGMWrORlWvzI+2cs6Lu42WpDbQaZdHSGbMOV3P9w9oDcm7DnKbDDd5GJ8wxiPvxki+ZcnxkzyFCX0iMK9kSboepC60bpZusoqZJcdr4sMM3cDOL5qcKae2ldtB3jXFgWe8diXocE7Q9UYjz/FnP3h3X7ghCAfSeXgsbDXK0WfY8ImTNKqQwTO701jdFtV1DL4qLUwsh5g82+53F9VAp6w7m6HnB9YsfyvwHeGoGIpiGBVlrT9TJSW/wQ9E/iBW+2oVuwAAAABJRU5ErkJggg==" alt="" class="img-responsive" />
									</div>
									<div class="col-lg-5 col-md-5 col-sm-7 col-xs-12 job-title">
										<h5>מנתח/ת בסיס נתונים</h5>
										<p>Google</p>
									</div>
									<div class="col-lg-4 col-md-4 col-sm-5 col-xs-12 job-location">
										<p><strong>תל אביב</strong></p>
									</div>
									<div class="col-lg-2 col-md-2 hidden-sm hidden-xs job-type text-center">
										<p class="badge full-time">משרה מלאה</p>
									</div>
								</div>
							</a>
							
							<!-- Job offer 9 -->
							<a href="#">
								<div class="row">
									<div class="col-md-1 hidden-sm hidden-xs">
                                        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAMAAAANIilAAAAAZlBMVEUAhcUEh8b////7/f6Kx+X3+/3p9PoNi8gJicdNqNbx+PwxnNCf0OkSjckomM7b7vcbksvs9vvH5PPT6vU5oNKw2e1Yrtlfstq63vBzvN9GpdWSy+Zuut7N5/Obz+nh8fmq1ux/weJEsoOEAAADfklEQVRIic2X6bKjIBCFpRFUFDdw14jv/5LTaBLXxDszNVVzfsRE/Vib7hPHJ38s3yHOH4v8O1iifh8mMuyNyhgqU6YP5fVbV7Bsp5zBRiyf2oshXMBeaUYKQHluOpTJuf01mtK7h1MjsK+xC1IpPd/3pEyDbsRbwqQ3sFdyHOVQHQYpqwHnwQ+dH+DUZTjB6jRAbLXCZWDurvM9LCMBwo3PqFXs4sNoO6QdTAoKIrjo9tl5IIAW2/c3sBcBJPoTaqUTgGhtfAN7EwMVfGMdJ1DApje9wiRIICv977BfZpAEb+QNyxpguj0lZAIoXou2whVA/YMTRrCP6gjLBMbwnnWccIREHuAGqHsz4UW+S6HZw1JB0v6EdZw2ASV3MO6/+XbuN5IGI2kHu1T0x7fSD631grpbOC2Ah44MrdJl6kQXxq4gicNwjvYUr/OjkEORbuBQwUCclluNtV6mRmmNfcuc8xp/+x3nam6FDKDCDRxweODnK+tUxOspsDouSx/3EHJniXy+HLgH8GADlwz6BU4UJhJePRhwN+yEmC7gHli5wqSiUC5wpSeO+YtBUgU1BVXq7ASXQHuywjjIdoFbRxbz2PsyoZDr0ibDA9ye4PAF+9EMU8w6RdjMKfgAhx97Jnp4rhvtwgdmHsRzrGpyhvHLqed1zsVjwHU2iYVrnHTSY9rlURQFCDMTRc0854psVlvYYLcwxSlCLbVaeq/jNFm+NdHzjj1EYrPaTjtChDC1YpnBRCMLHC6LUjwy813aPJYrwgbGdhthGDQ+JlerqZ2DUE7jOGGEec1819Xlcq0cH8NxG2G4PfyYN70yuM4smj8z0ftUMdZcvnmhhrHdqXLabM1rN8JRZu0O9nIYb3L2S8EIubeDMXnSx89y2IO+0ucb9gcQX0vNS1rA4B9gJ2AwfKxxq7wB2Gt+m4oRUehu10x2QKNzxSAYkaK5q1WNAKXPtQpPh0Dj8B1G0yGqldgWd/QUX+ukrZHP+DjDxBqH5uh53kobazo+OANb37Fp82HHtMGBTdsNObghr0fbwd2LRZcuejnR7zbzZOJaZQ3XFG/dJpHxZO2ZOpTCCwfoKkwm3DSBjlNUrIPGIEqVe+cAUb6ecchUXqNylcGM6tM+XLpeP63qveutq/RiCz+a9bTsajWiVN2VH3bvq9Mn1ul/e/6f/kH5j+G/+Tv4CwCBL6lp5b7xAAAAAElFTkSuQmCC" alt="" class="img-responsive" />
									</div>
									<div class="col-lg-5 col-md-5 col-sm-7 col-xs-12 job-title">
										<h5>ראשי/ות צוות ERP</h5>
										<p>Dell Inc.</p>
									</div>
									<div class="col-lg-4 col-md-4 col-sm-5 col-xs-12 job-location">
										<p><strong>הרצליה</strong></p>
									</div>
									<div class="col-lg-2 col-md-2 hidden-sm hidden-xs job-type text-center">
										<p class="badge full-time">משרה מלאה</p>
									</div>
								</div>
							</a>
							
							<!-- Job offer 10 -->
							<a href="#">
								<div class="row">
									<div class="col-md-1 hidden-sm hidden-xs">
										<img src="http://placehold.it/60x60.jpg" alt="" class="img-responsive" />
									</div>
									<div class="col-lg-5 col-md-5 col-sm-7 col-xs-12 job-title">
										<h5>סטודנט/ית מצטיין/ת למערכת מידע</h5>
										<p>Dell Inc.</p>
									</div>
									<div class="col-lg-4 col-md-4 col-sm-5 col-xs-12 job-location">
										<p><strong>הרצליה</strong></p>
									</div>
									<div class="col-lg-2 col-md-2 hidden-sm hidden-xs job-type text-center">
                                        <p class="badge temporary">לפי שעות</p>
									</div>
								</div>
							</a>
							
							<!-- Job offer 1 -->
							<a href="#" class="applied">
								<div class="row">
									<div class="col-md-1 hidden-sm hidden-xs">
										<img src="http://placehold.it/60x60.jpg" alt="" class="img-responsive" />
									</div>
									<div class="col-lg-5 col-md-5 col-sm-7 col-xs-12 job-title">
										<h5>מנהל /ת פרויקט</h5>
										<p>חברה בתחום סיעוד ורווחה</p>
									</div>
									<div class="col-lg-4 col-md-4 col-sm-5 col-xs-12 job-location">
										<p><strong>ירושלים</strong></p>
									</div>
									<div class="col-lg-2 col-md-2 hidden-sm hidden-xs job-type text-center">
										<p class="badge full-time">משרה מלאה</p>
									</div>
								</div>
							</a>
							
							<!-- Job offer 2 -->
							<a href="#">
								<div class="row">
									<div class="col-md-1 hidden-sm hidden-xs">
                                        <img src="https://i.vimeocdn.com/portrait/9194295_60x60.jpg" alt="" class="img-responsive" />
									</div>
									<div class="col-lg-5 col-md-5 col-sm-7 col-xs-12 job-title">
										<h5>מיישם /ת פריורטי</h5>
										<p>Ebay Inc.</p>
									</div>
									<div class="col-lg-4 col-md-4 col-sm-5 col-xs-12 job-location">
										<p><strong>נתניה</strong></p>
									</div>
									<div class="col-lg-2 col-md-2 hidden-sm hidden-xs job-type text-center">
										<p class="badge part-time">משרה חלקית</p>
									</div>
								</div>
							</a>
							
							<!-- Job offer 3 -->
							<a href="#" class="applied">
								<div class="row">
									<div class="col-md-1 hidden-sm hidden-xs">
                                        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAMAAAANIilAAAAA21BMVEX////qQzU0qFNChfT7vAV9q/hlnPb///7rRjj//Pyv3bv/+OX8/vz72db4/PnsVEdCrl/92G780VXuZFmOz6D94pLrSjz8yz38z0/8whz8yDLweG5uoffxhXxdlvbzl4/60c74v7ry9v6qyPqi2LB8x5BwrjxkvXxYuHI7lqf96+rI6NFLi/Xc7O7J3fz81GDs7ctXrEbp9ezT7NqOtvi74sY4noRBiOe81Ps2o2s/jNQ9kbxwtrDtWS7vcGb3tK/95Mj1p6DwZyf0iRnLtxhOq0mmtCb3oBDuXStGrXxfAAABn0lEQVRIie2Wa1eCMBiA2aK4ZEBBlhqmhkHaTcuyixLd//8vCmHgdBubnjp94fm48fhed46SVFLyf2iaso7Wixq2WQWgatqNqLdSwJarAgzVbWnC7hQQTAXt0CRdAMy2SNhjmjoj4rsNlqvucGVmXLXFrxf73Hajdjty7aTxJj+uNu+VnQ+3ZwvljM0oxEajhQI5Sy+TbC5LgURW7Ep+TWWBQMtsy7L8JjZRkv1Ylr8moLrSQ0Acygnf4RquVE9lGWv0JkGH7iq11D3AzjYILhkyCrxXKI/pcgXJu4XyyR/IYmmzZKGGMWrORlWvzI+2cs6Lu42WpDbQaZdHSGbMOV3P9w9oDcm7DnKbDDd5GJ8wxiPvxki+ZcnxkzyFCX0iMK9kSboepC60bpZusoqZJcdr4sMM3cDOL5qcKae2ldtB3jXFgWe8diXocE7Q9UYjz/FnP3h3X7ghCAfSeXgsbDXK0WfY8ImTNKqQwTO701jdFtV1DL4qLUwsh5g82+53F9VAp6w7m6HnB9YsfyvwHeGoGIpiGBVlrT9TJSW/wQ9E/iBW+2oVuwAAAABJRU5ErkJggg==" alt="" class="img-responsive" />
									</div>
									<div class="col-lg-5 col-md-5 col-sm-7 col-xs-12 job-title">
										<h5>מנהל/ת פרוייקט</h5>
										<p>Google</p>
									</div>
									<div class="col-lg-4 col-md-4 col-sm-5 col-xs-12 job-location">
										<p><strong>תל אביב</strong></p>
									</div>
									<div class="col-lg-2 col-md-2 hidden-sm hidden-xs job-type text-center">
										<p class="badge full-time">משרה מלאה</p>
									</div>
								</div>
							</a>
							
							<!-- Job offer 4 -->
							<a href="#" class="applied">
								<div class="row">
									<div class="col-md-1 hidden-sm hidden-xs">
                                        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAMAAAANIilAAAAAeFBMVEX+/v7///4qQ4Z0e7AqP4QqPYNtc6stRYeGirwqOoE2Sok6TIng4fLP0OkxR4iAhbi7vN5SXZmRlMOtrtVFVZBgaKL39vp6gLOztdmancqjySry8virzkBYYp3w+Nq4utzExuT2++iz1FPo6PWkptDZ2u7h87Xa76PGAeJ3AAABSElEQVRIie2Sa5aDIAyFkwB2FEdUfLS182w7s/8dTgKdqnUFPYf7AzHeLwkGgKSkpKSk51Jrq8q2iHPkotT9Dcdxz6u849Jzk6KgHJeRGd7RC7yGQEZ6Q7O1dYaoD16c4VhOKf8ALxtQEkMj39EYXQwRRm20OQDmucOcG2tqzasPHruG4aypRE1FxaDAvOd8dJC2l3D03PuPMBiqr2QRiQaBa9JnSRDOXEo2FCNeqQueFXwlmjIiw+W8wB0ngoI/rX8Y9qSDZ3NmRTZjlQI3VCHsbpUXcEZd8MwwDA2RBW51kmEK7MlM3HaszG2VYQjAHjOI5+f4O89Zd7G8DDz8sDyEMcB8SO5h4vUtxnM4nk4C+3Ec2zJOsO6L/gO8c5zJN3bPD+f4hk295dBnYy8YPDV8fb/HS7SY+noPD/v/dXtNk5KSkpKeQX9+Wg0Di47eyAAAAABJRU5ErkJggg==" alt="" class="img-responsive" />
									</div>
									<div class="col-lg-5 col-md-5 col-sm-7 col-xs-12 job-title">
										<h5>מיישם/ת מערכת CRM</h5>
										<p>Deloitte</p>
									</div>
									<div class="col-lg-4 col-md-4 col-sm-5 col-xs-12 job-location">
										<p><strong>תל אביב</strong></p>
									</div>
									<div class="col-lg-2 col-md-2 hidden-sm hidden-xs job-type text-center">
										<p class="badge temporary">לפי שעות</p>
									</div>
								</div>
							</a>
							
							<!-- Job offer 5 -->
							<a href="#">
								<div class="row">
									<div class="col-md-1 hidden-sm hidden-xs">
										<img src="http://placehold.it/60x60.jpg" alt="" class="img-responsive" />
									</div>
									<div class="col-lg-5 col-md-5 col-sm-7 col-xs-12 job-title">
										<h5>מיישם /ת מערכות CRM בענן</h5>
										<p></p>
									</div>
									<div class="col-lg-4 col-md-4 col-sm-5 col-xs-12 job-location">
										<p><strong>כפר סבא</strong></p>
									</div>
									<div class="col-lg-2 col-md-2 hidden-sm hidden-xs job-type text-center">
										<p class="badge part-time">משרה חלקית</p>
									</div>
								</div>
							</a>
						
						</div>

						<nav>
							<ul class="pagination">
								<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&raquo;</span></a></li>
								<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#" aria-label="Next"><span aria-hidden="true">&laquo;</span></a></li>
							</ul>
						</nav>

					</div>
                    <!--job list end-->

				</div>
			</div>
		</section>

		<!-- ============ JOBS END ============ -->


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
			<div id="credits">
				<div class="container text-center">
					<div class="row">
						<div class="col-sm-12">
							&copy; 2015 Jobseek - Responsive Job Board HTML Template<br>
							Designed &amp; Developed by <a href="http://themeforest.net/user/Coffeecream" target="_blank">Coffeecream Themes</a>
						</div>
					</div>
				</div>
			</div>
		</footer>

		<!-- ============ FOOTER END ============ -->

		<!-- ============ LOGIN START ============ -->

        <div class="popup" id="login">
            <div class="popup-form">
                <div class="popup-header">
                    <a class="close"><i class="fa fa-remove fa-lg"></i></a>
                    <h2>התחבר</h2>
                </div>
                <form>
                    <!--<ul class="social-login">
                    <li><a class="btn btn-facebook"><i class="fa fa-facebook"></i>Sign In with Facebook</a></li>
                    <li><a class="btn btn-google"><i class="fa fa-google-plus"></i>Sign In with Google</a></li>
                    <li><a class="btn btn-linkedin"><i class="fa fa-linkedin"></i>Sign In with LinkedIn</a></li>
                </ul>-->
                    <hr>
                    <div class="form-group">
                        <label for="login-username">שם משתמש</label>
                        <input type="text" class="form-control" id="login-username">
                    </div>
                    <div class="form-group">
                        <label for="login-password">סיסמא</label>
                        <input type="password" class="form-control" id="login-password">
                    </div>
                    <button type="submit" class="btn btn-primary">התחבר</button>
                </form>
            </div>
        </div>

		<!-- ============ LOGIN END ============ -->

		<!-- ============ REGISTER START ============ -->

        <div class="popup" id="register">
            <div class="popup-form">
                <div class="popup-header">
                    <a class="close"><i class="fa fa-remove fa-lg"></i></a>
                    <h2>הרשמה</h2>
                </div>
                <form>
                    <!---<ul class="social-login">
                    <li><a class="btn btn-facebook"><i class="fa fa-facebook"></i>Register with Facebook</a></li>
                    <li><a class="btn btn-google"><i class="fa fa-google-plus"></i>Register with Google</a></li>
                    <li><a class="btn btn-linkedin"><i class="fa fa-linkedin"></i>Register with LinkedIn</a></li>
                </ul>-->
                    <hr>
                    <div class="form-group">
                        <label for="register-name">שם פרטי</label>
                        <input type="text" class="form-control" id="register-name">
                    </div>
                    <div class="form-group">
                        <label for="register-surname">שם משפחה</label>
                        <input type="text" class="form-control" id="register-surname">
                    </div>
                    <div class="form-group">
                        <label for="register-email">אימייל</label>
                        <input type="email" class="form-control" id="register-email">
                    </div>
                    <hr>
                    <div class="form-group">
                        <label for="register-username">שם משתמש</label>
                        <input type="text" class="form-control" id="register-username">
                    </div>
                    <div class="form-group">
                        <label for="register-password1">סיסמא</label>
                        <input type="password" class="form-control" id="register-password1">
                    </div>
                    <div class="form-group">
                        <label for="register-password2">הקלד סיסמא שנית</label>
                        <input type="password" class="form-control" id="register-password2">
                    </div>
                    <button type="submit" class="btn btn-primary">הירשם</button>
                </form>
            </div>
        </div>

		<!-- ============ REGISTER END ============ -->

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