<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="administrateur.aspx.cs" Inherits="postes_gestion.administrateur" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
       
        
        .style1
        {
            width: 29%;
            border: 1px solid #ffffff;
            background-color: #0000CC;
            height: 180px;
        }
        .style3
        {
            height: 38px;
            width: 187px;
        }
        .style4
        {
            height: 44px;
            width: 187px;
        }
        .style5
        {
            width: 135px;
            height: 162px;
        }
        .style6
        {
            font-family: "AR BERKLEY";
            font-size: xx-large;
        }
        .style7
        {
            height: 38px;
            color: #0000CC;
            font-family: "AR BLANCA";
            width: 71px;
        }
        .style8
        {
            height: 44px;
            color: #0000CC;
            font-family: "AR BLANCA";
            width: 71px;
        }
        .style9
        {
            text-decoration: underline;
        }
        .style10
        {
            width: 187px;
        }
        .style11
        {
            width: 71px;
        }
        .style12
        {
            width: 78px;
            height: 86px;
        }
        .style13
        {
            width: 76px;
            height: 82px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <img alt="" class="style5" src="logo_poste.gif" /><span class="style6">
        <span class="style9">ADMINISTRATEUR<br />
        </span><br />
       
    <table class="style1" align="center" >
        <tr>
            <td class="style8">
                <span class="style6">
                <img alt="" class="style12" src="images.jpg" /></span></td>
            <td class="style4">
        <asp:TextBox ID="TextBox1" runat="server" Height="20px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox1" ErrorMessage="chemps vide" 
                    style="font-size: small; font-family: Arial, Helvetica, sans-serif; color: #FFFFFF"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style7">
                <img alt="" class="style13" src="images/images%20(20).jpg" /></td>
            <td class="style3">
        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
    
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox2" ErrorMessage="chemps invalide" 
                    style="font-size: small; font-family: Arial, Helvetica, sans-serif; color: #FFFFFF"></asp:RequiredFieldValidator>
    
            </td>
        </tr>
        <tr>
            <td class="style11">
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="CONNEXION" 
                    Height="36px" style="color: #FFFFFF; background-color: #000000" Width="94px" />
            </td>
            <td class="style10">
                <asp:CheckBox ID="CheckBox1" runat="server" Text="garder ma session ouvert" 
                    oncheckedchanged="CheckBox1_CheckedChanged" 
                    
                    style="font-size: x-small; font-family: Arial, Helvetica, sans-serif; color: #FFFF99;" />
            </td>
        </tr>
    </table>
    <p>
    <asp:Label ID="Label1" runat="server" 
            style="font-size: x-small; font-family: Arial, Helvetica, sans-serif"></asp:Label>
    </p>
    </form>
     </span>
    
    </div>
</body>
</html>

