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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loginError.Visible = false;
            loginError.InnerHtml = "";
        }

        protected void loginSubmitBtn_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["IEMJobsConnectionString"].ConnectionString);
                String checkUser = "SELECT COUNT (*) FROM Users WHERE user_email='" + loginUsername.Text + "'";
                con.Open();
                SqlCommand cmd = new SqlCommand(checkUser, con);
                int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                con.Close();
                //user exist
                if (temp == 1)
                {
                    con.Open();
                    String checkPassword = "SELECT user_password FROM Users WHERE user_email='" + loginUsername.Text + "'";
                    SqlCommand passCmd = new SqlCommand(checkPassword, con);
                    string passwordquer = passCmd.ExecuteScalar().ToString();
                    //hash the inserted PWD
                    String hashedPWD = hashPassword(loginPassword.Text);
                    //password is correct
                    if (passwordquer == hashedPWD)
                    {
                        String selectFname = "SELECT user_fname FROM Users WHERE user_email='" + loginUsername.Text + "'";
                        SqlCommand fnameCmd = new SqlCommand(selectFname, con);
                        string fname = fnameCmd.ExecuteScalar().ToString();
                        Session["Name"] = fname;
                        Session["Username"] = loginUsername.Text;

                        //save user_id
                        String getUserId = "SELECT user_id FROM Users WHERE user_email='" + Session["Username"].ToString() + "'";
                        SqlCommand getUserIDCmd = new SqlCommand(getUserId, con);
                        int userId = Convert.ToInt32(getUserIDCmd.ExecuteScalar());
                        Session["UserID"] = userId;

                        Response.Redirect(Session["Dest_Page"].ToString(),false);
                    }
                    //password is not correct
                    else
                    {
                        loginError.InnerHtml = "סיסמא שגויה";
                        loginError.Visible = true;
                    }
                    con.Close();
                }
                //user is not exist
                else
                {
                    loginError.InnerHtml = "שם משתמש שגוי";
                    loginError.Visible = true;
                }
            }
            catch (Exception ex)
            {
                loginError.InnerHtml = ex.Message.ToString();
                loginError.Visible = true;
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