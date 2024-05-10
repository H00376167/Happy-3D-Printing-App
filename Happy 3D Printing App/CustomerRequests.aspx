<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerRequests.aspx.cs" Inherits="Happy_3D_Printing_App.CustomerRequests" %>

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
      

        /* Style the GridView */
        .gridview {
            display: flex;
            
            align-items: center;
            width: 100%; 
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 20px;
            background-color: #f9f9f9;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-dark bg-dark">
            <div class="container">
             
                <div class="topnav">
  <a href="Customer-Home.aspx">Home.aspx</a>
  <a href="AddToRequest.aspx">3D Printing Services</a>
   <a class="active" href="CustomerRequests.aspx">Requests</a>
  <a href="About.aspx">About</a>
                    <a href="Login.aspx">Logout</a>
</div>
            </div>
        </nav>

        <div class="container mt-4">
            <div >
                <h1 class="display-4">Current Requests!</h1>
               
                </div>
        </div>
        <div class="jumbotron">
             <asp:GridView ID="GridView1" runat="server" CssClass="gridview" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                 <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="request_id" HeaderText="Request ID" />
        <asp:BoundField DataField="description" HeaderText="Description" >
        <ItemStyle Width="300px" />
        </asp:BoundField>
        <asp:BoundField DataField="CustomeName" HeaderText="Customer Name" />
        <asp:BoundField DataField="CustomerNumber" HeaderText="Customer Number" />
        <asp:BoundField DataField="length" HeaderText="Length" />
        <asp:BoundField DataField="width" HeaderText="Width" />
        <asp:BoundField DataField="height" HeaderText="Height" />
        <asp:BoundField DataField="material" HeaderText="Material" />
        <asp:TemplateField HeaderText="Image">
            <ItemTemplate>
                <asp:Image ID="imgPrototype" runat="server" ImageUrl='<%# "ImageHandler.ashx?id=" + Eval("request_id") %>' Height="100" Width="100" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
                 <FooterStyle BackColor="#CCCC99" />
                 <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                 <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                 <RowStyle BackColor="#F7F7DE" />
                 <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                 <SortedAscendingCellStyle BackColor="#FBFBF2" />
                 <SortedAscendingHeaderStyle BackColor="#848384" />
                 <SortedDescendingCellStyle BackColor="#EAEAD3" />
                 <SortedDescendingHeaderStyle BackColor="#575357" />
</asp:GridView>
            </div>
        <div>
             <h1 class="display-4">Replies Received!</h1>
            <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
             </asp:GridView>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            </div>
        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-eUHJiSO+Lq3LZatz7Et+fnVb8PK9s1O/WG+8eYo0iQT6toFZckC5eZxN/DlY4u9w" crossorigin="anonymous"></script>
    </form>
</body>
</html>
