<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Happy_3D_Printing_App.About" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Happy 3D Printing App - About Us</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!--custom styles -->
    <style>
        /* Add a black background color to the top navigation */
.topnav {
  background-color: #333;
  overflow: hidden;
}

/* Style the links inside the navigation bar */
.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

/* Change the color of links on hover */
.topnav a:hover {
  background-color: #ddd;
  color: black;
}

/* Add a color to the active/current link */
.topnav a.active {
  background-color: #04AA6D;
  color: white;
}
       

        .container {
            margin-top: 20px;
        }

        .jumbotron {
            background-color: #f8f9fa; /* Light background color for the jumbotron */
            border-radius: 10px; /* Add rounded corners to the jumbotron */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Add a subtle shadow for depth */
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-dark bg-dark">
            <div class="container">
             
                <div class="topnav">
  <a  href="Customer-Home.aspx">Home</a>
  <a href="AddToRequest.aspx">3D Printing Services</a>
   <a href="CustomerRequests.aspx">Requests</a>
  <a class="active" href="About.aspx">About</a>
  <a  href="Login.aspx">Logout</a>
</div>
            </div>
        </nav>
<div class="container mt-4">
            <h1>About Us</h1>
            <hr />

            <div class="row">
                <div class="col-md-6">
                    <h3>Our Mission</h3>
                    <p>We strive to provide innovative 3D printing solutions to our customers, helping them turn their ideas into reality.</p>
                </div>
                <div class="col-md-6">
                    <h3>Our Vision</h3>
                    <p>To become a leading provider of 3D printing services globally, delivering exceptional quality and customer satisfaction.</p>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col-md-12">
                    <h3>Our Team</h3>
                    <p>We have a dedicated team of experts passionate about 3D printing technology. Our team members are committed to delivering top-notch service and support to our valued customers.</p>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-eUHJiSO+Lq3LZatz7Et+fnVb8PK9s1O/WG+8eYo0iQT6toFZckC5eZxN/DlY4u9w" crossorigin="anonymous"></script>
    </form>
</body>
</html>
