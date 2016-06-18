using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace IEM_Portal
{
    public partial class resume : System.Web.UI.Page
    {
        String User_ID;
        protected void Page_Load(object sender, EventArgs e)
        {
            //------ manage login logout ------
            if (Session["Name"] != null)
            {
                String Name = Session["Name"].ToString();
                //user is not logged in
                if ((Name == "") || (Name == "אורח"))
                {
                    Session["Dest_Page"] = "resume.aspx";
                    Response.Redirect("login.aspx");
                }
                //user is logged in
                else
                {
                    //get the Job_ID and Company_ID from the URL
                    User_ID = Request.QueryString["User_ID"];
                    if (User_ID == null)
                     User_ID = Session["UserID"].ToString();

                    loggedInUser.InnerHtml = Session["Name"].ToString();
                    //remove loginBtn and registerBtn 
                    loginBtn.Style.Add("display", "none");
                    registerBtn.Style.Add("display", "none");
                    //add logoutBtn
                    logoutBtn.Style.Remove("display");

                    int isInserted = 0;
                    try
                    {
                        //check if the user already post resume (all must fields are filed)
                        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString);
                        con.Open();
                        String checkUserEduc = "SELECT COUNT (*) FROM User_Education WHERE user_id='" + User_ID + "'";
                        SqlCommand educCmd = new SqlCommand(checkUserEduc, con);
                        int educ = Convert.ToInt32(educCmd.ExecuteScalar().ToString());
                        String checkUser = "SELECT * FROM Users WHERE user_id='" + User_ID + "'";
                        SqlCommand userCmd = new SqlCommand(checkUser, con);
                        SqlDataReader dr = userCmd.ExecuteReader();
                        if (dr.Read())
                        {
                            //check required fields from user_education and users tables
                            if (educ > 0)
                                isInserted += 1;
                            if (dr["city_id"] != DBNull.Value)
                                isInserted += 1;
                        }
                    }
                    catch (Exception ex)
                    {
                        resumeError.Style.Remove("display");
                        resumeError.InnerHtml = ex.Message.ToString();
                    }

                    //user did not post a resume - display message TODO
                    if (isInserted<2)
                    {
                        //display error message
                        resumeError.Style.Remove("display");
                        resumeError.InnerHtml = "לא פורסמו קורות חיים עבור יוזר זה";
                        //hide content
                        mainProfile.Style.Add("display","none");
                        sidebar.Style.Add("display","none");
                    }
                    //user already posted a resume
                    else
                    {
                        //remove error message
                        resumeError.Style.Add("display", "none");
                        //display content
                        mainProfile.Style.Remove("display");
                        sidebar.Style.Remove("display");
                        //display the user resume
                        displayUserPersonalDetails(); //contact details, photo, summary
                        displayUserHighlights();
                        displayUserExperience();
                        displayUserEducation();
                        displayUserSocialNw();
                        displayUserSkills();
                    }
                }
            }
            //------ end manage login logout ------
        }

        protected void logoutBtn_Click(object sender, EventArgs e)
        {
            Session["Name"] = "אורח";
            Response.Redirect("homepage.aspx");
            //remove logoutBtn
            logoutBtn.Style.Add("display", "none");
            //add loginBtn and registerBtn 
            loginBtn.Style.Remove("display");
            registerBtn.Style.Remove("display");
        }

        /************************* display dynamic user data during Page_Load() *************************/
        private void displayUserPersonalDetails()
        {
            try
            {
                String selectUser = "SELECT u.user_fname, u.user_lname, u.user_curr_job_title, u.user_photo, u.user_summary, u.user_birthday,u.user_phone, c.city, u.user_email " +
                                    "FROM Users u inner join Cities c ON u.city_id = c.city_id WHERE User_id='" + User_ID + "'";
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString);
                con.Open();
                SqlCommand userCmd = new SqlCommand(selectUser, con);
                SqlDataReader dr = userCmd.ExecuteReader();
                if(dr.HasRows)
                {
                    if(dr.Read())
                    {
                        //title
                        String mainTitle = "";
                        mainTitle += "<h1>" + dr.GetString(0) + "&nbsp" + dr.GetString(1) + "<h1>";
                        if (dr["user_curr_job_title"] != "" && dr["user_curr_job_title"] != DBNull.Value)
                            mainTitle += "<h4>" + dr.GetString(2) + "<h4>";
                        title.InnerHtml = mainTitle;
                        //userProfile
                        String profile = "";
                        if (dr["user_photo"] != "" && dr["user_photo"] !=DBNull.Value )
                            profile += "<img src=\"" + dr.GetString(3) + "\" alt=\"" + "\" class=\"" + "pull-right" + "\" height=\"270\" width=\"220\"/>";
                        else
                            profile += "<img src=\"" + "http://placehold.it/220x270.jpg" + "\" alt=\"" + "\" class=\"" + "pull-right" + "\" height=\"270\" width=\"220\"/>";
                        if (dr["user_summary"] != "" && dr["user_summary"] != DBNull.Value)
                            profile += "<p>" + dr.GetString(4) + "</p>";
                        userProfile.InnerHtml = profile;
                        //contactDetails
                        String contact = "<ul>";
                        contact += "<li><i class=\"" + "fa fa-user" + "\"></i>" + dr.GetString(0) + "&nbsp" + dr.GetString(1) + "</li>"; //name
                        if (dr["user_curr_job_title"] != "" && dr["user_curr_job_title"] != DBNull.Value)
                            contact += "<li><i class=\"" + "fa fa-briefcase" + "\"></i>" + dr.GetString(2) + "</li>"; //jobTitle
                        DateTime min = new DateTime(1901, 01, 01);
                        if ((DateTime)dr["user_birthday"] > min)
                            contact += "<li><i class=\"" + "fa fa-birthday-cake" + "\"></i>" + dr.GetDateTime(5).Day.ToString() + "/" + dr.GetDateTime(5).Month.ToString() + "/" + dr.GetDateTime(5).Year.ToString() + "</li>"; //birthdate
                        if (dr["city"] != DBNull.Value && dr["city"] != "")
                            contact += "<li><i class=\"" + "fa fa-map-marker" + "\"></i>" + dr.GetString(7) + "</li>"; //city
                        if (dr["user_phone"] != "" && dr["user_phone"] != DBNull.Value)
                            contact += "<li><i class=\"" + "fa fa-phone" + "\"></i>" + dr.GetString(6) + "</li>"; //phone
                        contact += "<li><i class=\"" + "fa fa-envelope" + "\"></i><a href=\"" + "mailto:" + dr.GetString(8) + "\">" + "שלח אימייל</a></li>"; //email
                        contact += "</ul>";
                        contactDetails.InnerHtml = contact;
                    }
                }
                con.Close();
            }
            catch (Exception ex)
            {
                //TODO
            }
        }

        private void displayUserHighlights()
        {
            try
            {
                String selectExperience = "SELECT * FROM User_Highlights WHERE user_id='" + User_ID + "'";
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString);
                con.Open();
                SqlCommand highlightCmd = new SqlCommand(selectExperience, con);
                SqlDataReader dr = highlightCmd.ExecuteReader();
                if (dr.HasRows)
                {
                    String highlights = "<h3>מיומנויות</h3>" + "<ul>";
                    while (dr.Read())
                    {
                        highlights += "<li>" + dr.GetString(1)+ "</li>";
                    }
                    highlights += "<ul>";
                    userSkills.InnerHtml = highlights;
                }
                con.Close();
            }
            catch (Exception ex)
            {
                //TODO
            }
        }

        private void displayUserExperience()
        {
            try
            {
                String selectExperience = "SELECT * FROM User_Experience WHERE user_id='" + User_ID + "'";
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString);
                con.Open();
                SqlCommand experienceCmd = new SqlCommand(selectExperience, con);
                SqlDataReader dr = experienceCmd.ExecuteReader();
                if (dr.HasRows)
                {
                    String experience = "<h3>ניסיון תעסוקתי</h3>";
                    while (dr.Read())
                    {
                        experience += "<div class=\"" + "row work-experience" + "\">" +
                            "<div class=\"" + "col-sm-2" + "\">" +
                            "<div class=\"" + "img-circle" + "\">" +
                            "<i class=\"" + "fa fa-briefcase" + "\"></i></div></div>" +
                            "<div class=\"" + "col-sm-10" + "\">";
                        DateTime min = new DateTime(1901, 01, 01);
                        if ((DateTime)dr["end_date"] < min)
                            experience += "<h4>" + convertMonthToText(dr.GetDateTime(2).Month) + " " + dr.GetDateTime(2).Year.ToString() + " - " + "היום" + "</h4>";
                        else
                            experience += "<h4>" + convertMonthToText(dr.GetDateTime(2).Month) + " " + dr.GetDateTime(2).Year.ToString() + " - " + convertMonthToText(dr.GetDateTime(3).Month) + " " + dr.GetDateTime(3).Year.ToString() + "</h4>" +
                            "<h5>" + dr.GetString(1) + " - " + dr.GetString(4) + "</h5>";
                        if (dr["user_resp"] != DBNull.Value && dr["user_resp"] != "")
                            experience += "<p>" + dr.GetString(5) + "</p>";
                        experience += "</div></div>";
                    }
                    workExperience.InnerHtml = experience;
                }
                con.Close();
            }
            catch (Exception ex)
            {
                //TODO
            }
        }

        private void displayUserEducation()
        {
            try
            {
                //userEducation
                String selectEducation = "SELECT a.*, b.qualification FROM User_Education a INNER JOIN Educations b ON a.qualification_id=b.qualification_id WHERE user_id='" + User_ID + "'";
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString);
                con.Open();
                SqlCommand educationCmd = new SqlCommand(selectEducation, con);
                SqlDataReader dr = educationCmd.ExecuteReader();
                if (dr.HasRows)
                {
                    String educationHTML = "<h3>השכלה</h3>";
                    while (dr.Read())
                    {
                        educationHTML += "<div class=\"" + "row work-experience" + "\"style=\"display:block\">" +
                            "<div class=\"" + "col-sm-2" + "\">" +
                            "<div class=\"" + "img-circle" + "\">" +
                            "<i class=\"" + "fa fa-graduation-cap" + "\"></i></div></div>" +
                            "<div class=\"" + "col-sm-10" + "\">";
                        DateTime min = new DateTime(1901, 01, 01);
                        if ((DateTime)dr["end_date"] < min)
                            educationHTML += "<h4>" + convertMonthToText(dr.GetDateTime(2).Month) + " " + dr.GetDateTime(2).Year.ToString() + " - " + "היום" + "</h4>";
                        else
                            educationHTML += "<h4>" + convertMonthToText(dr.GetDateTime(2).Month) + " " + dr.GetDateTime(2).Year.ToString() + " - " + convertMonthToText(dr.GetDateTime(3).Month) + " " + dr.GetDateTime(3).Year.ToString() + "</h4>";
                        educationHTML += "<h5>" + dr.GetString(1) + " - " + dr.GetString(6) + "</h5>";
                        if (dr["notes"] != DBNull.Value && dr["notes"] != "")
                            educationHTML += "<p>" + dr.GetString(5) + "</p>";
                        educationHTML += "</div></div>";
                    }
                    education.InnerHtml = educationHTML;
                }
                con.Close();
            }
            catch (Exception ex)
            {
                //TODO
            }
        }

        private void displayUserSocialNw()
        {
            try
            {
                String selectSocialNW = "SELECT a.*,b.social_nw FROM User_Social_nw a inner join Social_nw b ON a.social_nw_id = b.social_nw_id WHERE user_id='" + User_ID + "'";
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString);
                con.Open();
                SqlCommand socialNWCmd = new SqlCommand(selectSocialNW, con);
                SqlDataReader dr = socialNWCmd.ExecuteReader();
                if (dr.HasRows)
                {
                    String nw = "<h2>רשתות חברתיות</h2>";
                    while (dr.Read())
                    {
                        nw += "<ul>";
                        if (dr["social_nw"].Equals("Google"))
                        {
                            nw += "<ul><li><a href=\"" + dr.GetString(1) + "\"><i class=\"" + "fa fa-google-plus" + "\"></i></a></li>";
                        }
                        if (dr["social_nw"].Equals("Facebook"))
                        {
                            nw += "<li><a href=\"" + dr.GetString(2) + "\"><i class=\"" + "fa fa-facebook" + "\"></i></a></li>";
                        }
                        if (dr["social_nw"].Equals("Linkedin"))
                        {
                            nw += "<li><a href=\"" + dr.GetString(3) + "\"><i class=\"" + "fa fa-linkedin" + "\"></i></a></li>";
                        }
                        nw += "</ul>";
                        socialNW.InnerHtml = nw;
                    }
                }
                con.Close();
            }
            catch (Exception ex)
            {
                //TODO
            }
        }

        private void displayUserSkills()
        {
            try
            {
                String selectSkills = "SELECT Skills.skill FROM User_Skills " +
                    "INNER JOIN Skills ON User_Skills.skill_id = Skills.skill_id " +
                    "WHERE User_Skills.user_id='" + User_ID + "'";
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString);
                con.Open();
                SqlCommand skillsCmd = new SqlCommand(selectSkills, con);
                SqlDataReader dr = skillsCmd.ExecuteReader();
                if (dr.HasRows)
                {
                    String skillsList = "<h2>כישורי מפתח</h2>" + "<div>";
                    while (dr.Read())
                    {
                        skillsList += "<a class=\"badge\">" + dr.GetString(0) + "</a>";
                    }
                    skillsList += "</div>";
                    skills.InnerHtml = skillsList;
                }
                con.Close();
            }
            catch (Exception ex)
            {
                //TODO
            }
        }
    
    
        private String convertMonthToText(int month)
        {
            switch(month)
            {
                case 1: return "ינואר";
                        break;
                case 2: return "פברואר";
                    break;
                case 3: return "מרץ";
                    break;
                case 4: return "אפריל";
                    break;
                case 5: return "מאי";
                    break;
                case 6: return "יוני";
                    break;
                case 7: return "יולי";
                    break;
                case 8: return "אוגוסט";
                break;
                case 9: return "ספטמבר";
                    break;
                case 10: return "אוקטובר";
                    break;
                case 11: return "נובמבר";
                    break;
                case 12: return "דצמבר";
            }
            return "";
        }

    }
}