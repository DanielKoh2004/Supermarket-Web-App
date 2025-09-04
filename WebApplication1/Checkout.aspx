<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="WebApplication1.Checkout" MasterPageFile="Site.master" %>


<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
        <title>Checkout</title>
    <style>
    
        .section {
            padding: 20px;
            margin: 20px auto;
            max-width: 600px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-family: Arial;
        }

        .form-label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }

        .form-input {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .form-button {
            margin-top: 20px;
            padding: 12px 24px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }
    </style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
        <asp:ImageButton ID="ImageButton1" runat="server" Height="51px" Width="51px" ImageUrl="~/img/back.png" OnClick="btnBack_Click"/>

        <div class="section">
            <h2>Choose Checkout Method</h2>
            <asp:RadioButtonList ID="rblMethod" runat="server" AutoPostBack="true" OnSelectedIndexChanged="rblMethod_SelectedIndexChanged">
                <asp:ListItem Text="Delivery" Value="delivery"></asp:ListItem>
                <asp:ListItem Text="Self Pickup" Value="pickup"></asp:ListItem>
            </asp:RadioButtonList>
        </div>

        <asp:Panel ID="pnlDelivery" runat="server" Visible="false" CssClass="section">
            <h3>Delivery Information</h3>
            <label class="form-label">Name:</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-input"></asp:TextBox>

            <label class="form-label">Address:</label>
            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-input" TextMode="MultiLine" Rows="3"></asp:TextBox>

            <label class="form-label">Phone Number:</label>
            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-input"></asp:TextBox>
        </asp:Panel>

        <asp:Panel ID="pnlPickup" runat="server" Visible="false" CssClass="section">
            <h3>Choose Pickup Location</h3>
            <asp:DropDownList ID="ddlPickupLocation" runat="server" CssClass="form-input">
                <asp:ListItem Text="Select location..." Value=""></asp:ListItem>
                <asp:ListItem Text="Selangor" Value="Selangor"></asp:ListItem>
                <asp:ListItem Text="Kuala Lumpur" Value="KL"></asp:ListItem>
                <asp:ListItem Text="Johor Bahru" Value="JB"></asp:ListItem>
            </asp:DropDownList>
        </asp:Panel>


        <div class="section">
            <asp:Button ID="btnConfirm" runat="server" Text="Confirm Order" CssClass="form-button" OnClientClick="return validateCheckout();" OnClick="btnConfirm_Click1" />
            <asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="false" CssClass="form-label"></asp:Label>
        </div>

        <script type="text/javascript">
    function validateCheckout() {
        var deliveryPanel = document.getElementById('<%= pnlDelivery.ClientID %>');
        var pickupPanel = document.getElementById('<%= pnlPickup.ClientID %>');
        var valid = true;
        var msg = "";

        // Defensive: check for null
        if (deliveryPanel && deliveryPanel.style.display !== "none") {
            var name = document.getElementById('<%= txtName.ClientID %>').value.trim();
            var address = document.getElementById('<%= txtAddress.ClientID %>').value.trim();
            var phone = document.getElementById('<%= txtPhone.ClientID %>').value.trim();
            if (!name) { valid = false; msg += "Name is required.\n"; }
            if (!address) { valid = false; msg += "Address is required.\n"; }
            if (!phone.match(/^01[0-9]{8,9}$/)) { valid = false; msg += "Phone format is invalid.\n"; }
        } else if (pickupPanel && pickupPanel.style.display !== "none") {
            var location = document.getElementById('<%= ddlPickupLocation.ClientID %>').value;
            if (!location) { valid = false; msg += "Pickup location is required.\n"; }
        }

        if (!valid) {
            alert(msg);
        }
        return valid;
    }
</script>
</asp:Content>
