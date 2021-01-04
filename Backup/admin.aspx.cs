using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace postes_gestion
{
    public partial class admin : System.Web.UI.Page
    {
        Class1 c = new Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            try
            {
                c.cn.Open();

            }
            catch (Exception ex)
            {
                Response.Write("echec de connexion !!!"+ex.Message);
                Response.End();
            
            }

        }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da;
            string Req;
            Req = "SELECT     min(OBJ.Annee) FROM     CLIENTS INNER JOIN ";
            Req += "OBJ ON CLIENTS.NomClient = OBJ.NomClient ";
            Req += "where CLIENTS.NomSecteur= 'Administration'";
            da = new SqlDataAdapter(Req, c.cn);
            da.Fill(ds, "Res");
            int X = (int)ds.Tables["Res"].Rows[0].ItemArray[0];
            int Y = Convert.ToInt32(TextBox1.Text);
            if ((Y - X) < 1)
            {
                Label2.Text = "No Data";
                GridView1.Visible = false;
            }
            else
            {
                GridView1.Visible = true;


            }
        }
    }
}