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
    public partial class nouve : System.Web.UI.Page
    {
        Class1 c = new Class1();
        DataSet ds = new DataSet();
        public void enregistrer()
        {
            SqlCommandBuilder cmdd = new SqlCommandBuilder(c.da);
            c.da.Update(ds,"obj");
        
        
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            c.cn.Open();
            c.da = new SqlDataAdapter("select * from OBJ", c.cn);
            c.da.Fill(ds, "obj");





        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {

                c.da = new SqlDataAdapter("delete OBJ where (NomClient ='" + TextBox2.Text + "'and Mois='"
                    + DropDownList3.SelectedItem + "'and  Annee=" + TextBox3.Text + "and Nature_Objectif=" + DropDownList2.SelectedItem + "')",
                    c.cn);



                enregistrer();
                Response.Write("<script>alert ('bien supprimer ');</script>");

            }
            catch
            {
                Response.Write("<script >alert ('connexion introuvable !!! ');</script>");

            }


        }

        protected void Button4_Click(object sender, EventArgs e)
        {

            try
            {
                c.da = new SqlDataAdapter("update set  Valeur_Objectif=" + TextBox4.Text + " where NomClient='" + TextBox2.Text +
                 "'and Mois='" + DropDownList3.SelectedItem + "' and Annee=" + TextBox3.Text + "and Nature_Objectif='"
                 + DropDownList2.SelectedItem + "'", c.cn);

                enregistrer();

                Response.Write("<script>alert ('bien modifier ');</script>");

            }
            catch
            {

                Response.Write("<script>alert ('connexion introuvable !!! ');</script>");

            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            try
            {
                DataRow row;
                row = ds.Tables["obj"].NewRow();
                row[0] = TextBox2.Text;
                row[1] = DropDownList3.SelectedItem;
                row[2] = TextBox3.Text;
                row[3] = DropDownList2.SelectedItem;
                row[4] = TextBox4.Text;
                ds.Tables["obj"].Rows.Add(row);
                enregistrer();
                Response.Write("<script>alert ('bien ajouter ');</script>");


            }
            catch
            {

                Response.Write("<script>alert ('connection introuvable !!! ');</script>");

            }
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
}