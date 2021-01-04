<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="se connecter.aspx.cs" Inherits="postes_gestion.se_connecter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

    <title>Se Connecter </title>
    <head></head>
     <style type="text/css">
        


         .style37
         {
             border-style: none;
             border-color: inherit;
             border-width: 0;
             width: 47%;
             background-color: #ffffff;
             background-image:url('images/login-01.png');
            
             background-repeat:no-repeat;
         
             height: 308px;
             width: 35%;
             margin-right: 0px;
         }
         .style38
         {
             width: 99px;
         }
         .style51
         {
             width: 99px;
             height: 80px;
         }
         .style53
         {
             width: 99px;
             height: 65px;
         }
         .style57
         {
             width: 99px;
             height: 35px;
         }
         .style59
         {
             width: 256px;
             height: 35px;
         }
         .style62
         {
             width: 256px;
             height: 65px;
         }
         .style70
         {
             width: 256px;
         }
         .style71
         {
             width: 99px;
             height: 51px;
         }
         .style72
         {
             width: 256px;
             height: 51px;
         }
         .style73
         {
             width: 180px;
             height: 180px;
         }
     </style>

<body>

   <form id="Form1" method="post" runat="server">
  
    <p style="background-color: #0066CC; height: 179px;">
        <img alt="" class="style73" src="logo%20pos.jpg" /><marquee 
        scrollamount="5" direction="scrolle" onmouseover="this.stop()"
        onmouseout="this.start()" 
            style="margin-left: 3px; height: 165px; width: 356px;">
       <img src="images/raha.jpg"  width="150 PX" height="150 px"/>
       <img src="images/téléchargement%20(1).jpg" width="150 PX" height="150 px" />
       <img src="images/téléchargement%20(7).jpg"  width="150 PX" height="150 px" />
                        </marquee></p>
    <p style="background-color: #FFFFFF; height: 24px; color: #FFFFFF;">
        <asp:LinkButton ID="LinkButton1" runat="server"  
            style="font-size: large; background-color: #FFFFFF; color: #FFFFFF;" 
            onclick="LinkButton1_Click">
            <a  href ="administrateur.aspx"> Administrateur </a>
           </asp:LinkButton>
    
        
         <table class="style37" align="center">
             <tr>
                 <td class="style51">
                     &nbsp;</td>
             </tr>
             <tr>
                 <td class="style57">
                     </td>
                 <td class="style59" align ="center">
            <asp:TextBox ID="TextBox1" runat="server" Width="199px" Height="21px" 
                          
                         ></asp:TextBox>
                     </td>
             </tr>
             <tr>
                 <td class="style71">
                     </td>
                 <td class="style72" align="center">
                     <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Width="197px" 
                         Height="20px"></asp:TextBox>
                 </td>
             </tr>
             <tr>
                 <td class="style38">
                     </td>
                 <td class="style70">
                     </td>
             </tr>
             <tr>
                 <td class="style53">
                     </td>
                 <td class="style62">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:Button ID="Button1" runat="server" Text="Se Connecter" onclick="Button1_Click" 
                         style="background-color: #FFFFFF" Width="106px" Height="30px" />
              
            &nbsp;
                     <asp:Button ID="Button2" runat="server" style="background-color: #FFFFFF; margin-left: 0px; margin-top: 0px;" 
                         Text="Annuler" Width="102px" Height="28px" />
              
                 </td>
             </tr>
             <tr>
                 <td class="style38">
                     &nbsp;</td>
                 <td class="style70">
                     <asp:RadioButton ID="RadioButton2" runat="server" 
                         style="color: #FFFF00; background-color: #0066FF" 
                         Text="Garder ma session ouverte" 
                         oncheckedchanged="RadioButton2_CheckedChanged" />
                 </td>
             </tr>
             <tr>
                 <td class="style38">
                     &nbsp;</td>
                 <td class="style70">
                     &nbsp;</td>
             </tr>
        </table>
    
         
        <br />
    
         
         &nbsp;</p>
    </form>
</body></html>