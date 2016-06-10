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
    public partial class job_details : System.Web.UI.Page
    {
        String jobId;
        String companyId;
        protected void Page_Load(object sender, EventArgs e)
        {
            //get the Job_ID and Company_ID from the URL
            jobId = Request.QueryString["Job_ID"];
            companyId = Request.QueryString["Company_ID"];
            display_job_details();
        }

        private void display_job_details()
        {
            try
            {
                String selectJob = "SELECT Jobs.job_title, Scopes.scope, Cities.city, Jobs.job_desc, Jobs.job_req " +
                    "FROM Jobs INNER JOIN Jobs_Scopes ON Jobs.job_id = Jobs_Scopes.job_id " +
                    "JOIN Scopes ON Jobs_Scopes.scope_id = Scopes.scope_id " +
                    "JOIN Jobs_Cities ON Jobs.job_id = Jobs_Cities.job_id " +
                    "JOIN Cities ON Jobs_Cities.city_id = Cities.city_id " +
                    "WHERE Jobs.job_id='" + jobId + "'";
                String selectCompany = "SELECT company_desc, company_logo, company_site, company_email FROM Companies WHERE company_id ='" + companyId.ToString() + "'";
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString);
                con.Open();
                SqlCommand jobCmd = new SqlCommand(selectJob, con);
                SqlDataReader dr = jobCmd.ExecuteReader();
                if (dr.HasRows)
                {
                    if (dr.Read())
                    {
                        //title
                        String mainTitle = "";
                        mainTitle = "<h1>" + dr.GetString(0) +"</h1>" +
                            "<h4>" + "<span><i class=\"fa fa-map-marker\"></i>" + dr.GetString(2) + "</span>" +
                            "<span><i class=\"fa fa-clock-o\"></i>" + dr.GetString(1)  + "</span>";
                        title.InnerHtml = mainTitle;
                        
                        //details (desc. req. send cv)
                        String details = "";
                        if (dr["job_desc"] != DBNull.Value)
                            details = "<p>" + dr.GetString(3) +"</p>";
                        if(dr["job_req"] != DBNull.Value)
                            details += "<h3>דרישות תפקיד</h3>" + 
                                       "<p>" + dr.GetString(4) + "</p>";
                        details += "<h3>כיצד להגיש מועמדות</h3>" +
                                   "<p>ניתן לשלוח קובץ קורות חיים ישירות במייל</p>" +
                                   "<p><a href=\"#\" class=\"btn btn-primary btn-lg\">שלח קורות חיים</a>"; 
                                   //"&nbsp" + 
								   //"<a href=\"#\" class=\"btn btn-default btn-lg\">הגש באמצעות Linkedin</a></p>" ;
                        jobDetails.InnerHtml = details;
                    }
                }
                con.Close();
                con.Open();
                SqlCommand companyCmd = new SqlCommand(selectCompany, con);
                dr = companyCmd.ExecuteReader();
                if (dr.HasRows)
                {
                    if (dr.Read())
                    {
                        //company details
                        String companyDetails = "";
                        String imgURL = "http://placehold.it/300x109.gif";
                        companyDetails = "<h2>על החברה</h2>";
                        if (dr["company_logo"] != DBNull.Value)
                            imgURL = dr.GetString(1);
                        companyDetails += "<p><img src=\"" + imgURL + "\" alt=\"\" class=\"img-responsive\" height=\"100\" width=\"300\" /></p>";

                        if (dr["company_desc"] != DBNull.Value)
                            companyDetails += "<p>" + dr.GetString(0) + "</p>";

                        if (dr["company_site"] != DBNull.Value)
                            companyDetails += "<p><a href=\"" + dr.GetString(2) + "\" class=\"btn btn-primary\">לאתר החברה</a></p>";

                        company.InnerHtml = companyDetails;
                    }
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