<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site.master" CodeBehind="Profile.aspx.cs" Inherits="WebApplication1.Profile" %> 

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <title>My Account - Profile</title>
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

        .section-title { 
            font-weight: bold; 
            font-size: 20px;     
            margin-top: 25px;
            margin-bottom: 15px;
            color: #2c7a7b;      
            border-bottom: 2px solid #e0e0e0; 
            padding-bottom: 5px;
        }

        .form-group { margin-bottom: 15px; }
        label { display: block; font-weight: bold; margin-bottom: 5px; }
        input, select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

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
            <h2>My Profile</h2>

            <div class="section-title">Basic Information</div>
            <div class="form-group">
                <label>Title</label>
                <select>
                    <option>Mr.</option>
                    <option>Mrs.</option>
                    <option>Ms.</option>
                </select>
            </div>
            <div class="form-group">
                <label>Name</label>
                <input type="text" />
            </div>
            <div class="form-group">
                <label>Middle Name and Last Name</label>
                <input type="text"/>
            </div>
            <div class="form-group">
                <label>Race</label>
                <select>
                    <option>Chinese</option>
                    <option>Malay</option>
                    <option>Indian</option>
                </select>
            </div>
            <div class="form-group">
                <label>Date of Birth</label>
                <input type="date" id="dob" name="dob" />
            </div>

            <div class="section-title">Contact Information</div>
            <div class="form-group">
                <label>Mobile Number</label>
                <input type="text"/>
            </div>
            <div class="form-group">
                <label>Email Address</label>
                <input type="email" />
            </div>

            <button class="save-button">Save</button>
        </div>
    </div>
</asp:Content>
