<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site.master" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
        <title>Supermarket - Login</title>
    <style>

        body {
            background: #f5f5f5;
            font-family: Arial, sans-serif;
        }

        .login-container {
            max-width: 500px;
            margin: 130px auto;
            padding: 30px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            position: relative;
        }

        .login-container h2 {
            text-align: center;
            color: #2c7a7b;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        .form-actions {
            text-align: center;
            margin-top: 20px;
        }

        .btn-submit {
            background-color: #2c7a7b;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
        }

        .btn-submit:hover {
            background-color: #225e5f;
        }

        .extra-link {
            text-align: center;
            margin-top: 15px;
        }

        .extra-link a {
            color: #2c7a7b;
            text-decoration: none;
            font-weight: bold;
        }

        .extra-link a:hover {
            text-decoration: underline;
        }

        .close-btn {
            position: absolute;
            top: 10px;
            left: 20px;
            font-size: 28px;
            font-weight: bold;
            color: #2c7a7b;
            text-decoration: none;
        }

        .close-btn:hover {
            color: #225e5f;
        }
           
    </style>
    </asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="login-container">
        <a href="Home.aspx" class="close-btn">&times;</a>
        <h2>Login to Your Account</h2>
        <div class="form-group">
            <label for="ddlLoginType">Login As</label>
            <asp:DropDownList ID="ddlLoginType" runat="server" CssClass="form-input">
                <asp:ListItem Text="Customer" Value="Customer" />
                <asp:ListItem Text="Staff" Value="Staff" />
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <label for="txtEmail">Email</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" />
        </div>

        <div class="form-group">
            <label for="txtPassword">Password</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-input" />
        </div>

        <div class="form-actions">
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-submit" OnClick="btnLogin_Click" />
        </div>

        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>

        <p class="extra-link">
            Don’t have an account? <a href="Register.aspx">Register here</a>
        </p>
        <p class="extra-link">
            <a href="ForgotPassword.aspx">Forgot Password?</a>
        </p>
    </div>

</asp:Content>

