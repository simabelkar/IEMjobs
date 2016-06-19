using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Security;

namespace IEM_Portal
{
    public partial class register : System.Web.UI.Page
    {
        bool Problem = false;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack)
            {

                CaptchaControl1.ValidateCaptcha(txtAnswer.Text);
                txtAnswer.Text = null;
                
                // validate the Captcha to check we're not dealing with a bot
                if (CaptchaControl1.UserValidated)
                {
                    Problem = false;                  
                }
                else
                {
                    // Captcha validation failed, show error message  
                    registerError.Visible = true;
                    registerError.InnerHtml = "התווים שהוכנסו שגויים, אנא נסה שנית";
                    Problem = true; 
                }

            }
            else
            {
                Problem = false;
                registerError.Visible = false;
                registerError.InnerHtml = "";
            }
        }

        protected void registerSubmitBtn_Click(object sender, EventArgs e)
        {
            if (!Problem)
            { 
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString);
            String checkUser = "SELECT COUNT (*) FROM Users WHERE user_email='" + registerUsername.Text + "'";
            con.Open();
            SqlCommand cmd = new SqlCommand(checkUser, con);
            int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            con.Close();
            //user exist
            if (temp == 1)
            {
                registerError.InnerHtml = "המשתמש כבר קיים";
                registerError.Visible = true;
            }
            //new user 
            else
            {
                //all parameters are valid
                if ((registerFnameVal.IsValid) && (registerLnameVal.IsValid) && (registerPasswordVal.IsValid))
                {
                    String hashPwd = hashPassword(registerPassword.Text);
                    try
                    {
                        String insertUser = "INSERT into Users (user_password,user_email,user_fname,user_lname) values (@userPassword,@userEmail,@userFname,@userLname)";
                        con.Open();
                        SqlCommand insertCmd = new SqlCommand(insertUser, con);
                        insertCmd.Parameters.AddWithValue("@userPassword", hashPwd);
                        insertCmd.Parameters.AddWithValue("@userEmail", registerUsername.Text);
                        insertCmd.Parameters.AddWithValue("@userFname", registerFname.Text);
                        insertCmd.Parameters.AddWithValue("@userLname", registerLname.Text);
                        insertCmd.ExecuteNonQuery();
                        

                        //login user
                        Session["Name"] = registerFname.Text;
                        Session["Username"] = registerUsername.Text;
                        //save user_id
                        String getUserId = "SELECT user_id FROM Users WHERE user_email='" + Session["Username"].ToString() + "'";
                        SqlCommand getUserIDCmd = new SqlCommand(getUserId, con);
                        int userId = Convert.ToInt32(getUserIDCmd.ExecuteScalar());
                        Session["UserID"] = userId;

                        con.Close();
                        //redirect TODO
                        Response.Redirect("homepage.aspx",false);

                    }
                    catch (Exception ex)
                    {
                        registerError.InnerHtml = ex.Message.ToString();
                        registerError.Visible = true;
                    }
                }
                else
                {
                    registerError.InnerHtml = "הנתונים אינם תקינים";
                    registerError.Visible = true;
                }

            }
            }
        }

        protected String hashPassword(String origPwd)
        {
            byte[] bytes = System.Text.Encoding.UTF8.GetBytes(origPwd);
            System.Security.Cryptography.SHA256Managed sha256HashString = new System.Security.Cryptography.SHA256Managed();
            byte[] hash = sha256HashString.ComputeHash(bytes);
            String hex = BitConverter.ToString(hash);
            return hex.Replace("-", "");
        }
    }
}