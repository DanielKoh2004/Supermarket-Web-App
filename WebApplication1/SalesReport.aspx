<%@ Page Title="Sales Report" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeBehind="SalesReport.aspx.cs" Inherits="WebApplication1.SalesReport" %>

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
            <a href="StaffReport.aspx">Staff List/Delete Staff</a>
        <% } %>
    </div>

        <!-- Main Content -->
        <div class="main-content">
            <div class ="fade-in">
            <h2>Sales Report</h2>
            <asp:Label ID="lblSelectDate" runat="server" Text="Select Date: " />
            <asp:Calendar ID="calSalesDate" runat="server" />
            <br /><br />
            <asp:Button ID="btnGenerateReport" runat="server" Text="Generate Report" CssClass="staff-btn" OnClick="btnGenerateSales_Click" />
            <br /><br />
            <asp:GridView ID="gvSalesReport" runat="server" AutoGenerateColumns="False" CssClass="gridview">
                <Columns>
                    <asp:BoundField DataField="Date" HeaderText="Date" />
                    <asp:BoundField DataField="Product" HeaderText="Product" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                    <asp:BoundField DataField="TotalSales" HeaderText="Total Sales (RM)" />
                </Columns>
            </asp:GridView>
        </div>
            </div>
    </div>
</asp:Content>
