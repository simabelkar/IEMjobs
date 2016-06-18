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
    public partial class post_a_resume : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //load in 1st time only
            if (!IsPostBack)
            {
                Populate_Job_Category_List();
                Populate_City_List();
                Populate_Skills_List();
                Populate_Social_Network_List();
                Populate_Educations_List();
            }

            //------ manage login logout ------
            if (Session["Name"] != null)
            {
                String Name = Session["Name"].ToString();
                //user is not logged in
                if ((Name == "") || (Name == "אורח"))
                {
                    Session["Dest_Page"] = "post-a-resume.aspx";
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

                    try
                    {
                        //check if user already post resume
                        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString);
                        con.Open();
                        //check exsistance in all tables
                        String checkSocialNW = "SELECT COUNT (*) FROM User_Social_nw WHERE user_id='" + Session["UserID"].ToString() + "'";
                        SqlCommand socialNWCmd = new SqlCommand(checkSocialNW, con);
                        int socialNW = Convert.ToInt32(socialNWCmd.ExecuteScalar().ToString());
                        String checkUserSkills = "SELECT COUNT (*) FROM User_Skills WHERE user_id='" + Session["UserID"].ToString() + "'";
                        SqlCommand skillsCmd = new SqlCommand(checkUserSkills, con);
                        int skills = Convert.ToInt32(skillsCmd.ExecuteScalar().ToString());
                        String checkUserExp = "SELECT COUNT (*) FROM User_Experience WHERE user_id='" + Session["UserID"].ToString() + "'";
                        SqlCommand expCmd = new SqlCommand(checkUserExp, con);
                        int exp = Convert.ToInt32(expCmd.ExecuteScalar().ToString());
                        String checkUserEduc = "SELECT COUNT (*) FROM User_Education WHERE user_id='" + Session["UserID"].ToString() + "'";
                        SqlCommand educCmd = new SqlCommand(checkUserEduc, con);
                        int educ = Convert.ToInt32(educCmd.ExecuteScalar().ToString());
                        String checkUserHighlight = "SELECT COUNT (*) FROM User_Highlights WHERE user_id='" + Session["UserID"].ToString() + "'";
                        SqlCommand highlightCmd = new SqlCommand(checkUserHighlight, con);
                        int highlight = Convert.ToInt32(highlightCmd.ExecuteScalar().ToString());
                        con.Close();
                        //user already post resume
                        if ((socialNW >= 1) || (skills >= 1) || (exp >= 1) || (educ >= 1) || (highlight >= 1) )
                        {
                            postResumeError.Style.Remove("display");
                            postResumeError.InnerHtml = "לא ניתן לבצע את הפעולה שנית";
                        }
                        //user did not post resume - fill user basic details automatically after login
                        else
                        {
                            try
                            {
                                //fill the user details inserted during registration process (fname,lname,email)
                                //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString);
                                String selectLname = "SELECT user_lname FROM Users WHERE user_email='" + Session["Username"].ToString() + "'";
                                con.Open();
                                SqlCommand getLnameCmd = new SqlCommand(selectLname, con);
                                string fname = getLnameCmd.ExecuteScalar().ToString();
                                resumeLastName.Text = fname;
                                resumeFirstName.Text = Session["Name"].ToString();
                                resumeEmail.Text = Session["Username"].ToString();
                                con.Close();
                            }
                            catch (Exception ex)
                            {
                                postResumeError.Style.Remove("display");
                                postResumeError.InnerHtml = ex.Message.ToString();
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        postResumeError.Style.Remove("display");
                        postResumeError.InnerHtml = ex.Message.ToString();
                    }
                }
            }
            //------ end manage login logout ------


        }

        protected void Post_Resume(object sender, EventArgs e)
        {
            bool isSuccess;
            //all field validation pass
            if (//personal details
                resumeLocationValidator.IsValid && resumeTitleValidator.IsValid && resumeCategoryValidator.IsValid && 
                resumeSummaryValidator.IsValid && resumeHighlightValidator.IsValid && resumeHighlightValidator2.IsValid && 
                resumeHighlightValidator3.IsValid && resumeHighlightValidator4.IsValid &&
                //job experience
                resumeEmployerValidator.IsValid && resumeEmployerValidator1.IsValid && resumeEmployerValidator2.IsValid && 
                resumeJobTitleValidator.IsValid && resumeJobTitleValidator1.IsValid && resumeJobTitleValidator2.IsValid &&
                resumeResponsibilitiesValidator.IsValid && resumeResponsibilitiesValidator1.IsValid && resumeResponsibilitiesValidator2.IsValid &&
                //education history
                resumeSchoolValidator.IsValid && resumeEducationValidator.IsValid && resumeNotesValidator.IsValid
                )
                
            {
                
                //update Users parameter
                isSuccess = Insert_User(resumeTitle.Text, resumeLocation.SelectedItem.Value, resumeBirthday.Text, resumePhone.Text, resumeSummary.Text, resumePhoto.Text);

                //if insert_user failed do not insert any other details to DB
                if (isSuccess)
                {
                    //insert user skills from DDL
                    Insert_Skills();

                    //insert user highlights1
                    if (!resumeHighlight1.Equals(""))
                        Insert_Highlight(resumeHighlight1.Text);
                    //insert user highlights2
                    if (!resumeHighlight2.Equals(""))
                        Insert_Highlight(resumeHighlight2.Text);
                    //insert user highlights3
                    if (!resumeHighlight3.Equals(""))
                        Insert_Highlight(resumeHighlight3.Text);
                    //insert user highlights4
                    if (!resumeHighlight4.Equals(""))
                        Insert_Highlight(resumeHighlight4.Text);

                    //TODO - add resumeCategory to DB

                    //save User_social_NW1 
                    if (resumeSocialNetwork.SelectedItem.Value != "0" && resumeSocialNetworkURL.Text != "")
                        Insert_Social_NW(Session["UserID"].ToString(), resumeSocialNetwork.SelectedItem.Value, resumeSocialNetworkURL.Text);
                    //add another social_NW2
                    if (resumeSocialNetwork2.SelectedItem.Value != "0" && resumeSocialNetworkURL2.Text != "")
                        Insert_Social_NW(Session["UserID"].ToString(), resumeSocialNetwork2.SelectedItem.Value, resumeSocialNetworkURL2.Text);

                    //save User_Experience1
                    if (resumeEmployer.Text != "" && resumeExperienceStartDate.Text != "" && resumeJobTitle.Text != "" && resumeResponsibilities.Text != "")
                        Insert_Experience(Session["UserID"].ToString(), resumeEmployer.Text, resumeExperienceStartDate.Text, resumeExperienceEndDate.Text, resumeJobTitle.Text, resumeResponsibilities.Text);
                    //save User_Experience2
                    if (resumeEmployer1.Text != "" && resumeExperienceEndDate1.Text != "" && resumeJobTitle1.Text != "" && resumeResponsibilities1.Text != "")
                        Insert_Experience(Session["UserID"].ToString(), resumeEmployer1.Text, resumeExperienceStartDate1.Text, resumeExperienceEndDate1.Text, resumeJobTitle1.Text, resumeResponsibilities1.Text);
                    //save User_Experience3
                    if (resumeEmployer2.Text != "" && resumeExperienceEndDate2.Text != "" && resumeJobTitle2.Text != "" && resumeResponsibilities2.Text != "")
                        Insert_Experience(Session["UserID"].ToString(), resumeEmployer2.Text, resumeExperienceStartDate2.Text, resumeExperienceEndDate2.Text, resumeJobTitle2.Text, resumeResponsibilities2.Text);


                    //TODO - save User_Jobs (user_id,job_id)

                    //save User_Education in case one of the fields is inserted
                    if (resumeSchool.Text != "" && resumeEducationStratDate.Text != "" && resumeEducation.SelectedItem.Value.ToString() != "0")
                        Insert_Education(Session["UserID"].ToString(), resumeSchool.Text, resumeEducationStratDate.Text, resumeEducationEndDate.Text, resumeEducation.SelectedItem.Value, resumeNotes.Text);

                    //TODO - add another education

                    Response.Redirect("resume.aspx");
                }
                

            }
            else
            {
                postResumeError.Style.Remove("display");
                postResumeError.InnerHtml = "חובה למלא את כל השדות מסומנים באדום";
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

        /************************* Check parameters during Post_Resume() *************************/
        private bool Insert_User(String jobTitle, String cityID, String birthday, String phone, String summary, String photoURL)
        {
            bool isSuccess = true;
            try
            {
                String updateUsers = "UPDATE Users SET user_curr_job_title=@userCurrJobTitle ,city_id=@cityID,user_birthday=@userBirthday,user_phone=@userPhone,user_summary=@userSummary,user_photo=@userPhoto WHERE user_email='" + Session["Username"].ToString() + "'";
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString);
                con.Open();
                SqlCommand setUsercmd = new SqlCommand(updateUsers, con);
                setUsercmd.Parameters.AddWithValue("@userCurrJobTitle", jobTitle);
                setUsercmd.Parameters.AddWithValue("@cityID", cityID);
                setUsercmd.Parameters.AddWithValue("@userBirthday", birthday);
                setUsercmd.Parameters.AddWithValue("@userPhone", phone);
                setUsercmd.Parameters.AddWithValue("@userSummary", summary);
                setUsercmd.Parameters.AddWithValue("@userPhoto", photoURL);
                setUsercmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex)
            {
                isSuccess = false;
                postResumeError.Style.Remove("display");
                postResumeError.InnerHtml = "Insert_User: " + ex.Message.ToString();
            }
            return isSuccess;
        }

        private void Insert_Social_NW(String userId,String socialNwId, String socialNwURL)
        {
            try {
                String insertUserSocialNW = "INSERT INTO User_Social_nw (user_id,social_nw_id,social_nw_url) VALUES (@userId,@socialNwId,@socialNwUrl)";
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString);
                con.Open(); 
                SqlCommand cmd = new SqlCommand(insertUserSocialNW, con);
                cmd.Parameters.AddWithValue("@userId", userId);
                cmd.Parameters.AddWithValue("@socialNwId", socialNwId);
                cmd.Parameters.AddWithValue("@socialNwUrl", socialNwURL);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception ex) {
                postResumeError.Style.Remove("display");
                postResumeError.InnerHtml = "Insert_Social_NW: " + ex.Message.ToString();
            }
        }

        private void Insert_Experience(String userId, String employer, String startDate, String endDate, String jobTitle, String responsibilities)
        {
            if (employer.Equals("") || startDate.Equals("") || jobTitle.Equals("") || responsibilities.Equals(""))
            {
                postResumeError.Style.Remove("display");
                postResumeError.InnerHtml = "חובה למלא את כל השדות של ניסיון תעסוקתי";
            }
            //insert to DB
            else
            {
                try
                {
                    if (endDate.Equals(""))
                        endDate = "היום";
                    String insertExperience = "INSERT INTO User_Experience (user_id,employer,start_date,end_date,job_title,user_resp) VALUES (@userId,@employer,@startDate,@endDate,@jobTitle,@userResp)";
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString);
                    con.Open();
                    SqlCommand setUserExperienceCmd = new SqlCommand(insertExperience, con);
                    setUserExperienceCmd.Parameters.AddWithValue("@userId", userId);
                    setUserExperienceCmd.Parameters.AddWithValue("@employer", employer);
                    setUserExperienceCmd.Parameters.AddWithValue("@startDate", startDate);
                    setUserExperienceCmd.Parameters.AddWithValue("@endDate", endDate);
                    setUserExperienceCmd.Parameters.AddWithValue("@jobTitle", jobTitle);
                    setUserExperienceCmd.Parameters.AddWithValue("@userResp", responsibilities);
                    setUserExperienceCmd.ExecuteNonQuery();
                    con.Close();
                }
                catch (Exception ex)
                {
                    postResumeError.Style.Remove("display");
                    postResumeError.InnerHtml = "Insert_Experience: " + ex.Message.ToString();
                }
            }
        }
        
        private void Insert_Education(String userId, String school, String startDate, String endDate, String qualification, String notes)
        {
            if (school.Equals("") || startDate.Equals("") || qualification.Equals("0"))
            {
                postResumeError.Style.Remove("display");
                postResumeError.InnerHtml = "חובה למלא את כל השדות של השכלה";
            }
            else
            {
                try
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString);
                    con.Open();
                    String insertEducation = "INSERT INTO User_Education (user_id,school_name,start_date,end_date,qualification_id,notes) VALUES (@userId,@schoolName,@startDate,@endDate,@qualification,@notes)";
                    SqlCommand setUserEducationCmd = new SqlCommand(insertEducation, con);
                    setUserEducationCmd.Parameters.AddWithValue("@userId", userId);
                    setUserEducationCmd.Parameters.AddWithValue("@schoolName", school);
                    setUserEducationCmd.Parameters.AddWithValue("@startDate", startDate);
                    setUserEducationCmd.Parameters.AddWithValue("@endDate", endDate);
                    setUserEducationCmd.Parameters.AddWithValue("@qualification", qualification);
                    setUserEducationCmd.Parameters.AddWithValue("@notes", notes);
                    setUserEducationCmd.ExecuteNonQuery();
                    con.Close();
                }
                catch (Exception ex)
                {
                    postResumeError.Style.Remove("display");
                    postResumeError.InnerHtml = "Insert_Education: " + ex.Message.ToString();
                }
            }
        }

        private void Insert_Skills()
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString);
                con.Open();
                String insertSkill = "";
                foreach (ListItem selectedItem in (resumeSkills as ListControl).Items)
                {
                    if (selectedItem.Selected)
                    {
                        insertSkill = "INSERT INTO User_Skills (user_id,skill_id) VALUES (@userId,@skillId)";
                        SqlCommand setUserSkillCmd = new SqlCommand(insertSkill, con);
                        setUserSkillCmd.Parameters.AddWithValue("@userId", Session["UserID"].ToString());
                        setUserSkillCmd.Parameters.AddWithValue("@skillId", selectedItem.Value);
                        setUserSkillCmd.ExecuteNonQuery();
                    }
                }
                con.Close();
            }
            catch (Exception ex)
            {
                postResumeError.Style.Remove("display");
                postResumeError.InnerHtml = "Insert_Skills: " + ex.Message.ToString();
            }
        }

        private void Insert_Highlight(String highlight)
        {
            try {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString);
                con.Open();
                String insertHighlight = "INSERT INTO User_Highlights (user_id,highlight) VALUES (@userId,@highlight)";
                SqlCommand setUserHighlightCmd = new SqlCommand(insertHighlight, con);
                setUserHighlightCmd.Parameters.AddWithValue("@userId", Session["UserID"].ToString());
                setUserHighlightCmd.Parameters.AddWithValue("@highlight", highlight);
                setUserHighlightCmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                postResumeError.Style.Remove("display");
                postResumeError.InnerHtml = "Insert_Highlight: " + ex.Message.ToString();
            }
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
                    resumeCategory.DataSource = subject;
                    resumeCategory.DataTextField = "category";
                    resumeCategory.DataValueField = "category_id";
                    resumeCategory.DataBind();
                    resumeCategory.Items.Insert(0, new ListItem("--בחר תחום--", "0"));
                }
                catch (Exception ex)
                {
                    postResumeError.Style.Remove("display");
                    postResumeError.InnerHtml = ex.Message.ToString();
                }
            }
        }

        protected void Populate_City_List()
        {
            String SQLquery = "SELECT city, city_id FROM Cities ORDER BY city";
            DataTable subject = new DataTable();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString))
            {
                try
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(SQLquery, con);
                    adapter.Fill(subject);
                    resumeLocation.DataSource = subject;
                    resumeLocation.DataTextField = "city";
                    resumeLocation.DataValueField = "city_id";
                    resumeLocation.DataBind();
                    resumeLocation.Items.Insert(0, new ListItem("--בחר עיר--", "0"));
                }
                catch (Exception ex)
                {
                    postResumeError.Style.Remove("display");
                    postResumeError.InnerHtml = ex.Message.ToString();
                }
            }
        }

        protected void Populate_Social_Network_List()
        {
            String SQLquery = "SELECT social_nw,social_nw_id FROM Social_nw";
            DataTable subject = new DataTable();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString))
            {
                try
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(SQLquery, con);
                    adapter.Fill(subject);
                    resumeSocialNetwork.DataSource = subject;
                    resumeSocialNetwork.DataTextField = "social_nw";
                    resumeSocialNetwork.DataValueField = "social_nw_id";
                    resumeSocialNetwork.DataBind();
                    resumeSocialNetwork.Items.Insert(0, new ListItem("--בחר רשת חברתית--", "0"));

                    resumeSocialNetwork2.DataSource = subject;
                    resumeSocialNetwork2.DataTextField = "social_nw";
                    resumeSocialNetwork2.DataValueField = "social_nw_id";
                    resumeSocialNetwork2.DataBind();
                    resumeSocialNetwork2.Items.Insert(0, new ListItem("--בחר רשת חברתית--", "0"));
                }
                catch (Exception ex)
                {
                    postResumeError.Style.Remove("display");
                    postResumeError.InnerHtml = ex.Message.ToString();
                }
            }
        }

        protected void Populate_Skills_List()
        {
            String SQLquery = "SELECT skill_id,skill FROM Skills ORDER BY skill";
            DataTable subject = new DataTable();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString))
            {
                try
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(SQLquery, con);
                    adapter.Fill(subject);
                    resumeSkills.DataSource = subject;
                    resumeSkills.DataTextField = "skill";
                    resumeSkills.DataValueField = "skill_id";
                    resumeSkills.DataBind();
                }
                catch (Exception ex)
                {
                    postResumeError.Style.Remove("display");
                    postResumeError.InnerHtml = ex.Message.ToString();
                }
            }
        }

        protected void Populate_Educations_List()
        {
            String SQLquery = "SELECT education_id,education FROM Educations";
            DataTable subject = new DataTable();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString))
            {
                try
                { 
                    SqlDataAdapter adapter = new SqlDataAdapter(SQLquery, con);
                    adapter.Fill(subject);
                    resumeEducation.DataSource = subject;
                    resumeEducation.DataTextField = "education";
                    resumeEducation.DataValueField = "education_id";
                    resumeEducation.DataBind();
                    resumeEducation.Items.Insert(0, new ListItem("--בחר סמכות--", "0"));
                }
                catch (Exception ex)
                {
                    postResumeError.Style.Remove("display");
                    postResumeError.InnerHtml = ex.Message.ToString();
                }
            }
        }

    }
}