<%@ Page Title="" Language="C#" MasterPageFile="~/poste.Master" AutoEventWireup="true" CodeBehind="Banque.aspx.cs" Inherits="postes_gestion.Banque" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ol>
        <li>
            <address id="menu" class="style10">
                <span style="font-size: xx-large; background-color: #FFFFCC">TDB&nbsp;&nbsp; :<span 
                    style="color: #FF9999">Banque</span></span><br />
                <br />
                annee actuel&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox1" runat="server" Width="185px"></asp:TextBox>
                <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </address>
        </li>
    </ol>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <br />
    &nbsp;<asp:Button ID="Button1" runat="server" Text="Rechercher" 
        onclick="Button1_Click" />
&nbsp;<br />
    <br />


    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource3" BackColor="White" BorderColor="#E7E7FF" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        GridLines="Horizontal" Width="50px" Height="3px" AllowPaging="True">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="NomClient" HeaderText="NomClient" 
                SortExpression="NomClient" />
            <asp:BoundField DataField="Mois" HeaderText="Mois" SortExpression="Mois" />
            <asp:BoundField DataField="VAL_R_N_1" HeaderText="VAL_R_N_1" 
                SortExpression="VAL_R_N_1" />
            <asp:BoundField DataField="Valeur_Objectif" HeaderText="Valeur_Objectif" 
                SortExpression="Valeur_Objectif" />
            <asp:BoundField DataField="VAL_R_N" HeaderText="VAL_R_N" 
                SortExpression="VAL_R_N" />
            <asp:BoundField DataField="Ecart_vs_B" HeaderText="Ecart_vs_B" ReadOnly="True" 
                SortExpression="Ecart_vs_B" />
            <asp:BoundField DataField="Ecart_Vs_N" HeaderText="Ecart_Vs_N" ReadOnly="True" 
                SortExpression="Ecart_Vs_N" />
            <asp:BoundField DataField="Nature_realise" HeaderText="Nature_realise" 
                SortExpression="Nature_realise" />
        </Columns>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <PagerTemplate>
            <asp:Button ID="président" runat="server" Text="président" />
            <asp:Button ID="Button3" runat="server" Text="suivent" />
        </PagerTemplate>
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <SortedAscendingCellStyle BackColor="#F4F4FD" />
        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
        <SortedDescendingCellStyle BackColor="#D8D8F0" />
        <SortedDescendingHeaderStyle BackColor="#3E3277" />
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" 
        
     
        
        SelectCommand="
select TDB_Commercial.NomClient,Mois,VAL_R_N_1,Valeur_Objectif,VAL_R_N,
Ecart_vs_B,Ecart_Vs_N,Nature_realise from(
 SELECT B.NomClient, D.Mois, B.Valeur_Realise AS VAL_R_N_1, D.Valeur_Objectif,
  A.Valeur_Realise AS VAL_R_N, 
 A.Valeur_Realise  -D.Valeur_Objectif AS Ecart_vs_B,
  A.Valeur_Realise-B.Valeur_Realise AS Ecart_Vs_N,
  B.Nature_realise
FROM (REALISES B INNER JOIN OBJ D ON (B.Mois = D.Mois) AND (B.NomClient =
 D.NomClient) AND (B.Nature_realise = D.nature_objectif))
  INNER JOIN REALISES A ON (A.Mois = B.Mois) AND (D.NomClient =
  A.NomClient) AND (D.Nature_Objectif = A.Nature_realise)
  
   where A.Annee=@m)
  TDB_Commercial
   join CLIENTS ON (CLIENTS.NomClient=TDB_Commercial.NomClient )
   join SECTEURS ON (SECTEURS.NomSecteur=CLIENTS.NomSecteur)
 WHERE (SECTEURS.NomSecteur='Banque')">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="m" PropertyName="Text" 
                DefaultValue="0000" />
        </SelectParameters>
    </asp:SqlDataSource>
&nbsp;&nbsp;<asp:DetailsView ID="DetailsView1" runat="server" 
        AutoGenerateRows="False" BackColor="White" BorderColor="White" 
        BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" 
        DataSourceID="SqlDataSource2" GridLines="None" Height="50px" Width="125px">
        <EditRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="total_r_N" HeaderText="total_r_N" ReadOnly="True" 
                SortExpression="total_r_N" />
            <asp:BoundField DataField="total_ecart_B" HeaderText="total_ecart_B" 
                ReadOnly="True" SortExpression="total_ecart_B" />
            <asp:BoundField DataField="totalecart_N" HeaderText="totalecart_N" 
                ReadOnly="True" SortExpression="totalecart_N" />
        </Fields>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" 
        
        SelectCommand="SELECT SUM(TDB_Commercial.VAL_R_N) AS total_r_N, SUM(TDB_Commercial.Ecart_vs_B) AS total_ecart_B, SUM(TDB_Commercial.Ecart_Vs_N) AS totalecart_N FROM (SELECT B.NomClient, D.Mois, B.Valeur_Realise AS VAL_R_N_1, D.Valeur_Objectif, A.Valeur_Realise AS VAL_R_N, A.Valeur_Realise - D.Valeur_Objectif AS Ecart_vs_B, A.Valeur_Realise - B.Valeur_Realise AS Ecart_Vs_N, B.Nature_realise FROM REALISES AS B INNER JOIN OBJ AS D ON B.Mois = D.Mois AND B.NomClient = D.NomClient AND B.Nature_realise = D.Nature_Objectif INNER JOIN REALISES AS A ON A.Mois = B.Mois AND D.NomClient = A.NomClient AND D.Nature_Objectif = A.Nature_realise WHERE (B.Annee = @M) AND (D.Annee = @M-1) AND (A.Annee = @M)) AS TDB_Commercial INNER JOIN CLIENTS ON CLIENTS.NomClient = TDB_Commercial.NomClient INNER JOIN SECTEURS ON SECTEURS.NomSecteur = CLIENTS.NomSecteur WHERE (SECTEURS.NomSecteur = 'Banque')">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="M" PropertyName="Text" 
                DefaultValue="0" />
        </SelectParameters>
    </asp:SqlDataSource>
    Lecart vers l&#39;annee passée selon de client<br />
<asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource3">
    <Series>
        <asp:Series ChartType="Pie" Name="Series1" XValueMember="NomClient" 
            YValueMembers="Ecart_Vs_N">
        </asp:Series>
    </Series>
    <ChartAreas>
        <asp:ChartArea Name="ChartArea1">
        </asp:ChartArea>
    </ChartAreas>
</asp:Chart>
    &nbsp;
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    </asp:Content>
