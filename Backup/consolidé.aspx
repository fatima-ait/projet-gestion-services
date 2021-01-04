<%@ Page Title="" Language="C#" MasterPageFile="~/poste.Master" AutoEventWireup="true" CodeBehind="consolidé.aspx.cs" Inherits="postes_gestion.consolidé" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <ul>
    <li style="font-size: xx-large; font-family: 'AR DELANEY'; color: #FFFF66; background-color: #000000">
        <strong>recap consolidé par année</strong></li>
</ul>
    <p>
    &nbsp; Saisir l&#39;année&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Width="185px"></asp:TextBox>
        <br />&nbsp; chaisir le mois&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" Height="19px" Width="144px">
            <asp:ListItem>...</asp:ListItem>
            <asp:ListItem>Janvier</asp:ListItem>
            <asp:ListItem>Février</asp:ListItem>
            <asp:ListItem>Mars</asp:ListItem>
            <asp:ListItem>Avril</asp:ListItem>
            <asp:ListItem>Mai</asp:ListItem>
            <asp:ListItem>Juin</asp:ListItem>
            <asp:ListItem>Juillet</asp:ListItem>
            <asp:ListItem>Aout</asp:ListItem>
            <asp:ListItem>Septembre</asp:ListItem>
            <asp:ListItem>Octobre</asp:ListItem>
            <asp:ListItem>Novembre</asp:ListItem>
            <asp:ListItem>Decembre</asp:ListItem>
        </asp:DropDownList>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </p>
    <p>
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="recherche" 
            Height="27px" style="color: #FFFFFF; background-color: #000000" 
            Width="111px" />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="3" DataKeyNames="NomClient" 
            DataSourceID="SqlDataSource1" GridLines="Vertical" Height="3px" 
            Width="5px" BackColor="White" BorderColor="#999999" BorderStyle="None" 
            BorderWidth="1px">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="NomClient" HeaderText="NomClient" ReadOnly="True" 
                    SortExpression="NomClient" />
                <asp:BoundField DataField="Nature_realise" HeaderText="Nature_realise" 
                    SortExpression="Nature_realise" />
                <asp:BoundField DataField="total_val_obj" HeaderText="total_val_obj" 
                    ReadOnly="True" SortExpression="total_val_obj" />
                <asp:BoundField DataField="total_val_rea" HeaderText="total_val_rea" 
                    ReadOnly="True" SortExpression="total_val_rea" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <PagerTemplate>
                <asp:Button ID="Button2" runat="server" Height="29px" Text="&lt;" 
                    Width="50px" />
                <asp:Button ID="Button3" runat="server" Text="&gt;" Width="60px" />
            </PagerTemplate>
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
    </p>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" SelectCommand="SELECT CLIENTS.NomClient, REALISES.Nature_realise ,SUM(Valeur_Objectif )AS total_val_obj,SUM(Valeur_Realise )AS total_val_rea FROM (CLIENTS INNER JOIN REALISES ON REALISES.NomClient=CLIENTS.NomClient INNER JOIN OBJ ON (REALISES.Nature_realise=OBJ.Nature_Objectif) AND (REALISES.Mois=OBJ.Mois) AND (REALISES.Annee=OBJ.Annee) AND REALISES.Mois =@mois  AND REALISES.Annee= @n ) GROUP BY CLIENTS.NomClient, REALISES.Nature_realise ORDER BY 
REALISES.Nature_realise">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="mois" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="TextBox1" Name="n" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>


</asp:Content>
