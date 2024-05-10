using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Happy_3D_Printing_App
{
    public partial class ReplyToCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSendReply_Click(object sender, EventArgs e)
        {
            // Get values from the form
            string customerName = txtCustomerName.Text;
            string customerNumber = txtCustomerNumber.Text;
            decimal price = Convert.ToDecimal(txtPrice.Text);
            string description = txtDescription.Text;
            string supplierSign = txtSupplierSign.Text;

            // Save data to the database
            string connectionString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
            string query = @"INSERT INTO SupplierReplies (CustomerName, CustomerNumber, Price, Description, SupplierSign) 
                     VALUES (@customerName, @customerNumber, @price, @description, @supplierSign)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to the command
                    command.Parameters.AddWithValue("@customerName", customerName);
                    command.Parameters.AddWithValue("@customerNumber", customerNumber);
                    command.Parameters.AddWithValue("@price", price);
                    command.Parameters.AddWithValue("@description", description);
                    command.Parameters.AddWithValue("@supplierSign", supplierSign);

                    try
                    {
                        // Open the connection and execute the command
                        connection.Open();
                        command.ExecuteNonQuery();               
                        Response.Write("<script>alert('Sent Successfully')</script>");
                        string script = "alert(\"Sent Successfully!\");";
                        ScriptManager.RegisterStartupScript(this, GetType(),
                                              "ServerControlScript", script, true);
                    }
                    catch (Exception ex)
                    {
                        // Display error message if there's an exception
                         Response.Write("<script>alert('An error occurred while processing your request. Please try again later.')</script>");
                        // Log the exception for troubleshooting
                        Console.WriteLine(ex.Message);
                    }
                }
            }
        }
    }
}