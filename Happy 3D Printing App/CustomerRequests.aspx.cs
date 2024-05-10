using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Happy_3D_Printing_App
{
    public partial class CustomerRequests : System.Web.UI.Page
    {
        int customerId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Call a method to bind data to the GridView
                BindGridView();
                BindGridViewReplies();
            }
            if (Session["CustomerId"] != null)
            {
                customerId = (int)Session["CustomerId"];

            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        private void BindGridView()
        {
            // Write your connection string here
            string connectionString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            // Write your SQL query to retrieve data from the Requests table
            string query = "SELECT [request_id], [description], [CustomeName], [CustomerNumber], [length], [width], [height], [material] FROM [Requests] WHERE [CustomerNumber] = @CustomerId";

            // Create a SqlConnection and a SqlDataAdapter
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                DataTable dataTable = new DataTable();

                // Add parameter for customer ID
                adapter.SelectCommand.Parameters.AddWithValue("@CustomerId", Session["CustomerId"]);

                // Fill the DataTable with data from the database
                adapter.Fill(dataTable);

                // Bind the DataTable to the GridView
                GridView1.DataSource = dataTable;
                GridView1.DataBind();
            }
        }
        private void BindGridViewReplies()
        {
            // Write your connection string here
            string connectionString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            // Write your SQL query to retrieve data from the Requests table
            string query = "SELECT * FROM [SupplierReplies] WHERE [CustomerNumber] = @CustomerId";

            // Create a SqlConnection and a SqlDataAdapter
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                DataTable dataTable = new DataTable();

                // Add parameter for customer ID
                adapter.SelectCommand.Parameters.AddWithValue("@CustomerId", Session["CustomerId"]);

                // Fill the DataTable with data from the database
                adapter.Fill(dataTable);

                // Bind the DataTable to the GridView
                GridView2.DataSource = dataTable;
                GridView2.DataBind();
            }
        }


    }
}