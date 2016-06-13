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

        

        
    }
}