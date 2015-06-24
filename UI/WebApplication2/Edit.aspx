<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="WebApplication2.Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Menu ID="Menu1" runat="server" BorderColor="Black" OnMenuItemClick="Menu1_MenuItemClick" Orientation="Horizontal" RenderingMode="Table" style="color: #0000CC; background-color: #808080">
            <Items>
                <asp:MenuItem NavigateUrl="~/Home.aspx" Text="Home |" Value="Home"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/ViewTables.aspx" Text="View Tables |" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Edit.aspx" Text="Update |" Value="Update"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Queries.aspx" Text="Queries |" Value="Queries"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Procedure.aspx" Text="Procedure" Value="Procedure"></asp:MenuItem>
            </Items>
        </asp:Menu>
    
        <br />
        Choose Student ID:<br />
        <asp:DropDownList ID="stdIDDropDownList" runat="server">
        </asp:DropDownList>
        <br />
        Enter new class room:<br />
        <asp:TextBox ID="classTextBox" runat="server"></asp:TextBox>
    
    </div>
        <p>
            <asp:Label ID="ErrorLabel" runat="server"></asp:Label>
        <asp:Button ID="Button1" runat="server" Height="71px" OnClick="Button1_Click" style="margin-left: 331px" Text="Update" Width="167px" />
        </p>
    </form>
</body>
</html>
