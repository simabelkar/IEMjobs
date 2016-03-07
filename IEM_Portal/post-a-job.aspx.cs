using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


namespace IEM_Portal
{
    public partial class post_a_job : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Post_A_Job(object sender, EventArgs e)
        {
            if(valjobtitle.IsValid && valjobdescription.IsValid && valjobrequirement.IsValid)
            {
                try
                {

                }
                catch (Exception ex)
                {
                    postjoberror.InnerHtml = "Error:" + ex.Message.ToString();
                }
            }
        }

        private void Load_Job_Category()
        {
            DataTable subject = new DataTable();
            //SqlConnection.SqlConnection con = new SqlConnection(connectionString);

            
        }

    }
}