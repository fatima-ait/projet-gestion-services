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
    public partial class Banque : System.Web.UI.Page
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from CLIENTS","server=.;database=projet poste; integrated security=true");
        DataSet ds = new DataSet();
        Class1 c = new Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!Page.IsPostBack)

            //{ 
            try
            {
                c.cn.Open();


            }
            catch (Exception ex)
            {
                Response.Write("echec de connexion!!" + ex.Message);
                Response.End();
            
            }
            
            
            
            //}

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            //CheckBox checkstat = (CheckBox)sender;
            //GridViewRow row = (GridViewRow)checkstat.NamingContainer;
        
        
        }
        protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
        {
            //CheckBox CheckBox2 = (CheckBox)GridView1.HeaderRow.FindControl("CheckBox2");
            //foreach (GridViewRow row in GridView1.Rows)
            //{
            //    CheckBox chrow = (CheckBox)row.FindControl("CheckBox1");
            //    if (CheckBox2.Checked == true)
            //    {
            //        chrow.Checked = true;

            //    }
            //    else
            //    {
            //        chrow.Checked = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter da;
            string Req;
            Req = "SELECT     min(OBJ.Annee) FROM     CLIENTS INNER JOIN ";
            Req += "OBJ ON CLIENTS.NomClient = OBJ.NomClient ";
            Req += "where CLIENTS.NomSecteur= 'Banque'";
            da = new SqlDataAdapter(Req, c.cn);
            da.Fill(ds, "Res");
            int X = (int)ds.Tables["Res"].Rows[0].ItemArray[0];
            int Y = Convert.ToInt32(TextBox1.Text);
            if ((Y - X) < 1)
            {
                Label1.Text = "No Data";
                 GridView1.Visible=false ;  
                 }
                else{
                    GridView1.Visible = true;


            }
        }

        //protected void Button3_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("se connecter.aspx");
        //}
        //    //    }
            //protected void Button1_Click(object sender, EventArgs e)
            //{
            //foreach(GridViewRow row in GridView1.Rows  )
            //{
            //var check=(CheckBox)row.FindControl("ChechBox1");
            //    if(check.Checked)
            //    {
            //    SqlCommand cmd=new SqlCommand();
            //    cmd.CommandText="delete from ";
                
            //    }
            
            
            }
            
            
        //    }

            
        //    }
        //}
    }
//}