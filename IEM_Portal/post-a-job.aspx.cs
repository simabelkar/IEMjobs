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
    public partial class post_a_job : System.Web.UI.Page
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

            //------ manage login logout ------
            if (Session["Name"] != null)
            {
                String Name = Session["Name"].ToString();
                //user is not logged in
                if ((Name == "") || (Name == "אורח"))
                {
                    Session["Dest_Page"] = "post-a-job.aspx";
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
            //------ end manage login logout ------
        }

        protected void Post_A_Job(object sender, EventArgs e)
        {
            
            //all field validation pass
            if((jobTitleValidator.IsValid) && (jobDescriptionValidator.IsValid) && (jobRequirementValidator.IsValid) && 
                (jobCategoryValidator.IsValid) && (jobSubCategoryValidator.IsValid) && (jobLocationValidator.IsValid) && 
                (jobScopeValidator.IsValid) && (companyNameValidator.IsValid) && (companyDescriptionValidator.IsValid))
            {
                try
                {
                    String SQLquery_Companies = "INSERT INTO Companies (company_name,company_desc,company_email,company_site,company_logo) VALUES (@companyName,@companyDesc,@companyEmail,@companyWebsite,@companyLogo)";
                    String SQLquery_Jobs = "INSERT INTO Jobs  (job_title,job_desc,job_req,company_id, timestamp) VALUES (@jobTitle,@jobDesc,@jobReq,@companyId,@timeStamp)";
                    String SQLquery_JobsCategories = "INSERT INTO Jobs_Categories (job_id,category_id,sub_category_id) VALUES (@jobID,@jobCategory,@jobSubCategory)";
                    String SQLquery_JobsCities = "INSERT INTO Jobs_Cities (job_id,city_id) VALUES (@jobID, @cityID) ";
                    String SQLquery_JobsScopes = "INSERT INTO Jobs_Scopes (job_id,scope_id) VALUES (@jobID,@jobScope)";
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString);
                    con.Open();


                    SqlCommand cmd = new SqlCommand(SQLquery_Companies, con);
                    //save company parameters
                    cmd.Parameters.AddWithValue("@companyName", companyName.Text);
                    cmd.Parameters.AddWithValue("@companyDesc", companyDescription.Text);
                    cmd.Parameters.AddWithValue("@companyEmail", companyEmail.Text);
                    cmd.Parameters.AddWithValue("@companyWebsite", companyWebsite.Text);
                    cmd.Parameters.AddWithValue("@companyLogo", companyLogo.Text);
                    //TODO - company photo
                    cmd.ExecuteNonQuery();

                    //get company ID
                    cmd.CommandText = "SELECT IDENT_CURRENT('Companies');";
                    int id = Convert.ToInt32(cmd.ExecuteScalar());
                    
                    DateTime currentTime = DateTime.Now;
                    cmd = new SqlCommand(SQLquery_Jobs, con);
                    //save job parameters
                    cmd.Parameters.AddWithValue("@jobTitle",jobTitle.Text);
                    cmd.Parameters.AddWithValue("@jobDesc", jobDescription.Text);
                    cmd.Parameters.AddWithValue("@jobReq", jobRequirement.Text);
                    cmd.Parameters.AddWithValue("@companyId", id);
                    cmd.Parameters.AddWithValue("@timeStamp", currentTime);
                    cmd.ExecuteNonQuery();
                    cmd.CommandText = "SELECT IDENT_CURRENT('Jobs');";
                    id = Convert.ToInt32(cmd.ExecuteScalar());


                    cmd = new SqlCommand(SQLquery_JobsCategories, con);
                    //JobsCategories parameters
                    cmd.Parameters.AddWithValue("@jobCategory", jobCategory.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@jobSubCategory", jobSubCategory.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@jobID", id);
                    cmd.ExecuteNonQuery();

                    cmd = new SqlCommand(SQLquery_JobsCities, con);
                    //JobsCities parameters
                    cmd.Parameters.AddWithValue("@jobID", id);
                    cmd.Parameters.AddWithValue("@cityID", jobLocation.SelectedItem.Value);
                    cmd.ExecuteNonQuery();

                    cmd = new SqlCommand(SQLquery_JobsScopes, con);
                    //Jobscope parameters
                    cmd.Parameters.AddWithValue("@jobID", id);
                    cmd.Parameters.AddWithValue("@jobScope",jobScope.SelectedItem.Value);
                    cmd.ExecuteNonQuery();

                    con.Close();

                    //navigate to homepage
                    Response.Redirect("homepage.aspx");
                   
                }
                catch (Exception ex)
                {
                    postJobError.Style.Remove("display");
                    postJobError.InnerHtml = ex.Message.ToString();
                }
            }

            else
            {
                postJobError.Style.Remove("display");
                postJobError.InnerHtml = "חובה למלא את כל שדות החובה";
            }
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
                    jobCategory.DataSource = subject;
                    jobCategory.DataTextField = "category";
                    jobCategory.DataValueField = "category_id";
                    jobCategory.DataBind();
                    jobCategory.Items.Insert(0,new ListItem("--בחר תחום--","0"));
                }
                catch (Exception ex)
                {
                    postJobError.Style.Remove("display");
                    postJobError.InnerHtml = ex.Message.ToString();
                }
            }
        }

        //jobCategory_SelectedIndexChanged
        protected void Populate_Job_Sub_Category_List(object sender, EventArgs e)
        {
            //selected category
            String index = jobCategory.SelectedItem.Value.ToString();
            //select sub_category match to the selected category
            String SQLquery = "SELECT sub_category, sub_category_id FROM Sub_Categories WHERE category_id='" + index + "' order by sub_category_id";
            
            DataTable subject = new DataTable();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString))
            {
                try
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(SQLquery, con);
                    adapter.Fill(subject);
                    jobSubCategory.DataSource = subject;
                    jobSubCategory.DataTextField = "sub_category";
                    jobSubCategory.DataValueField = "sub_category_id";
                    jobSubCategory.DataBind();
                    jobSubCategory.Items.Insert(0, new ListItem("--בחר תת תחום--", "0"));
                }
                catch (Exception ex)
                {
                    postJobError.Style.Remove("display");
                    postJobError.InnerHtml = ex.Message.ToString();
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
                    jobLocation.DataSource = subject;
                    jobLocation.DataTextField = "city";
                    jobLocation.DataValueField = "city_id";
                    jobLocation.DataBind();
                    jobLocation.Items.Insert(0, new ListItem("--בחר עיר--", "0"));
                }
                catch (Exception ex)
                {
                    postJobError.Style.Remove("display");
                    postJobError.InnerHtml = ex.Message.ToString();
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
                    jobScope.DataSource = subject;
                    jobScope.DataTextField = "scope";
                    jobScope.DataValueField = "scope_id";
                    jobScope.DataBind();
                    jobScope.Items.Insert(0, new ListItem("--בחר היקף משרה--", "0"));
                }
                catch (Exception ex)
                {
                    postJobError.Style.Remove("display");
                    postJobError.InnerHtml = ex.Message.ToString();
                }
            }
        }

    }
}