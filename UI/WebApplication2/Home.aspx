<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication2.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body style="text-align: center">
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
    
    </div>
        <p>
            &nbsp;</p>
        <p class="auto-style1">
            <strong>Yeshiva DBMS Project 2015</strong></p>
        <p>
            Avi Seidenfeld 204905244</p>
        <p>
            Yitzhak Shlomo Goldstein 312345366</p>
    </form>
</body>
</html>
