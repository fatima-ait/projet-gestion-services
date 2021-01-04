<%@ Page Title="" Language="C#" MasterPageFile="~/poste.Master" AutoEventWireup="true" CodeBehind="divers.aspx.cs" Inherits="postes_gestion.divers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <p>
        <span style="color: black; font-family: NSimSun; font-size: xx-large; background-color: #FF99FF">
        TDB: DIVERS</span></p>
    <p>
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span 
            style="font-size: x-large; font-family: Magneto">&nbsp;</span><span 
            style="color: white; font-size: x-large; font-family: Magneto; background-color: #000000"> 
        Saisir l&#39;Année</span> :<asp:TextBox 
            ID="TextBox1" runat="server" Height="38px" 
            style="background-color: #FF99FF" Width="185px"></asp:TextBox>
</p>
    <p>
        <asp:Button ID="rechercher" runat="server" Height="33px" onclick="Button1_Click" 
            style="background-color: #CC0099" Text="rechercher" Width="92px" />
</p>
    <p>
        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Vertical" 
            Width="500px">
            <AlternatingRowStyle BackColor="White" />
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
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <PagerTemplate>
                <asp:Button ID="Button1" runat="server" Text="&lt;" />
                <asp:Button ID="Button2" runat="server" Text="&gt;" />
            </PagerTemplate>
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" SelectCommand="
select TDB_Commercial.NomClient,Mois,VAL_R_N_1,Valeur_Objectif,VAL_R_N,
Ecart_vs_B,Ecart_Vs_N,Nature_realise from(
 SELECT B.NomClient, D.Mois, B.Valeur_Realise AS VAL_R_N_1, D.Valeur_Objectif,
  A.Valeur_Realise AS VAL_R_N, 
 A.Valeur_Realise  -D.Valeur_Objectif AS Ecart_vs_B,
  A.Valeur_Realise-B.Valeur_Realise AS Ecart_Vs_N,
  B.Nature_realise
FROM (REALISES B INNER JOIN OBJ D ON B.Mois = D.Mois AND B.NomClient =
 D.NomClient AND B.Nature_realise = D.nature_objectif)
 
  inner JOIN REALISES A ON A.Mois = B.Mois AND D.NomClient =
  A.NomClient AND D.Nature_Objectif = A.Nature_realise
  where (B.Annee =@M and D.Annee =@M-1  AND A.Annee=@M )
   )TDB_Commercial
   
inner join CLIENTS ON (CLIENTS.NomClient=TDB_Commercial.NomClient)
inner join SECTEURS ON (SECTEURS.NomSecteur=CLIENTS.NomSecteur)

oRDER  by SECTEURS.NomSecteur">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" DefaultValue="0000" Name="M" 
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
</p>
<p>
        ecart vers l&#39;objectif</p>

    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource2">
        <Series>
            <asp:Series ChartType="Line" Name="Series1" XValueMember="Ecart_Vs_N" 
                YValueMembers="Ecart_vs_B">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
    ecart vers l&#39;année passée



</asp:Content>
