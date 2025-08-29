<%@ Page Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="WebApplication1.ShoppingCart" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">

    <title></title>
    <style type="text/css">
        .auto-style2 {
            z-index: 1;
            position: relative;
            text-align: center;
            font-size: x-large;
        }
        .cart-wrapper {
            width: 95%;
            max-width: 1000px;
            margin: 40px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        .cart-table {
            width: 100%;
            border-collapse: collapse;
            font-family: Arial, sans-serif;
        }
        .cart-table thead {
            background-color: #f8f8f8;
        }
        .cart-table th, .cart-table td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
            font-size: 16px;
        }
        .cart-table td:first-child {
            text-align: left;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .product-img {
            width: 60px;
            height: auto;
            border-radius: 6px;
        }
        .product-name {
            font-weight: bold;
        }
        .qty-box {
            width: 60px;
            padding: 5px;
            text-align: center;
            font-size: 16px;
        }
        .cart-actions {
            text-align: right;
            margin-top: 20px;
        }
        .btn-action, .btn-checkout {
            background-color: #4CAF50;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            margin-left: 10px;
            transition: background-color 0.3s;
        }
        .btn-checkout {
            background-color: #ff9800;
        }
        .btn-action:hover {
            background-color: #45a049;
        }
        .btn-checkout:hover {
            background-color: #e68a00;
        }
        .qty-btn {
            background-color: transparent;
            color: #333;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 28px;
            height: 28px;
            font-size: 18px;
            margin: 0 4px;
            padding: 0;
            cursor: pointer;
        }
        .btn-delete {
            background-color: transparent;
            color: #b00020;
            border: none;
            font-size: 22px;
            font-weight: bold;
            margin-right: 8px;
            padding: 0;
            cursor: pointer;
        }
    </style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="auto-style2">Your Cart</div>
    <asp:ImageButton ID="ImageButton1" runat="server" Height="50px" Width="56px" ImageUrl="~/img/back.png" OnClick="btnBack_Click"/>
    <div class="cart-wrapper">
        <table class="cart-table">
            <thead>
                <tr>
                    <th>Item</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rptCart" runat="server" OnItemCommand="rptCart_ItemCommand">
                    <ItemTemplate>
                        <tr>
                            <td style="display: flex; align-items: center; gap: 10px;">
                                <asp:Button runat="server" CommandName="delete" CommandArgument='<%# Eval("Cart_ItemID") %>' Text="&#10006;" CssClass="btn-delete" Style="background-color: transparent; color: #b00020; border: none; font-size: 22px; font-weight: bold; margin-right: 8px; padding: 0;" />
                                <img src='<%# ResolveUrl("~/img/menu/") + Eval("ImageFile") %>' alt='<%# Eval("ItemName") %>' class="product-img" />
                                <span class="product-name"><%# Eval("ItemName") %></span>
                            </td>
                            <td>RM <%# Eval("UnitPrice", "{0:F2}") %></td>
                            <td>
                                <asp:Button runat="server" CommandName="minus" CommandArgument='<%# Eval("Cart_ItemID") %>' Text="-" CssClass="qty-btn" Style="background-color: transparent; color: #333; border: 1px solid #ccc; border-radius: 4px; width: 28px; height: 28px; font-size: 18px; margin-right: 4px;" />
                                <asp:Label runat="server" Text='<%# Eval("ItemQuantity") %>' CssClass="qty-box" />
                                <asp:Button runat="server" CommandName="plus" CommandArgument='<%# Eval("Cart_ItemID") %>' Text="+" CssClass="qty-btn" Style="background-color: transparent; color: #333; border: 1px solid #ccc; border-radius: 4px; width: 28px; height: 28px; font-size: 18px; margin-left: 4px;" />
                            </td>
                            <td>RM <%# (Convert.ToDecimal(Eval("UnitPrice")) * Convert.ToInt32(Eval("ItemQuantity"))).ToString("F2") %></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
        <div style="text-align:right; font-size:18px; margin-top:20px; margin-bottom:10px;">
            Subtotal: <asp:Label ID="lblSubtotal" runat="server" Text="" ForeColor="Black" Font-Bold="True" />
        </div>
        <div class="cart-actions">
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="True" />
            <asp:Button ID="btnCheckout" runat="server" Text="Checkout" CssClass="btn-checkout" OnClick="btnCheckout_Click" />
        </div>
    </div>
</asp:Content>