<%@ Page Title="" Language="C#" MasterPageFile="~/poste.Master" AutoEventWireup="true" CodeBehind="Client.aspx.cs" Inherits="postes_gestion.Client" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style16
    {
        width: 164px;
        background-color: #FFFFFF;
    }
          #Button1 ,#Button2 ,#Button3 ,#Button4 {
  display: inline-block;
  height: 33px;
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
-moz-box-shadow:0px 2px 2px rgba(0,0,0,0.2);
  -webkit-box-shadow:0px 2px 2px rgba(0,0,0,0.2);
  box-shadow:0px 2px 2px rgba(0,0,0,0.2);
  -ms-filter:"progid:DXImageTransform.Microsoft.dropshadow(OffX=0,OffY=2,Color=#33000000,Positive=true)";
filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=0,OffY=2,Color=#33000000,Positive=true);
            top: -19px;
            left: -1px;
            width: 191px;
        }
 #Button1 ,#Button2 ,#Button3 ,#Button4 :active {
  margin-top: 5px;
  margin-bottom: 20px;

  -moz-box-shadow:0px 1px 0px rgba(255,255,255,0.5);
-webkit-box-shadow:0px 1px 0px rgba(255,255,255,0.5);
box-shadow:0px 1px 0px rgba(255,255,255,0.5);
-ms-filter:"progid:DXImageTransform.Microsoft.dropshadow(OffX=0,OffY=1,Color=#ccffffff,Positive=true)";
filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=0,OffY=1,Color=#ccffffff,Positive=true);
            top: -12px;
            left: 28px;
            height: 49px;
            width: 190px;
        }
    .style25
    {
        color: #000066;
        text-decoration: underline;
        font-size: xx-large;
        font-family: "Berlin Sans FB Demi";
        background-color: #FFCCFF;
    }
    .style26
    {
        width: 307px;
    }
        .style45
        {
            width: 96px;
        }
    .style46
    {
            width: 749px;
            height: 11px;
        }
        .style48
        {
            width: 36px;
            background-color: #FFFFFF;
            height: 449px;
        }
        .style50
        {
            width: 36px;
        }
        .style52
        {
            width: 749px;
            height: 449px;
        }
        .style53
        {
            height: 449px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <span class="style25">GESTION CLIENTS<br />
<br />
<br />
</span>

<br />

    <table class="style10">
    <tr>
        <td class="style50">
            Nom Client</td>
        <td class="style16">
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </td>
        <td class="style46">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox1" ErrorMessage="chemps invalid"></asp:RequiredFieldValidator>
            <br />
        </td>
        </tr>
        <tr>
        
        <td class="style48">Nom Secteur<span class="style25"><asp:FormView ID="FormView1" runat="server" BackColor="#DEBA84" 
                BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                CellSpacing="2" DataSourceID="SqlDataSource2" GridLines="Both" 
    Width="485px" Height="61px" style="font-size: large">
                <EditItemTemplate>
                    Column1:
                    <asp:TextBox ID="Column1TextBox" runat="server" Text='<%# Bind("Column1") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Mettre à jour" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Cancel" Text="Annuler" />
                </EditItemTemplate>
                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <InsertItemTemplate>
                    Column1:
                    <asp:TextBox ID="Column1TextBox0" runat="server" 
                        Text='<%# Bind("Column1") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                        CommandName="Insert" Text="Insérer" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Cancel" Text="Annuler" />
                </InsertItemTemplate>
                <ItemTemplate>
                    NOMBRE DES CLIENTS:
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Column1") %>'></asp:TextBox>
                    <br />

                </ItemTemplate>
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            </asp:FormView>
</span>

            </td>
          <td class="style53"> &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" 
                  DataSourceID="SqlDataSource1" DataTextField="NomSecteur" 
                  DataValueField="NomSecteur">
              </asp:DropDownList>
            </td>
            <td class="style52">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="DropDownList1" ErrorMessage="chemps invalid"></asp:RequiredFieldValidator>
                </td>
       

    </tr>
   
     </table>           
            
            
        
        
    
   
 
            <asp:Button ID="Button4" runat="server" onclick="Button4_Click" 
                Text="supprimer" />
           
           
           
            <asp:Button ID="Button2" runat="server" Text="Annuler" onclick="Button1_Click"
                />
    <br />
            <asp:Button ID="Button1" runat="server" onclick="Button2_Click" Text="Ajouter" 
                />
            
            <asp:Button ID="Button3" runat="server" onclick="Button3_Click"  Text="modifier" />           
            
            
        
        
    
   
 
            <asp:GridView ID="GridView1" runat="server" 
                AutoGenerateColumns="False" BackColor="White" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="NomClient" 
                DataSourceID="SqlDataSource3" ForeColor="Black" 
     Width="37px" Height="16px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="NomClient" HeaderText="NomClient" ReadOnly="True" 
                        SortExpression="NomClient" />
                    <asp:BoundField DataField="NomSecteur" HeaderText="NomSecteur" 
                        SortExpression="NomSecteur" />
                    <asp:BoundField DataField="id_clt" HeaderText="id_clt" InsertVisible="False" 
                        ReadOnly="True" SortExpression="id_clt" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <PagerTemplate>
                    <asp:Button ID="Button5" runat="server" Text="président" />
                    <asp:Button ID="Button6" runat="server" Text="suivent" />
                </PagerTemplate>
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" 
                SelectCommand="select COUNT(*) FROM CLIENTS where NomClient=@nom">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" DefaultValue="0" Name="nom" 
                        PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" 
                SelectCommand="SELECT DISTINCT [NomSecteur] FROM [CLIENTS]">
            </asp:SqlDataSource> 
       
 
            <br />
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:projet posteConnectionString %>" 
                SelectCommand="SELECT * FROM [CLIENTS]"></asp:SqlDataSource>
        

</asp:Content>
