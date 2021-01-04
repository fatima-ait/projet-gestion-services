<%@ Page Title="" Language="C#" MasterPageFile="~/poste.Master" AutoEventWireup="true" CodeBehind="annuel.aspx.cs" Inherits="postes_gestion.annuel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <p style="text-decoration: underline; color: black; font-size: xx-large; font-family: AngsanaUPC">
        Recup Annuel</p>
<p>
    <span style="text-decoration: underline; font-family: 'Bradley Hand ITC'; color: black">&nbsp; annee actuel&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox1" runat="server" Width="185px"></asp:TextBox>
    <br />&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</p>
<p>
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="envoyer" 
        BackColor="Black" ForeColor="White" Height="38px" 
        style="font-family: Andalus; font-size: larger" Width="114px" />
</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource3" 
            AutoGenerateColumns="False" BackColor="White" 
            BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            GridLines="Vertical" Height="3px" Width="500px" AllowPaging="True">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="NomClient" HeaderText="NomClient" 
                    SortExpression="NomClient" />
                <asp:BoundField DataField="Mois" HeaderText="Mois" SortExpression="Mois" />
                <asp:BoundField DataField="Nature_realise" HeaderText="Nature_realise" 
                    SortExpression="Nature_realise" />
                <asp:BoundField DataField="Valeur_Realise" HeaderText="Valeur_Realise" 
                    SortExpression="Valeur_Realise" />
                <asp:BoundField DataField="Valeur_Objectif" HeaderText="Valeur_Objectif" 
                    SortExpression="Valeur_Objectif" />
                <asp:BoundField DataField="ecart_vs_B_N" HeaderText="ecart_vs_B_N" 
                    ReadOnly="True" SortExpression="ecart_vs_B_N" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <PagerTemplate>
                <asp:Button ID="Button2" runat="server" Text="&lt;" />
                <asp:Button ID="Button3" runat="server" Text="&gt;" />
            </PagerTemplate>
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" SelectCommand="

 select CLIENTS.NomClient,REALISES.Mois, REALISES.Nature_realise
 ,REALISES.Valeur_Realise,OBJ.Valeur_Objectif,Valeur_Realise-Valeur_Objectif
  as ecart_vs_B_N
 from (CLIENTS inner join REALISES on (CLIENTS.NomClient=REALISES.NomClient)
inner join OBJ on (REALISES.NomClient=OBJ.NomClient)
and (REALISES.Nature_realise=OBJ.Nature_Objectif)
and (REALISES.Annee=OBJ.Annee)
and (REALISES. Mois=OBJ.Mois )
and (REALISES.Mois='Janvier')
or (REALISES.Mois='Février' )
and OBJ.Annee=@n
)


">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="n" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
</p>
<p>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" SelectCommand="

select CLIENTS.NomClient,REALISES.Mois, REALISES.Nature_realise
 ,REALISES.Valeur_Realise,OBJ.Valeur_Objectif
 from (CLIENTS inner join REALISES on (CLIENTS.NomClient=REALISES.NomClient)
inner join OBJ on (REALISES.NomClient=OBJ.NomClient)
and (REALISES.Nature_realise=OBJ.Nature_Objectif)
and (REALISES.Annee=OBJ.Annee)
and (REALISES. Mois=OBJ.Mois )
and (REALISES.Mois='Janvier' )or( REALISES.Mois='Février')

and OBJ.Annee=@n)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" DefaultValue="0000" Name="n" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</p>
<p>
    <asp:FormView ID="FormView1" runat="server" BackColor="#CCCCCC" 
        BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" 
        CellSpacing="2" DataSourceID="SqlDataSource1" ForeColor="Black" 
        GridLines="Both">
        <EditItemTemplate>
            Column1:
            <asp:TextBox ID="Column1TextBox" runat="server" Text='<%# Bind("Column1") %>' />
            <br />
            Column2:
            <asp:TextBox ID="Column2TextBox" runat="server" Text='<%# Bind("Column2") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Mettre à jour" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Annuler" />
        </EditItemTemplate>
        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            Column1:
            <asp:TextBox ID="Column1TextBox" runat="server" Text='<%# Bind("Column1") %>' />
            <br />
            Column2:
            <asp:TextBox ID="Column2TextBox" runat="server" Text='<%# Bind("Column2") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insérer" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Annuler" />
        </InsertItemTemplate>
        <ItemTemplate>
            sum(Valeur_objectif):
            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Column1", "{0}") %>'></asp:TextBox>
            <br />
            sum(Valeur_realise):
            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Column2", "{0}") %>'></asp:TextBox>
            <br />

        </ItemTemplate>
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" SelectCommand="

SELECT  sum(Valeur_objectif) ,
 sum(Valeur_realise)
 FROM REALISES INNER JOIN OBJ ON 
 (REALISES.Annee=OBJ.Annee)
and (REALISES. Mois=OBJ.Mois )
and (REALISES.Mois='Janvier')
or (REALISES.Mois='Février' )
and OBJ.Annee=@n">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" DefaultValue="0000" Name="n" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</p>

</asp:Content>
