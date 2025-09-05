<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="WebApplication1.ForgotPassword" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <title>Forgot Password</title>
    <style>
        .forgot-container { max-width: 500px; margin: 50px auto; padding: 30px; background: #fff; border-radius: 10px; box-shadow: 0 0 15px rgba(0,0,0,0.1); }
        .form-group { margin-bottom: 15px; }
        label { display: block; font-weight: bold; margin-bottom: 5px; }
        .form-input { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 6px; box-sizing: border-box; }
        .btn-submit { background-color: #2c7a7b; color: white; border: none; padding: 10px 20px; border-radius: 6px; cursor: pointer; font-size: 16px; }
        .btn-submit:hover { background-color: #225e5f; }
        .result-label { color: red; margin-bottom: 10px; display: block; }
    </style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="forgot-container">
        <h2>Forgot Password</h2>
        <div class="form-group">
            <label for="txtEmail">Email</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" />
            <asp:Button ID="btnLoadQuestions" runat="server" Text="Load Questions" CssClass="btn-submit" OnClick="btnLoadQuestions_Click" />
        </div>
        <asp:Label ID="lblResult" runat="server" CssClass="result-label" />
        <asp:Panel ID="pnlQuestions" runat="server" Visible="false">
            <div class="form-group">
                <asp:Label ID="lblQ1" runat="server" CssClass="form-label" />
                <asp:TextBox ID="txtA1" runat="server" CssClass="form-input" />
            </div>
            <div class="form-group">
                <asp:Label ID="lblQ2" runat="server" CssClass="form-label" />
                <asp:TextBox ID="txtA2" runat="server" CssClass="form-input" />
            </div>
            <div class="form-group">
                <asp:Label ID="lblQ3" runat="server" CssClass="form-label" />
                <asp:TextBox ID="txtA3" runat="server" CssClass="form-input" />
            </div>
            <asp:Button ID="btnVerifyAnswers" runat="server" Text="Verify Answers" CssClass="btn-submit" OnClick="btnVerifyAnswers_Click" />
        </asp:Panel>
    </div>
</asp:Content>
