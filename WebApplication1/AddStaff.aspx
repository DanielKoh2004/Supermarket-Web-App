<%@ Page Title="Add Staff" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeBehind="AddStaff.aspx.cs" Inherits="WebApplication1.AddStaff" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <!-- Optional head content -->
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="layout-container">
        
        <!-- Sidebar -->
        <div class="sidebar">
            <a href="Default.aspx">Dashboard</a>
            <a href="StaffManagement.aspx">Manage Staff</a>
            <a href="AddStaff.aspx">Add Staff</a>
            <a href="EditStaff.aspx">Edit Staff</a>
            <a href="AddProduct.aspx">Add Product</a>
            <a href="UpdateStock.aspx">Update Stock</a>
            <a href="StockLevels.aspx">Stock Level</a>
            <a href="SalesReport.aspx">Sales Report</a>
            <a href="StaffReport.aspx">Staff Report</a>
        </div>

        <!-- Main Form Content -->
        <div class="main-content">
            <div class ="fade-in">
            <h2>Add New Staff</h2>

            <label for="txtEmail">Email:</label><br />
            <asp:TextBox ID="txtEmail" runat="server" CssClass="aspNetTextBox" /><br /><br />

            <label for="txtPassword">Password:</label><br />
            <asp:TextBox ID="txtPassword" runat="server" CssClass="aspNetTextBox" TextMode="Password" /><br /><br />

            <label for="txtName">Staff Name:</label><br />
            <asp:TextBox ID="txtName" runat="server" CssClass="aspNetTextBox" /><br /><br />

            <label for="ddlRole">Role:</label><br />
            <asp:DropDownList ID="ddlRole" runat="server" CssClass="aspNetDropDown">
                <asp:ListItem Text="Cashier" Value="Cashier" />
                <asp:ListItem Text="Stock Manager" Value="Stock Manager" />
                <asp:ListItem Text="Supervisor" Value="Supervisor" />
            </asp:DropDownList><br /><br />

            <label for="ddlStatus">Status:</label><br />
            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="aspNetDropDown">
                <asp:ListItem Text="Active" Value="Active" />
                <asp:ListItem Text="Inactive" Value="Inactive" />
            </asp:DropDownList><br /><br />

            <asp:Button ID="btnAdd" runat="server" Text="Add Staff" CssClass="btn-save" OnClick="btnAdd_Click" />
            <br /><br />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
        </div>
            </div>
    </div>
</asp:Content>
