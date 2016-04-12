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
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            registerError.Visible = false;
            registerError.InnerHtml = "";
        }

        protected void registerSubmitBtn_Click(object sender, EventArgs e)
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
                if ((registerFnameVal.IsValid) && (registerLnameVal.IsValid) && registerUsernameVal.IsValid &&
                    (registerPasswordVal.IsValid))
                {
                    try
                    {
                        String insertUser = "INSERT into Users (user_password,user_email,user_fname,user_lname) values (@userPassword,@userEmail,@userFname,@userLname)";
                        con.Open();
                        SqlCommand insertCmd = new SqlCommand(insertUser, con);
                        insertCmd.Parameters.AddWithValue("@userPassword", registerPassword.Text);
                        insertCmd.Parameters.AddWithValue("@userEmail", registerUsername.Text);
                        insertCmd.Parameters.AddWithValue("@userFname", registerFname.Text);
                        insertCmd.Parameters.AddWithValue("@userLname", registerLname.Text);
                        insertCmd.ExecuteNonQuery();
                        con.Close();

                        //redirect TODO
                        Response.Redirect("homepage.aspx");

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
}