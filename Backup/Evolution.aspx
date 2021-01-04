<%@ Page Title="" Language="C#" MasterPageFile="~/poste.Master" AutoEventWireup="true" CodeBehind="Evolution.aspx.cs" Inherits="postes_gestion.Evolution" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <br style="background-color: #0099FF" />
<span style="color: #FFFFCC; font-family: Roman; font-size: xx-large; background-color: #0099FF">
EVOLUTION </span>
<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
    &nbsp;&nbsp;&nbsp;Année actuelle&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox1" 
        runat="server" Width="210px"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
    <br />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    <asp:Button ID="Button1" runat="server" Text="Envoyer" 
        onclick="Button1_Click1" 
    style="color: #0033CC; background-color: #FF99FF" Width="114px" />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" 
    CellPadding="4" ForeColor="#333333" GridLines="None" Width="500px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="NomClient" HeaderText="NomClient" 
                SortExpression="NomClient" />
            <asp:BoundField DataField="Mois" HeaderText="Mois" SortExpression="Mois" />
            <asp:BoundField DataField="Nature_realise" HeaderText="Nature_realise" 
                SortExpression="Nature_realise" />
            <asp:BoundField DataField="Valeur_Realise" HeaderText="Valeur_Realise" 
                SortExpression="Valeur_Realise" />
            <asp:BoundField DataField="Valeur_Realise1" HeaderText="Valeur_Realise1" 
                SortExpression="Valeur_Realise1" />
            <asp:BoundField DataField="Evol" HeaderText="Evol" ReadOnly="True" 
                SortExpression="Evol" />
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
    evolution à DH<br />
    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource2" 
        Height="226px" onload="Chart1_Load">
        <Series>
            <asp:Series Name="Series1" XValueMember="NomClient" YValueMembers="Evol">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
</asp:Chart>client<br />
    <br />
&nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" SelectCommand="

SELECT evolution. NomClient, evolution. Mois,evolution. Nature_realise
,evolution.Valeur_Realise,evolution1.Valeur_Realise, 
((evolution1. Valeur_Realise-
evolution.Valeur_Realise)/nullif(evolution.Valeur_Realise,0)*100 ) as Evol



FROM REALISES evolution INNER JOIN REALISES evolution1 ON 
(evolution.NomClient = evolution1.NomClient) AND 

(evolution.Nature_realise = evolution1.Nature_realise) AND
 (evolution.Mois = evolution1.Mois)
where evolution.Annee=@m and evolution1.Annee=@m-1
">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="m" PropertyName="Text" 
                DefaultValue="0000" />
        </SelectParameters>
    </asp:SqlDataSource>
    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
</CR:CrystalReportSource>
&nbsp;</asp:Content>
