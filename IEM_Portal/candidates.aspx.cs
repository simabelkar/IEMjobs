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
                Populate_Job_Scope_List();
                Populate_Sub_Category_List();
                Populate_Regions_List();
            }
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

        protected void Populate_Job_Scope_List()
        {
            String SQLquery = "SELECT scope, scope_id FROM Scopes ORDER BY scope_id";
            DataTable subject = new DataTable();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString))
            {
                try
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(SQLquery, con);
                    adapter.Fill(subject);
                    candidateSearchScope.DataSource = subject;
                    candidateSearchScope.DataTextField = "scope";
                    candidateSearchScope.DataValueField = "scope_id";
                    candidateSearchScope.DataBind();
                }
                catch (Exception ex)
                {
                    //TODO
                }
            }
        }

        protected void Populate_Sub_Category_List()
        {
            String SQLquery = "SELECT sub_category, sub_category_id FROM Sub_Categories ORDER BY category_id";
            DataTable subject = new DataTable();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString))
            {
                try
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(SQLquery, con);
                    adapter.Fill(subject);
                    candidateSearchSubCategory.DataSource = subject;
                    candidateSearchSubCategory.DataTextField = "sub_category";
                    candidateSearchSubCategory.DataValueField = "sub_category_id";
                    candidateSearchSubCategory.DataBind();
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

        /*protected String candidateSearchScope_SelectedValue()
        {
        }*/

        /*protected String candidateSearchSubCategory_SelectedValue()
        {
            bool isFirst = true;
            String selected_subCategories = "(";
            foreach (ListItem selectedItem in (candidateSearchSubCategory as ListControl).Items)
            {
                if (selectedItem.Selected)
                {
                    if (isFirst)
                    {
                        selected_subCategories += "'" + selectedItem.Value + "' ";
                        isFirst = false;
                    }
                    else
                        selected_subCategories += ",'" + selectedItem.Value + "' ";
                }
            }
            selected_subCategories += ")";
            if (selected_subCategories.Equals("()"))
                return "";
            return " Jobs_Categories.sub_category_id IN " + selected_subCategories + " ";
        }*/

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
                        selected_regions += "'" + selectedItem.Value + "' ";
                        isFirst = false;
                    }
                    else
                        selected_regions += ",'" + selectedItem.Value + "' ";
                }
            }
            selected_regions += ")";
            if (selected_regions.Equals("()"))
                return "";
            return " Cities.region_id  IN " + selected_regions + " ";
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
                        selected_qualifications += "'" + selectedItem.Value + "' ";
                        isFirst = false;
                    }
                    else
                        selected_qualifications += ",'" + selectedItem.Value + "' ";
                }
            }
            selected_qualifications += ")";
            if (selected_qualifications.Equals("()"))
                return "";
            return " User_Education.qualification_id IN " + selected_qualifications + " ";
        }

        protected void Search_Candidates(object sender, EventArgs e)
        {
            String Html = "";
            String categoryClass = "";
            String locationCondition = candidateSearchLocation_SelectedValue();
            String educationCondition = candidateSearchEducation_SelectedValue();

            String SQLQuery = "SELECT Users.user_fname, Users.user_lname, Users.user_curr_job_title, Users.user_photo, Cities.city " +
                            "FROM Users " +
                            "INNER JOIN Cities ON Users.city_id = Cities.city_id " +
                            "INNER JOIN User_Education ON Users.user_id = User_Education.user_id " +
                            "INNER JOIN Educations ON Educations.qualification_id = User_Education.qualification_id " +
                            "WHERE" + locationCondition + "AND" + educationCondition + 
                            "ORDER BY Users.user_fname ASC";
            if (!locationCondition.Equals("") && !educationCondition.Equals(""))
            {
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
                        Html += "<a href=\"resume.aspx\"" + "class=\"applied\">" +
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
                                "<span class=\"badge\">ניהול</span>" +
                                "</p></div>";

                        Html += "</div>" + "</a>";
                    }
                }
                else
                    Html = "לא נמצאו תוצאות התואמות לחיפוש";
                con.Close();
                candidatesList.InnerHtml = Html;
            }
            else
            {
                cadidateSearchError.Style.Remove("display");
                cadidateSearchError.InnerHtml = "נא להזין את כל השדות לחיפוש";
                candidatesList.InnerHtml = "";
            }
        }
    }
}