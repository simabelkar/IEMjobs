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
    public partial class homepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //load in 1st time only
            if (!IsPostBack)
            {
                populate_last_jobs_list();
                populate_counters();
                populate_companies();
            }

            Session["Dest_Page"] = "homepage.aspx";

            //------ manage login logout ------ 
            if(Session["Name"] != null)
            {
                String name = Session["Name"].ToString();
                //user is not logged in
                if((name == "") || (name == "אורח") )
                {
                    Session["Name"] = "אורח";
                    loggedInUser.InnerHtml = Session["Name"].ToString();
                    //display loginBtn and registerBtn 
                    loginBtn.Style.Remove("display");
                    registerBtn.Style.Remove("display");
                }
                //user is logged in
                else
                {
                    loggedInUser.InnerHtml = Session["Name"].ToString();
                    //remove loginBtn and registerBtn 
                    loginBtn.Style.Add("display", "none");
                    registerBtn.Style.Add("display","none");
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

        protected void populate_last_jobs_list()
        {
            String Html = "";
            String JobsList = "";
            String scopeClass = "";
            String SQLQuery = "SELECT TOP 10 Jobs.job_title, Companies.company_name, Companies.company_logo,Cities.city, Scopes.scope, Jobs.job_id, Companies.company_id " +
                        "FROM Jobs INNER JOIN Companies ON Jobs.company_id = Companies.company_id " +
                        "JOIN Jobs_Cities ON Jobs.job_id = Jobs_Cities.job_id " +
                        "JOIN Jobs_Scopes ON Jobs.job_id = Jobs_Scopes.job_id " +
                        "JOIN Cities ON Jobs_Cities.city_id = Cities.city_id " +
                        "JOIN Scopes ON Jobs_Scopes.scope_id = Scopes.scope_id " +
                        "ORDER BY Jobs.timestamp DESC";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString);
            con.Open();
            SqlCommand jobsCmd = new SqlCommand(SQLQuery, con);
            SqlDataReader dr = jobsCmd.ExecuteReader();
            Boolean jobsExist = false;
            while (dr.Read())
            {
                jobsExist = true;
                
                //job list
                String imgURL = "http://spik.com.ph/wp-content/themes/skoon/images/members/default-logo.png"; //default company image
                JobsList += "<div class=\"jobs\">";
                //link for job details page - pass Job_ID and Comapany_ID via URL
                JobsList += "<a href=\"job-details.aspx?Job_ID=" + dr.GetInt32(5).ToString() + "&Company_ID=" + dr.GetInt32(6).ToString() + "\"" + "class=\"applied\">" +
                        "<div class=\"row\">";
                //company image
                if (dr["company_logo"] != DBNull.Value)
                    imgURL = dr.GetString(2);
                JobsList += "<div class=\"col-md-1 hidden-sm hidden-xs\">" +
                    "<img src=\"" + imgURL + "\"" + "alt=\"\"" + "class=\"img-responsive\" />" +
                    "</div>";
                //job title and company name
                JobsList += "<div class=\"col-lg-5 col-md-5 col-sm-7 col-xs-12 job-title\">" +
                    "<h5>" + dr.GetString(0) + "</h5>" +
                    "<p>" + dr.GetString(1) + "</p>" +
                    "</div>";
                //job locaion
                JobsList += "<div class=\"col-lg-4 col-md-4 col-sm-5 col-xs-12 job-location\">" +
                    "<p><strong>" + dr.GetString(3) + "</strong></p>" +
                    "</div>";
                //job scope (full-time, part-time, intership,temporary)
                switch (dr.GetInt32(5).ToString())
                {
                    case "1": scopeClass = "badge full-time";
                        break;
                    case "2": scopeClass = "badge part-time";
                        break;
                    case "3": scopeClass = "badge intership";
                        break;
                    case "4": scopeClass = "badge temporary";
                        break;
                }
                JobsList += "<div class=\"col-lg-2 col-md-2 hidden-sm hidden-xs job-type text-center\">" +
                    "<p class=\"" + scopeClass + "\">" + dr.GetString(4) + "</p>" +
                    "</div>";
                JobsList += "</div>" + "</a>";
            }
            if (jobsExist)
                Html = "<h2>משרות שנוספו לאחרונה</h2>" + JobsList + "</div>";
            con.Close();

            lastJobs.InnerHtml = Html;
        }

        protected void populate_companies()
        {
            String Html = "";
            String companiesUL = "";
            String SQLQuery = "SELECT company_logo FROM Companies WHERE company_logo<>'';";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString);
            con.Open();
            SqlCommand CompaniesCmd = new SqlCommand(SQLQuery, con);
            SqlDataReader dr = CompaniesCmd.ExecuteReader();
            Boolean companyExist=false;

            companiesUL += "<ul id=\"featured-companies\" class=\"row\">";

            while (dr.Read())
            {
                companyExist=true;
                companiesUL += "<li class=\"col-sm-4 col-md-3\">" + 
                    "<a href=\"#\">" + 
                    "<img src=\"" + dr.GetString(0) + "\"" + "alt=\"\"" + "/>" + 
                    "</a></li>";
            }

            companiesUL += "</ul>";

            if(companyExist)
            {
                Html += "<h2>החברות שמפרסמות אצלנו</h2>" +
                    companiesUL + "</div>";
            }
            con.Close();

            companiesList.InnerHtml = Html;
            
        }

        protected void populate_counters()
        {
            String Html = "";
            String Companies_count = "SELECT Count(*) FROM Companies;";
            String Users_count = "SELECT Count(*) FROM Users;";
            String Jobs_count = "SELECT Count(*) FROM Jobs;";
            String Profiles_count = "SELECT Count(*) FROM Users " +
                "WHERE EXISTS (SELECT * FROM User_Education WHERE Users.user_id = User_Education.user_id);";

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString);
            con.Open();
            SqlCommand Companies = new SqlCommand(Companies_count, con);
            int Companies_Cnt = Convert.ToInt32(Companies.ExecuteScalar().ToString());
            SqlCommand Users = new SqlCommand(Users_count, con);
            int Users_Cnt = Convert.ToInt32(Users.ExecuteScalar().ToString());
            SqlCommand Jobs = new SqlCommand(Jobs_count, con);
            int Jobs_Cnt = Convert.ToInt32(Jobs.ExecuteScalar().ToString());
            SqlCommand Profiles = new SqlCommand(Profiles_count, con);
            int Profiles_Cnt = Convert.ToInt32(Profiles.ExecuteScalar().ToString());
            con.Close();

            //users
            Html += "<div class=\"counter\">" +
                "<div class=\"number\">" + Users_Cnt + "</div>" +
                "<div class=\"description\">משתמשים</div>" +
                "</div>";
            //Jobs
            Html+="<div class=\"counter\">" + 
				"<div class=\"number\">" + Jobs_Cnt + "</div>" + 
				"<div class=\"description\">משרות</div>" + 
				"</div>";
            //companies
            Html += "<div class=\"counter\">" + 
                    "<div class=\"number\">" + Companies_Cnt + "</div>" + 
                    "<div class=\"description\">חברות</div>" +
                    "</div>"; 
            //profiles
            Html += "<div class=\"counter\">" +
                "<div class=\"number\">" + Profiles_Cnt + "</div>" +
                "<div class=\"description\">קורות חיים</div>" +
                "</div>";
            
            counter.InnerHtml = Html;
        }

        
    }
}