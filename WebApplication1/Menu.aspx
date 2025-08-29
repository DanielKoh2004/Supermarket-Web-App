<%@ Page Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="WebApplication1.Menu" MaintainScrollPositionOnPostback="true"%>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <title>Menu</title>
    <style type="text/css">
        body { margin: 0; padding: 0; font-family: Arial, sans-serif; }

        .top-bar {
            display: flex; justify-content: space-between; align-items: center;
            background-color: #f0f0f0; padding: 10px 20px; color: #333;
            flex-wrap: wrap; border: 1px solid #ccc; border-radius: 6px; margin-bottom: 20px;
        }
        .dropdown { padding: 5px; font-size: 16px; }
        .category-label { color: black; font-weight: bold; }

        .search-box input[type="text"] { padding: 6px; font-size: 16px; width: 220px; }
        .search-box .btn { padding: 6px 12px; font-size: 16px; background-color: #00bfa5; border: none; color: white; border-radius: 5px; cursor: pointer; }
        .search-box .btn:hover { background-color: #008e76; }

        .menu-grid {
            display: grid; grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 16px;
        }

        .menu-item {
            border: 1px solid #ccc; border-radius: 10px; padding: 15px; text-align: center; background-color: #fff;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .menu-item:hover { transform: translateY(-5px); box-shadow: 0 8px 16px rgba(0,0,0,0.2); }

        .product-image { border-radius: 8px; transition: transform 0.3s; width: 160px; height: 160px; object-fit: cover; }
        .product-image:hover { transform: scale(1.05); }

        .product-name { display:block; font-weight: bold; font-size: 16px; margin-top: 10px; }
        .product-price { display:block; color: #008000; font-size: 15px; margin-top: 6px; }
        .quantity-label {
            display: inline-block; background-color: #fff; color: #000; font-weight: bold; font-size: 13px;
            border: 2px solid #000; border-radius: 6px; padding: 4px 12px; margin: 8px 0;
        }
        .product-button {
            margin-top: 10px; padding: 8px 16px; background-color: #00bfa5; color: white; border: none; border-radius: 50px; cursor: pointer;
        }
        .product-button:hover { background-color: #008e76; }
        .out-of-stock { color:#b00020; font-weight:bold; margin-top:8px; display:block; }
        .msg { margin: 10px 0 0 0; color:#444; }
        .msg.error { color: #b00020; }
        .msg.ok { color: #007f00; }
    </style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="top-bar">
        <div class="top-bar-section">
            <label class="category-label">Category:</label>
            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="dropdown" Width="160px" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                <asp:ListItem Value="">All</asp:ListItem>
                <asp:ListItem Value="Beverages">Beverages</asp:ListItem>
                <asp:ListItem Value="Vegetables">Vegetables</asp:ListItem>
                <asp:ListItem Value="Fruit">Fruit</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="lblSuccess" runat="server" ForeColor="Green"></asp:Label>

        </div>

        <div class="top-bar-section search-box">
            <asp:Panel runat="server" DefaultButton="btnSearch" style="display:inline;">
                <asp:TextBox ID="txtSearch" runat="server" placeholder="Search..." />
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn" OnClick="btnSearch_Click" />
            </asp:Panel>
        </div>

        <div class="top-bar-section">
            <asp:ImageButton ID="imgCart" runat="server" ImageUrl="~/img/cart.png" Height="40px" Width="40px" OnClick="imgCart_Click" />
        </div>
    </div>

    <asp:Label ID="lblMessage" runat="server" CssClass="msg"></asp:Label>

    <div class="menu-grid">
        <asp:Repeater ID="rptMenu" runat="server" OnItemCommand="rptMenu_ItemCommand" OnItemDataBound="rptMenu_ItemDataBound">
            <ItemTemplate>
                <div class="menu-item">
                    <img src='<%# ResolveUrl("~/img/menu/") + Eval("ImageFile") %>' alt='<%# Eval("ItemName") %>' class="product-image" />
                    <span class="product-name"><%# Eval("ItemName") %></span>
                    <span class="product-price">RM <%# Eval("UnitPrice", "{0:F2}") %></span>
                    <span class="quantity-label">Stock: <%# Eval("StockQuantity") %></span>
                    <asp:Button ID="btnAddToCart" runat="server"
                        Text="Add to Cart"
                        CssClass="product-button"
                        CommandName="add"
                        CommandArgument='<%# Eval("ItemID") %>' />
                    <asp:Label ID="lblOOS" runat="server" CssClass="out-of-stock" Visible="false" Text="Out of stock"></asp:Label>


                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
