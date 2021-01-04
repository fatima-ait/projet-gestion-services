<%@ Page Title="" Language="C#" MasterPageFile="~/poste.Master" AutoEventWireup="true" CodeBehind="nouve obj.aspx.cs" Inherits="postes_gestion.nouve" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css" runat="server">
        Button {
        border-style: none;
            border-color: inherit;
            border-width: medium;
            background-color: #004A7F;
            -webkit-border-radius: 10px;
  
  
            color: #FFFFFF;
            cursor: pointer;
            display: inline-block;
            font-family: Arial;
            font-size: 20px;
            padding: 5px 10px;
            text-align: center;
            text-decoration: none;
            width: 81px;
        }


Button :hover 
{
   border-color:Fuchsia;
  
  
 
}
        .style10
        {
            width: 221px;
        }
        .style11
    {
        width: 585px;
    }
    .style26
    {
        width: 585px;
        height: 46px;
    }
        .style34
        {
            width: 372px;
            height: 26px;
            color: #0066FF;
        }
        .style35
        {
            width: 585px;
            height: 26px;
        }
        .style36
        {
            width: 372px;
            color: #0066FF;
        }
        .style37
        {
            width: 585px;
        }
        .style38
        {
            width: 372px;
            height: 27px;
            color: #0066FF;
        }
        .style39
        {
            width: 585px;
            height: 27px;
        }
        .nouveauStyle1
        {
        }
        .style43
    {
        width: 2838px;
        height: 22px;
        color: #0066FF;
        font-size: small;
    }
    .style44
    {
        width: 2838px;
        color: #0066FF;
        font-size: small;
        height: 1px;
    }
        .style45
        {
            background-color: #FFFFFF;
        }
        .style48
        {
            background-color: #FFCCCC;
        }
        .style47
        {
            font-family: "AR BERKLEY";
            color: black;
            background-color: #FF66FF;
        }
        .style49
        {
            background-color: #FF99FF;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br class="style45" />
    <span 
        style="color: black; text-decoration: underline; font-family: Century; font-size: larger">
    <em><strong><span class="style45">GESTION OBJECTIFS</span><span 
        style="background-color: #FFCCFF"><br class="style45" />
    <br />
    <br />
    </span><span style="background-color: #FFCCFF">
    <br class="style45" />
    <br />
    </span></strong>
    <br class="style48" />
    <table class="style46">
        <tr>
            <td class="style47">
                Nom client</td>
            <td class="style49">
                <asp:TextBox ID="TextBox2" runat="server" CssClass="style48"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style47">
                Année</td>
            <td class="style49">
                <asp:TextBox ID="TextBox3" runat="server" CssClass="style48"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style47">
                Valeur</td>
            <td class="style49">
                <asp:TextBox ID="TextBox4" runat="server" CssClass="style48"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style47">
                Nature Objectif</td>
            <td class="style49">
                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="style48">
                    <asp:ListItem>CA</asp:ListItem>
                    <asp:ListItem>TRAFFIC</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style47">
                Mois</td>
            <td class="style49">
                <asp:DropDownList ID="DropDownList3" runat="server" CssClass="style48">
                    <asp:ListItem Selected="True">CHOISIR LE MOIS</asp:ListItem>
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
                    <asp:ListItem>Decembre</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="Button2" runat="server" Height="34px" onclick="Button2_Click" 
        style="margin-right: 5px; background-color: #FFCCFF" Text="Annuler" 
        Width="87px" />
    <asp:Button ID="Button3" runat="server" Height="36px" onclick="Button3_Click" 
        style="background-color: #FF99FF" Text="supprimer" Width="111px" />
    <asp:Button ID="Button4" runat="server" Height="36px" onclick="Button4_Click" 
        style="background-color: #FF99CC" Text="Modifier" Width="94px" />
    <asp:Button ID="Button5" runat="server" Height="38px" onclick="Button5_Click" 
        style="background-color: #FF66FF" Text="Ajouter" Width="82px" />
    <br />
    <br />
    </em></span>
               
                <br />
&nbsp;&nbsp; RECHERCHE
    <asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="NomClient" 
        DataValueField="NomClient">
    </asp:DropDownList>
    <asp:Button ID="Button1" runat="server" Text="recherecher" />
    <asp:GridView ID="GridView2" runat="server" CellPadding="4" 
        DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Height="16px" 
        Width="50px" AutoGenerateColumns="False" 
    DataKeyNames="NomClient,Mois,Annee,Nature_Objectif" 
        onselectedindexchanged="GridView2_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="NomClient" HeaderText="NomClient" ReadOnly="True" 
                SortExpression="NomClient" />
            <asp:BoundField DataField="Mois" HeaderText="Mois" ReadOnly="True" 
                SortExpression="Mois" />
            <asp:BoundField DataField="Annee" HeaderText="Annee" ReadOnly="True" 
                SortExpression="Annee" />
            <asp:BoundField DataField="Nature_Objectif" HeaderText="Nature_Objectif" 
                ReadOnly="True" SortExpression="Nature_Objectif" />
            <asp:BoundField DataField="Valeur_Objectif" HeaderText="Valeur_Objectif" 
                SortExpression="Valeur_Objectif" />
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
    ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" 
    SelectCommand="SELECT DISTINCT [NomClient] FROM [OBJ]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" 
    SelectCommand="SELECT * FROM [OBJ] WHERE ([NomClient] = @NomClient)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="NomClient" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
</asp:SqlDataSource>
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" 
                    SelectCommand="SELECT * FROM [OBJ] WHERE ([NomClient] = @NomClient)" 
        OldValuesParameterFormatString="original_{0}" 
    ConflictDetection="CompareAllValues" 
    DeleteCommand="DELETE FROM [OBJ] WHERE [NomClient] = @original_NomClient AND [Mois] = @original_Mois AND [Annee] = @original_Annee AND [Nature_Objectif] = @original_Nature_Objectif AND (([Valeur_Objectif] = @original_Valeur_Objectif) OR ([Valeur_Objectif] IS NULL AND @original_Valeur_Objectif IS NULL))" 
    InsertCommand="INSERT INTO [OBJ] ([NomClient], [Mois], [Annee], [Nature_Objectif], [Valeur_Objectif]) VALUES (@NomClient, @Mois, @Annee, @Nature_Objectif, @Valeur_Objectif)" 
    
    UpdateCommand="UPDATE [OBJ] SET [Valeur_Objectif] = @Valeur_Objectif WHERE [NomClient] = @original_NomClient AND [Mois] = @original_Mois AND [Annee] = @original_Annee AND [Nature_Objectif] = @original_Nature_Objectif AND (([Valeur_Objectif] = @original_Valeur_Objectif) OR ([Valeur_Objectif] IS NULL AND @original_Valeur_Objectif IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_NomClient" Type="String" />
                        <asp:Parameter Name="original_Mois" Type="String" />
                        <asp:Parameter Name="original_Annee" Type="Int32" />
                        <asp:Parameter Name="original_Nature_Objectif" Type="String" />
                        <asp:Parameter Name="original_Valeur_Objectif" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="NomClient" Type="String" />
                        <asp:Parameter Name="Mois" Type="String" />
                        <asp:Parameter Name="Annee" Type="Int32" />
                        <asp:Parameter Name="Nature_Objectif" Type="String" />
                        <asp:Parameter Name="Valeur_Objectif" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="NomClient" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Valeur_Objectif" Type="Int32" />
                        <asp:Parameter Name="original_NomClient" Type="String" />
                        <asp:Parameter Name="original_Mois" Type="String" />
                        <asp:Parameter Name="original_Annee" Type="Int32" />
                        <asp:Parameter Name="original_Nature_Objectif" Type="String" />
                        <asp:Parameter Name="original_Valeur_Objectif" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

</asp:Content>
