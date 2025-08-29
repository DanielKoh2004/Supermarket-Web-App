<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffReport.aspx.cs" Inherits="SupermarketAdminPage.StaffReport" MasterPageFile="~/Site.Master" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <style>
        .staff-report-grid {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .staff-report-grid th, .staff-report-grid td {
            padding: 10px;
            border-bottom: 1px solid #ccc;
        }

        .staff-report-grid th {
            background-color: #89C3FA !important;
            color: #333 !important;
            text-align: left;
        }
    </style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="layout-container">

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

        <div class="main-content">
            <div class ="fade-in">
            <h2>Staff Report</h2>

            <asp:GridView ID="gvStaffReport" runat="server" AutoGenerateColumns="False" CssClass="staff-report-grid" GridLines="None">
                <Columns>
                    <asp:BoundField DataField="StaffID" HeaderText="Staff ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Role" HeaderText="Role" />
                </Columns>
            </asp:GridView>
        </div>
            </div>
    </div>
</asp:Content>
