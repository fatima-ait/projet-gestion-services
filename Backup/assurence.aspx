<%@ Page Title="" Language="C#" MasterPageFile="~/poste.Master" AutoEventWireup="true" CodeBehind="assurence.aspx.cs" Inherits="postes_gestion.assurence" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <address id="menu0" class="style10">
                <span style="font-size: xx-large; background-color: #FFFFCC">TDB&nbsp;&nbsp; :Secteur 
                Assurence</span><br />
                <br />
                annee actuel&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox2" runat="server" Width="185px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp; <asp:Button ID="Button1" runat="server" Text="rechercher" 
            onclick="Button1_Click" />
                <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Text="" style="font-size: large"></asp:Label>

        
            </address>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#999999" 
            BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" 
            GridLines="Vertical" Width="500px" AllowPaging="True">
            <AlternatingRowStyle BackColor="#CCCCCC" />
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
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <PagerTemplate>
                <asp:Button ID="Button2" runat="server" Text="président" />
                <asp:Button ID="Button3" runat="server" Text="suivent" />
            </PagerTemplate>
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            DataSourceID="SqlDataSource1" Height="50px" Width="125px" CellPadding="4" 
            ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="total_r_N" HeaderText="total_r_N" ReadOnly="True" 
                    SortExpression="total_r_N" />
                <asp:BoundField DataField="total_ecart_B" HeaderText="total_ecart_B" 
                    ReadOnly="True" SortExpression="total_ecart_B" />
                <asp:BoundField DataField="totalecart_N" HeaderText="totalecart_N" 
                    ReadOnly="True" SortExpression="totalecart_N" />
            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" 
            
            
            SelectCommand="
SELECT TDB_Commercial.NomClient, TDB_Commercial.Mois, TDB_Commercial.VAL_R_N_1,
 TDB_Commercial.Valeur_Objectif, TDB_Commercial.VAL_R_N, TDB_Commercial.Ecart_vs_B, TDB_Commercial.Ecart_Vs_N,
  TDB_Commercial.Nature_realise FROM (SELECT B.NomClient, D.Mois, B.Valeur_Realise AS VAL_R_N_1, D.Valeur_Objectif,
   A.Valeur_Realise AS VAL_R_N, A.Valeur_Realise - D.Valeur_Objectif AS Ecart_vs_B, A.Valeur_Realise - B.Valeur_Realise
    AS Ecart_Vs_N, B.Nature_realise FROM REALISES AS B INNER JOIN OBJ AS D ON B.Mois = D.Mois
     AND B.NomClient = D.NomClient AND B.Nature_realise = D.Nature_Objectif INNER JOIN REALISES AS
      A ON A.Mois = B.Mois AND D.NomClient = A.NomClient AND D.Nature_Objectif = A.Nature_realise WHERE 
      (B.Annee = @M) AND (D.Annee = @M-1) AND (A.Annee = @M)) AS TDB_Commercial INNER JOIN CLIENTS ON CLIENTS.NomClient 
      = TDB_Commercial.NomClient INNER JOIN SECTEURS ON SECTEURS.NomSecteur = CLIENTS.NomSecteur WHERE (SECTEURS.NomSecteur = 'Assurence')" 
            onselecting="SqlDataSource2_Selecting">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox2" Name="M" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
</p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" SelectCommand="   select SUM(VAL_R_N) as total_r_N,SUM(Ecart_vs_B)
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
   where (B.Annee =@M and D.Annee =@M-1 AND A.Annee=@M))
  TDB_Commercial join CLIENTS on (CLIENTS.NomClient=TDB_Commercial.NomClient)
  inner join SECTEURS on (SECTEURS.NomSecteur=CLIENTS.NomSecteur)
 
  where SECTEURS.NomSecteur='Assurence' ">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox2" Name="M" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
</p>
    <p>
    <br />
</p>
</asp:Content>
