using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Happy_3D_Printing_App
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Get values from the form
            string userType1 = userType.SelectedValue;
            string username = this.username.Text.Trim();
            string password = this.password.Text.Trim();

            // Validate user input 
            if (string.IsNullOrEmpty(userType1) || string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                // Display an error message
                return;
            }

            // Perform login based on user type
            bool loginSuccessful = false;
            int customerId = 0; // Initialize customer ID variable

            // Connection string 
            string connectionString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Use parameterized queries to prevent SQL injection
                string query = "";
                switch (userType1)
                {
                    case "customer":
                        query = "SELECT CustomerId FROM Customer WHERE UserName = @UserName AND Password = @Password";
                        break;

                    case "supplier":
                        query = "SELECT SupplierId FROM Supplier WHERE UserName = @UserName AND Password = @Password";
                        break;

                    case "admin":
                        query = "SELECT AdminId FROM Admin WHERE UserName = @UserName AND Password = @Password";
                        break;
                }

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to the query
                    command.Parameters.AddWithValue("@UserName", username);
                    command.Parameters.AddWithValue("@Password", password);

                    // Execute the query
                    object result = command.ExecuteScalar();

                    // Check if login is successful
                    if (result != null)
                    {
                        loginSuccessful = true;
                        customerId = Convert.ToInt32(result); // Store customer ID
                    }
                }
            }

            if (loginSuccessful)
            {
                // Store the customer ID in a session variable
                Session["CustomerId"] = customerId;

                if (userType1 == "admin" || userType1 == "supplier")
                {
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    // Redirect to the home page for customers
                    Response.Redirect("Customer-Home.aspx");
                }
            }
            else
            {
                // Display an error message 
                Response.Write("<script>alert('Incorrect Username/Password');</script>");
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if(userType.SelectedIndex == 0)
            {
                Response.Redirect("CustomerRegistration.aspx");
            }
            else if (userType.SelectedIndex == 1)
            {
                Response.Redirect("SupplierRegistration.aspx");
            }

        }
    }
}