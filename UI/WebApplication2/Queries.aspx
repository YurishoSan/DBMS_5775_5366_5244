<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Queries.aspx.cs" Inherits="WebApplication2.WebForm2" %>

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
        <asp:DropDownList ID="QueriesDropDownList" runat="server" Height="34px" style="margin-left: 18px">
            <asp:ListItem>2 - Shelves sorted by books count</asp:ListItem>
            <asp:ListItem>3 - Average age per Beit Midrash Hall</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="Button2" runat="server" Height="71px" OnClick="Button2_Click" style="margin-left: 331px" Text="Execute" Width="167px" />
        <p>
            <asp:Label ID="ErrorLabel2" runat="server"></asp:Label>
        </p>
        <asp:GridView ID="GridView2" runat="server">
        </asp:GridView>
    </form>
</body>
</html>
