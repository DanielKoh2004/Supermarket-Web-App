<%@ Page Title="Add Product" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="WebApplication1.AddProduct" %>

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

        <div class="main-content">
            <div class ="fade-in">
            <h2>Add New Product</h2>
            <asp:Label ID="lblProductName" runat="server" Text="Product Name: " />
            <asp:TextBox ID="txtProductName" runat="server" />
            <br /><br />

            <asp:Label ID="lblPrice" runat="server" Text="Price: " />
            <asp:TextBox ID="txtPrice" runat="server" />
            <br /><br />

            <asp:Label ID="lblCategory" runat="server" Text="Category: " />
            <asp:DropDownList ID="ddlCategory" runat="server">
                <asp:ListItem Value="Beverages">Beverages</asp:ListItem>
                <asp:ListItem Value="Vegetables">Vegetables</asp:ListItem>
                <asp:ListItem Value="Fruit">Fruit</asp:ListItem>
            </asp:DropDownList>
            <br /><br />

            <asp:Label ID="lblStock" runat="server" Text="Stock Quantity: " />
            <asp:TextBox ID="txtStock" runat="server" />
            <br /><br />

            <asp:Label ID="lblImageFile" runat="server" Text="Product Image: " />
            <asp:FileUpload ID="fuImage" runat="server" />
            <br /><br />

            <asp:Button ID="btnAddProduct" runat="server" Text="Add Product" CssClass="staff-btn" OnClick="btnAddProduct_Click" />
            <br /><br />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
        </div>
            </div>
    </div>
</asp:Content>
