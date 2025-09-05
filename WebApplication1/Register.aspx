<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site.master" CodeBehind="Register.aspx.cs" Inherits="WebApplication1.Register" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <title>Supermarket - Register</title>
    <link href="Content/register.css" rel="stylesheet" type="text/css" />
    <style>
        body {
            background: #f5f5f5;
            font-family: Arial, sans-serif;
        }

        .register-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 30px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }

        .register-container h2 {
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

        .login-link a {
            color: #2c7a7b;
            text-decoration: none;
            font-weight: bold;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        .login-link {
            text-align: center;
            margin-top: 15px;
        }

        .close-btn {
            position: absolute;
            top: 15px;
            left: 20px;
            font-size: 28px;
            font-weight: bold;
            color: #2c7a7b;
            text-decoration: none;
        }

        .close-btn:hover {
            color: #225e5f;
        }

        .register-container {
            position: relative;
            max-width: 500px;
            margin: 50px auto;
            padding: 30px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }

    </style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="register-container">
        <a href="Home.aspx" class="close-btn">&times;</a>
        <h2>Create Your Account</h2>

        <div class="form-group">
            <label for="txtUsername">Username</label>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-input" />
        </div>

        <div class="form-group">
            <label for="txtEmail">Email</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" />
        </div>
        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>


        <div class="form-group">
            <label for="txtPassword">Password</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-input" />
            <ul class="requirements" style="margin-top:8px; margin-bottom:0; color:#666; font-size:13px;">
                <li>8–50 characters long</li>
                <li>Includes upper & lower case letters</li>
                <li>At least 1 number</li>
                <li>At least 1 special character (!, @, #, $, %)</li>
                <li>No spaces allowed</li>
            </ul>
        </div>

        <div class="form-group">
            <label for="txtConfirmPassword">Confirm Password</label>
            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-input" />
        </div>

        <div class="form-group">
            <label for="txtDateOfBirth">Date of Birth</label>
            <asp:TextBox ID="txtDateOfBirth" runat="server" CssClass="form-input" TextMode="Date" />
        </div>

        <div class="form-group">
            <label for="txtMobileNumber">Mobile Number</label>
            <asp:TextBox ID="txtMobileNumber" runat="server" CssClass="form-input" />
        </div>

        <div class="form-group">
            <label>Secret Question 1:</label>
            <asp:DropDownList ID="ddlSecretQuestion1" runat="server" CssClass="form-input">
                <asp:ListItem Text="What is your mother's maiden name?" />
                <asp:ListItem Text="What was your first pet's name?" />
                <asp:ListItem Text="What is your favorite food?" />
            </asp:DropDownList>
            <asp:TextBox ID="txtSecretAnswer1" runat="server" CssClass="form-input" placeholder="Answer 1" />
            <br />
        </div>

        <div class="form-group">
            <label>Secret Question 2:</label>
            <asp:DropDownList ID="ddlSecretQuestion2" runat="server" CssClass="form-input">
                <asp:ListItem Text="What is your birthplace?" />
                <asp:ListItem Text="What is your favorite color?" />
                <asp:ListItem Text="What is your best friend's name?" />
            </asp:DropDownList>
            <asp:TextBox ID="txtSecretAnswer2" runat="server" CssClass="form-input" placeholder="Answer 2" />
            <br />
        </div>

        <div class="form-group">
            <label>Secret Question 3:</label>
            <asp:DropDownList ID="ddlSecretQuestion3" runat="server" CssClass="form-input">
                <asp:ListItem Text="What is your dream job?" />
                <asp:ListItem Text="What is your favorite movie?" />
                <asp:ListItem Text="What is your favorite sport?" />
            </asp:DropDownList>
            <asp:TextBox ID="txtSecretAnswer3" runat="server" CssClass="form-input" placeholder="Answer 3" />
            <br />
        </div>

        <div class="form-actions">
            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn-submit" OnClick="btnRegister_Click" />
        </div>

        <p class="login-link">
            Already have an account? <a href="Login.aspx">Login here</a>
        </p>
    </div>
</asp:Content>
