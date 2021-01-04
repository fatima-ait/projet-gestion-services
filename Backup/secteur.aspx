<%@ Page Title="" Language="C#" MasterPageFile="~/poste.Master" AutoEventWireup="true" CodeBehind="secteur.aspx.cs" Inherits="postes_gestion.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>
        <span style="background-color: #FFCCFF">&nbsp;</span><span 
            style="color: black; text-decoration: underline; font-family: Century; font-size: larger"><em><strong><span 
            style="background-color: #FFCCFF">gestion Secteurs</span></strong></em></span></h2>
    <p>
        &nbsp;</p>
    <p>
        Nom du secteur<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
</p>
    <p>
        Designation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
</p>
    <p>
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Ajouter" 
            style="color: #FFFFFF; font-family: 'AR BERKLEY'; font-size: large; background-color: #000000" />
    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Annuler" 
            style="font-size: large; font-family: 'AR BERKLEY'; color: #FFFFFF; background-color: #000000" />
    <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="Modifier" 
            style="font-size: large; font-family: 'AR BERKLEY'; color: #FFFFFF; background-color: #000000" />
    <asp:Button ID="Button4" runat="server" onclick="Button4_Click" Text="Supprimer" 
            style="font-size: large; font-family: 'AR BERKLEY'; color: #FFFFFF; background-color: #000000" />
    <br />
    <asp:GridView ID="GridView2" runat="server" BackColor="LightGoldenrodYellow" 
            BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" 
            GridLines="None">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
            HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <SortedAscendingCellStyle BackColor="#FAFAE7" />
        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
        <SortedDescendingCellStyle BackColor="#E1DB9C" />
        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
    </asp:GridView>
</p>
<p>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" 
        DeleteCommand="DELETE FROM [SECTEURS] WHERE [NomSecteur] = @original_NomSecteur AND [designation] = @original_designation" 
        InsertCommand="INSERT INTO [SECTEURS] ([NomSecteur], [designation]) VALUES (@NomSecteur, @designation)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [SECTEURS] ORDER BY [NomSecteur], [designation]" 
        UpdateCommand="UPDATE [SECTEURS] SET [designation] = @designation WHERE [NomSecteur] = @original_NomSecteur AND [designation] = @original_designation">
        <DeleteParameters>
            <asp:Parameter Name="original_NomSecteur" Type="String" />
            <asp:Parameter Name="original_designation" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="NomSecteur" Type="String" />
            <asp:Parameter Name="designation" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="designation" Type="String" />
            <asp:Parameter Name="original_NomSecteur" Type="String" />
            <asp:Parameter Name="original_designation" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</p>
</asp:Content>
