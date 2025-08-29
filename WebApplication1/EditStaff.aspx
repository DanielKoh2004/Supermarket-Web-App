<%@ Page Title="Edit Staff" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeBehind="EditStaff.aspx.cs" Inherits="WebApplication1.EditStaff" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
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

        <!-- Main Content -->
        <div class="main-content">
            <div class ="fade-in">
            <h2>Edit Staff</h2>
            <asp:Label ID="lblStaffID" runat="server" Text="Staff ID: " />
            <asp:TextBox ID="txtStaffID" runat="server" />
            <br /><br />
            <asp:Label ID="lblNewName" runat="server" Text="New Name: " />
            <asp:TextBox ID="txtNewName" runat="server" />
            <br /><br />
            <asp:Label ID="lblNewRole" runat="server" Text="New Role: " />
            <asp:DropDownList ID="ddlNewRole" runat="server">
                <asp:ListItem Value="Supervisor">Supervisor</asp:ListItem>
                <asp:ListItem Value="Stock Manager">Stock Manager</asp:ListItem>
            </asp:DropDownList>
            <br /><br />
            <asp:Button ID="btnUpdateStaff" runat="server" Text="Update Staff" CssClass="staff-btn" OnClick="btnUpdateStaff_Click"/>
            <br /><br />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
                </div>
        </div>

    </div>
</asp:Content>
