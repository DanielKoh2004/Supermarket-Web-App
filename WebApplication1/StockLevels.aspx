<%@ Page Title="Stock Level" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeBehind="StockLevels.aspx.cs" Inherits="WebApplication1.StockLevels" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <style>
        .gridview {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
        }
        .gridview th, .gridview td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }
        .gridview th {
            background-color: #f2f2f2;
        }
    </style>
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

        <!-- Main content section -->
        <div class="main-content">
            <div class ="fade-in">
            <h2>Current Stock Levels</h2>

            <asp:GridView ID="gvStockLevels" CssClass="gridview" runat="server" AutoGenerateColumns="False" OnRowCommand="gvStockLevels_RowCommand" DataKeyNames="ItemID">
                <Columns>
                    <asp:BoundField HeaderText="Item ID" DataField="ItemID" />
                    <asp:BoundField HeaderText="Product Name" DataField="ItemName" />
                    <asp:BoundField HeaderText="Unit Price" DataField="UnitPrice" DataFormatString="{0:F2}" />
                    <asp:BoundField HeaderText="Stock Quantity" DataField="StockQuantity" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="DeleteProduct" CommandArgument="<%# Container.DataItemIndex %>" OnClientClick="return confirm('Are you sure you want to delete this product?');" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
            </div>
    </div>
</asp:Content>

