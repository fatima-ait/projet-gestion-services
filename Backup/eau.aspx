<%@ Page Title="" Language="C#" MasterPageFile="~/poste.Master" AutoEventWireup="true" CodeBehind="eau.aspx.cs" Inherits="postes_gestion.eau" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <p style="color: black; font-size: xx-large; font-family: Forte; background-color: #FFCCFF">
        TBD: secteur d&#39;eau / Electricité</p>
    <p>
        <span style="font-family: Playbill; font-size: x-large">&nbsp;Saisir l&#39;Anée&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox1" runat="server" Width="185px" 
            style="background-color: #FF99FF"></asp:TextBox>
        <br />
&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" style="font-size: large" Text="Label"></asp:Label>
        <asp:Button ID="Button1" runat="server" Text="rechercher" Height="29px" 
            style="background-color: #FFCCFF" Width="93px" onclick="Button1_Click" />
</p>
    <p>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="Black" 
            GridLines="Vertical" Height="16px" Width="5px">
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
                <asp:Button ID="Button2" runat="server" Text="&lt;" />
                <asp:Button ID="Button3" runat="server" Text="&gt;" />
            </PagerTemplate>
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
</p>
    <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" 
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" DataSourceID="SqlDataSource4" ForeColor="Black" 
        GridLines="Vertical" Height="17px" Width="465px">
        <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="total_r_N" HeaderText="total_r_N" ReadOnly="True" 
                SortExpression="total_r_N" />
            <asp:BoundField DataField="total_ecart_B" HeaderText="total_ecart_B" 
                ReadOnly="True" SortExpression="total_ecart_B" />
            <asp:BoundField DataField="totalecart_N" HeaderText="totalecart_N" 
                ReadOnly="True" SortExpression="totalecart_N" />
        </Fields>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
    </asp:DetailsView>
    <p>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" 
            SelectCommand="
SELECT TDB_Commercial.NomClient, TDB_Commercial.Mois, TDB_Commercial.VAL_R_N_1,
 TDB_Commercial.Valeur_Objectif, TDB_Commercial.VAL_R_N, TDB_Commercial.Ecart_vs_B, TDB_Commercial.Ecart_Vs_N,
  TDB_Commercial.Nature_realise FROM (SELECT B.NomClient, D.Mois, B.Valeur_Realise AS VAL_R_N_1, D.Valeur_Objectif,
   A.Valeur_Realise AS VAL_R_N, A.Valeur_Realise - D.Valeur_Objectif AS Ecart_vs_B, A.Valeur_Realise - B.Valeur_Realise
    AS Ecart_Vs_N, B.Nature_realise FROM REALISES AS B INNER JOIN OBJ AS D ON B.Mois = D.Mois
     AND B.NomClient = D.NomClient AND B.Nature_realise = D.Nature_Objectif INNER JOIN REALISES AS
      A ON A.Mois = B.Mois AND D.NomClient = A.NomClient AND D.Nature_Objectif = A.Nature_realise WHERE 
      (B.Annee = @m) AND (D.Annee = @m-1) AND (A.Annee = @m)) AS TDB_Commercial INNER JOIN CLIENTS ON CLIENTS.NomClient 
      = TDB_Commercial.NomClient INNER JOIN SECTEURS ON SECTEURS.NomSecteur = CLIENTS.NomSecteur WHERE (SECTEURS.NomSecteur = 'Eau et électricité')">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="M" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    <br />
</p>
<p>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" 
        SelectCommand="SELECT SUM(TDB_Commercial.VAL_R_N) AS total_r_N, SUM(TDB_Commercial.Ecart_vs_B) AS total_ecart_B, SUM(TDB_Commercial.Ecart_Vs_N) AS totalecart_N FROM (SELECT B.NomClient, D.Mois, B.Valeur_Realise AS VAL_R_N_1, D.Valeur_Objectif, A.Valeur_Realise AS VAL_R_N, A.Valeur_Realise - D.Valeur_Objectif AS Ecart_vs_B, A.Valeur_Realise - B.Valeur_Realise AS Ecart_Vs_N, B.Nature_realise FROM REALISES AS B INNER JOIN OBJ AS D ON B.Mois = D.Mois AND B.NomClient = D.NomClient AND B.Nature_realise = D.Nature_Objectif INNER JOIN REALISES AS A ON A.Mois = B.Mois AND D.NomClient = A.NomClient AND D.Nature_Objectif = A.Nature_realise WHERE (B.Annee = @M) AND (D.Annee = @M-1) AND (A.Annee = @M)) AS TDB_Commercial INNER JOIN CLIENTS ON CLIENTS.NomClient = TDB_Commercial.NomClient INNER JOIN SECTEURS ON SECTEURS.NomSecteur = CLIENTS.NomSecteur WHERE (SECTEURS.NomSecteur = 'Eau et électricité')">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="M" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</p>
<p>
</p>

</asp:Content>
