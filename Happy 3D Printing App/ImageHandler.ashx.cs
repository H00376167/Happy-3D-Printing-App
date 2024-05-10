
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Happy_3D_Printing_App
{
    /// <summary>
    /// Summary description for ImageHandler
    /// </summary>
    public class ImageHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            // Get the request parameter (in this case, the request_id of the image)
            string requestId = context.Request.QueryString["id"];

         
            string connectionString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;

            // Write your SQL query to retrieve the image data from the database based on the request_id
            string query = "SELECT prototype_image FROM Requests WHERE request_id = @RequestId";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@RequestId", requestId);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        // Retrieve the image data from the database
                        byte[] imageData = (byte[])reader["prototype_image"];

                        // Set the response content type based on the image format
                        context.Response.ContentType = "image/jpeg"; // Change it according to your image format

                        // Write the image data to the response stream
                        context.Response.BinaryWrite(imageData);
                    }
                    else
                    {
                        // If no image is found, return a default image or display an error image
                        context.Response.Write("Image not found");
                    }
                }
                catch (Exception ex)
                {
                    // Handle exceptions
                    context.Response.Write("Error: " + ex.Message);
                }
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}