<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site.master" CodeBehind="AboutUs.aspx.cs" Inherits="WebApplication1.AboutUs" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <title>About Us - Happy Supermarket</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f5f5f5; margin: 0; }

        .about-wrapper {
            max-width: 1000px;
            margin: 40px auto;
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }

        /* Title */
        .about-title {
            text-align: center;
            font-size: 32px;
            font-weight: bold;
            color: #2c7a7b;
            margin-bottom: 20px;
        }

        /* Intro paragraph */
        .about-intro {
            text-align: center;
            font-size: 16px;
            color: #555;
            line-height: 1.6;
            margin-bottom: 40px;
        }

        /* Highlight banner */
        .highlight-banner {
            background: #2c7a7b;
            color: white;
            padding: 40px 20px;
            border-radius: 10px;
            text-align: center;
            margin-bottom: 40px;
        }
        .highlight-banner h2 {
            font-size: 28px;
            margin-bottom: 10px;
        }
        .highlight-banner p {
            font-size: 16px;
            max-width: 700px;
            margin: auto;
        }

        /* Values Section */
        .values-section {
            margin-top: 30px;
        }
        .values-title {
            font-size: 26px;
            font-weight: bold;
            color: #2c7a7b;
            margin-bottom: 20px;
        }
        .values-grid {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 20px;
        }
        .value-card {
            flex: 1;
            min-width: 150px;
            text-align: center;
        }
        .value-card h3 {
            font-size: 22px;
            color: #2c7a7b;
            margin-bottom: 10px;
        }
        .value-card p {
            font-size: 14px;
            color: #555;
            line-height: 1.4;
        }
    </style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="about-wrapper">
        <!-- Title -->
        <div class="about-title">Happy Supermarket in Malaysia</div>

        <!-- Intro -->
        <div class="about-intro">
            At Happy Supermarket, we’re committed to making grocery shopping a delightful experience for our customers by helping them make smarter everyday choices. 
            <br/><br/>
            We know every customer’s needs are unique, with a desire for personalization. Our goal is to be a one-stop destination — online and offline — where our customers can enjoy fresh products, better quality, and affordable prices.
        </div>

        <!-- Highlight Banner -->
        <div class="highlight-banner">
            <h2>We are more than just a supermarket.</h2>
            <p>We are your trusted destination for quality products, great value, and a shopping experience tailored to your needs.</p>
        </div>

        <!-- Our Values -->
        <div class="values-section">
            <div class="values-title">Our Values</div>
            <div class="values-grid">
                <div class="value-card">
                    <h3>S</h3>
                    <p><b>Simple:</b> We strive to simplify our customers' shopping experience.</p>
                </div>
                <div class="value-card">
                    <h3>M</h3>
                    <p><b>Motivated:</b> We collaborate with our partners to meet customer needs.</p>
                </div>
                <div class="value-card">
                    <h3>A</h3>
                    <p><b>Agile:</b> We adapt quickly to changing trends and customer demands.</p>
                </div>
                <div class="value-card">
                    <h3>R</h3>
                    <p><b>Responsible:</b> We uphold ethics and professionalism in everything we do.</p>
                </div>
                <div class="value-card">
                    <h3>T</h3>
                    <p><b>Transformative:</b> We innovate to provide better products and services.</p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
