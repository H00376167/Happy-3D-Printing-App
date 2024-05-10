<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Happy_3D_Printing_App.Login" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Happy 3D Printing App - Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <!-- Custom Styles -->
    <style>
        body {
            background-color: #106258; /* Dark background color */
            color: #ffffff; /* Text color */
        }

        .login-container {
            max-width: 400px;
            margin: auto;
            margin-top: 100px;
            background-color: #ffffff; /* Light background color for login area */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .login-container h2 {
            color: #007bff;
        }

        .login-container label {
            color: #495057;
        }

        .login-container select,
        .login-container input {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .login-container button {
            background-color: #007bff;
            color: #ffffff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .login-container a {
            color: #007bff;
            text-decoration: none;
        }

        .login-container a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container login-container">
            <h2 class="text-center mb-4">        Happy 3D Printing App</h2>
            <div class="mb-3">
                <label for="userType" class="form-label">User Type</label>
                <asp:DropDownList ID="userType" runat="server" CssClass="form-select" required>
                    <asp:ListItem Text="Customer" Value="customer" />
                    <asp:ListItem Text="Supplier" Value="supplier" />
                    <asp:ListItem Text="Admin" Value="admin" />
                </asp:DropDownList>
            </div>
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <asp:TextBox ID="username" runat="server" CssClass="form-control" required></asp:TextBox>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="form-control" required></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary btn-block" OnClick="btnLogin_Click" />
            </div>
            <div class="mb-3">
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Don't have an account? Register Now</asp:LinkButton>
                </div>
        </div>
    </form>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-eUHJiSO+Lq3LZatz7Et+fnVb8PK9s1O/WG+8eYo0iQT6toFZckC5eZxN/DlY4u9w" crossorigin="anonymous"></script>
</body>
</html>