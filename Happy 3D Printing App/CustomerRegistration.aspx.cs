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
    public partial class CustomerRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Validate the form controls
            if (Page.IsValid)
            {
                // Get values from form controls
                string struserName = userName.Text.Trim();
                string stremail = email.Text.Trim();
                string strpassword = password.Text.Trim();
                string straddress = address.Text.Trim();
                string strcontact = contact.Text.Trim();

                // Validate additional criteria if needed

                // Save data to the Customer table
                SaveToDatabase(struserName, stremail, strpassword, straddress, strcontact);

              
                Response.Redirect("Login.aspx");
            }
        }

        private void SaveToDatabase(string userName, string email, string password, string address, string contact)
        {
            // Connection string 
            string connectionString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // SQL query to insert data into the Customer table
                string query = "INSERT INTO Customer (UserName, Email, Password, Address, Contact) " +
                               "VALUES (@UserName, @Email, @Password, @Address, @Contact)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to the SQL query
                    command.Parameters.AddWithValue("@UserName", userName);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Password", password);
                    command.Parameters.AddWithValue("@Address", address);
                    command.Parameters.AddWithValue("@Contact", contact);

                    // Open the database connection
                    connection.Open();

                    // Execute the SQL query
                    command.ExecuteNonQuery();
                }
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}