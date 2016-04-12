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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Name"] != null)
            {
                String Name = Session["Name"].ToString();
                if ((Name == "") || (Name == "אורח"))
                {
                    Session["Dest_Page"] = "resume.aspx";
                    Response.Redirect("login.aspx");
                }
                //user is logged in
                else
                {
                    displayUserPersonalDetails(); //contact details, photo, summary
                    displayUserHighlights();
                    displayUserExperience();
                    displayUserEducation();
                    displayUserSocialNw();
                    //TODO-display skills
                }
            }
        }

        private void displayUserPersonalDetails()
        {
            try
            {
                String selectUser = "SELECT * FROM Users WHERE user_email='" + Session["Username"].ToString() + "'";
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
                        mainTitle += "<h1>" + dr.GetString(3) + "&nbsp" + dr.GetString(4) + "<h1>";
                        if (dr["user_curr_job_title"] != DBNull.Value)
                            mainTitle += "<h4>" + dr.GetString(5) + "<h4>";
                        title.InnerHtml = mainTitle;
                        //userProfile
                        String profile = "";
                        if (dr["user_photo"] != DBNull.Value)
                            profile += "<img src=\"" + dr.GetString(10) + "\" alt=\"" + "\" class=\"" + "pull-right" + "\" height=\"270\" width=\"220\"/>";
                        else
                            profile += "<img src=\"" + "http://placehold.it/220x270.jpg" + "\" alt=\"" + "\" class=\"" + "pull-right" + "\" height=\"270\" width=\"220\"/>";
                        if (dr["user_summary"] != DBNull.Value)
                            profile += "<p>" + dr.GetString(8) + "</p>";
                        userProfile.InnerHtml = profile;
                        //contactDetails
                        String contact = "<ul>";
                        contact += "<li><i class=\"" + "fa fa-user" + "\"></i>" + dr.GetString(3) + "&nbsp" + dr.GetString(4) + "</li>"; //name
                        if (dr["user_curr_job_title"] != DBNull.Value)
                            contact += "<li><i class=\"" + "fa fa-briefcase" + "\"></i>" + dr.GetString(5) + "</li>"; //jobTitle
                        if (dr["user_birthday"] != DBNull.Value)
                            contact += "<li><i class=\"" + "fa fa-birthday-cake" + "\"></i>" + dr.GetDateTime(7).Date.ToString() + "</li>"; //birthdate
                        if (dr["city_id"] != DBNull.Value)
                            contact += "<li><i class=\"" + "fa fa-map-marker" + "\"></i>" + dr.GetInt32(6) + "</li>"; //city
                        if (dr["user_phone"] != DBNull.Value)
                            contact += "<li><i class=\"" + "fa fa-phone" + "\"></i>" + dr.GetString(9) + "</li>"; //phone
                        contact += "<li><i class=\"" + "fa fa-envelope" + "\"></i><a href=\"" + "mailto:" + dr.GetString(2) + "\">" + "שלח אימייל</a></li>"; //email
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
                String selectExperience = "SELECT * FROM User_Highlights WHERE user_id='" + Session["UserID"].ToString() + "'";
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
                String selectExperience = "SELECT * FROM User_Experience WHERE user_id='" + Session["UserID"].ToString() + "'";
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
                            "<div class=\"" + "col-sm-10" + "\">" +
                            "<h4>" + dr.GetDateTime(2).Date.ToString() + " - " + dr.GetDateTime(3).Date.ToString() + "</h4>" +
                            "<h5>" + dr.GetString(1) + " - " + dr.GetString(4) + "</h5>";
                        if (dr["user_resp"] != DBNull.Value)
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
                String selectEducation = "SELECT * FROM User_Education WHERE user_id='" + Session["UserID"].ToString() + "'";
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
                            "<div class=\"" + "col-sm-10" + "\">" +
                            "<h4>" + dr.GetDateTime(2).Date.ToString() + " - " + dr.GetDateTime(3).Date.ToString() + "</h4>" +
                            "<h5>" + dr.GetString(1) + " - " + dr.GetString(4) + "</h5>";
                        if (dr["avarage"] != DBNull.Value)
                            educationHTML += "<p>" + "ממוצע ציונים:" + dr.GetString(5) + "</p>";
                        if (dr["notes"] != DBNull.Value)
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
                String selectSocialNW = "SELECT * FROM User_Social_nw WHERE user_id='" + Session["UserID"].ToString() + "'";
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString);
                con.Open();
                SqlCommand socialNWCmd = new SqlCommand(selectSocialNW, con);
                SqlDataReader dr = socialNWCmd.ExecuteReader();
                if (dr.HasRows)
                {
                    String nw = "<h2>רשתות חברתיות</h2>";
                    if (dr.Read())
                    {
                        nw += "<ul>";
                        if (dr["google"] != DBNull.Value)
                        {
                            nw += "<ul><li><a href=\"" + dr.GetString(1) + "\"><i class=\"" + "fa fa-google-plus" + "\"></i></a></li>";
                        }
                        if (dr["facebook"] != DBNull.Value)
                        {
                            nw += "<li><a href=\"" + dr.GetString(2) + "\"><i class=\"" + "fa fa-facebook" + "\"></i></a></li>";
                        }
                        if (dr["linkedin"] != DBNull.Value)
                        {
                            nw += "<li><a href=\"" + dr.GetString(3) + "\"><i class=\"" + "fa fa-linkedin" + "\"></i></a></li>";
                        }
                        if (dr["twitter"] != DBNull.Value)
                        {
                            nw += "<li><a href=\"" + dr.GetString(4) + "\"><i class=\"" + "fa fa-twitter" + "\"></i></a></li>";
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
                    "INNER JOIN Skills ON User_Skills.skill_id = Skills.skill_id" +
                    "WHERE User_Skills.user_id='" + Session["UserID"].ToString() + "'";
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
    }
}