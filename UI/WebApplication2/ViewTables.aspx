<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewTables.aspx.cs" Inherits="WebApplication2.WebForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 342px">
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
        <asp:Label ID="Label1" runat="server" Text="Choose table to view:"></asp:Label>
        <asp:DropDownList ID="TableNamesDropDownList" runat="server" Height="34px" style="margin-left: 18px">
            <asp:ListItem>Student</asp:ListItem>
            <asp:ListItem>Rav</asp:ListItem>
            <asp:ListItem>Book</asp:ListItem>
            <asp:ListItem>BeitMidrashHall</asp:ListItem>
            <asp:ListItem>VolunteerGroup</asp:ListItem>
            <asp:ListItem>Teaches</asp:ListItem>
            <asp:ListItem>Studies</asp:ListItem>
            <asp:ListItem>Placed</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" Height="71px" OnClick="Button1_Click" style="margin-left: 331px" Text="View Table" Width="167px" />
        <p>
            <asp:Label ID="ErrorLabel" runat="server"></asp:Label>
        </p>
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
    </form>
</body>
</html>
