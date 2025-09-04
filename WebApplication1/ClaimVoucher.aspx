<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClaimVoucher.aspx.cs" Inherits="WebApplication1.ClaimVoucher" MasterPageFile="Site.master" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <title>Claim Voucher</title>
    <style>
        .voucher-container { max-width: 700px; margin: 40px auto; background: #fff; padding: 30px; border-radius: 10px; box-shadow: 0 0 12px rgba(0,0,0,0.1); font-family: Arial, sans-serif; }
        h2 { text-align: center; color: #2c7a7b; margin-bottom: 25px; }
        .points-balance { font-size: 18px; color: #2c7a7b; margin-bottom: 20px; text-align: center; }
        .voucher-table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
        .voucher-table th, .voucher-table td { border: 1px solid #ccc; padding: 10px; text-align: left; }
        .voucher-table th { background: #e3f6f5; }
        .claim-btn { background: #2c7a7b; color: #fff; border: none; padding: 6px 18px; border-radius: 6px; font-size: 15px; cursor: pointer; }
        .claim-btn:disabled { background: #ccc; color: #888; cursor: not-allowed; }
        .claimed-label { color: #4CAF50; font-weight: bold; }
    </style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="voucher-container">
        <h2>Claim Voucher</h2>
        <asp:Label ID="lblPoints" runat="server" CssClass="points-balance" />
        <asp:GridView ID="gvVouchers" runat="server" AutoGenerateColumns="False" CssClass="voucher-table" OnRowCommand="gvVouchers_RowCommand">
            <Columns>
                <asp:BoundField DataField="VoucherCode" HeaderText="Voucher Code" />
                <asp:BoundField DataField="PointsRequired" HeaderText="Points Required" />
                <asp:BoundField DataField="DiscountAmount" HeaderText="Discount (RM)" DataFormatString="{0:F2}" />
                <asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                        <asp:Button 
                            ID="btnClaim" 
                            runat="server" 
                            CssClass="claim-btn" 
                            Text="Claim" 
                            CommandName="Claim" 
                            CommandArgument='<%# Eval("VoucherID").ToString() %>' 
                            Visible='<%# Convert.ToInt32(Eval("IsClaimed")) == 0 %>' />
                        <span class="claimed-label" style='<%# Convert.ToInt32(Eval("IsClaimed")) == 1 ? "" : "display:none;" %>'>Claimed</span>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
    </div>
</asp:Content>
