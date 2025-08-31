<%@ Page Title="Manage Staff" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeBehind="StaffManagement.aspx.cs" Inherits="WebApplication1.StaffManagement" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <title>Manage Staff</title>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="layout-container">
    
    <div class="sidebar">
        <% if (Session["Role"] != null && Session["Role"].ToString() == "Stock Manager") { %>
            <a href="Default.aspx">Dashboard</a>
            <a href="AddProduct.aspx">Add Product</a>
            <a href="UpdateStock.aspx">Update Stock</a>
            <a href="StockLevels.aspx">Stock Level</a>
            <a href="SalesReport.aspx">Sales Report</a>
        <% } else { %>
            <a href="Default.aspx">Dashboard</a>
            <a href="StaffManagement.aspx">Manage Staff</a>
            <a href="AddStaff.aspx">Add Staff</a>
            <a href="EditStaff.aspx">Edit Staff</a>
            <a href="AddProduct.aspx">Add Product</a>
            <a href="UpdateStock.aspx">Update Stock</a>
            <a href="StockLevels.aspx">Stock Level/Delete Stock</a>
            <a href="SalesReport.aspx">Sales Report</a>
            <a href="StaffReport.aspx">Staff List/Delete Staff</a>
        <% } %>
    </div>

        <!-- Main Content -->
        <div class="main-content">
            <div class ="fade-in">
            <h2>Staff Management</h2>
            <div class="staff-buttons">
                <div class="staff-button">
                    <img src="add.png" alt="Add" />
                    <asp:Button ID="btnAddStaff" runat="server" Text="Add Staff" PostBackUrl="AddStaff.aspx" CssClass="staff-btn" />
                </div>
                <div class="staff-button">
                    <img src="edit.png" alt="Edit" />
                    <asp:Button ID="btnEditStaff" runat="server" Text="Edit Staff" PostBackUrl="EditStaff.aspx" CssClass="staff-btn" />
                </div>
                <div class="staff-button">
                    <img src="delete.png" alt="Delete" />
                    <asp:Button ID="btnDeleteStaff" runat="server" Text="Delete Staff" PostBackUrl="DeleteStaff.aspx" CssClass="staff-btn" />
                </div>
            </div>
        </div>
            </div>

    </div>

</asp:Content>
