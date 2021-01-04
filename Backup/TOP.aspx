<%@ Page Title="" Language="C#" MasterPageFile="~/poste.Master" AutoEventWireup="true" CodeBehind="TOP.aspx.cs" Inherits="postes_gestion.TOP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <span style="font-size: large; color: aqua; background-color: #000066">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
    Tableau de bord mensuel : TOP10</span><br />
    <br />
Mois <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
    Height="20px" Width="162px">
    <asp:ListItem>Janvier</asp:ListItem>
    <asp:ListItem>Février</asp:ListItem>
</asp:DropDownList>
&nbsp;<br />
    &nbsp;année&nbsp;&nbsp;
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Button ID="Button1" runat="server" Height="31px" 
    style="color: #FFFFFF; background-color: #000000" Text="recherche" 
    Width="97px" />
<br />
<br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
        CellPadding="3" CellSpacing="1" DataSourceID="SqlDataSource2" 
    GridLines="None" style="margin-left: 0px" Width="500px" AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="NomClient" HeaderText="NomClient" 
                SortExpression="NomClient" />
            <asp:BoundField DataField="Mois" HeaderText="Mois" SortExpression="Mois" />
            <asp:BoundField DataField="VAL_R_N_1" HeaderText="VAL_R_N_1" 
                SortExpression="VAL_R_N_1" />
            <asp:BoundField DataField="Valeur_Objectif" HeaderText="Valeur_Objectif" 
                SortExpression="Valeur_Objectif" />
            <asp:BoundField DataField="Ecart_vs_B" HeaderText="Ecart_vs_B" 
                SortExpression="Ecart_vs_B" />
            <asp:BoundField DataField="Ecart_Vs_N" HeaderText="Ecart_Vs_N" ReadOnly="True" 
                SortExpression="Ecart_Vs_N" />
            <asp:BoundField DataField="Nature_realise" HeaderText="Nature_realise" 
                SortExpression="Nature_realise" />
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <PagerTemplate>
            <asp:Button ID="Button3" runat="server" Text="&lt;" />
            <asp:Button ID="Button2" runat="server" Text="suivent" />
        </PagerTemplate>
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        
    ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" 
    SelectCommand="
select top 10 tp.NomClient,Mois,VAL_R_N_1,Valeur_Objectif,VAL_R_N
Ecart_vs_B,Ecart_Vs_N,Nature_realise  from (
select SECTEURS.NomSecteur ,TDB_Commercial.NomClient,TDB_Commercial.Mois,VAL_R_N_1,Valeur_Objectif
,VAL_R_N,
Ecart_vs_B,Ecart_Vs_N,Nature_realise from
(SELECT B.NomClient, D.Mois, B.Valeur_Realise AS VAL_R_N_1, D.Valeur_Objectif,
  A.Valeur_Realise AS VAL_R_N, 
 A.Valeur_Realise  -D.Valeur_Objectif AS Ecart_vs_B,
  A.Valeur_Realise-B.Valeur_Realise AS Ecart_Vs_N,
  B.Nature_realise
FROM OBJ D INNER JOIN REALISES B ON B.Mois = D.Mois AND B.NomClient =
 D.NomClient AND B.Nature_realise = D.nature_objectif
 
  inner JOIN REALISES A ON A.Mois = B.Mois AND D.NomClient =
  A.NomClient AND D.Nature_Objectif = A.Nature_realise
  where B.Annee =@M and D.Annee =@M-1 AND A.Annee=@M  and A.Mois=@mois
  ) TDB_Commercial
 inner join CLIENTS ON CLIENTS.NomClient=TDB_Commercial.NomClient 
inner join SECTEURS ON SECTEURS.NomSecteur=CLIENTS.NomSecteur 
 
  )tp">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="M" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="DropDownList1" Name="mois" 
                PropertyName="SelectedValue" />
        </SelectParameters>
</asp:SqlDataSource>
<br />
</asp:Content>
