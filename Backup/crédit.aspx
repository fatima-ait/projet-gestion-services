<%@ Page Title="" Language="C#" MasterPageFile="~/poste.Master" AutoEventWireup="true" CodeBehind="crédit.aspx.cs" Inherits="postes_gestion.crédit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <span style="color: black; font-size: x-large">&nbsp; TD</span><span 
        style="text-decoration: underline; font-size: x-large; color: black">B 
    secteur crédit</span><br />
    <br />
    saisir l&#39;année<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="valider" 
        Width="73px" />
    <br />
    <asp:Label ID="Label2" runat="server"></asp:Label>
    <br />
    
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" 
        ForeColor="#333333" GridLines="None" Height="3px" Width="400px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="NomSecteur" HeaderText="NomSecteur" 
                SortExpression="NomSecteur" />
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
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <PagerTemplate>
            <asp:Button ID="Button2" runat="server" Height="28px" Text="&lt;" 
                Width="45px" />
            <asp:Button ID="Button3" runat="server" Height="28px" Text="&gt;" 
                Width="43px" />
        </PagerTemplate>
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" SelectCommand="

select SECTEURS.NomSecteur ,TDB_Commercial.NomClient,TDB_Commercial.Mois,VAL_R_N_1,Valeur_Objectif
,VAL_R_N,
Ecart_vs_B,Ecart_Vs_N,Nature_realise from(
 SELECT B.NomClient, D.Mois, B.Valeur_Realise AS VAL_R_N_1, D.Valeur_Objectif,
  A.Valeur_Realise AS VAL_R_N, 
 A.Valeur_Realise  -D.Valeur_Objectif AS Ecart_vs_B,
  A.Valeur_Realise-B.Valeur_Realise AS Ecart_Vs_N,
  B.Nature_realise
FROM OBJ D INNER JOIN REALISES B ON B.Mois = D.Mois AND B.NomClient =
 D.NomClient AND B.Nature_realise = D.nature_objectif
 
  inner JOIN REALISES A ON A.Mois = B.Mois AND D.NomClient =
  A.NomClient AND D.Nature_Objectif = A.Nature_realise
  where (B.Annee =@M and D.Annee =@M-1 AND A.Annee=@M 

   )
   )TDB_Commercial
 inner join CLIENTS ON (CLIENTS.NomClient=TDB_Commercial.NomClient)  
inner join SECTEURS ON (SECTEURS.NomSecteur=CLIENTS.NomSecteur) 
 wHERE SECTEURS.NomSecteur='Banque'">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="M" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>


</asp:Content>
