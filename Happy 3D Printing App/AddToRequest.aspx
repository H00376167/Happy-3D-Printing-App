<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddToRequest.aspx.cs" Inherits="Happy_3D_Printing_App.AddToRequest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add to Request - Happy 3D Printing App</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <!-- Custom styles -->
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

        </style>
    
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-dark bg-dark">
            <div class="container">
                <div class="topnav">
                    <a  href="Customer-Home.aspx">Home</a>
                    <a class="active" href="#printingservice">3D Printing Services</a>
                    <a href="CustomerRequests.aspx">Requests</a>
                    <a href="About.aspx">About</a>
                     <a href="Login.aspx">Logout</a>
                </div>
            </div>
        </nav>

        <div class="container mt-4">
            <h1>Add to Request</h1>
            <hr />

            <div class="form-group">
                <label for="txtCustomerName">Customer Name:</label>   
                   <br/>   
                <asp:TextBox ID="txtCustomerName" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>             
            </div>
             <br/>   
            <div class="form-group">
                
                <label for="txtCustomerNumber">Customer Number:</label>    
                   <br/>   
                <asp:TextBox ID="txtCustomerNumber" runat="server" CssClass="form-control" Width="300px" ReadOnly="True"></asp:TextBox>   
            </div>
             <br/>   
            <div class="form-group">
    <label>Prototype Dimensions: (Length, Width, Height)</label>
    <br />
    <div class="input-group">
        <asp:TextBox ID="txtLength" runat="server" CssClass="form-control" placeholder="Length: cm">0</asp:TextBox>
        <asp:TextBox ID="txtWidth" runat="server" CssClass="form-control" placeholder="Width: cm">0</asp:TextBox>
        <asp:TextBox ID="txtHeight" runat="server" CssClass="form-control" placeholder="Height: cm">0</asp:TextBox>
    </div>
    <div class="mt-2">
        <asp:Button ID="btnLengthIncrement" runat="server" Text="+" CssClass="btn btn-primary" OnClientClick="changeValue('txtLength', '+'); return false;" OnClick="btnLengthIncrement_Click" />

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <asp:Button ID="btnLengthDecrement" runat="server" Text="-" CssClass="btn btn-primary" OnClientClick="changeValue('txtLength', '-'); return false;" OnClick="btnLengthDecrement_Click" />

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;       &nbsp;&nbsp;&nbsp;&nbsp;        &nbsp;&nbsp;&nbsp;&nbsp;    &nbsp;&nbsp;

        <asp:Button ID="btnWidthIncrement" runat="server" Text="+" CssClass="btn btn-primary" OnClientClick="changeValue('txtWidth', '+'); return false;" OnClick="btnWidthIncrement_Click" />

              &nbsp;&nbsp;&nbsp;&nbsp;      &nbsp;&nbsp;&nbsp;&nbsp;

        <asp:Button ID="btnWidthDecrement" runat="server" Text="-" CssClass="btn btn-primary" OnClientClick="changeValue('txtWidth', '-'); return false;" OnClick="btnWidthDecrement_Click" />

              &nbsp;&nbsp;&nbsp;&nbsp;      &nbsp;&nbsp;&nbsp;&nbsp;      &nbsp;&nbsp;&nbsp;&nbsp;         &nbsp;&nbsp;&nbsp; &nbsp;   

        <asp:Button ID="btnHeightIncrement" runat="server" Text="+" CssClass="btn btn-primary" OnClientClick="changeValue('txtHeight', '+'); return false;" OnClick="btnHeightIncrement_Click" />
            
        &nbsp;&nbsp;&nbsp;&nbsp;      &nbsp;&nbsp;&nbsp;&nbsp;

        <asp:Button ID="btnHeightDecrement" runat="server" Text="-" CssClass="btn btn-primary" OnClientClick="changeValue('txtHeight', '-'); return false;" OnClick="btnHeightDecrement_Click" />
    </div>
</div>

             <br/>   
            <div class="form-group">
                <label for="ddlMaterial">Material:</label>
                  <br/>
                <asp:DropDownList ID="ddlMaterial" runat="server" CssClass="form-control" Width="300px">
                    <asp:ListItem Text="- Select Material -" Value=""></asp:ListItem>
                    <asp:ListItem Text="Plastic" Value="Plastic"></asp:ListItem>
                    <asp:ListItem Text="Rubber" Value="Rubber"></asp:ListItem>
                </asp:DropDownList>  
            </div>
             <br/>   
            <div class="form-group">
                <label for="txtDescription">Description:</label>
                  <br/>
                
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>        
               
                </div>
             <br/> 
            <div class="form-group">
                <label for="filePrototypeImage">Upload File or Image:</label>
                <asp:FileUpload ID="filePrototypeImage" runat="server" CssClass="form-control-file" /> 
            </div>
             <asp:HiddenField ID="hfErrorMessage" runat="server" />
           
                <asp:button ID="btnSubmit" runat="server" Text="Submit" type="submit" class="btn btn-primary" CssClass="auto-style2" OnClick="btnSubmit_Click" Width="159px"></asp:button> </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-eUHJiSO+Lq3LZatz7Et+fnVb8PK9s1O/WG+8eYo0iQT6toFZckC5eZxN/DlY4u9w" crossorigin="anonymous"></script>
    </form>
</body>
</html>
