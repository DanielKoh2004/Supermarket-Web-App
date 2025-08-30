<%@ Page Title="Dashboard" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.Default" %>

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
            <a href="StockLevels.aspx">Stock Level/Delete Stock</a>
            <a href="SalesReport.aspx">Sales Report</a>
            <a href="StaffReport.aspx">Staff Report</a>
        <% } %>
    </div>

        <!-- Dashboard Content -->
        <div class="dashboard-content">
            <h2>Welcome to Supermarket Admin Dashboard</h2>
            <p>This portal allows you to manage staff, products, inventory, and generate business reports.</p>

            <div class="dashboard-cards">
                <div class="dashboard-card">👥 Total Staff: <asp:Label ID="lblTotalStaff" runat="server" /></div>
                <div class="dashboard-card">🛒 Products in Stock: <asp:Label ID="lblProductsInStock" runat="server" /></div>
                <div class="dashboard-card">📈 Monthly Sales: RM <asp:Label ID="lblMonthlySales" runat="server" /></div>
            </div>
        </div>
    </div>
</asp:Content>

