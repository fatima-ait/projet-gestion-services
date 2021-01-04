<%@ Page Title="" Language="C#" MasterPageFile="~/poste.Master" AutoEventWireup="true" CodeBehind="periode.aspx.cs" Inherits="postes_gestion.periode" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style14
    {
        width: 100%;
        border: 1px solid #ffffff;
        background-color: #000080;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style14">
    <tr>
        <td style="background-color: #FFFFFF">
            <address id="menu0" class="style10">
                <span style="font-size: xx-large; background-color: #FFFFCC">TDB&nbsp;&nbsp; :Par 
                Période temporelle</span><br />
                annee actuel&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox1" runat="server" Width="185px"></asp:TextBox>
                <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </address>
            la période
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                Height="19px" Width="132px">
                <asp:ListItem Value="Saisir le mois...">Saisir le mois...</asp:ListItem>
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
                <asp:ListItem>Décembre</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Button ID="Button1" runat="server" Text="rechercher" />
            <br />
            <br />
            <br />
        </td>
    </tr>
    <tr>
        <td style="background-color: #FFFFFF">
            <asp:GridView ID="GridView1" runat="server" 
                AutoGenerateColumns="False" BackColor="White" BorderColor="White" 
                BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" 
                DataSourceID="SqlDataSource1" GridLines="None" Width="500px">
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
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#33276A" />
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" 
                SelectCommand="select TDB_Commercial.NomClient,Mois,VAL_R_N_1,Valeur_Objectif,VAL_R_N,
Ecart_vs_B,Ecart_Vs_N,Nature_realise from(
 SELECT B.NomClient, D.Mois, B.Valeur_Realise AS VAL_R_N_1, D.Valeur_Objectif,
  A.Valeur_Realise AS VAL_R_N, 
 A.Valeur_Realise  -D.Valeur_Objectif AS Ecart_vs_B,
  A.Valeur_Realise-B.Valeur_Realise AS Ecart_Vs_N,
  B.Nature_realise
FROM OBJ D INNER JOIN REALISES B ON B.Mois = D.Mois AND B.NomClient =
 D.NomClient AND B.Nature_realise = D.nature_objectif 
 
  inner JOIN REALISES A ON A.Mois = B.Mois AND A.Annee=B.Annee and D.NomClient =
  A.NomClient AND  D.Nature_Objectif = A.Nature_realise 
  where (B.Annee =@M and D.Annee =@M-1 AND A.Annee=@M and A.Mois=@p )
   )TDB_Commercial
   
inner join CLIENTS ON (CLIENTS.NomClient=TDB_Commercial.NomClient)
inner join SECTEURS ON (SECTEURS.NomSecteur=CLIENTS.NomSecteur)
">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="M" 
                        PropertyName="Text" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="p" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
</table>
</asp:Content>
