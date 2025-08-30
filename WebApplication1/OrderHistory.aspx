<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="WebApplication1.OrderHistory" MasterPageFile="Site.master" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <title>Order History</title>
    <style>
        .order-container {
            max-width: 950px;
            margin: 40px auto;
            background: #fff;
            padding: 36px 36px 24px 36px;
            border-radius: 16px;
            box-shadow: 0 4px 24px rgba(44,122,123,0.10);
            font-family: 'Segoe UI', Arial, sans-serif;
        }
        h2 {
            text-align: center;
            color: #2c7a7b;
            margin-bottom: 32px;
            font-size: 2rem;
            letter-spacing: 1px;
        }
        .order-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-bottom: 28px;
            background: #f9f9f9;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(44,122,123,0.07);
        }
        .order-table th, .order-table td {
            padding: 14px 12px;
            text-align: left;
            font-size: 15px;
        }
        .order-table th {
            background: #e3f6f5;
            color: #2c7a7b;
            font-weight: 600;
            border-bottom: 2px solid #b2dfdb;
        }
        .order-table tr {
            transition: background 0.2s;
        }
        .order-table tr:nth-child(even) {
            background: #f4f4f4;
        }
        .order-table tr:hover {
            background: #e0f7fa;
        }
        .order-table td {
            border-bottom: 1px solid #e0e0e0;
        }
        .method-badge {
            display: inline-block;
            padding: 4px 12px;
            border-radius: 12px;
            font-size: 13px;
            font-weight: 600;
            color: #fff;
            background: #2c7a7b;
            margin-right: 4px;
        }
        .method-badge.pickup {
            background: #ffb300;
            color: #333;
        }
        .method-badge.delivery {
            background: #2c7a7b;
        }
        .order-table .icon {
            vertical-align: middle;
            margin-right: 6px;
            font-size: 18px;
        }
        .back-btn {
            display: block;
            margin: 0 auto;
            background: #2c7a7b;
            color: #fff;
            border: none;
            padding: 12px 32px;
            border-radius: 8px;
            font-size: 18px;
            cursor: pointer;
            font-weight: 600;
            box-shadow: 0 2px 8px rgba(44,122,123,0.10);
            transition: background 0.2s;
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
                <asp:BoundField DataField="DeliveryMethod" HeaderText="Method" />
                <asp:TemplateField HeaderText="Address / Pickup Location">
                    <ItemTemplate>
                        <%# Eval("DeliveryMethod").ToString() == "Delivery" ? Eval("DeliveryAddress") : "" %>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Button ID="btnBackHome" runat="server" Text="Back to Home" CssClass="back-btn" OnClick="btnBackHome_Click" />
    </div>
</asp:Content>
