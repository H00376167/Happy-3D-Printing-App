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
    public partial class SupplierRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Validate the form controls
            if (IsValid)
            {
                // Retrieve values from form controls
                string userNameValue = userName.Text.Trim();
                string emailValue = email.Text.Trim();
                string passwordValue = password.Text.Trim();
                string companyNameValue = companyName.Text.Trim();
                string addressValue = address.Text.Trim();
                string contactValue = contact.Text.Trim();

                // Save data to the Supplier table in the database
                SaveToDatabase(userNameValue, emailValue, passwordValue, companyNameValue, addressValue, contactValue);

                Response.Redirect("Login.aspx");
            }
        }

        private void SaveToDatabase(string userName, string email, string password, string companyName, string address, string contact)
        {
            try
            {
                // Connection string 
                string connectionString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

                // SQL query to insert data into the Supplier table
                string query = "INSERT INTO Supplier (UserName, Email, Password, CompanyName, Address, Contact) " +
                               "VALUES (@UserName, @Email, @Password, @CompanyName, @Address, @Contact)";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add parameters to prevent SQL injection
                        command.Parameters.AddWithValue("@UserName", userName);
                        command.Parameters.AddWithValue("@Email", email);
                        command.Parameters.AddWithValue("@Password", password);
                        command.Parameters.AddWithValue("@CompanyName", companyName);
                        command.Parameters.AddWithValue("@Address", address);
                        command.Parameters.AddWithValue("@Contact", contact);

                        // Open the connection and execute the query
                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write($"Error: {ex.Message}");
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}