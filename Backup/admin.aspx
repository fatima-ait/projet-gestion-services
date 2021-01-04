<%@ Page Title="" Language="C#" MasterPageFile="~/poste.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="postes_gestion.admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <p style="color: #000066; height: 30px;">
        <span style="font-size: large; font-family: 'Wide Latin'; text-decoration: underline">
        tableau de bord de secteur administration</span></p>

    <p>
    &nbsp; S<span style="font-family: Shruti">aisir l&#39;année&nbsp;</span>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox1" runat="server" Width="185px"></asp:TextBox>
        <br />
&nbsp; &nbsp;&nbsp;
&nbsp;&nbsp;<asp:Label ID="Label2" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Envoyer" Height="38px" 
            style="font-family: 'Wide Latin'; background-color: #FFCC66" Width="110px" 
            onclick="Button1_Click" />
</p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            GridLines="Horizontal" AllowPaging="True" AllowSorting="True" 
            Height="3px" Width="500px">
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
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView></p>
<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" 
            CellPadding="4" CellSpacing="2" DataSourceID="SqlDataSource1" ForeColor="Black" 
            Height="16px" Width="438px">
            <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="total_r_N" HeaderText="total_r_N" ReadOnly="True" 
                    SortExpression="total_r_N" />
                <asp:BoundField DataField="total_ecart_B" HeaderText="total_ecart_B" 
                    ReadOnly="True" SortExpression="total_ecart_B" />
                <asp:BoundField DataField="totalecart_N" HeaderText="totalecart_N" 
                    ReadOnly="True" SortExpression="totalecart_N" />
            </Fields>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
        </asp:DetailsView>
        <p>
            l&#39;ecart à DH<asp:Chart ID="Chart1" 
            runat="server" DataSourceID="SqlDataSource2" Height="156px" Width="286px">
            <Series>
                <asp:Series Name="Series1" XValueMember="NomClient" YValueMembers="Ecart_Vs_N" 
                    ChartType="Candlestick" YValuesPerPoint="4">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
        nom du client</p>
    <p>
        &nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
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
  
   where A.Annee=@M )
  TDB_Commercial
   join CLIENTS ON (CLIENTS.NomClient=TDB_Commercial.NomClient )
   join SECTEURS ON (SECTEURS.NomSecteur=CLIENTS.NomSecteur)
 WHERE (SECTEURS.NomSecteur='Administration')">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="M" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
</p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" 
            
            SelectCommand="SELECT SUM(TDB_Commercial.VAL_R_N) AS total_r_N, SUM(TDB_Commercial.Ecart_vs_B) AS total_ecart_B, SUM(TDB_Commercial.Ecart_Vs_N) AS totalecart_N FROM (SELECT B.NomClient, D.Mois, B.Valeur_Realise AS VAL_R_N_1, D.Valeur_Objectif, A.Valeur_Realise AS VAL_R_N, A.Valeur_Realise - D.Valeur_Objectif AS Ecart_vs_B, A.Valeur_Realise - B.Valeur_Realise AS Ecart_Vs_N, B.Nature_realise FROM REALISES AS B INNER JOIN OBJ AS D ON B.Mois = D.Mois AND B.NomClient = D.NomClient AND B.Nature_realise = D.Nature_Objectif INNER JOIN REALISES AS A ON A.Mois = B.Mois AND D.NomClient = A.NomClient AND D.Nature_Objectif = A.Nature_realise WHERE (B.Annee = @M) AND (D.Annee = @M-1) AND (A.Annee = @M)) AS TDB_Commercial INNER JOIN CLIENTS ON CLIENTS.NomClient = TDB_Commercial.NomClient INNER JOIN SECTEURS ON SECTEURS.NomSecteur = CLIENTS.NomSecteur WHERE (SECTEURS.NomSecteur = 'Administration')">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="M" PropertyName="Text" 
                    DefaultValue="0" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
<p>
        &nbsp;</p>
    <p>
        &nbsp;</p>

</asp:Content>
