using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Happy_3D_Printing_App
{
    public partial class Requests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Call a method to bind data to the GridView
                BindGridView();
            }
        }
        private void BindGridView()
        {
            // Write your connection string here
            string connectionString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            // Write your SQL query to retrieve data from the Requests table
            string query = "SELECT [request_id], [description], [CustomeName], [CustomerNumber], [length], [width], [height], [material] FROM [Requests]";

            // Create a SqlConnection and a SqlDataAdapter
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                DataTable dataTable = new DataTable();

                // Fill the DataTable with data from the database
                adapter.Fill(dataTable);

                // Bind the DataTable to the GridView
                GridView1.DataSource = dataTable;
                GridView1.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReplyToCustomer.aspx");
        }
    }
}