<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site.master" CodeBehind="home.aspx.cs" Inherits="WebApplication1.home" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
        <title>Happy Supermarket - Home</title>
    <style>
        body { margin: 0; font-family: Arial, sans-serif; background: #f5f5f5; 
        }
 
        .top-banner {
            width: 100%;
            height: 450px;
            background: url('img/banner2.jpg') center no-repeat;
        }

        .section-title {
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            margin: 50px 0 20px;
            color: #2c7a7b;
        }

        .highlight-grid {
            display: flex;
            justify-content: center;
            gap: 30px;
            flex-wrap: wrap;
            padding: 0 20px;
        }
        .highlight-card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            width: 280px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .highlight-card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 25px rgba(0,0,0,0.2);
        }
        
        .highlight-card h3 {
            font-size: 18px;
            margin: 10px 0;
            color: #333;
        }

        .highlight-card .price {
            color: #2c7a7b;
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .highlight-card img,
        .product-card img {
            width: 100%;
            height: auto;          
            object-fit: contain;   
            border-radius: 8px;
            margin-bottom: 15px;
            background-color: #fff; 
            padding: 5px;          
        }

        .buy-button {
            background-color: #2c7a7b;
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
        }
        .buy-button:hover { background-color: #225e5f; }

        .promo-banner {
            width: 100%;
            height: 270px;
            margin: 50px 0;
            background: url('img/banner4.jpg') center no-repeat;
            border-radius: 10px;
        }

        .product-grid {
            display: flex;
            justify-content: center;
            gap: 30px;
            flex-wrap: wrap;
            padding: 0 20px 50px;
        }

        .product-card:hover { transform: translateY(-5px)
        }
        .product-card img {
            width: 100%;
            height: 160px;
            object-fit: cover;
            border-radius: 8px;
            margin-bottom: 10px;
        }
        .product-name { font-weight: bold; margin-bottom: 5px; color: #333; }
        .product-price { color: #2c7a7b; font-size: 18px; margin-bottom: 10px; }
    </style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="top-banner"></div>

    <div class="section-title">Weekly Highlights</div>
    <div class="highlight-grid">
        <div class="highlight-card">
            <a href="Menu.aspx">
                <img src="img/menu/jagung.png" alt="Corn" style="cursor:pointer;" />
            </a>
            <h3>Corn</h3>
            <div class="price">RM 5.00</div>
            <button class="buy-button" type="button" onclick="window.location.href='Menu.aspx'">Buy Now</button>
        </div>
        <div class="highlight-card">
            <a href="Menu.aspx">
                <img src="img/menu/lobak.png" alt="Daikon" style="cursor:pointer;" />
            </a>
            <h3>Daikon</h3>
            <div class="price">RM 2.50</div>
            <button class="buy-button" type="button" onclick="window.location.href='Menu.aspx'">Buy Now</button>
        </div>
        <div class="highlight-card">
            <a href="Menu.aspx">
                <img src="/img/menu/timun.png" alt="Cucumber" style="cursor:pointer;" />
            </a>
            <h3>Cucumber</h3> 
            <div class="price">RM 2.00</div>
            <button class="buy-button" type="button" onclick="window.location.href='Menu.aspx'">Buy Now</button>
        </div>
    </div>

    <div class="promo-banner"></div>

    <div class="section-title">Featured Products</div>
    <div class="product-grid">
        <div class="product-card">
            <a href="Menu.aspx">
                <img src="img/menu/sawi_cameron.png" alt="Cameron Choy Sum" style="cursor:pointer;" />
            </a>
            <div class="product-name">Cameron Choy Sum</div>
            <div class="product-price">RM 3.00</div>
            <button class="buy-button" type="button" onclick="window.location.href='Menu.aspx'">Buy Now</button>
        </div>
        <div class="product-card">
            <a href="Menu.aspx">
                <img src="img/menu/pineapple.png" alt="Pineapple" style="cursor:pointer;" />
            </a>
            <div class="product-name">Pineapple</div>
            <div class="product-price">RM 4.00</div>
            <button class="buy-button" type="button" onclick="window.location.href='Menu.aspx'">Buy Now</button>
        </div>
        <div class="product-card">
            <a href="Menu.aspx">
                <img src="img/menu/apple.jpg" alt="Apple" style="cursor:pointer;" />
            </a>
            <div class="product-name">Apple</div>
            <div class="product-price">RM 3.00</div>
            <button class="buy-button" type="button" onclick="window.location.href='Menu.aspx'">Buy Now</button>
        </div>
        <div class="product-card">
            <a href="Menu.aspx">
                <img src="img/menu/WaterMalon.jpg" alt="Watermalon" style="cursor:pointer;" />
            </a>
            <div class="product-name">Watermalon</div>
            <div class="product-price">RM 18.00</div>
            <button class="buy-button" type="button" onclick="window.location.href='Menu.aspx'">Buy Now</button>
        </div>
    </div>
</asp:Content>
