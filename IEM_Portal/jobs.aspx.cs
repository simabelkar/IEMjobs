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
    public partial class jobs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //load in 1st time only
            if (!IsPostBack)
            {
                Populate_Job_Category_List();
                Populate_Job_Location_List();
                Populate_Job_Scope_List();
            }
        }

        protected void Search_Jobs(object sender, EventArgs e)
        {
            String Html = "";
            String scopeClass = "";
            String locationCondition = jobSearchLocation_SelectedValues();
            String scopeCondition = jobSearchScope_SelectedValues();
            String subCategoryCondition = jobSearchSubCategory_SelectedValues();
            //select all jobs
            String SQLQuery = "SELECT Jobs.job_title, Companies.company_name, Companies.company_logo,Cities.city, Scopes.scope, Scopes.scope_id, Jobs.job_id, Companies.company_id " +
                        "FROM Jobs INNER JOIN Companies ON Jobs.company_id = Companies.company_id " +
                        "JOIN Jobs_Categories ON Jobs.job_id = Jobs_Categories.job_id " +
                        "JOIN Jobs_Cities ON Jobs.job_id = Jobs_Cities.job_id " +
                        "JOIN Jobs_Scopes ON Jobs.job_id = Jobs_Scopes.job_id " +
                        "JOIN Categories ON Jobs_Categories.category_id = Categories.category_id " +
                        "JOIN Cities ON Jobs_Cities.city_id = Cities.city_id " +
                        "JOIN Scopes ON Jobs_Scopes.scope_id = Scopes.scope_id " +
                        "JOIN Sub_Categories ON Jobs_Categories.sub_category_id = Sub_Categories.sub_category_id " +
                        "WHERE" + locationCondition + "AND" + scopeCondition + "AND" + subCategoryCondition + 
                        "ORDER BY Jobs.job_id ASC";

            if (!locationCondition.Equals("") && !scopeCondition.Equals("") &&
                !subCategoryCondition.Equals(""))
            {
                jobSearchError.Visible = false;
                
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString);
                con.Open();
                SqlCommand jobsCmd = new SqlCommand(SQLQuery, con);
                SqlDataReader dr = jobsCmd.ExecuteReader();
                if (dr.HasRows)
                {
                    String imgURL = "http://placehold.it/60x60.jpg"; //default company image
                    while (dr.Read())
                    {
                        //link for job details page - pass Job_ID and Comapany_ID via URL
                        Html += "<a href=\"job-details.aspx?Job_ID=" + dr.GetInt32(6).ToString() + "&Company_ID=" + dr.GetInt32(7).ToString() + "\"" + "class=\"applied\">" +
                                "<div class=\"row\">";
                        //company image
                        if(dr["company_logo"] != DBNull.Value)
                            imgURL = dr.GetString(2);
                        Html += "<div class=\"col-md-1 hidden-sm hidden-xs\">" +
                                "<img src=\"" + imgURL + "\"" + "alt=\"\"" + "class=\"img-responsive\" />" +
                                "</div>";
                            
                        //job title and company name
                        Html += "<div class=\"col-lg-5 col-md-5 col-sm-7 col-xs-12 job-title\">" +
                                "<h5>" + dr.GetString(0) + "</h5>" +
                                "<p>" + dr.GetString(1) + "</p>" +
                                "</div>";
                        //job locaion
                        Html += "<div class=\"col-lg-4 col-md-4 col-sm-5 col-xs-12 job-location\">" +
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
                        Html += "<div class=\"col-lg-2 col-md-2 hidden-sm hidden-xs job-type text-center\">" +
                                "<p class=\"" + scopeClass + "\">" + dr.GetString(4) + "</p>" +
                                "</div>";
                        Html += "</div>" + "</a>";
                    }

                }
                else
                    Html = "לא נמצאו תוצאות התואמות לחיפוש";
                con.Close();
                jobsList.InnerHtml = Html;
            }
            else
            {
                jobSearchError.Style.Remove("display");
                jobSearchError.InnerHtml = "נא להזין את כל השדות לחיפוש";
                jobsList.InnerHtml = "";
            }

        }


        /************************* Check boxes selection *************************/
        protected void jobSearchCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            bool isFirst = true;
            String selected_categories = "";
            foreach (ListItem selectedItem in (jobSearchCategory as ListControl).Items)
            {
                if (selectedItem.Selected)
                {
                    if (isFirst)
                    {
                        selected_categories += "'" + selectedItem.Value + "' ";
                        isFirst = false;
                    }
                    else
                        selected_categories += "OR category_id='" + selectedItem.Value + "' "; 
                }
            }

            //select sub_category match to the selected categories
            String SQLquery = "SELECT sub_category, sub_category_id FROM Sub_Categories WHERE category_id=" + selected_categories + "order by sub_category_id";
            DataTable subject = new DataTable();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString))
            {
                try
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(SQLquery, con);
                    adapter.Fill(subject);
                    jobSearchSubCategory.DataSource = subject;
                    jobSearchSubCategory.DataTextField = "sub_category";
                    jobSearchSubCategory.DataValueField = "sub_category_id";
                    jobSearchSubCategory.DataBind();
                }
                catch (Exception ex)
                {
                    //TODO
                }
            }
        }

        protected String jobSearchSubCategory_SelectedValues()
        {
            bool isFirst = true;
            String selected_subCategories = "(";
            foreach (ListItem selectedItem in (jobSearchSubCategory as ListControl).Items)
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
        }

        protected String jobSearchScope_SelectedValues()
        {
            bool isFirst = true;
            String selected_scopes= "(";
            foreach (ListItem selectedItem in (jobSearchScope as ListControl).Items)
            {
                if (selectedItem.Selected)
                {
                    if (isFirst)
                    {
                        selected_scopes += "'" + selectedItem.Value + "' ";
                        isFirst = false;
                    }
                    else
                        selected_scopes += ",'" + selectedItem.Value  + "' ";
                }
            }
            selected_scopes += ")";
            if (selected_scopes.Equals("()"))
                return "";
            return " Scopes.scope_id IN " + selected_scopes + " ";
        }

        private String jobSearchLocation_SelectedValues()
        {
            bool isFirst = true;
            String selected_cities = "(";
            foreach (ListItem selectedItem in (jobSearchLocation as ListControl).Items)
            {
                if (selectedItem.Selected)
                {
                    if (isFirst)
                    {
                        selected_cities += "'" + selectedItem.Value + "' ";
                        isFirst = false;
                    }
                    else
                        selected_cities += ",'" + selectedItem.Value + "' ";
                }
            }
            selected_cities += ")";
            if (selected_cities.Equals("()"))
                return "";
            return " Cities.city_id IN " + selected_cities + " ";
        }

        /************************* Populate Drop Down lists during Page_Load() *************************/
        protected void Populate_Job_Category_List()
        {
            String SQLquery = "SELECT category, category_id FROM Categories ORDER BY category_id";
            DataTable subject = new DataTable();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString))
            {
                try
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(SQLquery, con);
                    adapter.Fill(subject);
                    jobSearchCategory.DataSource = subject;
                    jobSearchCategory.DataTextField = "category";
                    jobSearchCategory.DataValueField = "category_id";
                    jobSearchCategory.DataBind();
                }
                catch (Exception ex)
                {
                    //TODO
                }
            }
        }

        protected void Populate_Job_Location_List()
        {
            String SQLquery = "SELECT city, city_id FROM Cities ORDER BY city";
            DataTable subject = new DataTable();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString))
            {
                try
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(SQLquery, con);
                    adapter.Fill(subject);
                    jobSearchLocation.DataSource = subject;
                    jobSearchLocation.DataTextField = "city";
                    jobSearchLocation.DataValueField = "city_id";
                    jobSearchLocation.DataBind();
                }
                catch (Exception ex)
                {
                    //TDOD
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
                    jobSearchScope.DataSource = subject;
                    jobSearchScope.DataTextField = "scope";
                    jobSearchScope.DataValueField = "scope_id";
                    jobSearchScope.DataBind();
                }
                catch (Exception ex)
                {
                    //TODO
                }
            }
        }
        
    }
}