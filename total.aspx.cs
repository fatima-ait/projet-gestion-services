using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace postes_gestion
{
    public partial class total : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Class1 c = new Class1();
            try
            {
                c.cn.Open();
                //if (Page.IsValid)
                //{


                //}
                if (!Page.IsPostBack)
                {
                    Button1.Enabled = true;
                    TextBox1.Enabled = true;
                    TextBox1.Enabled = true;



                }
                else Button1.Enabled = true;
            }


            catch (Exception)
            {
                Response.Redirect("se connecter.aspx");
                Response.Write("<script>(' utilisateur inconnaitre ');</script>" );
                
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }
//        <%@ Import Namespace="System.Data" %>
//<%@ Import Namespace="System.Data.OleDb" %>

//<script language="VB" runat="server">

//  Sub Page_Load(Sender As Object, E As EventArgs)

//    Dim strConnection As String
//    Dim strSQL        As String
//    Dim objDataSet    As New DataSet()
//    Dim objConnection As OleDbConnection
//    Dim objAdapter    As OleDbDataAdapter

//    ' set the connection and query details
//    strConnection = "Provider=Microsoft.Jet.OLEDB.4.0; " & _
//                    "Data Source=" & Server.MapPath("Northwind.mdb")
//    strSQL = "SELECT FirstName, LastName FROM Employees;"

//    ' open the connection and set the command
//    objConnection = New OledbConnection(strConnection)
//    objAdapter = New OledbDataAdapter(strSQL, objConnection)

//    ' fill the dataset with the data
//    objAdapter.Fill(objDataSet, "Employees")

//    objDataSet.WriteXml(Server.MapPath("Employees.xml"))
    
//    Response.Write("<a href='Employees.xml'>View XML file</a>")

    }
}