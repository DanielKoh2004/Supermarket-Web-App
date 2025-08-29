<%@ Page Title="Update Stock" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeBehind="UpdateStock.aspx.cs" Inherits="WebApplication1.UpdateStock" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
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
            <a href="StockLevels.aspx">Stock Level</a>
            <a href="SalesReport.aspx">Sales Report</a>
            <a href="StaffReport.aspx">Staff Report</a>
        <% } %>
    </div>

        <!-- Main Content -->
        <div class="main-content">
            <div class ="fade-in">
            <h2>Update Product Stock</h2>

            <label for="txtProductID">Product ID:</label><br />
            <asp:TextBox ID="txtProductID" runat="server" CssClass="aspNetTextBox" /><br /><br />

            <label for="txtNewStock">New Stock Quantity:</label><br />
            <asp:TextBox ID="txtNewStock" runat="server" CssClass="aspNetTextBox" /><br /><br />

            <label for="txtUnitPrice">New Unit Price:</label><br />
            <asp:TextBox ID="txtUnitPrice" runat="server" CssClass="aspNetTextBox" /><br /><br />

            <asp:Button ID="btnUpdateStock" runat="server" Text="Update Stock" CssClass="btn-save" OnClick="btnUpdateStock_Click" />
        </div>
            </div>
    </div>
</asp:Content>
