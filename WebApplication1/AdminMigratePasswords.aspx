<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminMigratePasswords.aspx.cs" Inherits="WebApplication1.AdminMigratePasswords" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Password Migration</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin:40px auto;max-width:500px;text-align:center;">
            <h2>Password Migration Tool</h2>
            <asp:Button ID="btnMigrate" runat="server" Text="Migrate Passwords" OnClick="btnMigrate_Click" />
            <br /><br />
            <asp:Label ID="lblResult" runat="server" ForeColor="Green" />
        </div>
    </form>
</body>
</html>
