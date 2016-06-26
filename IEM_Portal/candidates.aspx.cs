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
    public partial class candidates : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //load in 1st time only
            if (!IsPostBack)
            {
                Populate_Education_List();
                Populate_Skills_List();
                Populate_Regions_List();
            }

            //------ manage login logout ------ 
            if (Session["Name"] != null)
            {
                String name = Session["Name"].ToString();
                //user is not logged in
                if ((name == "") || (name == "אורח"))
                {
                    Session["Dest_Page"] = "candidates.aspx";
                    Response.Redirect("login.aspx");
                }
                //user is logged in
                else
                {
                    loggedInUser.InnerHtml = Session["Name"].ToString();
                    //remove loginBtn and registerBtn 
                    loginBtn.Style.Add("display", "none");
                    registerBtn.Style.Add("display", "none");
                    //add logoutBtn
                    logoutBtn.Style.Remove("display");
                }
            }
            //displayName is null
            else
            {
                Session["Name"] = "אורח";
                loggedInUser.InnerHtml = Session["Name"].ToString();
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

        /************************* Populate Drop Down lists during Page_Load() *************************/
        protected void Populate_Education_List()
        {
            String SQLquery = "SELECT qualification, qualification_id FROM Educations ORDER BY qualification_id";
            DataTable subject = new DataTable();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString))
            {
                try
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(SQLquery, con);
                    adapter.Fill(subject);
                    candidateSearchEducation.DataSource = subject;
                    candidateSearchEducation.DataTextField = "qualification";
                    candidateSearchEducation.DataValueField = "qualification_id";
                    candidateSearchEducation.DataBind();
                }
                catch (Exception ex)
                {
                    //TODO
                }
            }
        }

        protected void Populate_Skills_List()
        {
            String SQLquery = "SELECT skill, skill_id FROM Skills ORDER BY skill";
            DataTable subject = new DataTable();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString))
            {
                try
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(SQLquery, con);
                    adapter.Fill(subject);
                    candidateSearchSkills.DataSource = subject;
                    candidateSearchSkills.DataTextField = "skill";
                    candidateSearchSkills.DataValueField = "skill_id";
                    candidateSearchSkills.DataBind();
                }
                catch (Exception ex)
                {
                    //TODO
                }
            }
        }

        protected void Populate_Regions_List()
        {
            String SQLquery = "SELECT region, region_id FROM Regions ORDER BY region";
            DataTable subject = new DataTable();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString))
            {
                try
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(SQLquery, con);
                    adapter.Fill(subject);
                    candidateSearchLocation.DataSource = subject;
                    candidateSearchLocation.DataTextField = "region";
                    candidateSearchLocation.DataValueField = "region_id";
                    candidateSearchLocation.DataBind();
                }
                catch (Exception ex)
                {
                    //TODO
                }
            }
        }

        /************************* Check boxes selection *************************/        
        protected String candidateSearchLocation_SelectedValue()
        {
            bool isFirst = true;
            String selected_regions = "(";
            foreach (ListItem selectedItem in (candidateSearchLocation as ListControl).Items)
            {
                if (selectedItem.Selected)
                {
                    if (isFirst)
                    {
                        selected_regions += selectedItem.Value;
                        isFirst = false;
                    }
                    else
                        selected_regions += "," + selectedItem.Value;
                }
            }
            selected_regions += ")";
            if (selected_regions.Equals("()"))
                return "";
            return " AND Cities.region_id  IN " + selected_regions + " ";
        }

        protected String candidateSearchEducation_SelectedValue()
        {
            bool isFirst = true;
            String selected_qualifications = "(";
            foreach (ListItem selectedItem in (candidateSearchEducation as ListControl).Items)
            {
                if (selectedItem.Selected)
                {
                    if (isFirst)
                    {
                        selected_qualifications += selectedItem.Value;
                        isFirst = false;
                    }
                    else
                        selected_qualifications += "," + selectedItem.Value;
                }
            }
            selected_qualifications += ")";
            if (selected_qualifications.Equals("()"))
                return "";
            return " AND user_id in(SELECT distinct user_id from User_Education WHERE User_Education.qualification_id IN " + selected_qualifications + ") ";
        }

        private String candidateSearchSkills_SelectedValues()
        {
            bool isFirst = true;
            String selected_skills = "(";
            foreach (ListItem selectedItem in (candidateSearchSkills as ListControl).Items)
            {
                if (selectedItem.Selected)
                {
                    if (isFirst)
                    {
                        selected_skills += selectedItem.Value;
                        isFirst = false;
                    }
                    else
                        selected_skills += "," + selectedItem.Value;
                }
            }
            selected_skills += ")";
            if (selected_skills.Equals("()"))
                return "";
            return " AND user_id in(SELECT distinct user_id from User_Skills WHERE User_Skills.skill_id IN " + selected_skills + ") ";
        }



        protected void Search_Candidates(object sender, EventArgs e)
        {
            String Html = "";
            String educationCondition = candidateSearchEducation_SelectedValue();
            String skillCondition = candidateSearchSkills_SelectedValues();
            String locationCondition = candidateSearchLocation_SelectedValue();

            String SQLQuery = "SELECT Users.user_fname, Users.user_lname, Users.user_curr_job_title, Users.user_photo, Cities.city,Users.user_id " +
                            "FROM Users " +
                            "INNER JOIN Cities ON Users.city_id = Cities.city_id " +
                            "WHERE 1=1" + 
                            locationCondition + 
                            educationCondition +  
                            skillCondition + 
                            "ORDER BY Users.user_fname ASC";
                cadidateSearchError.Visible = false;
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString);
                con.Open();
                SqlCommand userCmd = new SqlCommand(SQLQuery, con);
                SqlDataReader dr = userCmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        //link for user resume page
                        Html += "<a href=\"resume.aspx?User_ID=" + dr.GetInt32(5).ToString()+"\"" + "class=\"applied\">" +
                                "<div class=\"row\">";
                        if (dr["user_photo"] != DBNull.Value)
                            //user photo
                            Html += "<div class=\"col-xs-3 col-sm-2 col-lg-1\">" +
                                    "<img src=\"" + dr.GetString(3) + "\"" + "alt=\"\"" + "class=\"img-circle img-responsive\" />" +
                                    "</div>";
                        else
                            //default user photo
                            Html += "<div class=\"col-xs-3 col-sm-2 col-lg-1\">" +
                                    "<img src=\"" + "http://placehold.it/60x60.jpg" + "\"" + "alt=\"\"" + "class=\"img-circle img-responsive\" />" +
                                    "</div>";
                        //user name and title
                        Html += "<div class=\"col-xs-9 col-sm-4 col-md-5 col-lg-4 candidate-name\">" +
                                "<h5>" + dr.GetString(0) + " " + dr.GetString(1) + "</h5>" +
                                "<p><strong>" + dr.GetString(2) + "</strong></p>" +
                                "</div>";
                        //user city
                        Html += "<div class=\"hidden-xs col-sm-6 col-md-5 col-lg-4 candidate-location\">" +
                                "<p><strong>" + dr.GetString(4) + "</strong></p>" +
                                "</div>";
                        //TODO
                        //modify date and user job category
                        Html += "<div class=\"hidden-xs hidden-sm hidden-md col-lg-3\">" +
                                "<p class=\"candidate-tags\">" +
                                //"<span class=\"badge\">ניהול</span>" +
                                "</p></div>";

                        Html += "</div>" + "</a>";
                    }
                }
                else
                    Html = "לא נמצאו תוצאות התואמות לחיפוש";
                con.Close();
                candidatesList.InnerHtml = Html;
        }

        
    }
}