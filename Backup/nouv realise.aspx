<%@ Page Title="" Language="C#" MasterPageFile="~/poste.Master" AutoEventWireup="true" CodeBehind="nouv realise.aspx.cs" Inherits="postes_gestion.nouv_realise" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <br />
     <style id="Style1" type="text/css" runat="server" >
            
       button{
  display: inline-block;
  height: 50px;
  line-height: 50px;
  padding-right: 30px;
  padding-left: 70px;
  position: relative;
  background-color:rgb(41,127,184);
  color:rgb(255,255,255);
  text-decoration: none;
  text-transform: uppercase;
  letter-spacing: 1px;
  margin-bottom: 15px;
border-radius: 5px;
  -moz-border-radius: 5px;
  -webkit-border-radius: 5px;
  text-shadow:0px 1px 0px rgba(0,0,0,0.5);
-ms-filter:"progid:DXImageTransform.Microsoft.dropshadow(OffX=0,OffY=1,Color=#ff123852,Positive=true)";zoom:1;
filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=0,OffY=1,Color=#ff123852,Positive=true);

  -moz-box-shadow:0px 2px 2px rgba(0,0,0,0.2);
  -webkit-box-shadow:0px 2px 2px rgba(0,0,0,0.2);
  box-shadow:0px 2px 2px rgba(0,0,0,0.2);
  -ms-filter:"progid:DXImageTransform.Microsoft.dropshadow(OffX=0,OffY=2,Color=#33000000,Positive=true)";
filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=0,OffY=2,Color=#33000000,Positive=true);
}
button:active {
  margin-top: 5px;
  margin-bottom: 20px;

  -moz-box-shadow:0px 1px 0px rgba(255,255,255,0.5);
-webkit-box-shadow:0px 1px 0px rgba(255,255,255,0.5);
box-shadow:0px 1px 0px rgba(255,255,255,0.5);
-ms-filter:"progid:DXImageTransform.Microsoft.dropshadow(OffX=0,OffY=1,Color=#ccffffff,Positive=true)";
filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=0,OffY=1,Color=#ccffffff,Positive=true);
}

         .style38
         {
             font-size: xx-large;
         }
        
         .style39
         {
             font-size: large;
             font-family: Fixedsys;
             color: #FFFF99;
             background-color: #CC6600;
         }
        
         .style45
    {
        font-size: medium;
        width: 3070px;
        height: 20px;
    }
        
         </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <span class="style45" style="background-color: #FFCCFF">&nbsp;</span><span 
        style="color: black; text-decoration: underline; font-family: Century; " 
        class="style45"><em><strong><span 
        style="background-color: #FFCCFF">gestion Realises</span></strong></em></span>
        <br />
<asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
    AutoGenerateRows="False" CellPadding="4" 
    DataKeyNames="NomClient,Mois,Annee,Nature_realise" 
    DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" 
    Height="100px" Width="500px">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
    <EditRowStyle BackColor="#999999" />
    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
    <Fields>
        <asp:BoundField DataField="NomClient" HeaderText="NomClient" ReadOnly="True" 
            SortExpression="NomClient" />
        <asp:BoundField DataField="Mois" HeaderText="Mois" ReadOnly="True" 
            SortExpression="Mois" />
        <asp:BoundField DataField="Annee" HeaderText="Annee" ReadOnly="True" 
            SortExpression="Annee" />
        <asp:BoundField DataField="Nature_realise" HeaderText="Nature_realise" 
            ReadOnly="True" SortExpression="Nature_realise" />
        <asp:BoundField DataField="Valeur_Realise" HeaderText="Valeur_Realise" 
            SortExpression="Valeur_Realise" />
        <asp:CommandField ShowInsertButton="True" />
    </Fields>
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <PagerTemplate>
        <asp:DataPager ID="DataPager2" runat="server">
            <Fields>
                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
                <asp:NumericPagerField />
                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
            </Fields>
        </asp:DataPager>
    </PagerTemplate>
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
</asp:DetailsView>
<br />
    <asp:GridView ID="GridView3" runat="server" 
    AutoGenerateColumns="False" CellPadding="4" 
    DataKeyNames="NomClient,Mois,Annee,Nature_realise" 
    DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" 
    Height="157px" Width="500px" AllowPaging="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ButtonType="Image" 
                DeleteImageUrl="~/images/téléchargement (2).png" 
                EditImageUrl="~/images/update_WDF_button.png" 
                NewImageUrl="~/images/téléchargement (3).png" 
                SelectImageUrl="~/images/update_icon.gif" ShowDeleteButton="True" 
                ShowEditButton="True" ShowHeader="True" 
                ShowSelectButton="True" />
            <asp:BoundField DataField="NomClient" HeaderText="NomClient" ReadOnly="True" 
                SortExpression="NomClient" />
            <asp:BoundField DataField="Mois" HeaderText="Mois" ReadOnly="True" 
                SortExpression="Mois" />
            <asp:BoundField DataField="Annee" HeaderText="Annee" ReadOnly="True" 
                SortExpression="Annee" />
            <asp:BoundField DataField="Nature_realise" HeaderText="Nature_realise" 
                ReadOnly="True" SortExpression="Nature_realise" />
            <asp:BoundField DataField="Valeur_Realise" HeaderText="Valeur_Realise" 
                SortExpression="Valeur_Realise" />
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
    <strong><span class="style39">
    <br />
    <asp:Label ID="Label2" runat="server"></asp:Label>
    <br />
    <br />
    </span></strong><br />
    Année&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox1" runat="server" 
    ontextchanged="TextBox1_TextChanged"></asp:TextBox>
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
Nature-realises&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem>CA</asp:ListItem>
        <asp:ListItem>TRAFFIC</asp:ListItem>
    </asp:DropDownList>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button2" runat="server" Text="valider" Width="100px" />
    <br />
    <asp:GridView ID="GridView4" runat="server" 
    AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" 
    BorderStyle="None" BorderWidth="1px" CellPadding="4" 
    DataKeyNames="NomClient,Mois,Annee,Nature_realise" 
    DataSourceID="SqlDataSource2" Width="400px">
        <Columns>
            <asp:BoundField DataField="NomClient" HeaderText="NomClient" ReadOnly="True" 
                SortExpression="NomClient" />
            <asp:BoundField DataField="Mois" HeaderText="Mois" ReadOnly="True" 
                SortExpression="Mois" />
            <asp:BoundField DataField="Annee" HeaderText="Annee" ReadOnly="True" 
                SortExpression="Annee" />
            <asp:BoundField DataField="Nature_realise" HeaderText="Nature_realise" 
                ReadOnly="True" SortExpression="Nature_realise" />
            <asp:BoundField DataField="Valeur_Realise" HeaderText="Valeur_Realise" 
                SortExpression="Valeur_Realise" />
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
</asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" 
        SelectCommand="SELECT * FROM [REALISES] WHERE (([Annee] = @Annee) AND ([Nature_realise] = @Nature_realise))">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="Annee" PropertyName="Text" 
                Type="Int32" />
            <asp:ControlParameter ControlID="DropDownList1" Name="Nature_realise" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <br />
    <br />
<asp:SqlDataSource ID="SqlDataSource3" runat="server" 
    ConflictDetection="CompareAllValues" 
    ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" 
    DeleteCommand="DELETE FROM [REALISES] WHERE [NomClient] = @original_NomClient AND [Mois] = @original_Mois AND [Annee] = @original_Annee AND [Nature_realise] = @original_Nature_realise AND (([Valeur_Realise] = @original_Valeur_Realise) OR ([Valeur_Realise] IS NULL AND @original_Valeur_Realise IS NULL))" 
    InsertCommand="INSERT INTO [REALISES] ([NomClient], [Mois], [Annee], [Nature_realise], [Valeur_Realise]) VALUES (@NomClient, @Mois, @Annee, @Nature_realise, @Valeur_Realise)" 
    OldValuesParameterFormatString="original_{0}" 
    SelectCommand="SELECT * FROM [REALISES]" 
    UpdateCommand="UPDATE [REALISES] SET [Valeur_Realise] = @Valeur_Realise WHERE [NomClient] = @original_NomClient AND [Mois] = @original_Mois AND [Annee] = @original_Annee AND [Nature_realise] = @original_Nature_realise AND (([Valeur_Realise] = @original_Valeur_Realise) OR ([Valeur_Realise] IS NULL AND @original_Valeur_Realise IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_NomClient" Type="String" />
        <asp:Parameter Name="original_Mois" Type="String" />
        <asp:Parameter Name="original_Annee" Type="Int32" />
        <asp:Parameter Name="original_Nature_realise" Type="String" />
        <asp:Parameter Name="original_Valeur_Realise" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="NomClient" Type="String" />
        <asp:Parameter Name="Mois" Type="String" />
        <asp:Parameter Name="Annee" Type="Int32" />
        <asp:Parameter Name="Nature_realise" Type="String" />
        <asp:Parameter Name="Valeur_Realise" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Valeur_Realise" Type="Int32" />
        <asp:Parameter Name="original_NomClient" Type="String" />
        <asp:Parameter Name="original_Mois" Type="String" />
        <asp:Parameter Name="original_Annee" Type="Int32" />
        <asp:Parameter Name="original_Nature_realise" Type="String" />
        <asp:Parameter Name="original_Valeur_Realise" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>

   

   

    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [REALISES]" 
    ConflictDetection="CompareAllValues" 
    DeleteCommand="DELETE FROM [REALISES] WHERE [NomClient] = @original_NomClient AND [Mois] = @original_Mois AND [Annee] = @original_Annee AND [Nature_realise] = @original_Nature_realise AND (([Valeur_Realise] = @original_Valeur_Realise) OR ([Valeur_Realise] IS NULL AND @original_Valeur_Realise IS NULL))" 
    InsertCommand="INSERT INTO [REALISES] ([NomClient], [Mois], [Annee], [Nature_realise], [Valeur_Realise]) VALUES (@NomClient, @Mois, @Annee, @Nature_realise, @Valeur_Realise)" 
    UpdateCommand="UPDATE [REALISES] SET [Valeur_Realise] = @Valeur_Realise WHERE [NomClient] = @original_NomClient AND [Mois] = @original_Mois AND [Annee] = @original_Annee AND [Nature_realise] = @original_Nature_realise AND (([Valeur_Realise] = @original_Valeur_Realise) OR ([Valeur_Realise] IS NULL AND @original_Valeur_Realise IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_NomClient" Type="String" />
            <asp:Parameter Name="original_Mois" Type="String" />
            <asp:Parameter Name="original_Annee" Type="Int32" />
            <asp:Parameter Name="original_Nature_realise" Type="String" />
            <asp:Parameter Name="original_Valeur_Realise" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="NomClient" Type="String" />
            <asp:Parameter Name="Mois" Type="String" />
            <asp:Parameter Name="Annee" Type="Int32" />
            <asp:Parameter Name="Nature_realise" Type="String" />
            <asp:Parameter Name="Valeur_Realise" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Valeur_Realise" Type="Int32" />
            <asp:Parameter Name="original_NomClient" Type="String" />
            <asp:Parameter Name="original_Mois" Type="String" />
            <asp:Parameter Name="original_Annee" Type="Int32" />
            <asp:Parameter Name="original_Nature_realise" Type="String" />
            <asp:Parameter Name="original_Valeur_Realise" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
   
   
    <br />
    <br />
    <br />
    <br />
    
    
</asp:Content>
