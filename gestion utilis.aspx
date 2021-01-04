<%@ Page Title="" Language="C#" MasterPageFile="~/poste.Master" AutoEventWireup="true" CodeBehind="gestion utilis.aspx.cs" Inherits="postes_gestion.gestion_utilis" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <span style="text-decoration: underline; font-size: large; color: white; background-color: #000000">
gestion utilisateurs&nbsp; </span><br />
<br />
<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
    CellPadding="4" DataKeyNames="mot_de_passe" DataSourceID="SqlDataSource2" 
    ForeColor="#333333" GridLines="None" Height="19px" Width="339px">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
    <EditRowStyle BackColor="#999999" />
    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
    <Fields>
        <asp:BoundField DataField="login" HeaderText="login" SortExpression="login" />
        <asp:BoundField DataField="mot_de_passe" HeaderText="mot_de_passe" 
            ReadOnly="True" SortExpression="mot_de_passe" />
        <asp:BoundField DataField="nom" HeaderText="nom" SortExpression="nom" />
        <asp:BoundField DataField="code" HeaderText="code" SortExpression="code" />
        <asp:CommandField ShowInsertButton="True" />
    </Fields>
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <PagerTemplate>
        <asp:Button ID="Button1" runat="server" Text="&lt;" />
        <asp:Button ID="Button2" runat="server" Text="&gt;" />
    </PagerTemplate>
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
</asp:DetailsView>
<asp:GridView ID="GridView1" runat="server" 
    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="mot_de_passe" 
    DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
    Height="16px" Width="500px">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
            ShowSelectButton="True" />
        <asp:BoundField DataField="login" HeaderText="login" SortExpression="login" />
        <asp:BoundField DataField="mot_de_passe" HeaderText="mot_de_passe" 
            ReadOnly="True" SortExpression="mot_de_passe" />
        <asp:BoundField DataField="nom" HeaderText="nom" SortExpression="nom" />
        <asp:BoundField DataField="code" HeaderText="code" SortExpression="code" />
    </Columns>
    <EditRowStyle BackColor="#999999" />
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <PagerTemplate>
        <asp:Button ID="Button3" runat="server" Text="président" />
        <asp:Button ID="Button4" runat="server" Text="suivent" />
    </PagerTemplate>
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#E9E7E2" />
    <SortedAscendingHeaderStyle BackColor="#506C8C" />
    <SortedDescendingCellStyle BackColor="#FFFDF8" />
    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConflictDetection="CompareAllValues" 
    ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" 
    DeleteCommand="DELETE FROM [utilisateur] WHERE [mot_de_passe] = @original_mot_de_passe AND (([login] = @original_login) OR ([login] IS NULL AND @original_login IS NULL)) AND (([nom] = @original_nom) OR ([nom] IS NULL AND @original_nom IS NULL)) AND (([code] = @original_code) OR ([code] IS NULL AND @original_code IS NULL))" 
    InsertCommand="INSERT INTO [utilisateur] ([login], [mot_de_passe], [nom], [code]) VALUES (@login, @mot_de_passe, @nom, @code)" 
    OldValuesParameterFormatString="original_{0}" 
    SelectCommand="SELECT * FROM [utilisateur]" 
    UpdateCommand="UPDATE [utilisateur] SET [login] = @login, [nom] = @nom, [code] = @code WHERE [mot_de_passe] = @original_mot_de_passe AND (([login] = @original_login) OR ([login] IS NULL AND @original_login IS NULL)) AND (([nom] = @original_nom) OR ([nom] IS NULL AND @original_nom IS NULL)) AND (([code] = @original_code) OR ([code] IS NULL AND @original_code IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_mot_de_passe" Type="String" />
        <asp:Parameter Name="original_login" Type="String" />
        <asp:Parameter Name="original_nom" Type="String" />
        <asp:Parameter Name="original_code" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="login" Type="String" />
        <asp:Parameter Name="mot_de_passe" Type="String" />
        <asp:Parameter Name="nom" Type="String" />
        <asp:Parameter Name="code" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="login" Type="String" />
        <asp:Parameter Name="nom" Type="String" />
        <asp:Parameter Name="code" Type="String" />
        <asp:Parameter Name="original_mot_de_passe" Type="String" />
        <asp:Parameter Name="original_login" Type="String" />
        <asp:Parameter Name="original_nom" Type="String" />
        <asp:Parameter Name="original_code" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
<br />
<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConflictDetection="CompareAllValues" 
    ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" 
    DeleteCommand="DELETE FROM [utilisateur] WHERE [mot_de_passe] = @original_mot_de_passe AND (([login] = @original_login) OR ([login] IS NULL AND @original_login IS NULL)) AND (([nom] = @original_nom) OR ([nom] IS NULL AND @original_nom IS NULL)) AND (([code] = @original_code) OR ([code] IS NULL AND @original_code IS NULL))" 
    InsertCommand="INSERT INTO [utilisateur] ([login], [mot_de_passe], [nom], [code]) VALUES (@login, @mot_de_passe, @nom, @code)" 
    OldValuesParameterFormatString="original_{0}" 
    SelectCommand="SELECT * FROM [utilisateur] WHERE ([mot_de_passe] = @mot_de_passe)" 
    UpdateCommand="UPDATE [utilisateur] SET [login] = @login, [nom] = @nom, [code] = @code WHERE [mot_de_passe] = @original_mot_de_passe AND (([login] = @original_login) OR ([login] IS NULL AND @original_login IS NULL)) AND (([nom] = @original_nom) OR ([nom] IS NULL AND @original_nom IS NULL)) AND (([code] = @original_code) OR ([code] IS NULL AND @original_code IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_mot_de_passe" Type="String" />
        <asp:Parameter Name="original_login" Type="String" />
        <asp:Parameter Name="original_nom" Type="String" />
        <asp:Parameter Name="original_code" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="login" Type="String" />
        <asp:Parameter Name="mot_de_passe" Type="String" />
        <asp:Parameter Name="nom" Type="String" />
        <asp:Parameter Name="code" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="GridView1" Name="mot_de_passe" 
            PropertyName="SelectedValue" Type="String" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="login" Type="String" />
        <asp:Parameter Name="nom" Type="String" />
        <asp:Parameter Name="code" Type="String" />
        <asp:Parameter Name="original_mot_de_passe" Type="String" />
        <asp:Parameter Name="original_login" Type="String" />
        <asp:Parameter Name="original_nom" Type="String" />
        <asp:Parameter Name="original_code" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>

</asp:Content>
