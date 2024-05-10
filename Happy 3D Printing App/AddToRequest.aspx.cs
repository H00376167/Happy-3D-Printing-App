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
    public partial class AddToRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtCustomerNumber.Text= Session["CustomerId"].ToString() ;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Validate the input
            if (string.IsNullOrEmpty(txtDescription.Text) || filePrototypeImage.PostedFile == null || filePrototypeImage.PostedFile.ContentLength == 0)
            {
                // Display an error message if any of the fields are empty
                hfErrorMessage.Value = "Please provide a description and select a prototype image.";
                return;
            }

            // Get the file name and content
            string fileName = filePrototypeImage.FileName;
            byte[] fileContent = filePrototypeImage.FileBytes;

            // Get other input values
            string customerName = txtCustomerName.Text;
            string customerNumber = txtCustomerNumber.Text;
            string material = ddlMaterial.Text;
            int length = Convert.ToInt32(txtLength.Text);
            int width = Convert.ToInt32(txtWidth.Text);
            int height = Convert.ToInt32(txtHeight.Text);

            // Save data to the database
            string connectionString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
            string query = "INSERT INTO Requests (description, prototype_image, CustomeName, CustomerNumber, length, width, height, material) " +
                           "VALUES (@description, @prototypeImage, @customerName, @customerNumber, @length, @width, @height, @material)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to the command
                    command.Parameters.AddWithValue("@description", txtDescription.Text);
                    command.Parameters.AddWithValue("@prototypeImage", fileContent);
                    command.Parameters.AddWithValue("@customerName", customerName);
                    command.Parameters.AddWithValue("@customerNumber", customerNumber);
                    command.Parameters.AddWithValue("@length", length);
                    command.Parameters.AddWithValue("@width", width);
                    command.Parameters.AddWithValue("@height", height);
                    command.Parameters.AddWithValue("@material", material);

                    try
                    {
                        // Open the connection and execute the command
                        connection.Open();
                        command.ExecuteNonQuery();

                        // Display success message
                        hfErrorMessage.Value = "Request submitted successfully!";

                    }
                    catch (Exception ex)
                    {
                        // Display error message if there's an exception
                        hfErrorMessage.Value = "An error occurred while processing your request. Please try again later.";
                        Response.Write(ex.ToString());
                        // Log the exception for troubleshooting
                        Console.WriteLine(ex.Message);
                    }
                }
            }
        }


        protected void btnHeightDecrement_Click(object sender, EventArgs e)
        {
            DecrementTextBoxValue(txtHeight);
        }

        protected void btnHeightIncrement_Click(object sender, EventArgs e)
        {
            IncrementTextBoxValue(txtHeight);
        }

        protected void btnWidthDecrement_Click(object sender, EventArgs e)
        {
            DecrementTextBoxValue(txtWidth);
        }

        protected void btnWidthIncrement_Click(object sender, EventArgs e)
        {
            IncrementTextBoxValue(txtWidth);
        }

        protected void btnLengthDecrement_Click(object sender, EventArgs e)
        {
            DecrementTextBoxValue(txtLength);
        }
        private void IncrementTextBoxValue(TextBox textBox)
        {
            int value;
            if (int.TryParse(textBox.Text, out value))
            {
                value++;
                textBox.Text = value.ToString();
            }
        }

        private void DecrementTextBoxValue(TextBox textBox)
        {
            int value;
            if (int.TryParse(textBox.Text, out value))
            {
                value--;
                textBox.Text = value.ToString();
            }
        }
        protected void btnLengthIncrement_Click(object sender, EventArgs e)
        {
            IncrementTextBoxValue(txtLength);
        }
    }
}