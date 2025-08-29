<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="WebApplication1.OrderHistory" MasterPageFile="Site.master" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <title>Order History</title>
    <style>
        .order-container {
            max-width: 900px;
            margin: 40px auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 12px rgba(0,0,0,0.1);
            font-family: Arial, sans-serif;
        }
        h2 {
            text-align: center;
            color: #2c7a7b;
            margin-bottom: 25px;
        }
        .order-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .order-table th, .order-table td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
        .order-table th {
            background: #f4f4f4;
        }
        .back-btn {
            display: block;
            margin: 0 auto;
            background: #2c7a7b;
            color: #fff;
            border: none;
            padding: 10px 24px;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }
        .back-btn:hover {
            background: #225e5f;
        }
    </style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="order-container">
        <h2>Your Order History</h2>
        <asp:GridView ID="gvOrderHistory" runat="server" CssClass="order-table" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
                <asp:BoundField DataField="OrderDate" HeaderText="Order Date" />
                <asp:BoundField DataField="PurchasedItems" HeaderText="Purchased Items" />
                <asp:BoundField DataField="TotalAmount" HeaderText="Total Amount" DataFormatString="{0:C}" />
            </Columns>
        </asp:GridView>
        <asp:Button ID="btnBackHome" runat="server" Text="Back to Home" CssClass="back-btn" OnClick="btnBackHome_Click" />
    </div>
</asp:Content>
