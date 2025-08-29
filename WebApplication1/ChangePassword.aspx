<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site.master" CodeBehind="ChangePassword.aspx.cs" Inherits="WebApplication1.ChangePassword" %> 

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <title>My Account - Change Password</title>
    <style>
        .account-wrapper {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 30px 0 40px;
            max-width: 900px;
            margin: 0 auto;
        }

        .top-bar {
            background-color: white;
            padding: 15px 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 500px;
        }
        .top-bar-title {
            font-size: 18px;
            font-weight: bold;
            color: #2c7a7b;
        }
        .top-bar-links {
            display: flex;
            gap: 30px;
        }
        .top-bar-links a {
            text-decoration: none;
            color: #2c7a7b;
            font-weight: bold;
        }
        .top-bar-links a:hover {
            text-decoration: underline;
            color: #225e5f;
        }

        .content-container {
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            width: 500px;
        }

        h2 { 
            color: #2c7a7b; 
            text-align: center;
            margin-bottom: 25px;
        }
        .form-group { margin-bottom: 20px; }
        label { display: block; font-weight: bold; margin-bottom: 5px; }
        input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        .requirements {
            font-size: 13px;
            color: #666;
            margin-top: 10px;
            padding-left: 15px;
        }

        .requirements li { margin-bottom: 5px; }
        .save-button {
            margin-top: 20px;
            width: 100%;
            padding: 10px;
            background-color: #2c7a7b;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
        }
        .save-button:hover { background-color: #225e5f; }
    </style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="account-wrapper">
        <div class="top-bar">
            <div class="top-bar-title">My Account</div>
            <div class="top-bar-links">
                <a href="Profile.aspx">Profile</a>
                <a href="ChangePassword.aspx">Change Password</a>
            </div>
        </div>

        <div class="content-container">
            <h2>Change Password</h2>
            <div class="form-group">
                <label for="newPassword">New Password</label>
                <input type="password" id="newPassword" placeholder="Enter new password">
            </div>
            <div class="form-group">
                <label for="confirmPassword">Confirm New Password</label>
                <input type="password" id="confirmPassword" placeholder="Re-enter new password">
            </div>
            <ul class="requirements">
                <li>8–50 characters long</li>
                <li>Includes upper & lower case letters</li>
                <li>At least 1 number</li>
                <li>At least 1 special character (!, @, #, $, %)</li>
                <li>No spaces allowed</li>
            </ul>
            <button class="save-button">Update Password</button>
        </div>
    </div>
</asp:Content>
