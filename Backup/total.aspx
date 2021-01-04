<%@ Page Title="" Language="C#" MasterPageFile="~/poste.Master" AutoEventWireup="true" CodeBehind="total.aspx.cs" Inherits="postes_gestion.total" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <p style="font-size: xx-large; font-family: Haettenschweiler; color: white; background-color: #000000">
        <strong>TDB : Total des Secteurs</strong></p>
    <p>
    &nbsp; 
        <span style="text-decoration: underline; font-size: larger; font-family: 'Footlight MT Light'; color: black">
        Saisir l&#39;année&nbsp;:</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox1" runat="server" Width="185px" 
            style="background-color: #FFFF99"></asp:TextBox>
        <br />
&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Button 
            ID="Button1" runat="server" onclick="Button1_Click" 
            Text="rechercher" Height="33px" 
            style="font-family: 'AR BERKLEY'; font-size: large; background-color: #FFFF99" 
            Width="95px" />
</p>

    <p style="background-color: #FFFFFF">
    <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataSourceID="SqlDataSource2" Width="400px">
            <Columns>
                <asp:BoundField DataField="total_r_N" HeaderText="total_r_N" ReadOnly="True" 
                    SortExpression="total_r_N" />
                <asp:BoundField DataField="total_ecart_B" HeaderText="total_ecart_B" 
                    ReadOnly="True" SortExpression="total_ecart_B" />
                <asp:BoundField DataField="totalecart_N" HeaderText="totalecart_N" 
                    ReadOnly="True" SortExpression="totalecart_N" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
</p>
<p>
    &nbsp;</p>
    <p>
        total d&#39;ecart vert l&#39;objectif<asp:Chart ID="Chart1" runat="server" 
            DataSourceID="SqlDataSource2" Height="134px" style="margin-top: 0px">
            <Series>
                <asp:Series Name="Series1" 
                    XValueMember="total_r_N" YValueMembers="totalecart_N">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
        total _ecart vers année passée</p>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" SelectCommand="select SUM(VAL_R_N) as total_r_N,SUM(Ecart_vs_B)
   as total_ecart_B,SUM(Ecart_vs_N)  as totalecart_N from
   (
 SELECT B.NomClient, D.Mois, B.Valeur_Realise AS VAL_R_N_1, 
 D.Valeur_Objectif,
  A.Valeur_Realise AS VAL_R_N, 
 A.Valeur_Realise  -D.Valeur_Objectif AS Ecart_vs_B,
  A.Valeur_Realise-B.Valeur_Realise AS Ecart_Vs_N,
  B.Nature_realise
   from (REALISES B INNER JOIN OBJ D ON (B.Mois = D.Mois) AND (B.NomClient =
 D.NomClient) AND (B.Nature_realise = D.nature_objectif))
  INNER JOIN REALISES A ON (A.Mois = B.Mois) AND (D.NomClient =
  A.NomClient) AND (D.Nature_Objectif = A.Nature_realise)
   where (B.Annee =@M and D.Annee =@M-1  AND A.Annee=@M))
  TDB_Commercial join CLIENTS on (CLIENTS.NomClient=TDB_Commercial.NomClient)
  inner join SECTEURS on (SECTEURS.NomSecteur=CLIENTS.NomSecteur)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="M" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
<p>
</p>

</asp:Content>
