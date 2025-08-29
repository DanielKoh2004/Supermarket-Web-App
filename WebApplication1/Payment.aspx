<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="WebApplication1.Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payment Method - Happy Supermarket</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 30px;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 600px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 12px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .section {
            margin-top: 20px;
        }

        .form-label {
            display: block;
            margin-top: 12px;
            font-weight: bold;
        }

        .form-input {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        .form-button {
            display: block;
            width: 100%;
            background-color: #28a745;
            color: white;
            padding: 14px;
            font-size: 16px;
            margin-top: 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .form-button:hover {
            background-color: #218838;
        }
.bank-list input[type="radio"] {
    margin-right: 10px;
}

.bank-logo {
    width: 30px;
    height: auto;
    vertical-align: middle;
    margin-right: 8px;
}

.ewallet-logo {
    width: 100px;
    height: auto;
    margin: 10px 0;
}
.success-message {
    text-align: center;
    display: block;
    margin-top: 30px;
    color: green;
    font-size: 24px;
    font-weight: bold;
}


    </style>
    <script type="text/javascript">
function validatePayment() {
    var valid = true;
    var msg = "";
    var method = document.getElementById('<%= rblPaymentMethod.ClientID %>');
    var selectedMethod = "";
    if (method) {
        var radios = method.getElementsByTagName('input');
        for (var i = 0; i < radios.length; i++) {
            if (radios[i].checked) {
                selectedMethod = radios[i].value;
                break;
            }
        }
    }
    if (selectedMethod === "bank") {
        var bank = document.getElementById('<%= rblBanks.ClientID %>');
        var username = document.getElementById('<%= txtBankUsername.ClientID %>').value.trim();
        var password = document.getElementById('<%= txtBankPassword.ClientID %>').value.trim();
        var bankSelected = false;
        if (bank) {
            var bankRadios = bank.getElementsByTagName('input');
            for (var i = 0; i < bankRadios.length; i++) {
                if (bankRadios[i].checked) {
                    bankSelected = true;
                    break;
                }
            }
        }
        if (!bankSelected) { valid = false; msg += "Please select a bank.\n"; }
        if (!username) { valid = false; msg += "Bank username is required.\n"; }
        if (!password) { valid = false; msg += "Bank password is required.\n"; }
    } else if (selectedMethod === "card") {
        var cardNumber = document.getElementById('<%= txtCardNumber.ClientID %>').value.trim();
        var cardHolder = document.getElementById('<%= txtCardHolder.ClientID %>').value.trim();
        var expiry = document.getElementById('<%= txtExpiry.ClientID %>').value.trim();
        var cvv = document.getElementById('<%= txtCVV.ClientID %>').value.trim();
        if (!cardNumber.match(/^\d{16}$/)) { valid = false; msg += "Card number must be 16 digits.\n"; }
        if (!cardHolder) { valid = false; msg += "Card holder name is required.\n"; }
        if (!expiry.match(/^(0[1-9]|1[0-2])\/(\d{2})$/)) { valid = false; msg += "Expiry date must be MM/YY.\n"; }
        if (!cvv.match(/^\d{3}$/)) { valid = false; msg += "CVV must be 3 digits.\n"; }
    } else if (selectedMethod === "wallet") {
        var phone = document.getElementById('<%= txtTngPhone.ClientID %>').value.trim();
        var pin = document.getElementById('<%= txtTngPin.ClientID %>').value.trim();
        if (!phone.match(/^01[0-9]{8,9}$/)) { valid = false; msg += "Phone format is invalid.\n"; }
        if (!pin.match(/^\d{6}$/)) { valid = false; msg += "PIN must be 6 digits.\n"; }
    } else {
        valid = false;
        msg += "Please select a payment method.\n";
    }
    if (!valid) {
        alert(msg);
    }
    return valid;
}
</script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ImageButton ID="ImageButton1" runat="server" Height="44px" Width="50px" ImageUrl="~/img/back.png"  OnClick="btnBack_Click" />
        <div class="container">
            <h2>Choose Payment Method</h2>

            <asp:RadioButtonList ID="rblPaymentMethod" runat="server" AutoPostBack="true" OnSelectedIndexChanged="rblPaymentMethod_SelectedIndexChanged">
                <asp:ListItem Text="Online Banking" Value="bank"></asp:ListItem>
                <asp:ListItem Text="Credit Card" Value="card"></asp:ListItem>
                <asp:ListItem Text="E-Wallet" Value="wallet"></asp:ListItem>
            </asp:RadioButtonList>

            <!-- Online Banking Panel -->
            <asp:Panel ID="pnlBanking" runat="server" Visible="false" CssClass="section">
                <label class="form-label">Select Bank:</label>
                <asp:RadioButtonList ID="rblBanks" runat="server" CssClass="bank-list">
                    <asp:ListItem Value="Public Bank" Text="<img src='img/payment/public.png' class='bank-logo' /> Public Bank" />
                    <asp:ListItem Value="Maybank" Text="<img src='img/payment/maybank.jpeg' class='bank-logo' /> Maybank" />
                    <asp:ListItem Value="Bank Rakyat" Text="<img src='img/payment/rakyat.jpg' class='bank-logo' /> Bank Rakyat" />
                    <asp:ListItem Value="Hong Leong Bank" Text="<img src='img/payment/hongleong.png' class='bank-logo' /> Hong Leong Bank" />
                </asp:RadioButtonList>

                <label class="form-label">Username:</label>
                <asp:TextBox ID="txtBankUsername" runat="server" CssClass="form-input"></asp:TextBox>

                <label class="form-label">Password:</label>
                <asp:TextBox ID="txtBankPassword" runat="server" CssClass="form-input" TextMode="Password"></asp:TextBox>
            </asp:Panel>


            <!-- Credit Card Panel -->
            <asp:Panel ID="pnlCard" runat="server" Visible="false" CssClass="section">
                <label class="form-label">Card Number:</label>
                <asp:TextBox ID="txtCardNumber" runat="server" CssClass="form-input" MaxLength="16"></asp:TextBox>

                <label class="form-label">Card Holder Name:</label>
                <asp:TextBox ID="txtCardHolder" runat="server" CssClass="form-input"></asp:TextBox>

                <label class="form-label">Expiry Date:</label>
                <asp:TextBox ID="txtExpiry" runat="server" CssClass="form-input" placeholder="MM/YY"></asp:TextBox>

                <label class="form-label">CVV:</label>
                <asp:TextBox ID="txtCVV" runat="server" CssClass="form-input" MaxLength="3" TextMode="Password"></asp:TextBox>
            </asp:Panel>

            <!-- E-Wallet Panel -->
            <asp:Panel ID="pnlEwallet" runat="server" Visible="false" CssClass="section">
                <h3>Touch 'n Go E-Wallet</h3>

                <div>
                    <img src="img/payment/tng.png" alt="Touch 'n Go Logo" class="ewallet-logo" />
                </div>

                <label class="form-label">Phone Number:</label>
                <asp:TextBox ID="txtTngPhone" runat="server" CssClass="form-input" placeholder="e.g. 0123456789"></asp:TextBox>

                <label class="form-label">PIN Number:</label>
                <asp:TextBox ID="txtTngPin" runat="server" CssClass="form-input" TextMode="Password" placeholder="Enter 6-digit PIN"></asp:TextBox>
            </asp:Panel>


            <asp:Button ID="btnPay" runat="server" Text="Pay Now" CssClass="form-button" OnClientClick="return validatePayment();" OnClick="btnPay_Click" />
            <asp:Label ID="lblMessage" runat="server" Text="" 
                CssClass="success-message" Visible="false"></asp:Label>

        </div>
    </form>
</body>
</html>
