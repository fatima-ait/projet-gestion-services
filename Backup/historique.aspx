<%@ Page Title="" Language="C#" MasterPageFile="~/poste.Master" AutoEventWireup="true" CodeBehind="historique.aspx.cs"
 Inherits="postes_gestion.historique" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style10
    {
        width: 150px;
        height: 74px;
    }
    .style11
    {
        width: 150px;
        height: 16px;
    }
        .style27
        {
            font-size: x-large;
            font-family: "AR BLANCA";
            color: black;
            background-color: #FFFFCC;
        }
        .style28
        {
            font-size: x-large;
            color: white;
            text-decoration: underline;
            background-color: #000000;
        }
        .style29
        {
            text-decoration: underline;
        }
        .style30
        {
            font-size: large;
            font-family: "AR ESSENCE";
            background-color: #FFFFFF;
        }
        .style31
        {
            font-family: Broadway;
            color: #000000;
            background-color: #FFFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 
        
   
    <div style="background-color:#ededed; height: 1079px;"
    class="AG" >
    
        <br />
        <strong><span class="style28">Historique selon
        CLIENT
        : </span></strong>
        <br />

        <table class="style1" style="width: 442px">
            <tr>
                <td class="style30">
                    <em><span class="style31">secteur</span></em></td>
                <td class="style3">
                    <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" 
                        
                        DataSourceID="SqlDataSource4" DataTextField="NomSecteur" 
                        DataValueField="NomSecteur">
                        <asp:ListItem Selected="True" Value="AUCUN ">aucun</asp:ListItem>
                        <asp:ListItem>Immobilier</asp:ListItem>
                        <asp:ListItem>Crédit</asp:ListItem>
                        <asp:ListItem>Assurance</asp:ListItem>
                        <asp:ListItem>Administration</asp:ListItem>
                        <asp:ListItem>Prévoyance Sociale</asp:ListItem>
                        <asp:ListItem>Enseignement</asp:ListItem>
                        <asp:ListItem>Telecoms</asp:ListItem>
                        <asp:ListItem>Eau &amp; Electricité</asp:ListItem>
                        <asp:ListItem>Banque</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" 
                        SelectCommand="SELECT DISTINCT [NomSecteur] FROM [SECTEURS]">
                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style31">
                    nom</td>
                <td class="style3">
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource2" DataTextField="NomClient" 
                        DataValueField="NomClient">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" 
                        
                        
                        SelectCommand="SELECT DISTINCT [NomClient] FROM [CLIENTS] WHERE ([NomSecteur] = @NomSecteur)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList3" Name="NomSecteur" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            </table>
    
        <br />
        <span class="style27"><span class="style29">pour voir les details sélectionnez 
        un client :</span><br />
        <br />
        </span>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" 
            BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            DataSourceID="SqlDataSource5" GridLines="Horizontal" AllowSorting="True" 
            >
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="NomClient" HeaderText="NomClient" 
                    SortExpression="NomClient" />
                <asp:BoundField DataField="Mois" HeaderText="Mois" SortExpression="Mois" />
                <asp:BoundField DataField="Annee" HeaderText="Annee" SortExpression="Annee" />
                <asp:BoundField DataField="Valeur_Realise" HeaderText="Valeur_Realise" 
                    SortExpression="Valeur_Realise" />
                <asp:BoundField DataField="Valeur_Objectif" HeaderText="Valeur_Objectif" 
                    SortExpression="Valeur_Objectif" />
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
        </asp:GridView>
       
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" 
            GridLines="None" AllowPaging="True">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="NomClient" HeaderText="NomClient" 
                    SortExpression="NomClient" />
                <asp:BoundField DataField="Mois" HeaderText="Mois" SortExpression="Mois" />
                <asp:BoundField DataField="VAL_REA2014" HeaderText="VAL_REA2014" 
                    SortExpression="VAL_REA2014" />
                <asp:BoundField DataField="Valeur_Objectif" HeaderText="Valeur_Objectif" 
                    SortExpression="Valeur_Objectif" />
                <asp:BoundField DataField="VAL_REA2015" HeaderText="VAL_REA2015" 
                    SortExpression="VAL_REA2015" />
                <asp:BoundField DataField="Ecart_vs_B" HeaderText="Ecart_vs_B" ReadOnly="True" 
                    SortExpression="Ecart_vs_B" />
                <asp:BoundField DataField="Ecart_Vs_N" HeaderText="Ecart_Vs_N" ReadOnly="True" 
                    SortExpression="Ecart_Vs_N" />
                <asp:BoundField DataField="Nature_realise" HeaderText="Nature_realise" 
                    SortExpression="Nature_realise" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
       
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" 
            SelectCommand="SELECT CLIENTS.NomClient, CLIENTS.NomSecteur, OBJ.Mois, OBJ.Annee, OBJ.Valeur_Objectif AS Objectif, REALISES.Valeur_Realise AS Réalisé, REALISES.Valeur_Realise - OBJ.Valeur_Objectif AS Ecart, REALISES.Nature_realise FROM CLIENTS INNER JOIN REALISES ON CLIENTS.NomClient = REALISES.NomClient INNER JOIN OBJ ON CLIENTS.NomClient = OBJ.NomClient WHERE (CLIENTS.NomClient = @NomClient)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="NomClient" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <input onclick="window.print()" type="button" value="Imprimer cette page" /><br />
       
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" SelectCommand=" SELECT B.NomClient, D.Mois, B.Valeur_Realise AS VAL_REA2014, D.Valeur_Objectif, A.Valeur_Realise AS VAL_REA2015, 
 A.Valeur_Realise  -D.Valeur_Objectif AS Ecart_vs_B, A.Valeur_Realise-B.Valeur_Realise AS Ecart_Vs_N,
  B.Nature_realise
FROM (REALISES B INNER JOIN OBJ D ON (B.Mois = D.Mois) AND (B.NomClient =
 D.NomClient) AND (B.Nature_realise = D.nature_objectif))
  INNER JOIN REALISES A ON (A.Mois = B.Mois) AND (D.NomClient =
  A.NomClient) AND (D.nature_objectif = A.Nature_realise);">
  </asp:SqlDataSource>
       
        <br />
        <br />
        <br />
    
    </div>
   
    
 
    
    
  
    
</asp:Content>
