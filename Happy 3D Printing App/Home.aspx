<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Happy_3D_Printing_App.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Happy 3D Printing App - Home</title>
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
  <a class="active" href="#home">Home</a>
   <a href="Requests.aspx">Customer Requests</a>
    <a href="Login.aspx">Logout</a>
</div>
            </div>
        </nav>

        <div class="container mt-4">
            <div class="jumbotron">
                <h1 class="display-4">Welcome to Happy 3D Printing App!</h1>
                <p class="lead">Explore our services and bring your ideas to life through 3D printing.</p>

                <!-- Display the current user's name (Assuming you have the user's information in a session or other means) -->
                <p class="lead">Welcome, <asp:Label ID="lblUserName" runat="server" Text="User"></asp:Label>!</p>
            </div>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-eUHJiSO+Lq3LZatz7Et+fnVb8PK9s1O/WG+8eYo0iQT6toFZckC5eZxN/DlY4u9w" crossorigin="anonymous"></script>
    </form>
</body>
</html>