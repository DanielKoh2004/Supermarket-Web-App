<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="WebApplication1.ResetPassword" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <title>Reset Password</title>
    <style>
        .reset-container { max-width: 500px; margin: 50px auto; padding: 30px; background: #fff; border-radius: 10px; box-shadow: 0 0 15px rgba(0,0,0,0.1); }
        .form-group { margin-bottom: 15px; }
        label { display: block; font-weight: bold; margin-bottom: 5px; }
        .form-input { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 6px; box-sizing: border-box; }
        .btn-submit { background-color: #2c7a7b; color: white; border: none; padding: 10px 20px; border-radius: 6px; cursor: pointer; font-size: 16px; }
        .btn-submit:hover { background-color: #225e5f; }
        .result-label { color: red; margin-bottom: 10px; display: block; }
    </style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="reset-container">
        <h2>Reset Password</h2>
        <asp:Label ID="lblResult" runat="server" CssClass="result-label" />
        <div class="form-group">
            <label for="txtNewPassword">New Password</label>
            <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="form-input" />
        </div>
        <div class="form-group">
            <label for="txtConfirmPassword">Confirm New Password</label>
            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-input" />
        </div>
        <asp:Button ID="btnResetPassword" runat="server" Text="Reset Password" CssClass="btn-submit" OnClick="btnResetPassword_Click" />
    </div>
</asp:Content>
