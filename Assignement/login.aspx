<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Assignement.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <link rel="stylesheet" type="text/css" href="StyleSheet3.css">

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>FPT SO 1 Hoa Lac</h1> 
        </div>
        <div class="cen">
            <h1>Login</h1>
            Login:<asp:TextBox ID="UserName" runat="server"></asp:TextBox><br/>
            Password:<asp:TextBox ID="password"   TextMode="Password" runat="server"></asp:TextBox><br/>
            <asp:Button ID="Button1" runat="server" Text="Log in" OnClick="Button1_Click" /><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="UserName" ></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="password"> </asp:RequiredFieldValidator>
        </div>
    </form>
</body>
</html>
