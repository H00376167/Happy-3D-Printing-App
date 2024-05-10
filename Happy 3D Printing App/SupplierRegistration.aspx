<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SupplierRegistration.aspx.cs" Inherits="Happy_3D_Printing_App.SupplierRegistration" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Supplier Registration</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <!-- Custom Styles -->
    <style>
        body {
            background-color: #106258; /* Dark background color */
            color: #ffffff; /* Text color */
        }

        .registration-container {
            max-width: 400px;
            margin: auto;
            margin-top: 100px;
            background-color: #ffffff; 
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .registration-container h2 {
            color: #007bff;
        }

        .registration-container label {
            color: #495057;
        }

        .registration-container input {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .registration-container button {
            background-color: #007bff;
            color: #ffffff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container registration-container">
            <h2 class="text-center mb-4">Supplier Registration</h2>
            <div class="mb-3">
                <label for="userName" class="form-label">Username</label>
                <asp:TextBox ID="userName" runat="server" CssClass="form-control" required></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <asp:TextBox ID="email" runat="server" CssClass="form-control" type="email" required></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="form-control" required></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="companyName" class="form-label">Company Name</label>
                <asp:TextBox ID="companyName" runat="server" CssClass="form-control" required></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="address" class="form-label">Address</label>
                <asp:TextBox ID="address" runat="server" CssClass="form-control" required></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="contact" class="form-label">Contact</label>
                <asp:TextBox ID="contact" runat="server" CssClass="form-control" required></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary btn-block" OnClick="btnRegister_Click" />
            </div>
            <div class="mb-3">
                <asp:LinkButton ID="LinkButton2" runat="server" NavigateUrl="~/Login.aspx" OnClick="LinkButton2_Click">Already have an account? Login</asp:LinkButton>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-eUHJiSO+Lq3LZatz7Et+fnVb8PK9s1O/WG+8eYo0iQT6toFZckC5eZxN/DlY4u9w" crossorigin="anonymous"></script>
</body>
</html>